package persistence;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JComboBox;

import model.Escola;
import model.Quesito;

public class NotaDAO {
	
	private Connection c;
	
	public NotaDAO() {
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();
	}
	
	public String[] carregarEscolas() throws SQLException {
		int i = 0;
		String[] escolas = new String[14];
		PreparedStatement ps = c.prepareStatement("SELECT * FROM escola");
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			escolas[i] = rs.getString("nome_escola");
			i++;
		}
		return escolas;
	}
	
	public String[] carregarQuesitos() throws SQLException {
		int i = 0;
		String[] quesitos = new String[9];
		PreparedStatement ps = c.prepareStatement("SELECT nome_quesito FROM quesito");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			quesitos[i] = rs.getString("nome_quesito");
			i++;
		}
		return quesitos;
	}
	
	public void carregarJurados(JComboBox<String> combo, int quesito) throws SQLException {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT ju.nome_jurado FROM jurado ju ");
		sql.append("INNER JOIN quesitoJurado qj ");
		sql.append("ON ju.id_jurado = qj.id_jurado ");
		sql.append("WHERE qj.id_quesito = ?");
		PreparedStatement ps = c.prepareStatement(sql.toString());
		ps.setInt(1, quesito);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			combo.addItem(rs.getString(1));
		}
	}
	
	public void adicionarNota(int quesito, int escola, BigDecimal nota, int posNota) throws SQLException {
		String sql = "call sp_addNotas (?, ?, ?, ?)";
		CallableStatement cs = c.prepareCall(sql);
		cs.setInt(1, quesito);
		cs.setInt(2, escola);
		cs.setBigDecimal(3, nota);
		cs.setInt(4, posNota);
		cs.execute();
		cs.close();
	}
	
	public void adicionarNotaTeste(int quesito, int escola, float nota, int posNota) throws SQLException {
		String sql = "call sp_addNotas (?, ?, ?, ?)";
		CallableStatement cs = c.prepareCall(sql);
		cs.setInt(1, quesito);
		cs.setInt(2, escola);
		cs.setFloat(3, nota);
		cs.setInt(4, posNota);
		cs.execute();
		cs.close();
	}
	
	public List<Quesito> notasQuesito(int quesito) throws SQLException {
		List<Quesito> notas = new ArrayList<Quesito>();
		String sql = "CALL sp_verQuesito (?)";
		CallableStatement cs = c.prepareCall(sql);
		cs.setInt(1, quesito);
		ResultSet rs = cs.executeQuery();
		
		while(rs.next()) {
			Quesito q = new Quesito();
			q.setEscola(rs.getString("nome_escola"));
			q.setNota1(rs.getFloat("nota1"));
			q.setNota2(rs.getFloat("nota2"));
			q.setNota3(rs.getFloat("nota3"));
			q.setNota4(rs.getFloat("nota4"));
			q.setNota5(rs.getFloat("nota5"));
			q.setMaior(rs.getFloat("maior"));
			q.setMenor(rs.getFloat("menor"));
			q.setTotal(rs.getFloat("total"));
			notas.add(q);
		}
		return notas;
	}
	
	public List<Escola> notasTotal() throws SQLException {
		List<Escola> notas = new ArrayList<Escola>();
//		String sql = "CALL sp_verQuesito";
		StringBuffer sql = new StringBuffer();
		sql.append("select nome_escola as nome, nota_final as total ");
		sql.append("FROM escola ");
		sql.append("ORDER BY total DESC");
//		CallableStatement cs = c.prepareCall(sql);
		PreparedStatement cs = c.prepareStatement(sql.toString());
		ResultSet rs = cs.executeQuery();
		
		while(rs.next()) {
			Escola e = new Escola();
			e.setEscola(rs.getString("nome"));
			e.setTotal(rs.getFloat("total"));
			notas.add(e);
		}
		return notas;
	}
	
}
