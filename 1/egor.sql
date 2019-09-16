DROP VIEW IF EXISTS v1;
CREATE VIEW v1 AS
SELECT teacher.*,
       teacher_student_group.subjectCode,
       teacher_student_group.groupCode,
       teacher_student_group.auditorium
FROM teacher
         INNER JOIN teacher_student_group
                    ON teacher.ownNumber LIKE teacher_student_group.ownNumber;


DROP VIEW IF EXISTS v2;
CREATE VIEW v2 AS
SELECT student_group.*,
       teacher_student_group.subjectCode,
       teacher_student_group.ownNumber,
       teacher_student_group.auditorium
FROM student_group
         INNER JOIN teacher_student_group
                    ON student_group.code LIKE teacher_student_group.groupCode
WHERE speciality LIKE 'ЭВМ';


DROP VIEW IF EXISTS v3;
CREATE VIEW v3 AS
SELECT teacher_student_group.ownNumber, teacher_student_group.auditorium
FROM teacher_student_group
WHERE teacher_student_group.subjectCode LIKE '18П';


DROP VIEW IF EXISTS v4;
CREATE VIEW v4 AS
SELECT subject.code,
       subject.name
FROM subject
         INNER JOIN teacher_student_group
                    ON subject.code LIKE teacher_student_group.subjectCode
WHERE ownNumber LIKE (SELECT ownNumber FROM teacher WHERE surname LIKE 'Костин');


DROP VIEW IF EXISTS v5;
CREATE VIEW v5 AS
SELECT teacher_student_group.groupCode
FROM teacher_student_group
WHERE ownNumber LIKE (SELECT ownNumber FROM teacher WHERE surname LIKE 'Фролов');


DROP VIEW IF EXISTS v6;
CREATE VIEW v6 AS
SELECT subject.*,
       teacher_student_group.groupCode,
       teacher_student_group.ownNumber,
       teacher_student_group.auditorium
FROM subject
         INNER JOIN teacher_student_group
                    ON subject.code LIKE teacher_student_group.subjectCode
WHERE speciality LIKE 'АСОИ';


DROP VIEW IF EXISTS v7;
CREATE VIEW v7 AS
SELECT teacher.*,
       teacher_student_group.groupCode,
       teacher_student_group.subjectCode,
       teacher_student_group.auditorium
FROM teacher
         INNER JOIN teacher_student_group
                    ON teacher.ownNumber LIKE teacher_student_group.ownNumber
WHERE speciality LIKE '%АСОИ%';


DROP VIEW IF EXISTS v8;
CREATE VIEW v8 AS
SELECT teacher.surname
FROM teacher
         INNER JOIN teacher_student_group
                    ON teacher.ownNumber LIKE teacher_student_group.ownNumber
WHERE auditorium = 210;

--TASK 9
SELECT DISTINCT subject.name AS subjectName,
       group2subject.name AS groupName
FROM subject
         INNER JOIN (SELECT student_group.name,
                            teacher_student_group.subjectCode
                     FROM student_group
                              INNER JOIN teacher_student_group
                                         ON student_group.code LIKE teacher_student_group.groupCode
                     WHERE auditorium >= 100
                       AND auditorium <= 200) AS group2subject
                    ON subject.code LIKE group2subject.subjectCode;


DROP VIEW IF EXISTS v10;
CREATE VIEW v10 AS
SELECT g1.name AS groupName1,
       g2.name AS groupName2
FROM student_group g1
         INNER JOIN student_group g2 ON g1.speciality LIKE g2.speciality
WHERE g1.code NOT LIKE g2.code;


DROP VIEW IF EXISTS v11;
CREATE VIEW v11 AS
SELECT sum(size)
FROM student_group
WHERE speciality LIKE 'ЭВМ';


DROP VIEW IF EXISTS v12;
CREATE VIEW v12 AS
SELECT teacher.ownNumber
FROM teacher
         INNER JOIN teacher_student_group ON teacher.ownNumber = teacher_student_group.ownNumber
WHERE groupCode IN (SELECT student_group.code FROM student_group WHERE student_group.speciality LIKE 'ЭВМ');


DROP VIEW IF EXISTS v14;
CREATE VIEW v14 AS

SELECT DISTINCT teacher.Фамилия
FROM teacher
JOIN teacher_subject_group l2s
  ON teacher.ЛичныйНомер = l2s.ЛичныйНомер
