<?php
    
namespace Smirik\CoreBundle\Log;

use Smirik\CoreBundle\Model\LogQuery;
use Smirik\CoreBundle\Log\ObjectCountLog;
use Smirik\CourseBundle\Model\CourseQuery;
use Smirik\CourseBundle\Model\LessonQuery;
use Smirik\CourseBundle\Model\TaskQuery;

use Doctrine\Common\Collections\ArrayCollection;

class LogManager
{
    
    protected $start;
    protected $stop;
    protected $users_ids;
    
    private function getQueryFiltered()
    {
        $log_query = LogQuery::create()
            ->filterByUserId($this->users_ids)
            ->filterByCreatedAt(array(
                'min' => $this->start->format('Y-m-d H:i:s'),
                'max' => $this->stop->format('Y-m-d H:i:s'),
            ))
        ;
        return $log_query;
    }
    
    private function findByRouteAndGroupByModelId($route)
    {
        return $this->getQueryFiltered()
            ->select(array('modelId', 'num'))
            ->withColumn('COUNT(*)', 'num')
            ->filterByRoute($route)
            ->groupBy('modelId')
            ->find()
            ->toKeyValue('modelId', 'num')
        ;
    }
    
    public function getUserLogs($user, $start, $stop)
    {
        $this->start = $start;
        $this->stop  = $stop;
        $this->users_ids = array($user->getId());
        $homepage = $this->getHomepageLogs();
        $course_logs = $this->getCourseLogs();
        $lesson_logs = $this->getLessonLogs();
        $task_logs   = $this->getTaskLogs();
        return array(
            'homepage'    => $homepage,
            'course_logs' => $course_logs,
            'lesson_logs' => $lesson_logs,
            'task_logs'   => $task_logs,
        );
    }
    
    private function getHomepageLogs() {
        $num = $this->getQueryFiltered()
            ->filterByRoute('homepage')
            ->count()
        ;
        return $num;
    }
    
    public function getCourseLogs()
    {
        $logs = $this->findByRouteAndGroupByModelId('course_show');
        $courses = CourseQuery::create()
            ->filterById(array_keys($logs))
            ->find()
            ->toArray('Id')
        ;
        
        $coll = new ArrayCollection();
        foreach ($logs as $model_id => $num) {
            if (isset($courses[$model_id])) {
                $course_log = new ObjectCountLog($courses[$model_id], $num, $this->start, $this->stop);
                $coll->add($course_log);
            }
        }
        
        return $coll;
    }

    public function getLessonLogs()
    {
        $logs = $this->findByRouteAndGroupByModelId('lesson_index');
        $lessons = LessonQuery::create()
            ->filterById(array_keys($logs))
            ->find()
            ->toArray('Id')
        ;
        
        $coll = new ArrayCollection();
        foreach ($logs as $model_id => $num) {
            if (isset($lessons[$model_id])) {
                $lesson_log = new ObjectCountLog($lessons[$model_id], $num, $this->start, $this->stop);
                $coll->add($lesson_log);
            }
        }
        
        return $coll;
    }

    public function getTaskLogs()
    {
        $logs = $this->findByRouteAndGroupByModelId('lesson_task');
        
        $tasks = TaskQuery::create()
            ->filterById(array_keys($logs))
            ->joinWith('Lesson')
            ->find()
            ->toArray('Id')
        ;
        
        $coll = new ArrayCollection();
        foreach ($logs as $model_id => $num) {
            if (isset($tasks[$model_id])) {
                $task_log = new ObjectCountLog($tasks[$model_id], $num, $this->start, $this->stop);
                $coll->add($task_log);
            }
        }
        
        return $coll;
    }
    
}