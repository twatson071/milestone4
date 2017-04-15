package finalbeans;

import java.io.Serializable;

import oracle.jdbc.*;
import java.io.IOException;
import java.sql.*;

public class DatabaseBean implements Serializable {
    private String prodName;
    private String prodSKU;
    private double prodPrice;
    private String prodCat;
    private static ResultSet rset;
    private static int colCount;
    private static int records = 0;
    
    public DatabaseBean() {
        prodName = "";
        prodSKU = "";
        prodPrice = 0;
        prodCat = "";
    }
    
    public void setProdName(String pn){
        this.prodName = pn;
    }
    
    public void setProdSKU(String ps){
        this.prodSKU = ps;
    }
    
    public void setProdPrice(double pp){
        this.prodPrice = pp;
    }
    
    public void setProdCat(String pc){
        this.prodCat = pc;
    }
    
    public String getProdName(){
        return this.prodName;
    }
    
    public String getProdSKU(){
        return this.prodSKU;
    }
    
    public double getProdPrice(){
        return this.prodPrice;
    }
    
    public String getProdCat(){
        return this.prodCat;
    }
    
    public void storeBean() {
        System.out.println("Trying to store from bean");
        try{
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1", "pass");

            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("Enter CREATE TABLE");           
            try{
                stmt.executeQuery("CREATE TABLE BD_PRODUCTS (ID INT PRIMARY KEY, PRODNAME VARCHAR(25) NOT NULL, PRODSKU VARCHAR(25) NOT NULL, PRODPRICE NUMBER(25,2) NOT NULL, PRODCAT VARCHAR(25) NOT NULL)");
            } catch(Exception e){
                
            }

            System.out.println("Exit CREATE TABLE");

            rset = stmt.executeQuery("SELECT COUNT(ID) FROM BD_PRODUCTS");
            System.out.println(rset);
            while(rset.next()) {
                records = Integer.parseInt(rset.getString(1));
            }

            System.out.println("Enter INSERT");
            System.out.println(records + 1);
            stmt.executeUpdate("INSERT INTO BD_PRODUCTS VALUES (" + (++records) + ", '" + this.prodName + "', '" + this.prodSKU + "', '" + this.prodPrice + "', '" + this.prodCat + "')");

            System.out.println("Exit INSERT");

            System.out.println("Connection established - now executing SELECT");
            rset = stmt.executeQuery("SELECT * FROM BD_PRODUCTS");
            colCount = rset.getMetaData().getColumnCount();
            
            System.out.println("Stored from bean");
        } catch (Exception e) {
            
        }
    }
    
    public void dropTables() {
        System.out.println("Dropping Tables");
        try{
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "student1", "pass");

            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("Enter DROP TABLE");           
            try{
                stmt.executeQuery("DROP TABLE BD_PRODUCTS");
                System.out.println("DROP TABLE successful!");
            } catch(Exception e){
                System.out.println("Error with DROP TABLE");
                System.out.println("\tEither table doesn't exist or an error occurred");
            }
            System.out.println("Exit DROP TABLE");
        } catch (Exception e) {
            
        }
    }
}