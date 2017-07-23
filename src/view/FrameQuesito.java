package view;

import java.sql.SQLException;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import model.Quesito;
import persistence.NotaDAO;

public class FrameQuesito extends JFrame {
	
	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JTable tblNotas;
	private int quesito;
	
	public FrameQuesito(int quesito) {
		this.quesito = quesito;
		setBounds(100, 100, 700, 450);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 11, 664, 356);
		contentPane.add(scrollPane);
		
		tblNotas = new JTable();
		scrollPane.setViewportView(tblNotas);
		tblNotas.setModel(new DefaultTableModel(
			new Object[][] {
			},
			new String[] {
				"Escola", "Nota 1", "Nota 2", "Nota 3", "Nota 4", "Nota 5", "Maior", "Menor", "Total"
			}
		));
		tblNotas.getColumnModel().getColumn(0).setPreferredWidth(212);
		tblNotas.getColumnModel().getColumn(1).setPreferredWidth(50);
		tblNotas.getColumnModel().getColumn(2).setPreferredWidth(50);
		tblNotas.getColumnModel().getColumn(3).setPreferredWidth(49);
		tblNotas.getColumnModel().getColumn(4).setPreferredWidth(51);
		tblNotas.getColumnModel().getColumn(5).setPreferredWidth(57);
		tblNotas.getColumnModel().getColumn(6).setPreferredWidth(46);
		tblNotas.getColumnModel().getColumn(7).setPreferredWidth(52);
		tblNotas.getColumnModel().getColumn(8).setPreferredWidth(57);
		
		preencherTabela();
		
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setVisible(true);
	}
	
	public void preencherTabela() {
		NotaDAO dao = new NotaDAO();
		try {
			List<Quesito> notas = dao.notasQuesito(quesito);
			DefaultTableModel modelo = (DefaultTableModel) tblNotas.getModel();
			if (modelo.getRowCount() > 0) {
				modelo.setRowCount(0);
			}
			
			for (Quesito q : notas) {
				Object[] objeto = new Object[9];
				objeto[0] = q.getEscola();
				objeto[1] = q.getNota1();
				objeto[2] = q.getNota2();
				objeto[3] = q.getNota3();
				objeto[4] = q.getNota4();
				objeto[5] = q.getNota5();
				objeto[6] = q.getMaior();
				objeto[7] = q.getMenor();
				objeto[8] = q.getTotal();
				modelo.addRow(objeto);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
