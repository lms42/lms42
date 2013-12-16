Feature: dashboard
    In order to check lesson interface
    As logged user
    I need to see all the content of lesson

    Scenario: 
        Given I am logged in
          And I am on "/"
         When I follow "Работа с массивами"
         Then The breadcrumbs are "Панель управления, Курсы, Основы программирования на ruby, Работа с массивами"
          And I should see "Работа с массивами"
          
          And I should see in lesson navigation in the "div#accordion_affix" element:
              | Содержание | Основной текст | Ссылки на сайты | Задать вопрос | Тесты | Произведение элементов | Средние | Поиск элементов | Поиск и сумма | Закончить |
    
    @javascript
    Scenario: 
        Given I am logged in
          And I am on "/lessons/4"
         When I follow "Поиск элементов"
         Then I should see "Задан массив из 10 целых чисел (любых)."
         
         When I fill in "UserTaskAnswer8_text" with "Тестовый ответ"
          And I follow "Сохранить"
          And I reload the page
          And I follow "Поиск элементов"
         Then I should see "Тестовый ответ"
        
         When I fill in "UserTaskAnswer8_text" with "Итоговый ответ"
          And I press "Отправить на проверку"
          And I reload the page
          And I follow "Поиск элементов" 
         Then I should see "На проверке"
         
         When I follow "Поиск и сумма"
         Then I should see "В работе"
         
         When I follow "Совсем не знаю"
          And I follow "Поиск и сумма"
         Then I should see "Провалено"
         