exec sp_configure 'show advanced options', 1;
go 
reconfigure
go 
exec sp_configure 'clr enabled',1;
exec sp_configure 'clr strict security', 0


