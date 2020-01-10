<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "student";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
%>
<!DOCTYPE html>
<html>
<body>

<h1>Select all students</h1>
<table border="1">
<tr>
<td>student_id</td>
<td>student_fio</td>
<td>group</td>
<td>year_of_start</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database+"?" + "useSSL=false&" +
                "allowPublicKeyRetrieval=true&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", userid, password);
statement=connection.createStatement();
String sql ="select * from students_tb";
ResultSet resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("student_id") %></td>
<td><%=resultSet.getString("student_fio") %></td>
<td><%=resultSet.getString("group") %></td>
<td><%=resultSet.getString("year_of_start") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<p><a href="index.html">Home page</a></p>
</body>
</html>