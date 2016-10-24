<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<%
System.out.println("1");	

String id = request.getParameter("token_id");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://redvelvetdb.czvyaawmcxuy.ap-south-1.rds.amazonaws.com:3306/";
String dbName = "botdb";
String userId = "awsadmin";
String password = "awsadmin";
System.out.println("2");	

try {
	System.out.println("3");	

Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
System.out.println("4");	

}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
System.out.println("5");	

Statement statement2 = null;
%>
<%
System.out.println("6");	

ArrayList al= new ArrayList();
ArrayList al1= new ArrayList();
%>>
<%
try{ 
System.out.println("7");	
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="select name,quantity from menuitem,orderline where menuitem.itemid =orderline.itemid;";
System.out.println("8");	


resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	al.add(resultSet.getString("name"));
	al1.add(resultSet.getString("quantity"));
	
}	
System.out.println(al);
/* System.out.println(al1);
 */

} catch (Exception e) {
	e.printStackTrace();
	}
 %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>