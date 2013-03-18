<?php

/**
 * Data object containing the SQL and PHP code to migrate the database
 * up to version 1361545298.
 * Generated on 2013-02-22 16:01:38 by smirik
 */
class PropelMigration_1361545298
{

    public function preUp($manager)
    {
        // add the pre-migration code here
    }

    public function postUp($manager)
    {
        // add the post-migration code here
    }

    public function preDown($manager)
    {
        // add the pre-migration code here
    }

    public function postDown($manager)
    {
        // add the post-migration code here
    }

    /**
     * Get the SQL statements for the Up migration
     *
     * @return array list of the SQL strings to execute for the Up migration
     *               the keys being the datasources
     */
    public function getUpSQL()
    {
        return array (
  'default' => '
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `exams`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `quiz_id` INTEGER NOT NULL,
    `type_id` INTEGER NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `description` TEXT NOT NULL,
    `is_active` TINYINT(1) DEFAULT 0,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`),
    INDEX `exams_FI_1` (`type_id`),
    INDEX `exams_FI_2` (`quiz_id`)
) ENGINE=MyISAM;

CREATE TABLE `exams_types`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=MyISAM;

CREATE TABLE `exams_users`
(
    `exam_id` INTEGER NOT NULL,
    `user_id` INTEGER NOT NULL,
    PRIMARY KEY (`exam_id`,`user_id`),
    INDEX `exams_users_FI_2` (`user_id`)
) ENGINE=MyISAM;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
',
);
    }

    /**
     * Get the SQL statements for the Down migration
     *
     * @return array list of the SQL strings to execute for the Down migration
     *               the keys being the datasources
     */
    public function getDownSQL()
    {
        return array (
  'default' => '
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `exams`;

DROP TABLE IF EXISTS `exams_types`;

DROP TABLE IF EXISTS `exams_users`;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
',
);
    }

}