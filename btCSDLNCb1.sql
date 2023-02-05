
drop procedure if exists reward_salary;
DELIMITER $$
create procedure reward_salary()
begin 
with bt as ( select first_name ,  round(datediff( curdate() , hire_date ) / 365 , 0) as work_time, salary,
    case 
		when round(datediff( curdate() , hire_date ) / 365 , 0) >= 9 then 12000
        when round(datediff( curdate() , hire_date ) / 365 , 0) >6 then 8000
        when round(datediff( curdate() , hire_date ) / 365 , 0) >4 then 6000
        else 5000
	end as reward
    from employees )
	select first_name, work_time, salary, reward, salary + reward as total_salary
	from bt;
end;
call reward_salary
 -- câu 2:
 
 
 drop procedure if exists pro_search_name;
 DELIMITER $$
 create procedure pro_search_name(f_name varchar(20))
 begin
	select employee_id , (concat(first_name,' ', last_name))  as full_name , email , 
    phone_number , hire_date , job_id , salary , manager_id , department_id
    from employees where first_name = f_name ;
 end;
 call pro_search_name('Lex')