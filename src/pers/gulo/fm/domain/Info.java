package pers.gulo.fm.domain;

import java.util.List;

/**这个类用来显示界面需要显示的信息*/
public class Info extends Flight {
    private int ticketID;
    private int seatID;
    private int userID;
    private String username;
    public Info(Flight flight,int seatID,int userID,int ticketID){
        this.setFlightID(flight.getFlightID());
        this.setName(flight.getName());
        this.setS_time(flight.getS_time());
        this.setE_time(flight.getE_time());
        this.setS_city(flight.getS_city());
        this.setE_city(flight.getE_city());
        this.setPrice(flight.getPrice());
        this.setCapacity(flight.getCapacity());
        this.seatID=seatID;
        this.userID=userID;
        this.ticketID=ticketID;
    }

    public int  getSeatID() {
        return this.seatID;
    }

    public int getUserID() {
        return userID;
    }
    public int getTicketID(){
        return ticketID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username){
        this.username=username;
    }
}