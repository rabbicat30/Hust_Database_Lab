package pers.gulo.fm.utils;

import java.io.FileReader;
import java.sql.*;
import java.util.Properties;

public class JDBCUtils {
    private static Properties prop =null;
    private JDBCUtils(){};

    static {
        try{
            prop = new Properties();
            prop.load(new FileReader(JDBCUtils.class.getClassLoader().getResource("config.properties").getPath()));
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /*获取文件中的数据库配置*/
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName(prop.getProperty("driver"));
        return DriverManager.getConnection(prop.getProperty("url"),prop.getProperty("user"),prop.getProperty("password"));
    }

    /*关闭连接*/
    public static void close(ResultSet rs, Statement stat,Connection conn){
        if(rs!=null){
            try{
                rs.close();
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                rs=null;
            }
        }
        if(stat!=null){
            try{
                stat.close();
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                stat=null;
            }
        }
        if(conn!=null){
            try{
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                conn=null;
            }
        }
    }
}
