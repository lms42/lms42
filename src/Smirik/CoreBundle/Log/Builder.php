<?php
    
namespace Smirik\CoreBundle\Log;

use Smirik\CoreBundle\Model\Log;

class Builder
{
    
    public function log($user, $request)
    {
        $route = $request->get('_route');
        
        if (strpos($route, 'admin_') !== false) {
            return;
        }
        
        $log = new Log();
        $log->setRoute($route);
        $log->setUser($user);
        
        $log = $this->process($log, $request);
        
        $log->save();
    }
    
    private function process(Log $log, $request)
    {
        $parameters = $request->attributes->get('_route_params');
        
        switch ($log->getRoute()) {
            case 'lesson_task':
            case 'lesson_task_save':
                if (isset($parameters['task_id'])) {
                    $log->setModelId($parameters['task_id']);
                }
                if (isset($parameters['id'])) {
                    $log->setData(json_encode(array(
                        'task_id' => $parameters['task_id'],
                        'lesson_id' => $parameters['id'],
                    )));
                }
                break;
            
            case 'category_index':
                if (isset($parameters['urlkey'])) {
                    $log->setData(json_encode(array(
                        'urlkey' => $parameters['urlkey'],
                    )));
                }
                break;
            
            default:
                if (isset($parameters['id'])) {
                    $log->setModelId($parameters['id']);
                }
                break;
        }
        
        return $log;
    }
    
}