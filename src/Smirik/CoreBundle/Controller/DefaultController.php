<?php

namespace Smirik\CoreBundle\Controller;

use Doctrine\Common\Collections\Criteria;
use Smirik\CourseBundle\Model\TaskQuery;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

use Smirik\ContentBundle\Model\ContentQuery;
use Smirik\ContentBundle\Model\CategoryQuery;
use Smirik\CourseBundle\Model\CourseQuery;
use Smirik\CourseBundle\Model\LessonQuery;

use Symfony\Component\HttpFoundation\Response;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     * @Template("SmirikCoreBundle:Default:index.html.twig", vars={"get"})
     */
    public function indexAction()
    {
        $user = $this->getUser();
        if ( is_object($user) ) {
            return $this->forward('SmirikCoreBundle:Default:dashboard');
        }

        $news = ContentQuery::create()
            ->useCategoryQuery()
                ->filterByUrlkey('news')
            ->endUse()
            ->limit(10)
            ->orderByCreatedAt('desc')
            ->find();
        
        $courses = $this->get('course.manager')->getAll();

        return array(
            'news' => $news,
            'courses' => $courses,
        );
    }

    /**
     * @Route("/dashboard", name="dashboard")
     * @Template("SmirikCoreBundle:Default:dashboard.html.twig", vars={"get"})
     */
    public function dashboardAction()
    {
        $user = $this->getUser();

        $lm = $this->get('lesson.manager');
        $lessons = $lm->getOpened($user);

        $tm = $this->get('user_task.manager');
        $user_tasks = $tm->latestUserTodo($user, 6);
        $completed_user_tasks = $tm->lastCompleted($user, 5);
        $pending_user_tasks   = $tm->lastPending($user, 5);

        $uqm  = $this->get('user_quiz.manager');
        $completed_users_quiz = $uqm->completed($user, 5);

        $cm = $this->get('content.manager');
        $contents = $cm->last(5);

        return array(
            'lessons'    => $lessons,
            'user_tasks' => $user_tasks,
            'completed_user_tasks' => $completed_user_tasks,
            'pending_user_tasks'   => $pending_user_tasks,
            'completed_users_quiz' => $completed_users_quiz,
            'contents'   => $contents
        );
    }

    /**
     * @Route("/about", name="about")
     * @Template("SmirikCoreBundle:Default:about.html.twig", vars={"get"})
     */
    public function aboutAction()
    {
        return array();
    }

    /**
     * @Template("SmirikCoreBundle:Default:navigation.html.twig", vars={"get"})
     */
    public function navigationAction()
    {
        $user = $this->getUser();
        $categories = CategoryQuery::create()->filterByNavigation(true)->find();

        $courses = false;
        if (is_object($user)) {
            $courses = CourseQuery::create()
                ->useUserCourseQuery()
                    ->filterByUserId($user->getId())
                ->endUse()
                ->find();
        }

        $csrf = $this->container->get('form.csrf_provider')->generateCsrfToken('authenticate');
        return array(
            'categories' => $categories,
            'courses' => $courses,
            'csrf' => $csrf,
        );
    }
    
    /**
     */
    public function csrfAction()
    {
        $csrf = $this->container->get('form.csrf_provider')->generateCsrfToken('authenticate');
        return new Response($csrf);
    }

    /**
     * @Template("SmirikCoreBundle:Default:sidebar.html.twig", vars={"get"})
     */
    public function sidebarAction()
    {
        // $cm = $this->get('course.manager');
        // $user = $this->getUser();
        // $courses_ids = array();
        //
        // if (is_object($user)) {
        //     $courses_ids = CourseQuery::create()
        //         ->select('Id')
        //         ->useUserCourseQuery()
        //         ->filterByUserId($user->getId())
        //         ->endUse()
        //         ->find()
        //         ->toArray();
        // }
        //
        // $last_lessons = array();
        // foreach ($courses_ids as $id) {
        //     $user_lesson = UserLessonQuery::create()
        //         ->filterByUserId($user->getId())
        //         ->filterByCourseId($id)
        //         ->joinLesson()
        //         ->joinCourse()
        //         ->orderByStartedAt('desc')
        //         ->findOne();
        //     if ($user_lesson) {
        //         $last_lessons[] = $user_lesson;
        //     }
        // }
        //
        // $content = ContentQuery::create()
        //     ->useCategoryQuery()
        //     ->filterByUrlkey('keynote')
        //     ->endUse()
        //     ->limit(3)
        //     ->find();
        //
        // return array(
        //     'content' => $content,
        //     'last_lessons' => $last_lessons,
        // );
        return array();
    }
}