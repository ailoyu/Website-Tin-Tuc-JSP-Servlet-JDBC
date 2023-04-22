package dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import dao.GenericDAO;
import mapper.RowMapper;

public class AbstractDAO<T> implements GenericDAO<T> {
	
	// thông tin từ file db.properties
	ResourceBundle resourceBundle = ResourceBundle.getBundle("db"); 
	
	public Connection getConnection() {
		try {
			// Khai báo driver từ file porm.xml
			
//			Class.forName("com.mysql.jdbc.Driver");
//			String url = "jdbc:mysql://localhost:3306/newservlet12month2018";
//			String user = "root";
//			String password = "1412";
			
			Class.forName(resourceBundle.getString("driverName"));
			String url = resourceBundle.getString("url");
			String user = resourceBundle.getString("user");
			String password = resourceBundle.getString("password");
			return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			return null;
		}
	}

	@Override
	public <T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters) {
		Connection c = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			List<T> list = new ArrayList<>();
			c  = getConnection();
			pst = c.prepareStatement(sql);
			
			// setparameter 
			setParameter(pst, parameters);
			
			
			rs = pst.executeQuery();
			while(rs.next()) {
				list.add(rowMapper.mapRow(rs));
			}
			return list;
		} catch (Exception e) {
			return null;
		} finally {
			try {
				c.close();
				pst.close();
				rs.close();
			} catch (Exception e2) {
				return null;
			}
		}
	}

	private void setParameter(PreparedStatement pst, Object... parameters) {
		try {
			for(int i = 0; i < parameters.length; i++) {
				Object p = parameters[i];
				int index = i + 1;
				
				if(p instanceof Long) {
					pst.setLong(index, (Long) p);
				}else if(p instanceof String) {
					pst.setString(index, (String) p);
				}else if(p instanceof Integer) {
					pst.setInt(index, (Integer) p);
				}else if(p instanceof Timestamp) {
					pst.setTimestamp(index, (Timestamp) p);
				}else if(p == null) {
					pst.setNull(index, Types.NULL);
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public Long insert(String sql, Object... parameters) {
		ResultSet rs = null;
		Connection c = null;
		PreparedStatement pst = null;
		Long id = null;
		try {
			c = getConnection();
			c.setAutoCommit(false);
			pst  = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			setParameter(pst, parameters);
			pst.executeUpdate();
			rs = pst.getGeneratedKeys(); // trả v�? đối tượng mới thêm vào db
			if(rs.next()) {
				id = rs.getLong(1); // trả v�? cột id của bài viết news
			}
			c.commit();
			return id;
		} catch (SQLException e) {
			try {
				c.rollback(); 
			// khi thay đổi db bị fail thì reset các giá trị success dc thêm cùng lúc đó
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				c.close();
				pst.close();
				rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public void update(String sql, Object... parameters) {
		Connection c = null;
		PreparedStatement pst = null;
		try {
			c = getConnection();
			c.setAutoCommit(false);
			pst  = c.prepareStatement(sql);
			setParameter(pst, parameters);
			pst.executeUpdate();
			c.commit();
			System.out.println("ok");
		} catch (SQLException e) {
			try {
				System.out.println("fail");
				c.rollback(); 
			// khi thay đổi db bị fail thì reset các giá trị success dc thêm cùng lúc đó
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				c.close();
				pst.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}


	@Override
	public void delete(String sql, Object... parameters) {
		Connection c = null;
		PreparedStatement pst = null;
		try {
			c = getConnection();
			c.setAutoCommit(false);
			pst  = c.prepareStatement(sql);
			setParameter(pst, parameters);
			pst.executeUpdate();
			c.commit();
			
		} catch (SQLException e) {
			try {
				c.rollback(); 
			// khi thay đổi db bị fail thì reset các giá trị success dc thêm cùng lúc đó
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {
			try {
				c.close();
				pst.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	@Override
	public int count(String sql, Object... parameters) {
		Connection c = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			int count = 0;
			c  = getConnection();
			System.out.println(sql);
			pst = c.prepareStatement(sql);
			setParameter(pst, parameters);
			rs = pst.executeQuery();
			while(rs.next()) {
				count = rs.getInt("count(*)"); // lấy cột count (*) của (select count(*) )
			}
			return count;
		} catch (Exception e) {
			return 0;
		} finally {
			try {
				c.close();
				pst.close();
				rs.close();
			} catch (Exception e2) {
				return 0;
			}
		}
	}

}
