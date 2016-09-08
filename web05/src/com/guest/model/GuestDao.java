package com.guest.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.guest.bean.GuestBean;

public class GuestDao {
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	private int result;
	
	public GuestBean selectOne(int sabun){
		String sql ="select * from guest where sabun="+sabun;
		GuestBean bean = new GuestBean();
		conn = OraDB.getConnection();
		try{
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()){
//				bean = new GuestBean();
				bean.setSabun(rs.getInt("sabun"));
				bean.setName(rs.getString("name"));
				bean.setNalja(rs.getDate("nalja"));
				bean.setPay(rs.getInt("pay"));
			}
		}catch(Exception ex){}finally{
			try{
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e){}
		}
		
		return bean;
	}
	
	public int insertOne(String name,int pay){
		String sql ="insert into guest (sabun,name,nalja,pay) ";
		sql+=" values (guest_seq.nextval,'"+name;
		sql+="',sysdate,"+pay+")";
		
		conn=OraDB.getConnection();
		try{
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		}catch(Exception ex){}finally{
				try {
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return result;
	}

	public ArrayList<GuestBean> selectAll(){
		String sql="select * from guest";
		ArrayList<GuestBean> list = new ArrayList<GuestBean>();
		conn=OraDB.getConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				GuestBean bean = new GuestBean();
				bean.setSabun(rs.getInt("sabun"));
				bean.setName(rs.getString("name"));
				bean.setNalja(rs.getDate("nalja"));
				bean.setPay(rs.getInt("pay"));
				list.add(bean);
			}
		} catch (SQLException e) {e.printStackTrace();
		} finally {try {
					if(rs!=null)rs.close();
					if(stmt!=null)stmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {e.printStackTrace();
				}
		}
		return list;
	}
	
	
}
