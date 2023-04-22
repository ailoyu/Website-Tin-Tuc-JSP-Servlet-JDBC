package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.RoleModel;
import model.UserModel;

public class UserMapper implements RowMapper<UserModel> {

	@Override
	public UserModel mapRow(ResultSet rs) {
		try {
			UserModel user = new UserModel();
			user.setId(rs.getLong("id"));
			user.setUserName(rs.getString("username"));
			user.setFullName(rs.getString("fullname"));
			user.setPassword(rs.getString("password"));
			user.setStatus(rs.getInt("status"));
			user.setRoleId(rs.getLong("roleid"));
			
			
			// try catch nếu chỉ là câu select bth, ko có inner join vào bảng role
			// ko trả bị lỗi NullPointerException 
			try { 
				RoleModel role = new RoleModel();
				role.setCode(rs.getString("code"));
				role.setName(rs.getString("name"));
				
				user.setRole(role);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
}
