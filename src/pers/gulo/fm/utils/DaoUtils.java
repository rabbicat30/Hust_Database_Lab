package pers.gulo.fm.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/*使用jdbc和mysql获得连接*/
public class DaoUtils {
    private static DataSource source = new ComboPooledDataSource();
    private DaoUtils(){
    }

    public static DataSource getSource(){
        return source;
    }

    public static Connection getConnection(){
        try{
            return source.getConnection();
        }catch(SQLException e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


}
