  /*a. students со столбцами id (целое число от -32768 до 32767, не пустое), 
  full_name (текстовое поле длиной до 200 символов, не пустое),
  age (минимальный целочисленный тип, nullable), country, 
  city (оба поля текстовые длиной 150 символов, nullable), 
  is_active (логический тип, не пустое)*/
  
  CREATE TABLE students
(
	 id_student smallint NOT NULL,
	 full_name varchar(200) NOT NULL,
	 age tinyint null,
	 country varchar(150) null,
	 city varchar(150) null,
	 is_active boolean NOT null,
	 PRIMARY key (id_student)
 );
 
-- drop table students;

    /*b. courses со столбцами id (целое число от -32768 до 32767, не пустое), 
    name (текстовое поле длиной 150 символов, не пустое),
    description (текстовое поле длиной 500 символов, nullable), 
    duration (целое число от -128 до 127, не пустое)*/

create table courses
(
	id_course smallint not null,
	name varchar(150) not null, 
	description varchar(500) null, 
	duration tinyint not null,
	PRIMARY key (id_course)
);

-- drop table courses;

/*student_course со столбцами 
student_id (число того же типа, что и id в students, не пустое)
и course_id (число того же типа, что и id в courses, не пустое), 
enrollment_date (дата в формате YYYY-MM-DD, не пустое)*/

create table student_course
(
	student_id smallint NOT null,
	course_id smallint not null,
	enrollment_date date not null,
	FOREIGN KEY (student_id) REFERENCES students (id_student),
	FOREIGN KEY (course_id) REFERENCES courses (id_course)
);

	/*Добавьте данные во все таблицы:

    a. Пять записей в students (три студента должны быть неактивны)*/
    
    INSERT INTO students values (1, 'Cispia Megellus', 22, 'Russia', 'Moscow', 1);
    INSERT INTO students values (2, 'Cominia Quiriac', 21, 'Russia', 'Omsk', 1);
    INSERT INTO students values (3, 'Adamus Rectus', 22, 'Russia', 'Novosibirsk', 0);
    INSERT INTO students values (4, 'Trachalio Felix', 25, 'Russia', 'Tomsk', 0);
    INSERT INTO students values (5, 'Tuccia Litumaris', 27, 'Russia', 'Omsk', 0);

    /*b. Три записи в courses*/
    insert into courses values (1, 'English language', 'The discipline "English language" is taught to students of all educational programs.', 4);
    insert into courses values (2, 'Philosophy', 'The discipline "Philosophy" is taught to students of all educational programs.', 1);
    insert into courses values (3, 'Physics', 'The discipline "Physics" is taught to students of all educational programs.', 2);

    /*c. Добавьте как минимум по две записи в student_course для всех активных студентов.*/
    
    INSERT INTO student_course values (1, 1, '2018-09-01');
    INSERT INTO student_course values (1, 2, '2019-09-01');
	INSERT INTO student_course values (1, 3, '2018-02-01');

	INSERT INTO student_course values (2, 1, '2018-09-01');
    INSERT INTO student_course values (2, 2, '2019-09-01');
	INSERT INTO student_course values (2, 3, '2018-02-01');

   -- DELETE FROM student_course WHERE course_id  = '3'

	-- a. students - увеличьте поле full_name на 200 символов, удалите столбец age

	ALTER TABLE students
	MODIFY column full_name varchar(400) NOT NULL;

	ALTER TABLE students
	DROP column age;

    -- b. courses - добавьте текстовое поле teacher_name длиной до 400 символов

	ALTER TABLE courses
	ADD column teacher_name varchar(400) NOT NULL;
	
    -- c. student_course - добавьте поле completion_date, которое будет содержать дату в формате YYYY-MM-DD и может быть пустым.

	ALTER TABLE student_course
	ADD column complition_date date NULL;

	

-- drop table student_course;