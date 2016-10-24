<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("token_id");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://redvelvetdb.czvyaawmcxuy.ap-south-1.rds.amazonaws.com:3306/";
String dbName = "botdb";
String userId = "awsadmin";
String password = "awsadmin";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html lang="en">


<head>
<form action=update>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <link href="css/example.css" rel="stylesheet">
  <link href="css/example.css" rel="stylesheet">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
    rel="stylesheet" type="text/css" />
<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
    type="text/javascript"></script>
<script type="text/javascript">
  
   
   
</script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WhyQ</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="NewFinal.jsp">Counter View</a></li>
      <li><a href="final1.jsp">Manager View</a></li>
     
    </ul>
  </div>
</nav>
  
<h2 align="center"><font><strong>Tokens</strong></font></h2></head>
<div class="responsive-table">
<table  id="tbUser" align="center" width="600">
<thead>
<tr>

</tr>
<tr align="center">

<th  data-table="Custom Head 1"><b>Menu</b></td>
<th data-table="Custom Head 5"><b>Quantity Pending</b></td>



</tr>
</thead>
		
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="select name,sum(quantity) from orderline ol, menuitem mi, orderinfo od where mi.itemid = ol.itemid and od.orderid=ol.orderid GROUP BY name";


resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	
	
%>

<tbody>
<tr align="center">

<td><%=resultSet.getString("name") %></td>

<td><%=resultSet.getString("sum(quantity)") %></td>


</tr>
</tbody>

<%
}

} catch (Exception e) {
e.printStackTrace();
}
%><script>
$(document).ready(function(){

 $("#tbUser").on('click','#btnDelete',function(){
       $(this).closest('tr').remove();
     });

});

</script>

<script type="text/javascript"> $(function(){$('#ddlCars2').multiselect({ 
        includeSelectAllOption: true,
        enableFiltering:true         
        
  });
    });</script>
</table>
</div></body>
</html>