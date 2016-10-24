package com;
import java.sql.*;
import java.util.ArrayList;


public class Manager {

 
	   // JDBC driver name and database URL
	   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	   static final String DB_URL = "jdbc:mysql://redvelvetdb.czvyaawmcxuy.ap-south-1.rds.amazonaws.com:3306/botdb";

	   //  Database credentials
	   static final String USER = "awsadmin";
	   static final String PASS = "awsadmin";
	   
	   public static void main(String[] args) {
	   Connection conn = null;
	   Statement stmt = null;
	   
	  ArrayList al=new ArrayList();
	   try{
	      //STEP 2: Register JDBC driver
	      Class.forName("com.mysql.jdbc.Driver");

	      //STEP 3: Open a connection
	      System.out.println("Connecting to a selected database...");
	      conn = DriverManager.getConnection(DB_URL, USER, PASS);
	      System.out.println("Connected database successfully...");
	      
	      //STEP 4: Execute a query
	      System.out.println("Creating statement...");
	      stmt = conn.createStatement();

	      String sql = "SELECT  distinct(name),SUM(quantity)from orderline ol, menuitem mi, orderinfo od where mi.itemid = ol.itemid and od.orderid=ol.orderidGROUP BY name;";
	      ResultSet rs = stmt.executeQuery(sql);
	      //STEP 5: Extract data from result set
	      while(rs.next()){
	         //Retrieve by column name
	    	 String name = rs.getString("name");
	    	 System.out.println(rs.getString("name"));
	    	 al.add(name);

	         //Display values
	         System.out.print("name: " + name);
	         
	      }
	      rs.close();
	      System.out.println(al);
	   }catch(SQLException se){
	      //Handle errors for JDBC
	      se.printStackTrace();
	   }catch(Exception e){
	      //Handle errors for Class.forName
	      e.printStackTrace();
	   }finally{
	      //finally block used to close resources
	      try{
	         if(stmt!=null)
	            conn.close();
	      }catch(SQLException se){
	      }// do nothing
	      try{
	         if(conn!=null)
	            conn.close();
	      }catch(SQLException se){
	         se.printStackTrace();
	      }//end finally try
	   }//end try
	   System.out.println("Goodbye!");
	}//end main
	}//end JDBCExample

