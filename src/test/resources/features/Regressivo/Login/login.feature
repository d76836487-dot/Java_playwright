Feature: Login

  @Login
  Scenario Outline: Login Portal
    Given open portal "<alianca>" and logon

    Examples:
      |Description        |alianca            |
      |Usuario master     |sicredi            |
      |Usuario master     |afinz              |
      |Usuario master     |azulzinha          |
      |Usuario master     |bin                |


