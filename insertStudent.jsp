<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page
   import="java.sql.*"
   import="javax.sql.*"%>
   
   <meta http-equiv="refresh" content="5; url=http:index.html">

<%
String fio = request.getParameter("student_fio");
String group = request.getParameter("group");
String year_of_start = request.getParameter("year_of_start");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?" +
                "useSSL=false&" +
                "allowPublicKeyRetrieval=true&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC" 
                , "root", "");
Statement st = conn.createStatement();

int i = st.executeUpdate("insert into students_tb (student_fio, `group` ,year_of_start) values ('"+fio+"','"+group+"','"+year_of_start+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>