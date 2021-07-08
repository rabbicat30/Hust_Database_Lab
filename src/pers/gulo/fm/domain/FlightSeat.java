package pers.gulo.fm.domain;

/*航班座位信息*/
public class FlightSeat {
    private int seatID;
    private int flightID;
    private int seatStatus;/*座位状态，0—未被订座，1-被订座*/

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


    public int getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(int seatStatus) {
        this.seatStatus = seatStatus;
    }

}