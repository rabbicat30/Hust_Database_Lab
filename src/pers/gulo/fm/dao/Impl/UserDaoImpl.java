package pers.gulo.fm.dao.Impl;

import pers.gulo.fm.dao.resultsethandler.*;

import pers.gulo.fm.domain.*;
import pers.gulo.fm.exception.MyException;
import pers.gulo.fm.utils.DaoUtils;
import org.apache.commons.dbutils.QueryRunner;
import pers.gulo.fm.dao.UserDAO;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class UserDaoImpl implements UserDAO{

    @Override
    public User login(String username,String password){
        User user=null;
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        try{
           List<User> userList=runner.query("SELECT * FROM USER_TABLE WHERE USERNAME= ? AND PASSWORD=?",new UserResultSetHandler(),username,password);
            if(userList!=null&&userList.size()!=0) {
                user=userList.get(0);
                System.out.println(user.getRealName());
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return user;
    }

    /** U_ID USERNAME PASSWORD U_NAME ID_CARD PHONE_NUMBER */
    @Override
    public void initialUser(User user) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        try {
            runner.update("INSERT INTO USER_TABLE(USERNAME,PASSWORD,U_NAME,ID_CARD,U_TYPE) VALUES(?,?,?,?,0)",user.getName(),user.getPassword(),
                    user.getRealName(),user.getIdCard());
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("发生错误或用户名已存在，请重新注册");
        }
    }

    @Override
    public void changeUserInfo(User user) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        try {
            runner.update("UPDATE USER_TABLE SET USERNAME=?,PASSWORD=?,U_NAME=?,ID_CARD=? WHERE U_ID=?",
                    user.getName(),user.getPassword(),user.getRealName(),user.getIdCard(),user.getUserID());
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("修改失败");
        }
    }

    @Override
    public List<Flight> queryFlight(String start, String destination, String s_time) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<Flight> flightList=null;
        /**只需要在订票的同时更新航班的座位信息，就可以保证航班的座位数量为最新的数量而非最初的总的数量*/
        if(start==null||destination==null||s_time==null) {
        	try{
                flightList=runner.query("SELECT * FROM flight_table WHERE START_CITY=? AND END_CITY=? AND START_TIME =? ORDER BY END_TIME ASC",new FlightResultSetHandler(),
                        start,destination,s_time);
                
            }catch (SQLException e){
                e.printStackTrace();
                throw new MyException("查找航班失败，请输入正确的地点和时间");
            } 
            return flightList;
        }
        else {
        	try{
        		flightList=runner.query("SELECT * FROM flight_table WHERE START_CITY=? AND END_CITY=? AND SUBSTRING_INDEX(START_TIME,\' \',1) =? ORDER BY END_TIME ASC",new FlightResultSetHandler(),
        				start,destination,s_time);
        		if(flightList.size()==0)
        			System.out.println("size 0");
        		System.out.println("size "+flightList.size());
                for(Flight f:flightList) {
                	int num=f.getCapacity()-getSeatsByFlightID(f.getFlightID()).size();
                	System.out.println("capcaity="+f.getCapacity()+" num "+num);
                	f.setNum(num);
                }
        	}catch (SQLException e){
        		e.printStackTrace();
        		throw new MyException("查找航班失败，请输入正确的地点和时间");
        	} 
        	return flightList;
        }
    }

    /**
    @Override
    public int getBillID(int userID,int flightID) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<Bill> billList=null;
        try {
            billList = runner.query("SELECT * FROM BILL_TABLE WHERE U_ID= ? AND F_ID =?", new BillResultSetHandler(),
                    userID, flightID);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return billList.get(0).getBillID();
    }*/

    @Override
    /**
     * 订票
     * 更新座位信息表
     * 向订票信息表中插入新的记录
     * 向取票通知表中插入新的记录
     * 向账单表中插入新的记录
     */
    public void bookFlight(int userID,int flightID,int seatID,int seatPrice) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        try {
            runner.update("CALL boot_insert(?,?,?,?)",userID,flightID,seatID,seatPrice);
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("预订失败");
        }
    }

    /**
     * 更新座位信息表
     * 删除订票信息表中的记录
     * 删除取票通知表中的记录
     * 向账单中插入新的账单信息——退票信息
     * @throws MyException
     */
    @Override
    public void deleteTicket(int userID,int flightID,int seatID,int ticketID,int seatPrice) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        try{
            runner.update("CALL delete_boot(?,?,?,?,?)",ticketID,userID,flightID,seatID,seatPrice);
            }catch (SQLException e){
                e.printStackTrace();
                throw new MyException("退票失败");
        }
    }

    //@Override
    /**
     * 完成账单付款，修改付款标志为和账单付款时间
     * 修改订票信息中的票为已付款
     */
    /**
    public void payBill(Bill bill) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        try {
            runner.update("UPDATE BILL_TABLE SET IS_PAID=1,RESERVE_TIME =? WHERE B_ID=?",
                    new Date(), bill.getBillID());
            runner.update("UPDATE FLIGHT_RESERVE_TABLE SET IS_PAID=1 WHERE B_ID=?",
                    bill.getBillID());
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("订单付款失败");
        }
    }
     */
