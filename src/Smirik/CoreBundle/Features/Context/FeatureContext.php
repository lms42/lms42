<?php

namespace Smirik\CoreBundle\Features\Context;

use Behat\Behat\Context\ClosuredContextInterface,
    Behat\Behat\Context\TranslatedContextInterface,
    Behat\Behat\Context\BehatContext,
    Behat\Behat\Context\Step\Then,
    Behat\Behat\Exception\PendingException,
    Behat\MinkExtension\Context\MinkContext;

use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;

use Behat\Behat\Event\FeatureEvent;

//   require_once 'PHPUnit/Autoload.php';
//   require_once 'PHPUnit/Framework/Assert/Functions.php';

/**
 * Features context.
 */
class FeatureContext extends MinkContext
{
    /**
     * Initializes context.
     * Every scenario gets it's own context object.
     *
     * @param array $parameters context parameters (set them up through behat.yml)
     */
    public function __construct(array $parameters)
    {
        // Initialize your context here
    }
    
    /** @BeforeFeature */
    public static function setupFeature(FeatureEvent $event)
    {
        exec('php ' . __DIR__ . '/../../../../../app/console propel:sql:insert --force --env=test');
        exec('mysql -uroot -proot -D lms42-test < ' . __DIR__ . '/../../../../../app/propel/sql/fixtures.sql');
    }
    
    
    /**
     * @Then /^The breadcrumbs are "([^"]*)"$/
     */
    public function theBreadcrumbsAre($arg1)
    {
        $elements = explode(',', $arg1);
    
        $response = array();
        foreach ($elements as $element) 
        {
            $response[] = new Then("I should see \"$element\"");
        }
        return $response;
    }
    
    /**
     * @Given /^I should see$/
     */
    public function iShouldSee(TableNode $table)
    {
        $response = array();
        foreach ($table as $element) 
        {
            $response[] = new Then("I should see \"$element\"");
        }
        return $response;
    }
    
    /**
     * @Given /^I should see in lesson navigation in the "([^"]*)" element:$/
     */
    public function iShouldSeeInLessonNavigationInTheElement($arg1, TableNode $table)
    {
        $response = array();
        foreach ($table->getRow(0) as $element) 
        {
            $response[] = new Then("I should see \"$element\"");
        }
        
        return $response;
    }
    
    /**
     * @Given /^I wait for "([^"]*)" seconds$/
     */
    public function iWaitForSeconds($arg1)
    {
        $this->getSession()->wait(1000*$arg1);
    }

    /**
     * @Given /^I am logged in as "([^"]*)" with password "([^"]*)"$/
     */
    public function iAmLoggedInAsWithPassword($username, $password)
    {
        $this->visit('/login');
        $this->fillField('username', $username);
        $this->fillField('inputPassword', $password);
        $this->pressButton('Войти');
    }
    
    /**
     * @Given /^I am logged in as admin$/
     */
    public function iAmLoggedInAsAdmin()
    {
        return $this->iAmLoggedInAsWithPassword('test', 'test');
    }

    /**
     * @Given /^I am logged in$/
     */
    public function iAmLoggedIn()
    {
        $this->visit('/login');
        $this->fillField('username', 'test');
        $this->fillField('inputPassword', 'test');
        $this->pressButton('Войти');
    }


}
