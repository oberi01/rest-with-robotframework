Feature: Password Safe API

    The API provides CRUD operations

    Scenario: AS Script User Nick I want to create a new password_Record in PWS in order to manage
              my new Account Credentials securely

      Given an open session to a password database by PWS_Username AND PWS_Password AND PWS_Database (later with token!)
      When I create a new Password with new values (UserName, Password, URL, ...)
      Then the password_Record has been created correctly

    Scenario: AS Script User Nick I want to read password_Records in PWS in order to check someThing

      Given an open session to a password database by PWS_Username AND PWS_Password AND PWS_Database (later with token!)
      When I search for existing Password_Records with  "Ama" in thier PWS_Entry_Descriptions
      Then i get a list of all matching password_Records

    Scenario: AS Script User Nick I want to update a single password in PWS in order to match security guidelines

      Given an open session to a password database by PWS_Username AND PWS_Password AND PWS_Database (later with token!)
      When an unique password with PWS_Entry_Description exists
      And I update the Password with a new Password
      Then the password has been changed correctly

    Scenario: AS Script User Nick I want to delete a single Password_Record in PWS in order to chore the unused passwords

      Given an open session to a password database by PWS_Username AND PWS_Password AND PWS_Database (later with token!)
      When an unique password with PWS_Entry_Description exists
      And I delete the Password_Entry
      Then the Password has been deleted correctly

