package pers.gulo.fm.dao.resultsethandler;

import pers.gulo.fm.domain.User;
import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserResultSetHandler implements ResultSetHandler<List<User>> {
    @Override
    public List<User> handle(ResultSet rs) throws SQLException {
        List<User> userList=new ArrayList<User>();
        while(rs.next()){
            User user=new User();
            user.setUserID(rs.getInt("U_ID"));
            user.setName(rs.getString("USERNAME"));
            user.setPassword(rs.getString("PASSWORD"));
            user.setRealName(rs.getString("U_NAME"));
            user.setIdCard(rs.getString("ID_CARD"));
            user.setUserType(rs.getInt("U_TYPE"));
            userList.add(user);
        }
        return userList;
    }
}
