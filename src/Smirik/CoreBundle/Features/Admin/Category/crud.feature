Feature: Category CRUD
    In order to check CRUD for category's admin panel
    As admin
    I need to list, create, edit & delete category.
    
    Background:
    
    @javascript
    Scenario: list
        Given I am logged in as admin
          And I am on "/admin/categories"
          And I wait for "2" seconds
        Then  I should see 
            | Презентации | Новости | Базовая |
            
        When I am on "/admin/categories/3/edit"
         And I fill in "Category_title" with "Доклады"
         And I press "Сохранить"
         And I wait for "2" seconds
        Then I should see "Доклады"

    Scenario: add category to navigation
       Given I am logged in as admin
        When I am on "/admin/categories/3/edit"
         And I check "Category_navigation"
         And I check "Category_is_active"
         And I press "Сохранить"
         And I wait for "2" seconds
         And I am on "/"
        Then I should see "Доклады"
        
    Scenario: remove category
       Given I am logged in as admin
        When I am on "/admin/categories/3/delete"
        Then I should not see "Доклады"
        
        When I am on "/"
        Then I should not see "Доклады"
