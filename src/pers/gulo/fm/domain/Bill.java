package pers.gulo.fm.domain;

import java.util.Date;

/*账单信息*/
public class Bill {
    private int userID;/*下单用户账号ID*/
    private int flightID;/*航班ID，一个航班对应一个订单*/
    private int seatID;
    private int price;
    private int op;

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getFlightID() { return flightID; }

    public void setFlightID(int flightID) { this.flightID = flightID; }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getSeatID() {
        return seatID;
    }

    public void setSeatID(int seatID) {
        this.seatID = seatID;
    }

    public int getOp() {
        return op;
    }

    public void setOp(int op) {
        this.op = op;
    }
}