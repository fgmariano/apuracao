package controller;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.math.BigDecimal;
import java.sql.SQLException;

import javax.swing.JComboBox;
import javax.swing.JTextField;

import persistence.NotaDAO;
import view.FrameQuesito;
import view.FrameTotal;

public class ApuracaoController implements ActionListener {
	
	private JComboBox<String> escola = new JComboBox<String>();
	private JComboBox<String> quesito = new JComboBox<String>();
	private JComboBox<String> jurado = new JComboBox<String>();
	private NotaDAO dao = new NotaDAO();
	private JTextField textField = new JTextField();
	
	public ApuracaoController(JComboBox<String> escola, JComboBox<String> quesito, 
			JComboBox<String> jurado, JTextField textField) {
		this.escola = escola;
		this.quesito = quesito;
		this.jurado = jurado;
		this.textField = textField;
	}
	
	public void firstRun() {
		
	}
	
	public void atualizarJurado() {
		try {
			jurado.removeAllItems();
			dao.carregarJurados(jurado, quesito.getSelectedIndex());
			jurado.validate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void adicionarNota() {
		BigDecimal nota = new BigDecimal(textField.getText());
		try {
			dao.adicionarNota(quesito.getSelectedIndex(), escola.getSelectedIndex(), 
					nota, (jurado.getSelectedIndex()+1));
		} catch (NumberFormatException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getActionCommand() == "Inserir") {
			if (Float.parseFloat(textField.getText()) >= 5 & Float.parseFloat(textField.getText()) <= 10) {
				adicionarNota();
				if (escola.getSelectedIndex() < 13) {
					escola.setSelectedIndex(escola.getSelectedIndex()+1);
				} else if (jurado.getSelectedIndex() < 4) {
					jurado.setSelectedIndex(jurado.getSelectedIndex()+1);
					escola.setSelectedIndex(0);
				} else if (quesito.getSelectedIndex() < 8) {
					quesito.setSelectedIndex(quesito.getSelectedIndex()+1);
					escola.setSelectedIndex(0);
					jurado.setSelectedIndex(0);
					atualizarJurado();
				} else {
					escola.setSelectedIndex(0);
					jurado.setSelectedIndex(0);
					quesito.setSelectedIndex(0);
				}
			} else {
				textField.setText("NOTA INVALIDA");
			}
			
		} else if (e.getActionCommand() == "Ver Quesito") {
			new FrameQuesito(quesito.getSelectedIndex());
		} else if (e.getActionCommand() == "Ver Total") {
			new FrameTotal();
		} else if (e.getActionCommand() == "comboBoxChanged") {
			atualizarJurado();
		}
		
	}

}
