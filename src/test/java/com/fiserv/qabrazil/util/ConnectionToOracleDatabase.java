package com.fiserv.qabrazil.util;

import com.fiserv.automation.framework.common.annotations.ScenarioComponent;

import java.sql.*;

@ScenarioComponent
public class ConnectionToOracleDatabase {
    private static final String JDBC_URL = "jdbc:oracle:thin:@//brbri01t02c4-dbvm01.fiserv.one:1521/SBACAT.fiserv.one";
    private static final String USERNAME = "F7B07NV";
    private static final String PASSWORD = "access#FGV135";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
    }

    public String getTokenByTypeFlow(String fluxo) {
        String token = "";
        String tp_Flow = switch (fluxo) {
            case "Primeiro acesso" -> "FIRST_ACCESS";
            case "Esqueci minha senha" -> "RESET_PASSWORD";
            default -> "MFA";
        };

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            statement = connection.createStatement();

            String sql = "SELECT VR_TOKEN FROM UAT_MANAGEMEN2.TB_TOKEN" +
                " WHERE DH_EXPIRES >= CURRENT_TIMESTAMP - INTERVAL '15' MINUTE" +
                " AND TP_FLOW = '" + tp_Flow + "' AND STATUS = 'SENT'" +
                " ORDER BY id DESC FETCH FIRST 1 ROWS ONLY";
            resultSet = statement.executeQuery(sql);

            while (resultSet.next())
                token = resultSet.getString("VR_TOKEN");

        } catch (SQLException sqlException1) {
            sqlException1.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
            } catch (SQLException sqlException2) {
                sqlException2.printStackTrace();
            }
            try {
                if (statement != null) statement.close();
            } catch (SQLException sqlException3) {
                sqlException3.printStackTrace();
            }
            try {
                if (connection != null) connection.close();
            } catch (SQLException sqlException4) {
                sqlException4.printStackTrace();
            }
        }

        return token;
    }
}