package pers.gulo.fm.dao.Impl;

import pers.gulo.fm.dao.AdminDao;
import pers.gulo.fm.dao.resultsethandler.*;
import pers.gulo.fm.domain.*;

import pers.gulo.fm.exception.MyException;
import pers.gulo.fm.utils.DaoUtils;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;
import java.util.List;

/**
 * 为管理员单独创建一个表
 */
public class AdminDaoImpl implements AdminDao{

    @Override
    public void deleteUser(User user) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        try{
            runner.update("DELETE FROM USER_TABLE WHERE U_ID = ??",user.getUserID());
        }catch(SQLException e){
            e.printStackTrace();
            throw new MyException("删除管理员失败");
        }
    }


    @Override
    public void updateUser(User user) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        try {
            runner.update("UPDATE USER_TABLE SET U_NAME=?,ID_CARD=?,U_TYPE=? WHERE U_ID = ?",user.getRealName(),user.getIdCard(),user.getUserType(),user.getUserID());
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("修改管理员信息失败");
        }
    }

    @Override
    public List<Flight> queryAllFlight() throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<Flight> flightList=null;
        try {
            flightList=runner.query("SELECT * FROM FLIGHT_TABLE ORDER BY F_ID ASC",new FlightResultSetHandler());
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flightList;
    }

    @Override
    public void deleteFlight(int flightID) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        try{
            //runner.update("DELETE FROM FLIGHT_RESERVE_TABLE WHERE F_ID=?",flightID);
            //runner.update("DELETE FROM BILL_TABLE WHERE F_ID=?",flightID);
            //runner.update("DELETE FROM NOTIFICATION_TABLE WHERE F_ID = ?",flightID);
            runner.update("DELETE FROM SEAT_TABLE WHERE F_ID = ? ",flightID);
            runner.update("DELETE FROM FLIGHT_TABLE WHERE F_ID=?",flightID);
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("删除航班失败");
        }
    }

    @Override
    public void insertFlight(Flight flight) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        try{
            runner.update("INSERT INTO FLIGHT_TABLE (F_NAME,START_TIME,END_TIME,START_CITY,END_CITY,PRICE,CAPACITY) VALUES(?,?,?,?,?,?,?)",
                    flight.getName(),flight.getS_time(),flight.getE_time(),flight.getS_city(),flight.getE_city(),
                    flight.getPrice(),flight.getCapacity());
            runner.update("CALL add_new_seats(?,?)",flight.getFlightID(),flight.getCapacity());
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("插入航班失败");
        }
    }


    @Override
    public List<User> queryAllUsers() throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<User> userList=null;
        try {
            userList=runner.query("SELECT * FROM USER_TABLE",new UserResultSetHandler());
        }catch (SQLException e){
            e.printStackTrace();
        }
        return userList;
    }

   @Override
   public List<FlightReserve> getTicketByUserid(int userID) throws MyException{
       QueryRunner runner=new QueryRunner(DaoUtils.getSource());
       List<FlightReserve> flightReserveList=null;
       try {
           flightReserveList=runner.query("SELECT * FROM FLIGHT_RESERVE_TABLE WHERE U_ID = ?",new FlightReserveResultSetHandler(),userID);
       }catch (SQLException e){
           e.printStackTrace();
           throw new MyException("查找失败");
       }
       return flightReserveList;
   }
    @Override
    public void deleteBill(int flightID,int userID,int seatID,int ticketID,int price) throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        try {
            runner.update("CALL delete_boot(?,?,?,?,?)",ticketID,userID,
                    flightID,seatID,price);
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("删除失败");
        }
    }

    @Override
    public List<FlightReserve> queryAllFlightReserve() throws MyException{
        QueryRunner runner=new QueryRunner(DaoUtils.getSource());
        List<FlightReserve> flightReserveList=null;
        try {
            flightReserveList=runner.query("SELECT * FROM FLIGHT_RESERVE_TABLE",new FlightReserveResultSetHandler());
        }catch (SQLException e){
            e.printStackTrace();
            throw new MyException("查找失败");
        }
        return flightReserveList;
    }
}