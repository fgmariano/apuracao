package controller;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import persistence.NotaDAO;

public class TesteAdds {
	static NotaDAO dao = new NotaDAO();
	
	public static void main(String[] args) {
		float nota = 0;
		float novoNumero1;
		NumberFormat formatarFloat = new DecimalFormat("#.#");
		for (int quesito = 0; quesito < 9; quesito++) {
			for (int jurado = 1; jurado < 6; jurado++) {
				for (int escola = 0; escola < 14; escola++) {
					try {
						nota = 5 + (float) (Math.random() * 5);
						novoNumero1 = Float.parseFloat(formatarFloat.format(nota).replace(",", "."));
						dao.adicionarNotaTeste(quesito, escola, novoNumero1, jurado);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}