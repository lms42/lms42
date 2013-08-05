Feature: dashboard
    In order to check profile view & edit
    As logged user
    I need to see my profile

    Scenario: 
        Given I am logged in
          And I am on "/profile"
         Then The breadcrumbs are "Панель управления, Профиль"
          And I should see "Смирнов Евгений"
          And I should see "smirik@gmail.com"
          And I should see "test"
          And I should see "Изменить профиль"
         
         When I follow "Изменить профиль"
         Then I should see "Евгений"
         Then I should see "Смирнов"
         
         When I fill in "Profile_first_name" with "Иван"
          And I fill in "Profile_last_name" with "Иванов"
          And I fill in "Profile_phone" with "1234567"
          And I press "Сохранить"
         Then I should see "Иван"
          And I should see "Иванов"
          And I should see "1234567"
         