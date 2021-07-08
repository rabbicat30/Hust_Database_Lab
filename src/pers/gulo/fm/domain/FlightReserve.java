package pers.gulo.fm.domain;

import java.util.Date;

/*旅客订票信息*/

/**订票时，一个航班的一种座位类型作为一个订单，订单上可以有多长机票，根据机票编号区分机票*/
public class FlightReserve {
    private int ticketID;/*机票编号*/
    private int flightID;/*航班编号*/
    private int seatID;/*座位编号*/
    private int userID;
    private int price;/*座位价格*/

    public int getTicketID() {
        return ticketID;
    }

    public void setTicketID(int ticketID) {
        this.ticketID = ticketID;
    }

    public int getFlightID() {
        return flightID;
    }

    public void setFlightID(int flightID) {
        this.flightID = flightID;
    }

    public int getSeatID() {
        return seatID;
    }

    public void setSeatID(int seatID) {
        this.seatID = seatID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

}