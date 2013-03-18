<?php

/**
 * Data object containing the SQL and PHP code to migrate the database
 * up to version 1361820287.
 * Generated on 2013-02-25 20:24:47 by smirik
 */
class PropelMigration_1361820287
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

ALTER TABLE `exams` ADD `started_at` DATETIME after `name`;

ALTER TABLE `exams_users` DROP PRIMARY KEY,
    ADD `id` INTEGER NOT NULL AUTO_INCREMENT FIRST,
    ADD `user_quiz_id` INTEGER AFTER `user_id`,
    ADD PRIMARY KEY (`id`);

CREATE INDEX `exams_users_FI_1` ON `exams_users` (`exam_id`);

CREATE INDEX `exams_users_FI_3` ON `exams_users` (`user_quiz_id`);

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

ALTER TABLE `exams` DROP `started_at`;

ALTER TABLE `exams_users` DROP PRIMARY KEY;

DROP INDEX `exams_users_FI_1` ON `exams_users`;

DROP INDEX `exams_users_FI_3` ON `exams_users`;

ALTER TABLE `exams_users` DROP `id`;

ALTER TABLE `exams_users` DROP `user_quiz_id`;

ALTER TABLE `exams_users` ADD PRIMARY KEY (`exam_id`,`user_id`);

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
',
);
    }

}