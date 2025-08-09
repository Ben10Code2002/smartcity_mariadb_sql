TYPE=VIEW
query=select `smartcity`.`employees`.`Employee_ID` AS `Employee_ID`,`smartcity`.`employees`.`First_name` AS `First_name`,`smartcity`.`employees`.`Last_name` AS `Last_name` from `smartcity`.`employees` where `smartcity`.`employees`.`Assigned_department` = \'Road Development\'
md5=3ba68c27c912d6a6f9347e579fc56feb
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=0001750558559502960
create-version=2
source=SELECT Employee_ID, First_name, Last_name FROM Employees WHERE Assigned_department = \'Road Development\'
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_uca1400_ai_ci
view_body_utf8=select `smartcity`.`employees`.`Employee_ID` AS `Employee_ID`,`smartcity`.`employees`.`First_name` AS `First_name`,`smartcity`.`employees`.`Last_name` AS `Last_name` from `smartcity`.`employees` where `smartcity`.`employees`.`Assigned_department` = \'Road Development\'
mariadb-version=110702
