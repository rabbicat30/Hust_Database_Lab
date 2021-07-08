package pers.gulo.fm.test;

import pers.gulo.fm.dao.AdminDao;
import pers.gulo.fm.dao.Impl.AdminDaoImpl;
import pers.gulo.fm.domain.Flight;
import pers.gulo.fm.exception.MyException;

import java.sql.SQLException;
import java.util.List;

public class Main {
    public static void main(String[] args) throws SQLException{
        AdminDao adminDao=new AdminDaoImpl();
    }
}