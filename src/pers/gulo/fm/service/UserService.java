package pers.gulo.fm.service;

import pers.gulo.fm.domain.*;
import pers.gulo.fm.exception.MyException;

import java.util.List;

public interface UserService {

    public User login(String username, String password);

    public void initialUser(User user) throws MyException;

    public void changeUserInfo(User user) throws MyException;

    public void bookFlight(int userID,int flightID,int seatID,int seatPrice) throws MyException;

    public void deleteTicket(int userID,int flightID,int seatID,int ticketID,int seatPrice) throws MyException;

    public List<FlightReserve> getPaidFlights(User user) throws MyException;

    public Flight getFlightByID(int flightID) throws MyException;
    public List<FlightSeat> getSeatsByFlightID(int flightID) throws MyException;

    public List<FlightSeat> getSeatsByFlightIDAndUserID(int userID,int flightID) throws MyException;
    public List<Notification> getNotificationByUser(int userID) throws MyException;
    public void deleteNotification(int userID,int flightID,int seatID) throws MyException;
    public String getUserNameByID(int userID) throws MyException;
    public List<Flight> queryFlight(String start, String destination, String s_time) throws MyException;

}