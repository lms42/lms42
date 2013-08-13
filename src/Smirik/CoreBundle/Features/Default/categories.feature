Feature: categories
    In order to check categories
    As anonim
    I need to see all the content
    
    Scenario: news category
        Given I am on "/"
        When  I follow "Новости"
        Then  The breadcrumbs are "Панель управления, Новости"
        And   I should see "Презентация по использованию циклов в ruby"
        And   I should see "Презентация по управляющим структурам в ruby"
    
    Scenario: check categories widget
        Given I am on "/"
        When  I follow "Новости"
        Then  I should see "Новости" in the "div.sidebar" element
        Then  I should see "Презентации" in the "div.sidebar" element
        
        When I follow "Презентации"
        Then I should see "Сервисы Google"
         And I should see "Циклы в ruby"
         And I should see "Управляющие структуры в ruby: условия"
         And I should see "Вирусы и антивирусы"
         And I should see "Основы программирования на ruby"
        