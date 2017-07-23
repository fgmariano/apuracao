package view;

import java.awt.EventQueue;
import java.awt.Font;
import java.sql.SQLException;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

import controller.ApuracaoController;
import persistence.NotaDAO;

public class MainWindow extends JFrame {
	
	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JTextField textField;
	private String[] escolas = new String[14];
	private String[] quesitos = new String[9];
	private JComboBox<String> cbEscola;
	private JComboBox<String> cbQuesito;
	private JComboBox<String> cbJurado = new JComboBox<String>();
	private JButton btnInserir;
	private JButton btnVerQuesito;
	private JButton btnVerTotal;
	private ApuracaoController controller;
	private NotaDAO dao = new NotaDAO();
	
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainWindow frame = new MainWindow();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public MainWindow() {
		setTitle("Apura\u00E7\u00E3o");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 600, 400);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblEscola = new JLabel("Escola");
		lblEscola.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblEscola.setBounds(33, 38, 46, 14);
		contentPane.add(lblEscola);
		
		JLabel lblJurado = new JLabel("Jurado");
		lblJurado.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblJurado.setBounds(33, 80, 46, 14);
		contentPane.add(lblJurado);
		
		JLabel lblQuesito = new JLabel("Quesito");
		lblQuesito.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblQuesito.setBounds(33, 125, 46, 14);
		contentPane.add(lblQuesito);
		
//		Carregar comboBox
		try {
			escolas = dao.carregarEscolas();
			quesitos = dao.carregarQuesitos();
			dao.carregarJurados(cbJurado, 0);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		cbEscola = new JComboBox<String>(escolas);
		cbEscola.setBounds(100, 36, 406, 20);
		contentPane.add(cbEscola);
		
		cbQuesito = new JComboBox<String>(quesitos);
		cbQuesito.setBounds(100, 78, 406, 20);
		contentPane.add(cbQuesito);
		
		cbJurado.setBounds(101, 123, 322, 20);
		contentPane.add(cbJurado);
		
		JLabel lblNota = new JLabel("Nota");
		lblNota.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblNota.setBounds(33, 236, 46, 14);
		contentPane.add(lblNota);
		
		textField = new JTextField();
		textField.setBounds(100, 234, 106, 20);
		contentPane.add(textField);
		textField.setColumns(10);
		
		btnInserir = new JButton("Inserir");
		btnInserir.setBounds(217, 233, 89, 23);
		contentPane.add(btnInserir);
		
		btnVerQuesito = new JButton("Ver Quesito");
		btnVerQuesito.setBounds(200, 281, 121, 23);
		contentPane.add(btnVerQuesito);
		
		btnVerTotal = new JButton("Ver Total");
		btnVerTotal.setBounds(367, 281, 114, 23);
		contentPane.add(btnVerTotal);
		
		controller = new ApuracaoController(cbEscola, cbQuesito, cbJurado, textField);
		
//		Listeners
		cbQuesito.addActionListener(controller);
		btnInserir.addActionListener(controller);
		btnVerQuesito.addActionListener(controller);
		btnVerTotal.addActionListener(controller);
	}
}
