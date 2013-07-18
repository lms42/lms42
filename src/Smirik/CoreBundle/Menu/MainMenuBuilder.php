<?php
namespace Smirik\CoreBundle\Menu;


use Knp\Menu\FactoryInterface;
use Smirik\AdminBundle\Event\ConfigureMainMenuEvent;
use Smirik\AdminBundle\Event\ConfigureMenuEvent;
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
     * @param FactoryInterface $factory
     * @param \Symfony\Component\DependencyInjection\Container $container
     */
    public function __construct(FactoryInterface $factory, Container $container)
    {
        $this->factory = $factory;
        $this->container = $container;
    }

    public function build()
    {
        $menu = $this->factory->createItem('root');

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
}