<?php

namespace Smirik\CoreBundle\Menu\Voter;


use Knp\Menu\ItemInterface;
use Knp\Menu\Matcher\Voter\VoterInterface;
use Symfony\Component\DependencyInjection\Container;

class RequestVoter implements VoterInterface
{
    /**
     * @var Container
     */
    protected $container;

    function __construct(Container $container)
    {
        $this->container = $container;
    }

    /**
     * @param ItemInterface $item
     * @return bool|null
     * @source https://gist.github.com/Korpch/4183696
     */
    public function matchItem(ItemInterface $item)
    {
        if ($item->getUri() === $this->container->get('request')->getRequestUri()) {
            return true;
        } else {
            if ($item->getUri() !== '/' && (substr(
                        $this->container->get('request')->getRequestUri(),
                        0,
                        strlen($item->getUri())
                    ) === $item->getUri())
            ) {
                return true;
            }
        }

        return null;
    }


}