<?php
    
namespace Smirik\CoreBundle\EventListener;

use Symfony\Component\HttpKernel\Event\GetResponseEvent;
use Symfony\Component\HttpKernel\HttpKernel;

class UserLogListener
{
    
    public function onKernelRequest(GetResponseEvent $event)
    {
        $route = $event->getRequest()->get('_route');
        
        if ( ($event->getRequestType() != HttpKernel::MASTER_REQUEST) || (strpos($route, '_wdt') !== false) || (strpos($route, '_asset') !== false) || (strpos($route, '_imagine') !== false) ) {
            return;
        }
        
        $container = $event->getDispatcher()->getContainer();
        
        if ($container->get('security.context')->isGranted('IS_AUTHENTICATED_FULLY')) {
            $container->get('lms42.log.builder')->log($container->get('security.context')->getToken()->getUser(), $event->getRequest());
        }
    }
    
}