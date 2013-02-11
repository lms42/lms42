
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

-- ---------------------------------------------------------------------
-- fos_user
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `fos_user`;

CREATE TABLE `fos_user`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255),
    `username_canonical` VARCHAR(255),
    `email` VARCHAR(255),
    `email_canonical` VARCHAR(255),
    `enabled` TINYINT(1) DEFAULT 0,
    `salt` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `last_login` DATETIME,
    `locked` TINYINT(1) DEFAULT 0,
    `expired` TINYINT(1) DEFAULT 0,
    `expires_at` DATETIME,
    `confirmation_token` VARCHAR(255),
    `password_requested_at` DATETIME,
    `credentials_expired` TINYINT(1) DEFAULT 0,
    `credentials_expire_at` DATETIME,
    `roles` TEXT,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `fos_user_U_1` (`username_canonical`),
    UNIQUE INDEX `fos_user_U_2` (`email_canonical`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- fos_group
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `fos_group`;

CREATE TABLE `fos_group`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `roles` TEXT,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- fos_user_group
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `fos_user_group`;

CREATE TABLE `fos_user_group`
(
    `fos_user_id` INTEGER NOT NULL,
    `fos_group_id` INTEGER NOT NULL,
    PRIMARY KEY (`fos_user_id`,`fos_group_id`),
    INDEX `fos_user_group_FI_2` (`fos_group_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- profiles
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles`
(
    `user_id` INTEGER NOT NULL,
    `vk_id` VARCHAR(50),
    `first_name` VARCHAR(100),
    `last_name` VARCHAR(100),
    `middle_name` VARCHAR(100),
    `birthday` DATETIME,
    `position` VARCHAR(200),
    `phone` VARCHAR(50),
    `skype` VARCHAR(50),
    `file` VARCHAR(100),
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`user_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- categories
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `pid` INTEGER,
    `urlkey` VARCHAR(100) NOT NULL,
    `title` VARCHAR(100) NOT NULL,
    `url` VARCHAR(200),
    `navigation` TINYINT(1),
    `is_active` TINYINT(1),
    `mode` TINYINT(1),
    PRIMARY KEY (`id`),
    INDEX `categories_I_1` (`pid`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- content
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `category_id` INTEGER NOT NULL,
    `title` VARCHAR(100) NOT NULL,
    `description` VARCHAR(255),
    `text` LONGTEXT NOT NULL,
    `urlkey` VARCHAR(50),
    `is_active` TINYINT(1),
    `weight` INTEGER,
    `file` VARCHAR(200),
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`),
    INDEX `content_I_1` (`category_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- courses
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `pid` INTEGER,
    `title` VARCHAR(200) NOT NULL,
    `description` TEXT NOT NULL,
    `type` INTEGER DEFAULT 1,
    `file` VARCHAR(100),
    `is_public` TINYINT(1),
    `is_active` TINYINT(1),
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`),
    INDEX `courses_I_1` (`pid`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- lessons
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `lessons`;

CREATE TABLE `lessons`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `course_id` INTEGER,
    `title` VARCHAR(255) NOT NULL,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    `sortable_rank` INTEGER,
    PRIMARY KEY (`id`),
    INDEX `lessons_I_1` (`course_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- users_courses
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `users_courses`;

CREATE TABLE `users_courses`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `course_id` INTEGER NOT NULL,
    `started_at` DATETIME,
    `stopped_at` DATETIME,
    `is_passed` TINYINT(1) DEFAULT 0,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`),
    INDEX `users_courses_I_1` (`user_id`),
    INDEX `users_courses_I_2` (`course_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- users_lessons
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `users_lessons`;

CREATE TABLE `users_lessons`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `course_id` INTEGER NOT NULL,
    `lesson_id` INTEGER NOT NULL,
    `started_at` DATETIME,
    `stopped_at` DATETIME,
    `is_passed` TINYINT(1) DEFAULT 0,
    `is_closed` TINYINT(1) DEFAULT 0,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`),
    INDEX `users_lessons_I_1` (`user_id`),
    INDEX `users_lessons_FI_2` (`lesson_id`),
    INDEX `users_lessons_FI_3` (`course_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- lessons_quizes
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_quizes`;

CREATE TABLE `lessons_quizes`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `lesson_id` INTEGER NOT NULL,
    `quiz_id` INTEGER NOT NULL,
    `sortable_rank` INTEGER,
    PRIMARY KEY (`id`),
    INDEX `lessons_quizes_I_1` (`lesson_id`),
    INDEX `lessons_quizes_I_2` (`quiz_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- lessons_questions
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_questions`;

CREATE TABLE `lessons_questions`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `lesson_id` INTEGER NOT NULL,
    `title` VARCHAR(200) NOT NULL,
    `text` TEXT,
    `is_visible` TINYINT(1) DEFAULT 0,
    `is_answered` TINYINT(1) DEFAULT 0,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    `sortable_rank` INTEGER,
    PRIMARY KEY (`id`),
    INDEX `lessons_questions_I_1` (`user_id`),
    INDEX `lessons_questions_I_2` (`lesson_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- lessons_answers
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_answers`;

CREATE TABLE `lessons_answers`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `lesson_id` INTEGER NOT NULL,
    `question_id` INTEGER NOT NULL,
    `text` TEXT,
    `is_visible` TINYINT(1) DEFAULT 0,
    `is_accepted` TINYINT(1) DEFAULT 0,
    `accepted_by` INTEGER,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`),
    INDEX `lessons_answers_I_1` (`user_id`),
    INDEX `lessons_answers_I_2` (`lesson_id`),
    INDEX `lessons_answers_I_3` (`question_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- lessons_content
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_content`;

CREATE TABLE `lessons_content`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `lesson_id` INTEGER,
    `title` VARCHAR(200) NOT NULL,
    `description` TEXT,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    `sortable_rank` INTEGER,
    `descendant_class` VARCHAR(100),
    PRIMARY KEY (`id`),
    INDEX `lessons_content_I_1` (`lesson_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- lessons_content_files
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_content_files`;

CREATE TABLE `lessons_content_files`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `lesson_content_id` INTEGER,
    `file` VARCHAR(255) NOT NULL,
    `type` VARCHAR(50) NOT NULL,
    `title` VARCHAR(200),
    `caption` TEXT,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`),
    INDEX `lessons_content_files_I_1` (`lesson_content_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- lessons_content_texts
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_content_texts`;

CREATE TABLE `lessons_content_texts`
(
    `text` TEXT,
    `id` INTEGER NOT NULL,
    `lesson_id` INTEGER,
    `title` VARCHAR(200) NOT NULL,
    `description` TEXT,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    `sortable_rank` INTEGER,
    PRIMARY KEY (`id`),
    INDEX `lessons_content_texts_I_1` (`lesson_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- lessons_content_urls
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_content_urls`;

CREATE TABLE `lessons_content_urls`
(
    `url` VARCHAR(255) NOT NULL,
    `id` INTEGER NOT NULL,
    `lesson_id` INTEGER,
    `title` VARCHAR(200) NOT NULL,
    `description` TEXT,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    `sortable_rank` INTEGER,
    PRIMARY KEY (`id`),
    INDEX `lessons_content_urls_I_1` (`lesson_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- lessons_content_youtube
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_content_youtube`;

CREATE TABLE `lessons_content_youtube`
(
    `url` VARCHAR(255) NOT NULL,
    `id` INTEGER NOT NULL,
    `lesson_id` INTEGER,
    `title` VARCHAR(200) NOT NULL,
    `description` TEXT,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    `sortable_rank` INTEGER,
    PRIMARY KEY (`id`),
    INDEX `lessons_content_youtube_I_1` (`lesson_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- lessons_content_slideshare
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `lessons_content_slideshare`;

CREATE TABLE `lessons_content_slideshare`
(
    `url` VARCHAR(255) NOT NULL,
    `id` INTEGER NOT NULL,
    `lesson_id` INTEGER,
    `title` VARCHAR(200) NOT NULL,
    `description` TEXT,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    `sortable_rank` INTEGER,
    PRIMARY KEY (`id`),
    INDEX `lessons_content_slideshare_I_1` (`lesson_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- tasks
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE `tasks`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `lesson_id` INTEGER NOT NULL,
    `title` VARCHAR(200) NOT NULL,
    `text` TEXT,
    `file` VARCHAR(200),
    `created_at` DATETIME,
    `updated_at` DATETIME,
    `sortable_rank` INTEGER,
    PRIMARY KEY (`id`),
    INDEX `tasks_I_1` (`lesson_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- users_tasks
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `users_tasks`;

CREATE TABLE `users_tasks`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `lesson_id` INTEGER NOT NULL,
    `task_id` INTEGER NOT NULL,
    `user_id` INTEGER NOT NULL,
    `text` TEXT,
    `url` VARCHAR(200),
    `file` VARCHAR(200),
    `status` INTEGER DEFAULT 0,
    `mark` INTEGER,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`),
    INDEX `users_tasks_I_1` (`lesson_id`),
    INDEX `users_tasks_I_2` (`user_id`),
    INDEX `users_tasks_I_3` (`task_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- users_tasks_reviews
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `users_tasks_reviews`;

CREATE TABLE `users_tasks_reviews`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_task_id` INTEGER NOT NULL,
    `user_id` INTEGER NOT NULL,
    `text` TEXT,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`),
    INDEX `users_tasks_reviews_I_1` (`user_id`),
    INDEX `users_tasks_reviews_I_2` (`user_task_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- quiz
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `quiz`;

CREATE TABLE `quiz`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `description` LONGTEXT NOT NULL,
    `time` INTEGER NOT NULL,
    `num_questions` INTEGER NOT NULL,
    `is_active` TINYINT(1),
    `is_opened` TINYINT(1),
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- questions
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `text` LONGTEXT,
    `type` VARCHAR(50),
    `file` VARCHAR(255),
    `num_answers` INTEGER NOT NULL,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- quiz_questions
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `quiz_questions`;

CREATE TABLE `quiz_questions`
(
    `question_id` INTEGER NOT NULL,
    `quiz_id` INTEGER NOT NULL,
    PRIMARY KEY (`question_id`,`quiz_id`),
    INDEX `quiz_questions_I_1` (`question_id`),
    INDEX `quiz_questions_I_2` (`quiz_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- answers
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `question_id` INTEGER NOT NULL,
    `title` VARCHAR(255),
    `file` VARCHAR(255),
    `is_right` VARCHAR(255),
    PRIMARY KEY (`id`),
    INDEX `answers_I_1` (`question_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- users_questions
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `users_questions`;

CREATE TABLE `users_questions`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `quiz_id` INTEGER NOT NULL,
    `question_id` INTEGER NOT NULL,
    `user_quiz_id` INTEGER NOT NULL,
    `answer_id` INTEGER,
    `answer_text` VARCHAR(200),
    `is_right` TINYINT(1),
    `is_closed` TINYINT(1),
    PRIMARY KEY (`id`),
    INDEX `users_questions_I_1` (`user_id`),
    INDEX `users_questions_I_2` (`quiz_id`),
    INDEX `users_questions_I_3` (`question_id`),
    INDEX `users_questions_I_4` (`user_quiz_id`),
    INDEX `users_questions_I_5` (`answer_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- users_quiz
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `users_quiz`;

CREATE TABLE `users_quiz`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `quiz_id` INTEGER,
    `questions` VARCHAR(255) NOT NULL,
    `current` INTEGER NOT NULL,
    `num_right_answers` INTEGER,
    `started_at` DATETIME,
    `stopped_at` DATETIME,
    `is_active` TINYINT(1),
    `is_closed` TINYINT(1),
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`),
    INDEX `users_quiz_I_1` (`user_id`),
    INDEX `users_quiz_I_2` (`quiz_id`)
) ENGINE=MyISAM;

-- ---------------------------------------------------------------------
-- users_groups
-- ---------------------------------------------------------------------

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups`
(
    `group_id` INTEGER NOT NULL,
    `user_id` INTEGER NOT NULL,
    PRIMARY KEY (`group_id`,`user_id`),
    INDEX `users_groups_I_1` (`group_id`),
    INDEX `users_groups_I_2` (`user_id`)
) ENGINE=MyISAM;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