WHERE l2s.КодовыйНомерПредмета IN (
  SELECT subject.КодовыйНомерПредмета
  FROM subject
  JOIN teacher_subject_group l2s
    ON subject.КодовыйНомерПредмета = l2s.КодовыйНомерПредмета
  WHERE l2s.ЛичныйНомер IN (
    SELECT teacher.ЛичныйНомер
    FROM teacher
    JOIN teacher_subject_group l2s
      ON teacher.ЛичныйНомер = l2s.ЛичныйНомер
    WHERE l2s.КодовыйНомерПредмета = '14П'
  )
);


DROP VIEW IF EXISTS v15;
CREATE VIEW v15 AS
SELECT subject.*
FROM subject
         INNER JOIN teacher_student_group l2s ON subject.code = l2s.subjectCode
WHERE l2s.subjectCode NOT IN (SELECT subject.code
                          FROM subject
                                   INNER JOIN teacher_student_group l2s ON subject.code = l2s.subjectCode
                          WHERE l2s.ownNumber LIKE '221Л');


DROP VIEW IF EXISTS v16;
CREATE VIEW v16 AS
SELECT subject.*
FROM subject
         INNER JOIN teacher_student_group l2s ON subject.code = l2s.subjectCode
WHERE l2s.subjectCode NOT IN (SELECT subject.code
                          FROM subject
                                   INNER JOIN teacher_student_group l2s ON subject.code = l2s.subjectCode
                          WHERE l2s.groupCode LIKE (SELECT student_group.code FROM student_group WHERE student_group.name LIKE 'М-6'));


DROP VIEW IF EXISTS v17;
CREATE VIEW v17 AS
SELECT teacher.*
FROM teacher
         INNER JOIN teacher_student_group l2s on teacher.ownNumber = l2s.ownNumber
WHERE teacher.position LIKE 'Доцент' AND (l2s.groupCode LIKE '3Г' OR l2s.groupCode LIKE '8Г');


DROP VIEW IF EXISTS v18;
CREATE VIEW v18 AS
SELECT l2s.groupCode,
       l2s.subjectCode,
       l2s.ownNumber
FROM teacher
         INNER JOIN teacher_student_group l2s on teacher.ownNumber = l2s.ownNumber
WHERE teacher.department LIKE 'ЭВМ' AND teacher.speciality LIKE '%АСОИ%';


DROP VIEW IF EXISTS v19;
CREATE VIEW v19 AS
SELECT student_group.code
FROM teacher
         INNER JOIN student_group
                    ON teacher.speciality LIKE (SELECT CONCAT('%', student_group.speciality, '%'));


DROP VIEW IF EXISTS v20;
CREATE VIEW v20 AS
SELECT teacher.ownNumber
FROM teacher
         INNER JOIN teacher_student_group l2s ON teacher.ownNumber = l2s.ownNumber
WHERE l2s.subjectCode IN (SELECT subject.code
                          FROM subject
                                   INNER JOIN student_group
                                              ON student_group.speciality LIKE subject.speciality);


DROP VIEW IF EXISTS v21;
CREATE VIEW v21 AS
SELECT student_group.speciality
FROM student_group
         INNER JOIN teacher_student_group l2s ON student_group.code = l2s.groupCode
WHERE l2s.ownNumber IN (SELECT teacher.ownNumber FROM teacher WHERE teacher.department LIKE 'АСУ');


DROP VIEW IF EXISTS v22;
CREATE VIEW v22 AS
SELECT subject.code
FROM subject
         INNER JOIN teacher_student_group l2s ON subject.code = l2s.subjectCode
WHERE l2s.groupCode LIKE (SELECT student_group.code FROM student_group WHERE student_group.name LIKE 'АС-8');


DROP VIEW IF EXISTS v23;
CREATE VIEW v23 AS
SELECT student_group.code
FROM student_group
         INNER JOIN teacher_student_group l2s ON student_group.code = l2s.groupCode
WHERE l2s.subjectCode IN (SELECT subject.code
                          FROM subject
                                   INNER JOIN teacher_student_group l2s ON subject.code = l2s.subjectCode
                          WHERE l2s.groupCode LIKE (SELECT student_group.code FROM student_group WHERE student_group.name LIKE 'АС-8'));
