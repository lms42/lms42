<?php

/**
 * Data object containing the SQL and PHP code to migrate the database
 * up to version 1361733926.
 * Generated on 2013-02-24 20:25:26 by smirik
 */
class PropelMigration_1361733926
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

CREATE TABLE `configs`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `pid` INTEGER,
    `title` VARCHAR(200),
    `key` VARCHAR(200) NOT NULL,
    `value` TEXT NOT NULL,
    `type` VARCHAR(20) NOT NULL,
    `is_visible` TINYINT(1) DEFAULT 1,
    PRIMARY KEY (`id`),
    INDEX `configs_FI_1` (`pid`)
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

DROP TABLE IF EXISTS `configs`;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
',
);
    }

}