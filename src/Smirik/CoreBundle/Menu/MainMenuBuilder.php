<?php
namespace Smirik\CoreBundle\Menu;


use Knp\Menu\FactoryInterface;
use Smirik\AdminBundle\Event\ConfigureMainMenuEvent;
use Smirik\AdminBundle\Event\ConfigureMenuEvent;
use Smirik\CoreBundle\Menu\Voter\RequestVoter;
use Symfony\Component\DependencyInjection\Container;
use Symfony\Component\HttpFoundation\Request;

class MainMenuBuilder
{
    /**
     * @var FactoryInterface
     */
    private $factory;

    /**
     * @var Container
     */
    private $container;

    /**
     * @var RequestVoter
     */
    private $voter;

    /**
     * @param FactoryInterface $factory
     * @param \Symfony\Component\DependencyInjection\Container $container
     * @param Voter\RequestVoter $voter
     */
    public function __construct(FactoryInterface $factory, Container $container, RequestVoter $voter)
    {
        $this->factory = $factory;
        $this->container = $container;
        $this->voter = $voter;
    }

    public function build()
    {
        $menu = $this->factory->createItem('root');
        $menu->addChild('Dashboard', array('route' => 'dashboard'));

        $this->container->get('event_dispatcher')->dispatch(
            ConfigureMainMenuEvent::CONFIGURE,
            new ConfigureMenuEvent(
                $this->factory,
                $menu,
                $this->container
            )
        );

        return $menu;
    }

    public function buildBreadcrumbs()
    {
        $result = $this->getCurrentItem(
            $this->build()
        );

        return $result ? $result : $this->factory->createItem('root');
    }

    protected function getCurrentItem($menu)
    {
        foreach ($menu as $item) {
            if ($this->voter->matchItem($item)) {
                return $item;
            }

            if ($item->getChildren() && $currentChild = $this->getCurrentItem($item)) {
                return $currentChild;
            }
        }

        return null;
    }
}