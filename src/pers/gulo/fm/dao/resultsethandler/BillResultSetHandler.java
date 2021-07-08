package pers.gulo.fm.dao.resultsethandler;

import pers.gulo.fm.domain.Bill;
import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BillResultSetHandler implements ResultSetHandler<List<Bill>> {
    @Override
    public List<Bill> handle(ResultSet rs) throws SQLException{
        List<Bill> billList=new ArrayList<Bill>();
        while(rs.next()){
            Bill bill =new Bill();
            bill.setUserID(rs.getInt("U_ID"));
            bill.setFlightID(rs.getInt("F_ID"));
            bill.setSeatID(rs.getInt("S_ID"));
            bill.setPrice(rs.getInt("S_PRICE"));
            bill.setOp(rs.getInt("OP"));
            billList.add(bill);
        }
        return billList;
    }
}
