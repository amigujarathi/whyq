<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import ="java.sql.*" %>
    <html>
    <body>
 
<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://redvelvetdb.czvyaawmcxuy.ap-south-1.rds.amazonaws.com:3306/";
String dbName = "botdb";
String userId = "awsadmin";
String password = "awsadmin";


    try{
        String username = request.getParameter("user");   
        String pass = request.getParameter("pass");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection(connectionUrl+dbName, userId, password);    
        PreparedStatement pst = conn.prepareStatement("Select user,pass from validation where user=? and pass=?");
        pst.setString(1, username);
        pst.setString(2, pass);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())           
        	 response.sendRedirect("NewFinal.jsp");      
        else
        	response.sendRedirect("login.html");           
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>
            </body>
            </html>
 
 
 