/**
    @Override
    public List<Bill> getBill(User user) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<Bill> billList=null;
        try {
            billList=runner.query("SELECT * FROM BILL_TABLE WHERE U_ID=?",new BillResultSetHandler(),user.getUserID());
        }catch (SQLException e){
            e.printStackTrace();
        }
        return billList;
    }
*/

    //@Override
    /**获取整个账单的所有订票信息*/
    /**
    public List<FlightReserve> getFlightReserves(Bill bill) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<FlightReserve> flightReserveList=null;
        try {
            flightReserveList=runner.query("SELECT * FROM FLIGHT_RESERVE_TABLE WHERE B_ID = ?",new FlightReserveResultSetHandler(),bill.getBillID());
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flightReserveList;
    }
     */

    @Override
    /**获取已经付款的全部订票信息
     * 账单信息中标识了是否完成付款
     * 而订票信息中只标识了是否取消退票，无法确定是否完成付款
     */
    public List<FlightReserve> getPaidFlights(User user) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<FlightReserve> flightReserveList=null;
        try {
            flightReserveList=runner.query("SELECT * FROM FLIGHT_RESERVE_TABLE WHERE  U_ID=?",new FlightReserveResultSetHandler(),user.getUserID());
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flightReserveList;
    }

    @Override
    public Flight getFlightByID(int flightID) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<Flight> flightList=null;
        Flight flight=null;
        try {
            flightList=runner.query("SELECT * FROM FLIGHT_TABLE WHERE F_ID=?",new FlightResultSetHandler(),flightID);
            if(flightList!=null&&flightList.size()!=0){
                flight=flightList.get(0);
            }
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("查找失败");
        }
        return flight;
    }

    @Override
    public List<FlightSeat> getSeatsByFlightID(int flightID) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<FlightSeat> flightSeatList=null;
        try {
            flightSeatList=runner.query("SELECT * FROM SEAT_TABLE WHERE F_ID = ? AND S_STATUS=0",new FlightSeatResultSetHandler(),flightID);
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("查找失败");
        }
        return flightSeatList;
    }

    @Override
    public List<FlightSeat> getSeatsByFlightIDAndUserID(int userID,int flightID) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<FlightSeat> flightSeatList=null;
        try {
            flightSeatList=runner.query("SELECT * FROM SEAT_TABLE WHERE F_ID = ? AND U_ID=?",new FlightSeatResultSetHandler(),flightID,userID);
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("查找失败");
        }
        return flightSeatList;
    }

    @Override
    public List<Notification> getNotificationByUser(int userID) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<Notification> notificationList=null;
        try {
            notificationList=runner.query("SELECT * FROM NOTIFICATION_TABLE WHERE U_ID=?",new NotificationResultSetHandler(),userID);
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("获取取票通知表失败");
        }
        return notificationList;

    }

    @Override
    public void deleteNotification(int userID,int flightID,int seatID) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        try {
            runner.update("DELETE  FROM NOTIFICATION_TABLE WHERE U_ID=? AND F_ID=? AND S_ID=?",userID,flightID,seatID);
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("删除取票通知记录失败");
        }
    }

    @Override
    public String getUserNameByID(int userID) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<User> userList=null;
        String username=new String();
        try {
            userList=runner.query("SELECT * FROM USER_TABLE WHERE U_ID=?",new UserResultSetHandler(),userID);
            if(userList!=null&&userList.size()!=0){
                username=userList.get(0).getName();
            }
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("查找失败");
        }
        return username;
    }
/**
    @Override
    public List<FlightReserve> getUnPaidFlight(User user) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<FlightReserve> flightReserveList=null;
        try {
            flightReserveList=runner.query("SELECT * FROM FLIGHT_RESERVE_TABLE WHERE IS_PAID=0 AND IS_CANCELED = 0 AND U_ID =?",new FlightReserveResultSetHandler(),user.getUserID());
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flightReserveList;
    }

    @Override
    /**
     * 获取退款的机票信息
     */
    /**
    public List<FlightReserve> getDrawbackTickets(User user) throws MyException {
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<FlightReserve> flightReserveList=null;
        try {
            flightReserveList=runner.query("SELECT * FROM FLIGHT_RESERVE_TABLE WHERE U_ID= ? AND IS_CANCELED=1 AND IS_PAID=1",
                    new FlightReserveResultSetHandler(),user.getUserID());
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flightReserveList;
    }

    @Override
    public List<FlightSeat> getFlightSeat(int flightID) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<FlightSeat> flightSeatList=null;
        try {
            flightSeatList=runner.query("SELECT * FROM SEAT_TABLE WHERE F_ID=?",new FlightSeatResultSetHandler(),flightID);
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("查找座位失败");
        }
        return flightSeatList;
    }

    @Override
    public FlightReserve getFlightReserve(int userID,int flightID,int ticketID) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<FlightReserve> flightReserveList=null;
        try {
            flightReserveList=runner.query("SELECT * FROM FLIGHT_TABLE WHERE U_ID=? AND F_ID=? AND T_ID=?",
                    new FlightReserveResultSetHandler(),userID,flightID,ticketID);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flightReserveList.get(0);
    }
    */
}