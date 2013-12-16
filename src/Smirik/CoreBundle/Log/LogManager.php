<?php
    
namespace Smirik\CoreBundle\Log;

use Smirik\CoreBundle\Model\LogQuery;

class LogManager
{
    
    public function getQueryFiltered($user, $start, $stop)
    {
        $log_query = LogQuery::create()
            ->withColumn('num', 'COUNT(*)')
            ->filterByUserId($user->getId())
            ->filterByCreatedAt(array(
                'min' => $start->format('Y-m-d H:i:s'),
                'max' => $stop->format('Y-m-d H:i:s'),
            ))
        ;
        return $log_query;
    }
    
    public function getLogsByDate($user, $start, $stop)
    {
        $logs = LogQuery::create()
            ->withColumn('num', 'COUNT(*)')
            ->filterByUserId($user->getId())
            ->filterByCreatedAt(array(
                'min' => $start->format('Y-m-d H:i:s'),
                'max' => $stop->format('Y-m-d H:i:s'),
            ))
            ->groupBy('')
            ->find()
        ;
    }
    
    public function getHomepageLogs($user, $start, $stop) {
        $logs = LogQuery::create()
            ->withColumn('num', 'COUNT(*)')
            ->filterByUserId($user->getId())
            ->filterByCreatedAt(array(
                'min' => $start->format('Y-m-d H:i:s'),
                'max' => $stop->format('Y-m-d H:i:s'),
            ))
            ->groupBy('')
            ->find()
        ;
    }
    
}