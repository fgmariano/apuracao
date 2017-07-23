create procedure sp_verTotal as
	update escola
		set nota_final = dbo.fn_verTotal(0)
		where id_escola = 0
	update escola
		set nota_final = dbo.fn_verTotal(1)
		where id_escola = 1
	update escola
		set nota_final = dbo.fn_verTotal(2)
		where id_escola = 2
	update escola
		set nota_final = dbo.fn_verTotal(3)
		where id_escola = 3
	update escola
		set nota_final = dbo.fn_verTotal(4)
		where id_escola = 4
	update escola
		set nota_final = dbo.fn_verTotal(5)
		where id_escola = 5
	update escola
		set nota_final = dbo.fn_verTotal(6)
		where id_escola = 6
	update escola
		set nota_final = dbo.fn_verTotal(7)
		where id_escola = 7
	update escola
		set nota_final = dbo.fn_verTotal(8)
		where id_escola = 8
	update escola
		set nota_final = dbo.fn_verTotal(9)
		where id_escola = 9
	update escola
		set nota_final = dbo.fn_verTotal(10)
		where id_escola = 10
	update escola
		set nota_final = dbo.fn_verTotal(11)
		where id_escola = 11
	update escola
		set nota_final = dbo.fn_verTotal(12)
		where id_escola = 12
	update escola
		set nota_final = dbo.fn_verTotal(13)
		where id_escola = 13
	select nome_escola as nome, nota_final as total
		from escola
		order by total desc