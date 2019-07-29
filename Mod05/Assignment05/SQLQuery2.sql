create procedure spUser_New
@name varchar(20),
@username varchar(50), 
@email varchar(50), 
@reason text
as begin
insert into newuser (name, username, email, reason)
values(@name, @username, @email, @reason)
end