package dao.impl;

import java.util.List;

import dao.IUserDAO;
import mapper.UserMapper;
import model.UserModel;

public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {

	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
		StringBuilder sql = new StringBuilder("Select * from user as u");
		sql.append(" inner join role as r on r.id = u.roleid");
		sql.append(" where username = ? and password = ? and status = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), userName, password, status);
		// Lấy vị trí thứ 0 (đầu ti�?n) trong list
		return users.isEmpty() ? null : users.get(0);
	}

}
