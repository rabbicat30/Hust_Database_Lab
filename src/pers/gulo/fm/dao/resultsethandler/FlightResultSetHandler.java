package pers.gulo.fm.dao.resultsethandler;

import pers.gulo.fm.domain.Flight;
import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FlightResultSetHandler implements ResultSetHandler<List<Flight>> {
    @Override
    public List<Flight> handle(ResultSet rs) throws SQLException {
        List<Flight> flightList=new ArrayList<Flight>();
        while(rs.next()){
            Flight flight=new Flight();
            flight.setFlightID(rs.getInt("F_ID"));
            flight.setName(rs.getString("F_NAME"));
            flight.setS_time(rs.getString("START_TIME"));
            flight.setE_time(rs.getString("END_TIME"));
            flight.setS_city(rs.getString("START_CITY"));
            flight.setE_city(rs.getString("END_CITY"));
            flight.setPrice(rs.getInt("PRICE"));
            flight.setCapacity(rs.getInt("CAPACITY"));

            flightList.add(flight);
        }
        return flightList;
    } 
}
