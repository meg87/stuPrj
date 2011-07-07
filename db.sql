create table supervisors
(
	supervisor_id integer not null AUTO_INCREMENT, 
	supervisor_fname varchar(255), 
	supervisor_mname varchar(255), 
	supervisor_lname varchar(255), 
	supervisor_username varchar(255) not null, 
	supervisor_password varchar(255) not null, 
	supervisor_email varchar(255), 
	supervisor_active integer default 0, 
	primary key (supervisor_id), 
	UNIQUE (supervisor_username), 
	UNIQUE (supervisor_email)
);

create table projects
(
	project_id integer not null AUTO_INCREMENT, 
	project_title varchar(255) not null, 
	project_description text not null, 
	project_supervisor integer not null, 
	primary key (project_id),
	foreign key (project_supervisor) references supervisors(supervisor_id)
);

create table students
(
	student_id integer not null AUTO_INCREMENT, 
	student_fname varchar(255), 
	student_mname varchar(255), 
	student_lname varchar(255), 
	student_username int not null, 
	student_password varchar(255) not null, 
	student_email varchar(255), 
	student_active integer default 0, 
	student_gpa float(3, 2), 
	student_workon integer, 
	primary key (student_id), 
	UNIQUE (student_username), 
	UNIQUE (student_email), 
	foreign key (student_workon) references projects(project_id)
);

create table visits 
(
	visit_id integer not null AUTO_INCREMENT, 
	visit_date varchar(10) not null, 
	visit_by integer not null, 
	visit_to integer, 
	visit_details text not null, 
	primary key (visit_id), 
	foreign key (visit_by) references students(student_id), 
	foreign key (visit_to) references supervisors(supervisor_id)
);

create table chooses 
(
	student integer not null, 
	project integer not null, 
	constraint id UNIQUE (student, project),
	foreign key (student) references students(student_id) on delete cascade, 
	foreign key (project) references projects(project_id) on delete cascade
);
