package pers.gulo.fm.dao.resultsethandler;

import pers.gulo.fm.domain.Flight;
import pers.gulo.fm.domain.FlightSeat;
import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FlightSeatResultSetHandler implements ResultSetHandler<List<FlightSeat>> {
    @Override
    public List<FlightSeat> handle(ResultSet rs) throws SQLException{
        List<FlightSeat> flightSeatsList= new ArrayList<FlightSeat>();;
        while(rs.next()){
            FlightSeat flightSeat=new FlightSeat();
            flightSeat.setFlightID(rs.getInt("F_ID"));
            flightSeat.setSeatID(rs.getInt("S_ID"));
            flightSeat.setSeatStatus(rs.getInt("S_STATUS"));
            flightSeatsList.add(flightSeat);
        }
        return flightSeatsList;
    }
}
