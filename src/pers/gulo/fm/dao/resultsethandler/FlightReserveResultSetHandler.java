package pers.gulo.fm.dao.resultsethandler;

import pers.gulo.fm.domain.FlightReserve;
import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FlightReserveResultSetHandler implements ResultSetHandler<List<FlightReserve>> {
    @Override
    public List<FlightReserve> handle(ResultSet rs)throws SQLException{
        List<FlightReserve> flightReserveList=new ArrayList<FlightReserve>();
        while(rs.next()){
            FlightReserve flightReserve=new FlightReserve();
            flightReserve.setTicketID(rs.getInt("T_ID"));
            flightReserve.setFlightID(rs.getInt("F_ID"));
            flightReserve.setSeatID(rs.getInt("S_ID"));
            flightReserve.setUserID(rs.getInt("U_ID"));
            flightReserve.setPrice(rs.getInt("S_PRICE"));
            flightReserveList.add(flightReserve);
        }
        return flightReserveList;
    }
}
