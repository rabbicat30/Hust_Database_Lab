package pers.gulo.fm.service.Impl;

import pers.gulo.fm.dao.Impl.UserDaoImpl;
import pers.gulo.fm.dao.UserDAO;
import pers.gulo.fm.domain.*;
import pers.gulo.fm.exception.MyException;
import pers.gulo.fm.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    @Override
    public User login(String username, String password){
        UserDAO userDAO=new UserDaoImpl();
        return userDAO.login(username,password);
    }

    @Override
    public void initialUser(User user) throws MyException{
        UserDAO userDAO=new UserDaoImpl();
        userDAO.initialUser(user);
    }

    @Override
    public void changeUserInfo(User user){
        UserDAO userDAO=new UserDaoImpl();
        try {
            userDAO.changeUserInfo(user);
        } catch (MyException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Flight> queryFlight(String start, String destination, String s_time) throws MyException{
        UserDAO userDAO=new UserDaoImpl();
        return userDAO.queryFlight(start,destination,s_time);
    }

    @Override
    public void bookFlight(int userID,int flightID,int seatID,int seatPrice) throws MyException{
        UserDAO userDAO=new UserDaoImpl();
        userDAO.bookFlight(userID,flightID,seatID,seatPrice);
    }

    @Override
    public void deleteTicket(int userID,int flightID,int seatID,int ticketID,int seatPrice) throws MyException{
        UserDAO userDAO=new UserDaoImpl();
        userDAO.deleteTicket(userID,flightID,seatID,ticketID,seatPrice);
    }


    @Override
    public List<FlightReserve> getPaidFlights(User user) throws MyException{
        UserDAO userDAO=new UserDaoImpl();
        return userDAO.getPaidFlights(user);
    }
    @Override
    public Flight getFlightByID(int flightID) throws MyException{
        UserDAO userDAO=new UserDaoImpl();
        return userDAO.getFlightByID(flightID);
    }

    @Override
    public List<FlightSeat> getSeatsByFlightID(int flightID) throws MyException{
        UserDAO userDAO=new UserDaoImpl();
        return userDAO.getSeatsByFlightID(flightID);
    }

    @Override
    public List<FlightSeat> getSeatsByFlightIDAndUserID(int userID,int flightID) throws MyException{
        UserDAO userDAO=new UserDaoImpl();
        return userDAO.getSeatsByFlightIDAndUserID(userID,flightID);
    }

    @Override
    public List<Notification> getNotificationByUser(int userID) throws MyException{
        UserDAO userDAO=new UserDaoImpl();
        return userDAO.getNotificationByUser(userID);
    }

    @Override
    public void deleteNotification(int userID,int flightID,int seatID) throws MyException{
        UserDAO userDAO=new UserDaoImpl();
        userDAO.deleteNotification(userID,flightID,seatID);
    }

    @Override
    public String getUserNameByID(int userID) throws MyException{
        UserDAO userDAO=new UserDaoImpl();
        return userDAO.getUserNameByID(userID);
    }

}