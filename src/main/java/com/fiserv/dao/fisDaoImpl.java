package com.fiserv.dao;

public class fisDaoImpl {


    public void saveHistory(String id,String env,String feature,String scenario,String browser,String dt_start,String dt_end,String status,String sit){
        String vlsql = "";
        //JdbcTemplate jdbcTemplate
        vlsql = "insert into historico values (";
        vlsql = vlsql + "" + id + "'";
        vlsql = vlsql + "," + env + "'";
        vlsql = vlsql + "," + feature + "'";
        vlsql = vlsql + "," + scenario + "'";
        vlsql = vlsql + "," + browser + "'";
        vlsql = vlsql + "," + dt_start + "'";
        vlsql = vlsql + "," + dt_end + "'";
        vlsql = vlsql + "," + status + "'";
        vlsql = vlsql + "," + sit + "'";
        //jdbcTemplate.execute(vlsql);
    }
}
