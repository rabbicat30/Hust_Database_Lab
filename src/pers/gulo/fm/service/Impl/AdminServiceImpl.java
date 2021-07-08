package pers.gulo.fm.service.Impl;

import pers.gulo.fm.dao.Impl.AdminDaoImpl;
import pers.gulo.fm.domain.*;
import pers.gulo.fm.exception.MyException;
import pers.gulo.fm.service.AdminService;
import pers.gulo.fm.dao.*;

import java.sql.SQLException;
import java.util.List;

public class AdminServiceImpl implements AdminService {

    @Override
    public void deleteUser(User user) throws MyException{
        AdminDao adminDao = new AdminDaoImpl();
        adminDao.deleteUser(user);
    }


    @Override
    public void updateUser(User user) throws MyException{
        AdminDao adminDao=new AdminDaoImpl();
        adminDao.updateUser(user);
    }

    @Override
    public List<Flight> queryAllFlight() throws MyException{
        AdminDao adminDao=new AdminDaoImpl();
        return adminDao.queryAllFlight();
    }

    @Override
    public void insertFlight(Flight flight) throws MyException{
        AdminDao adminDao=new AdminDaoImpl();
        adminDao.insertFlight(flight);
    }

    @Override
    public void deleteFlight(int flightID) throws MyException{
        AdminDao adminDao=new AdminDaoImpl();
        adminDao.deleteFlight(flightID);
    }

    @Override
    public List<User> queryAllUsers() throws MyException{
        AdminDao adminDao=new AdminDaoImpl();
        return adminDao.queryAllUsers();
    }

    /*根据用户名查找用户账单*/
    public List<FlightReserve> getTicketByUserid(int userID) throws MyException{
        AdminDao adminDao=new AdminDaoImpl();
        return adminDao.getTicketByUserid(userID);
    }

    /*删除订单*/
    public void deleteBill(int flightID,int userID,int seatID,int ticketID,int price) throws MyException{
        AdminDao adminDao=new AdminDaoImpl();
        adminDao.deleteBill(flightID,userID,seatID,ticketID,price);
    }

    public List<FlightReserve> queryAllFlightReserve() throws MyException{
        AdminDao adminDao=new AdminDaoImpl();
        return adminDao.queryAllFlightReserve();
    }

}