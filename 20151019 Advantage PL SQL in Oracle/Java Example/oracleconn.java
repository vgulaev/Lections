package javaplsql;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.File;
import java.io.IOException;
import java.io.FileNotFoundException;
//import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.*;
import org.apache.poi.ss.usermodel.charts.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;


public class HelloPL {

    public static void readfromexcel() {
      System.out.println("start excel reading");
      //File file = new File( "c:\\_del\\ex.xlsx" );
      //Files.newInputStream(file)
      try {
          FileInputStream fis = new FileInputStream( "c:\\_del\\ex.xlsx" );
          XSSFWorkbook wb = new XSSFWorkbook( fis );
          XSSFSheet sh = wb.getSheet( "Лист1" );
          String exname = sh.getRow( 2 ).getCell( 2 ).getStringCellValue();
          Double exid = sh.getRow( 2 ).getCell( 1 ).getNumericCellValue();
          System.out.println( exname );
          System.out.println( exid.intValue() );
      } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
      }
      
      Workbook wb = new XSSFWorkbook();
      Sheet sheet = wb.createSheet("Sheet 1");

      try {
      FileOutputStream fileOut = new FileOutputStream("c:\\_del\\ooxml-scatter-chart.xlsx");
      wb.write( fileOut );
      fileOut.close();
         System.out.println("complate");
      } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
             System.out.println("error");
      }
    }
    
    public static void main( String[] args ) {
      System.out.println( hellostr() );
      System.out.println( primenum( 50 ) );
      System.out.println( addint( 100, 10 ) );
      System.out.println("-------- Oracle JDBC Connection Testing ------");

      try {

            Class.forName("oracle.jdbc.driver.OracleDriver");

      } catch (ClassNotFoundException e) {

            System.out.println("Where is your Oracle JDBC Driver?");
            e.printStackTrace();
            return;

      }
      readfromexcel();      
      testora();
  }
  
  public static String hellostr() {
      return "Hello my friend";
  }
  
  public static Integer primenum( Integer n ) {
      Integer k = 0;
      Integer p = 1;
      Boolean isPrime;
      while ( true ) {
        isPrime = true;
        for (int i = 2; i < Math.sqrt( Math.floor( p ) ); i++) {
            if ( p % i == 0 ){
                isPrime = false;
            }
        }       
        if ( isPrime == true ) {
            k = k + 1;
        }
        if ( k == n ) {
            break;
        }
        p = p + 2;
    }
      return p; 
  }
 public static Integer addint( Integer a, Integer b ) {
     return ( a + b );  
}
 public static void testora() {
    System.out.println("Start conn");
    Connection connection = null;
    try {
        connection = DriverManager.getConnection( "jdbc:oracle:thin:@localhost:1521:orcl", "system", "Pa$$w0rd");
        Statement statement = null;
        
        String insertString = "insert into FAMILY ( id, name ) values (?,?)";
        PreparedStatement insertStatement = null;
        insertStatement = connection.prepareStatement( insertString );
        insertStatement.setInt( 1, 445 );
        insertStatement.setString( 2, "LLLarisa" );
        insertStatement.executeQuery();
        //connection.commit();
        
        statement = connection.createStatement();           
        ResultSet result1 = statement.executeQuery(
                "SELECT * FROM FAMILY where id >2");
        while (result1.next()) {
            System.out.println("Номер в выборке #" + result1.getRow()
                    + "\t Номер в базе #" + result1.getInt("id") 
                    + "\t Номер в базе #" + result1.getString("name") );
        }           
        
    } catch (SQLException e) {

        System.out.println("executeQuery Failed! Check output console");
        e.printStackTrace();
        return;

    }
    }
}