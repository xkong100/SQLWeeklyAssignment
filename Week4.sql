DROP Table if exists company;

Create Table company (
	employee_id int PRIMARY KEY,
    employee_name varchar(300) NOT NULL,
    job_title varchar(300) NOT NULL,
    VP_id int Null,
    supervisor varchar(300) Null
    );

Insert Into company (employee_id, employee_name,job_title, VP_id, supervisor) values (1, 'John Edison', 'CEO', Null, Null);
Insert Into company (employee_id, employee_name,job_title, VP_id, supervisor) values (2, 'Linda May','Marketing VP', 1, 'John Edison');
Insert Into company (employee_id, employee_name,job_title, VP_id, supervisor) values (3, 'Bill Hom', 'Operation VP', 1, 'John Edison');
Insert Into company (employee_id, employee_name,job_title, VP_id, supervisor) values (4, 'Xue Liu','on-line sales Manager', 2, 'Linda May' );
Insert Into company (employee_id, employee_name,job_title, VP_id, supervisor) values (5, 'June Bullock','channel sales Manager', 2, 'Linda May');
Insert Into company (employee_id, employee_name,job_title, VP_id, supervisor) values (6, 'Juno Zhou','HR Manager', 3, 'Bill Hom');
Insert Into company (employee_id, employee_name,job_title, VP_id, supervisor) values (7, 'Sandra Lewis','Fullfillment Manager', 3, 'Bill Hom');
Insert Into company (employee_id, employee_name,job_title, VP_id, supervisor) values (8, 'Tracy Wang','Assistant', 1, 'John Edison');

select employee_id, employee_name, job_title, supervisor
	from company;


SELECT VP.employee_name AS VP, employee.employee_name AS employee
  FROM company VP
       JOIN company employee
       ON employee.VP_id = VP.employee_id
ORDER BY VP, employee;