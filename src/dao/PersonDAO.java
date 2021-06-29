package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.PersonDTO;

public class PersonDAO {
	
	private static PersonDAO instance;
	public synchronized static PersonDAO getInstance() {
		if(instance==null) {
			instance = new PersonDAO();
		}
		return instance;
	}
	private PersonDAO() {}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insert(String name, String contact) throws Exception {
		String sql ="insert into Person values(Person_seq.nextval,?,?,sysdate)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				pstat.setString(1, name);
				pstat.setString(2, contact);
				int result = pstat.executeUpdate();
				con.commit();
				return result;
		}
	}
	public List<PersonDTO> getAll() throws Exception {
		String sql="select * from Person";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
				List<PersonDTO> list = new ArrayList();
				while(rs.next()) {
					int id = rs.getInt("id");
					String name = rs.getString("name");
					String contact = rs.getString("contact");
					Date reg_date = rs.getDate("reg_date");
					list.add(new PersonDTO(id, name, contact, reg_date));
				}
				return list;
		}
	}
	public int delete(int delid) throws Exception{
		String sql="delete from Person where id=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, delid);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public int modify(PersonDTO dto)throws Exception{
		String sql="update Person set name=?,contact=? where id=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1,dto.getName() );
			pstat.setString(2, dto.getContact());
			pstat.setInt(3, dto.getId());
			int result= pstat.executeUpdate();
			con.commit();
			return result;
		}
		
	}
}
