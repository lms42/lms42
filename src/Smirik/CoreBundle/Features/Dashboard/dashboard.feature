Feature: dashboard
    In order to check user's dashboard
    As logged user
    I need to see all the content

    Scenario: news category
        Given I am logged in as "test" with password "test"
          And I am on "/"
         Then I should see "Панель управления"
          And I should see
              | Панель управления | Ваши уроки и задания | Законченные задания | Тесты | Ваши задания | Поиск элементов | Поиск и сумма | Последние новости |
          And I should see "Прогресс по курсам" in the "div.widget" element
