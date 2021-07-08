package pers.gulo.fm.dao;

import pers.gulo.fm.domain.*;
import pers.gulo.fm.exception.MyException;

import java.rmi.server.ExportException;
import java.util.List;

public interface UserDAO {
    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    public User login(String username, String password);

    /**
     * 用户注册,主要完成个人信息填写工作
     * @param
     * @throws Exception
     */
    public void initialUser(User user) throws MyException;

    /**
     * 更改个人信息
     * @param user
     */
    public void changeUserInfo(User user) throws MyException;

    /**
     * 用户根据出发地、目的地、出发时间查询航班信息
     * @param start
     * @param destination
     * @param s_time
     * @return 返回航班List表
     * @exception Exception
     */
    public List<Flight> queryFlight(String start, String destination, String s_time) throws MyException;


    /**
     * 预订机票，需要知道航班、座位和用户的信息
     * @param
     * @throws Exception
     */
    public void bookFlight(int userID,int flightID,int seatID,int seatPrice) throws MyException;

    /**
     * 退票，根据预订的机票退票
     * @throws Exception
     */
    public void deleteTicket(int userID,int flightID,int seatID,int ticketID,int seatPrice) throws MyException;

    /**
     * 获取用户已经付款的订单
     */
    public List<FlightReserve> getPaidFlights(User user) throws MyException;

    /**通过flightID查询flight*/
    public Flight getFlightByID(int flightID) throws MyException;
    /**通过航班号来查询当前航班的座位信息*/
    public List<FlightSeat> getSeatsByFlightID(int flightID) throws MyException;
    /**通过航班编号和用户编号获得用户的座位*/
    public List<FlightSeat> getSeatsByFlightIDAndUserID(int userID,int flightID) throws MyException;
    /**获取用户的取票通知单*/
    public List<Notification> getNotificationByUser(int userID) throws MyException;
    /**通过用户和航班删除对应的取票通知*/
    public void deleteNotification(int userID,int flightID,int seatID) throws MyException;
    /**由用户ID获取用户名*/
    public String getUserNameByID(int userID) throws MyException;
    //public List<FlightSeat> getFlightSeat(int flightID) throws MyException;

    //public int getBillID(int userID,int flightID) throws MyException;

    //public FlightReserve getFlightReserve(int userID,int flightID,int ticketID) throws MyException;
}