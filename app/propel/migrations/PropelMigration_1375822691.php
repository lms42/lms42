<?php

/**
 * Data object containing the SQL and PHP code to migrate the database
 * up to version 1375822691.
 * Generated on 2013-08-06 22:58:11 by smirik
 */
class PropelMigration_1375822691
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

ALTER TABLE `categories` CHANGE `is_active` `is_active` TINYINT(1) DEFAULT 0;

ALTER TABLE `content` CHANGE `is_active` `is_active` TINYINT(1) DEFAULT 0;

ALTER TABLE `courses`
    ADD `user_id` INTEGER AFTER `id`;

CREATE INDEX `courses_I_2` ON `courses` (`user_id`);

ALTER TABLE `lessons`
    ADD `user_id` INTEGER AFTER `id`;

CREATE INDEX `lessons_I_2` ON `lessons` (`user_id`);

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

ALTER TABLE `categories` CHANGE `is_active` `is_active` TINYINT(1);

ALTER TABLE `content` CHANGE `is_active` `is_active` TINYINT(1);

DROP INDEX `courses_I_2` ON `courses`;

ALTER TABLE `courses` DROP `user_id`;

DROP INDEX `lessons_I_2` ON `lessons`;

ALTER TABLE `lessons` DROP `user_id`;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
',
);
    }

}