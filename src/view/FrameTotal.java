package view;

import java.sql.SQLException;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import model.Escola;
import persistence.NotaDAO;

public class FrameTotal extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JTable tblTotal;
	
	public FrameTotal() {
		setBounds(100, 100, 700, 450);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(10, 11, 664, 356);
		contentPane.add(scrollPane);
		
		tblTotal = new JTable();
		scrollPane.setViewportView(tblTotal);
		tblTotal.setModel(new DefaultTableModel(
			new Object[][] {
			},
			new String[] {
				"Escola", "Total Pontos"
			}
		));
		tblTotal.getColumnModel().getColumn(0).setPreferredWidth(223);
		tblTotal.getColumnModel().getColumn(1).setPreferredWidth(102);
		
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);		
		preencherTabela();
		setVisible(true);
	}
	
	public void preencherTabela() {
		NotaDAO dao = new NotaDAO();
		try {
			List<Escola> notas = dao.notasTotal();
			DefaultTableModel modelo = (DefaultTableModel) tblTotal.getModel();
			if (modelo.getRowCount() > 0) {
				modelo.setRowCount(0);
			}
			
			for (Escola e : notas) {
				Object[] objeto = new Object[9];
				objeto[0] = e.getEscola();
				objeto[1] = e.getTotal();
				modelo.addRow(objeto);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
