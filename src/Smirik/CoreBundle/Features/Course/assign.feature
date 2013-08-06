Feature: dashboard
    In order to check assign course feature
    As logged user
    I need to be able to subscribe to course & first lesson.

    @javascript
    Scenario: 
        Given I am logged in
          And I am on "/courses"
         When I follow "Доступные курсы"
          And I follow "Информация"
         Then The breadcrumbs are "Панель управления, Курсы, Информация"
          And I should see 
             | Информация | Информационное общество | Записаться на курс |
             
         When I follow "Записаться на курс"
         Then I should see "Удалиться с курса"
          And I should see "Начать урок"
          
         When I follow "Начать урок"
         Then I should see "Информационное общество"
         
         When I follow "Приоритет"
         Then I should see "Недоступно"
         
         When I follow "Начать урок"
          And I follow "Приоритет"
         Then I should see "В работе"
         Then I should see "Сохранить"
          And I should see "Совсем не знаю"
          And I should see "Отправить на проверку"