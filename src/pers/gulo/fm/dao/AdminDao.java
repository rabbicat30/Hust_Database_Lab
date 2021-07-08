package pers.gulo.fm.dao;

import pers.gulo.fm.domain.*;
import pers.gulo.fm.exception.MyException;

import java.sql.SQLException;
import java.util.List;

/**
 * 管理员对象的数据库处理操作
 */
public interface AdminDao {

    /*查看所有用户的信息*/
    public List<User> queryAllUsers() throws MyException;

    /*删除用户*/
    public void deleteUser(User user) throws MyException;

    /*更新用户信息*/
    public void updateUser(User user) throws MyException;

    /*查询所有航班*/
    public List<Flight> queryAllFlight() throws MyException;

    /*添加新的航班*/
    public void insertFlight(Flight flight) throws MyException;

    /*删除航班*/
    public void deleteFlight(int flightID) throws MyException;

    /*根据用户名查找用户账单*/
    public List<FlightReserve> getTicketByUserid(int userID) throws MyException;

    /*查询所有订单*/
    public List<FlightReserve> queryAllFlightReserve() throws MyException;

    /*删除订单*/
    public void deleteBill(int flightID,int userID,int seatID,int ticketID,int price) throws MyException;

}