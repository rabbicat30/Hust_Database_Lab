package pers.gulo.fm.dao.resultsethandler;

import pers.gulo.fm.domain.Notification;
import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NotificationResultSetHandler implements ResultSetHandler<List<Notification>> {
    @Override
    public List<Notification> handle(ResultSet rs) throws SQLException{
        List<Notification> notificationList=new ArrayList<Notification>();
        while(rs.next()){
            Notification notification=new Notification();
            notification.setUserID(rs.getInt("U_ID"));
            notification.setFlightID(rs.getInt("F_ID"));
            notification.setSeatID(rs.getInt("S_ID"));
            notification.setPrice(rs.getInt("S_PRICE"));
            notification.setS_time(rs.getString("S_TIME"));
            notification.setE_time(rs.getString("L_TIME"));
            notificationList.add(notification);
        }
        return notificationList;
    }
}
