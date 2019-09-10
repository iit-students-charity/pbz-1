-- 1
SELECT * FROM teacher;
-- 2
SELECT * FROM student_group
WHERE Специальность = 'ЭВМ';
-- 3
SELECT DISTINCT ЛичныйНомер, НомерАудитории
FROM teacher_subject_group
WHERE КодовыйНомерПредмета = '18П';
-- 4
SELECT DISTINCT subject.КодовыйНомерПредмета, subject.НазваниеПредмета
FROM subject
JOIN teacher_subject_group
  ON teacher_subject_group.КодовыйНомерПредмета = subject.КодовыйНомерПредмета
JOIN teacher
  ON teacher.ЛичныйНомер = teacher_subject_group.ЛичныйНомер
WHERE teacher.Фамилия = 'Костин';
-- 5
SELECT DISTINCT teacher_subject_group.КодовыйНомерГруппы
FROM teacher
JOIN teacher_subject_group
  ON teacher_subject_group.ЛичныйНомер = teacher.ЛичныйНомер
WHERE Фамилия = 'Фролов';
-- 6
SELECT DISTINCT subject.*
FROM subject
JOIN teacher_subject_group
  ON teacher_subject_group.КодовыйНомерПредмета = subject.КодовыйНомерПредмета
WHERE Специальность = 'АСОИ';
-- 7
SELECT DISTINCT teacher.*
FROM teacher
JOIN teacher_subject_group
  ON teacher_subject_group.ЛичныйНомер = teacher.ЛичныйНомер
JOIN subject
  ON subject.КодовыйНомерПредмета = teacher_subject_group.КодовыйНомерПредмета
WHERE subject.Специальность = 'АСОИ';
-- 8
SELECT DISTINCT teacher.Фамилия
FROM teacher
JOIN teacher_subject_group
  ON teacher.ЛичныйНомер = teacher_subject_group.ЛичныйНомер
WHERE НомерАудитории = 210;
-- 9
SELECT DISTINCT subject.НазваниеПредмета, student_group.НазваниеГруппы
FROM subject
JOIN teacher_subject_group
  ON subject.КодовыйНомерПредмета = teacher_subject_group.КодовыйНомерПредмета
JOIN student_group
  ON student_group.КодовыйНомерГруппы = teacher_subject_group.КодовыйНомерГруппы
WHERE НомерАудитории BETWEEN 100 AND 200;
-- 10
SELECT DISTINCT group_1.КодовыйНомерГруппы, group_2.КодовыйНомерГруппы
FROM student_group AS group_1
JOIN student_group AS group_2
  ON group_1.Специальность = group_1.Специальность
WHERE group_1.КодовыйНомерГруппы < group_2.КодовыйНомерГруппы;
-- 11
SELECT SUM(КоличествоЧеловек)
FROM student_group
WHERE Специальность = 'ЭВМ';
-- 12
SELECT ЛичныйНомер
FROM teacher
WHERE Специальность LIKE '%ЭВМ%';
-- 13
SELECT subj.КодовыйНомерПредмета
FROM (
  SELECT subject.КодовыйНомерПредмета, COUNT(*)
  FROM subject
  JOIN teacher_subject_group
    ON subject.КодовыйНомерПредмета = teacher_subject_group.КодовыйНомерПредмета
  GROUP BY subject.КодовыйНомерПредмета
) AS subj
WHERE count = (
  SELECT DISTINCT COUNT(*)
  FROM student_group
);
-- 14
WITH selected_subjects AS (
  SELECT DISTINCT subject.КодовыйНомерПредмета
  FROM subject
  JOIN teacher_subject_group AS lesson
  ON subject.КодовыйНомерПредмета = lesson.КодовыйНомерПредмета
  WHERE lesson.ЛичныйНомер IN (
    SELECT ЛичныйНомер FROM teacher_subject_group
    WHERE КодовыйНомерПредмета = '14П'
  )
)
SELECT Фамилия FROM teacher
WHERE ЛичныйНомер IN (
  SELECT DISTINCT lesson.ЛичныйНомер
  FROM teacher_subject_group AS lesson
  WHERE lesson.КодовыйНомерПредмета IN (
    SELECT КодовыйНомерПредмета FROM selected_subjects
  )
  GROUP BY lesson.ЛичныйНомер
  HAVING COUNT(DISTINCT КодовыйНомерПредмета) = (
    SELECT COUNT(DISTINCT КодовыйНомерПредмета) FROM selected_subjects
  )
);
-- 15
SELECT DISTINCT subject.*
FROM subject
JOIN teacher_subject_group
  ON subject.КодовыйНомерПредмета = teacher_subject_group.КодовыйНомерПредмета
WHERE NOT teacher_subject_group.ЛичныйНомер = '221Л';
-- 16
SELECT subject.*
FROM subject
EXCEPT
SELECT subject.*
FROM subject
JOIN teacher_subject_group
  ON subject.КодовыйНомерПредмета = teacher_subject_group.КодовыйНомерПредмета
JOIN student_group
  ON student_group.КодовыйНомерГруппы = teacher_subject_group.КодовыйНомерГруппы
