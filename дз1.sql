CREATE TABLE `students` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL,
    `lastName` VARCHAR(30) NOT NULL,
    `birthday` DATE NULL
);


INSERT INTO `students`(`name`,`lastName`,`birthday`) VALUES 
    ('Иван','Иванов','2009-09-21'),
    ('Степан','Гулага','2015-12-31'),
    ('Александра','Петрова','2002-03-15'),
    ('Андрей','Сидоров','2002-11-08'),
    ('Дарья','Кузнецова','2003-11-28'),
    ('Дмитрий','Попов','2005-05-30'),
    ('Екатерина','Васильева','2004-08-12'),
    ('Сергей','Иванов','2000-12-30'),
    ('Анна','Федорова','2007-02-18'),
    ('Павел','Малахов','2015-10-07');


CREATE TABLE `subjects` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30) NOT NULL,
    `hours` SMALLINT NULL
);

INSERT INTO `subjects` (`name`,`hours`) VALUES
    ('математика',170),
    ('русский язык',170),
    ('английский', 50);


CREATE TABLE `marks` (
    `stud_id` INT,
    `subj_id` INT,
    `ddate` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `mark` TINYINT CHECK (`mark` > 1 and `mark` <= 5),
    FOREIGN KEY (`stud_id`) REFERENCES `students` (`id`),
    FOREIGN KEY (`subj_id`) REFERENCES `subjects` (`id`)
);

INSERT INTO `marks` (`stud_id`,`subj_id`,`ddate`,`mark`) VALUES
    (1, 2, '2025-10-10 08:45:00', 5),
    (2, 1, '2025-10-10 08:45:00', 5),
    (3, 3, '2025-10-11 10:00:00', 2),
    (4, 1, '2025-10-11 11:00:00', 3),
    (5, 2, '2025-10-11 11:00:00' , 4);


INSERT INTO `marks` (`stud_id`,`subj_id`,`mark`) VALUES
    (6, 3, 4),
    (7, 2, 5),
    (8, 1, 4),
    (9, 1, 3),
    (10, 3, 3);