Feature: homepage
    In order to check availablity of homepage
    As anonim
    I need to see the topbar and list of available courses
    
    Scenario: homepage availability
        Given I am on "/"
        Then I should see "LMS42"
        And  I should see "Основы программирования на ruby"
        And  I should see "Информация"
        
    Scenario: Top bar content
        When I am on "/"
        Then I should see "Панель управления" in the "header" element
        And  I should see "Новости" in the "header" element
        And  I should see "Открытые курсы" in the "header" element
        And  I should see "Вход" in the "header" element
        