WHERE student_group.НазваниеГруппы = 'М-6';
-- 17
SELECT DISTINCT teacher.*
FROM teacher
JOIN teacher_subject_group
  ON teacher.ЛичныйНомер = teacher_subject_group.ЛичныйНомер
JOIN student_group
  ON student_group.КодовыйНомерГруппы = teacher_subject_group.КодовыйНомерГруппы
WHERE teacher.Должность = 'Доцент' AND student_group.КодовыйНомерГруппы IN ('3Г', '8Г');
-- 18
SELECT DISTINCT teacher_subject_group.ЛичныйНомер, teacher_subject_group.КодовыйНомерГруппы, teacher_subject_group.КодовыйНомерПредмета
FROM teacher_subject_group
JOIN teacher
  ON teacher.ЛичныйНомер = teacher_subject_group.ЛичныйНомер
WHERE teacher.Специальность LIKE '%АСОИ%' AND teacher.Кафедра = 'ЭВМ';
-- 19
SELECT DISTINCT student_group.КодовыйНомерГруппы
FROM student_group
JOIN teacher_subject_group
  ON student_group.КодовыйНомерГруппы = teacher_subject_group.КодовыйНомерГруппы
JOIN teacher
  ON teacher.ЛичныйНомер = teacher_subject_group.ЛичныйНомер
WHERE teacher.Специальность = student_group.Специальность;
-- 20
SELECT DISTINCT teacher.ЛичныйНомер
FROM teacher
JOIN teacher_subject_group
  ON teacher.ЛичныйНомер = teacher_subject_group.ЛичныйНомер
JOIN student_group
  ON student_group.КодовыйНомерГруппы = teacher_subject_group.КодовыйНомерГруппы
JOIN subject
  ON subject.КодовыйНомерПредмета = teacher_subject_group.КодовыйНомерПредмета
WHERE teacher.Кафедра = 'ЭВМ' AND subject.Специальность = student_group.Специальность;
-- 21
SELECT DISTINCT student_group.Специальность
FROM student_group
JOIN teacher_subject_group
  ON student_group.КодовыйНомерГруппы = teacher_subject_group.КодовыйНомерГруппы
JOIN teacher
  ON teacher.ЛичныйНомер = teacher_subject_group.ЛичныйНомер
WHERE teacher.Кафедра = 'АСУ';
-- 22
SELECT DISTINCT subject.КодовыйНомерПредмета
FROM subject
JOIN teacher_subject_group
  ON subject.КодовыйНомерПредмета = teacher_subject_group.КодовыйНомерПредмета
JOIN student_group
  ON student_group.КодовыйНомерГруппы = teacher_subject_group.КодовыйНомерГруппы
WHERE student_group.НазваниеГруппы = 'АС-8';
-- 23
SELECT DISTINCT teacher_subject_group.КодовыйНомерГруппы
FROM teacher_subject_group
WHERE teacher_subject_group.КодовыйНомерПредмета IN (
  SELECT DISTINCT teacher_subject_group.КодовыйНомерПредмета
  FROM teacher_subject_group
  JOIN student_group
    ON student_group.КодовыйНомерГруппы = teacher_subject_group.КодовыйНомерГруппы
  WHERE student_group.НазваниеГруппы = 'АС-8'
);
-- 24
SELECT DISTINCT student_group.КодовыйНомерГруппы
FROM student_group
WHERE NOT student_group.КодовыйНомерГруппы IN (
  SELECT DISTINCT teacher_subject_group.КодовыйНомерГруппы
  FROM teacher_subject_group
  WHERE teacher_subject_group.КодовыйНомерПредмета IN (
    SELECT DISTINCT teacher_subject_group.КодовыйНомерПредмета
    FROM teacher_subject_group
    JOIN student_group
      ON student_group.КодовыйНомерГруппы = teacher_subject_group.КодовыйНомерГруппы
    WHERE student_group.НазваниеГруппы = 'АС-8'
  )
);
-- 25
SELECT DISTINCT student_group.КодовыйНомерГруппы
FROM student_group
WHERE NOT student_group.КодовыйНомерГруппы IN (
  SELECT DISTINCT teacher_subject_group.КодовыйНомерГруппы
  FROM teacher_subject_group
  WHERE teacher_subject_group.КодовыйНомерПредмета IN (
    SELECT DISTINCT teacher_subject_group.КодовыйНомерПредмета
    FROM teacher_subject_group
    JOIN teacher
      ON teacher.ЛичныйНомер = teacher_subject_group.ЛичныйНомер
    WHERE teacher.ЛичныйНомер = '430Л'
  )
);
-- 26
SELECT DISTINCT teacher.ЛичныйНомер
FROM teacher
JOIN teacher_subject_group
  ON teacher.ЛичныйНомер = teacher_subject_group.ЛичныйНомер
JOIN student_group
  ON student_group.КодовыйНомерГруппы = teacher_subject_group.КодовыйНомерГруппы
JOIN subject
  ON subject.КодовыйНомерПредмета = teacher_subject_group.КодовыйНомерПредмета
WHERE NOT subject.КодовыйНомерПредмета = '12П' AND student_group.НазваниеГруппы = 'Э-15';
