Feature: Category CRUD
    In order to check CRUD for content's admin panel
    As admin
    I need to list, create, edit & delete content.
    
    Background:
    
    @javascript
    Scenario: list
        Given I am logged in as admin
          And I am on "/admin/content"
          And I wait for "2" seconds
        Then  I should see 
            | Сервисы Google | Презентация по использованию циклов в ruby | Циклы в ruby | Презентация по управляющим структурам в ruby | Управляющие структуры в ruby: условия | Основы программирования на ruby | Вирусы и антивирусы |
            
        When I am on "/admin/content/7/edit"
         And I fill in "Content_title" with "Сервисы Apple"
         And I press "Сохранить"
         And I wait for "2" seconds
        Then I should see "Сервисы Apple"

 #    @javascript
 #    Scenario: list
 #        Given I am logged in as admin
 #        When I am on "/admin/content/7/edit"
 #         And I fill in "Content_description" with "Презентация по Apple iOS"
 #         And I press "Сохранить"
 #         And I wait for "2" seconds
 #        Then I should see "Презентация по Apple iOS"

	# @javascript
 #    Scenario: list
 #        Given I am logged in as admin
 #        When I am on "/admin/content/7/edit"
 #         And I fill in "Content_text" with "Презентация по Apple iOS, полный текст"
 #         And I press "Сохранить"
 #         And I wait for "2" seconds
 #        Then I should see "Презентация по Apple iOS, полный текст"
        

    @javascript
    Scenario: add category to navigation
       Given I am logged in as admin
        When I am on "/admin/content/7/edit"
         And I fill in "Content_urlkey" with "Urlkey"
         And I press "Сохранить"
         And I wait for "2" seconds
        Then I should see "Urlkey"
    
    # @javascript
    # Scenario: add category to navigation
    #    Given I am logged in as admin
    #     When I am on "/admin/content/7/edit"
    #      And I uncheck "Content_is_active"
    #      And I press "Сохранить"
    #      And I wait for "2" seconds
    #      And I am on "/"
    #     Then I should see "" in the "i.icon-remove" element

    @javascript
    Scenario: remove category
       Given I am logged in as admin
        When I am on "/admin/content/7/delete"
        Then I should not see "Сервисы Apple"
        
        When I am on "/"
        Then I should not see "Сервисы Apple"
