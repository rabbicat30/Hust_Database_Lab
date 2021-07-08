package pers.gulo.fm.domain;

import java.util.Date;


/*航班信息*/
public class Flight{
    private int flightID;/*自增长的标识编号*/
    private String name;/*航班号*/
    private String s_time;/*出发时间*/
    private String e_time;/*到达时间*/
    private String s_city;/*出发城市*/
    private String e_city;/*到达城市*/
    private int price;
    private int capacity;
    private int num;
    public int getNum() {return num;}
    public void setNum(int num) {this.num=num;}

    public int getFlightID(){return flightID;};
    public void setFlightID(int flightID){ this.flightID=flightID;}

    public String getName(){return name;}
    public void setName(String name){this.name=name;}

    public String getS_time(){return s_time;}
    public String getE_time() { return e_time; }
    public void setS_time(String s_time){this.s_time=s_time;}
    public void setE_time(String e_time) { this.e_time = e_time; }

    public String getS_city() { return s_city; }
    public void setS_city(String s_city) { this.s_city = s_city; }

    public String getE_city() { return e_city; }
    public void setE_city(String e_city) { this.e_city = e_city; }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

}