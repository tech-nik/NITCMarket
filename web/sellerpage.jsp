<%-- 
    Document   : sellerpage
    Created on : Apr 23, 2014, 12:18:54 AM
    Author     : Nikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.io.*" %>
<%! Connection con=null; %> 
<%! Statement st= null; %> 
<%! ResultSet rs= null; %> 


<%! ArrayList<String> errorlist = null; %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel ="stylesheet" type="text/css" href="Style.css">
        <title>Seller Page</title>
    </head>
    <body>
            <%
                String object=request.getParameter("object");
                String category = request.getParameter("category");
                String price = request.getParameter("price");
                String mobile = request.getParameter("mobile");
                String password = request.getParameter("password");
                errorlist = new ArrayList<String>();
               
                if ((object == null) || (object.length()==0))
                {
                    errorlist.add("Item name cannot be empty!");
                }
                if ((category == null) || (category.length()==0))
                {
                    errorlist.add("You did not select a category!");
                }
                if ((price == null) || (price.length()==0))
                {
                    errorlist.add("price cannot be empty!");
                }
                if ((mobile == null) || (mobile.length()!= 10))
                {
                    errorlist.add("Enter you 10 digit mobile number!");
                }
                if ((password == null) || (password.length()<6) || (password.length()>12))
                {
                    errorlist.add("Password should contain 6-12 characters!");
                }
                
                try 
                { 
                   
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost/marketdb","root", "root"); 
                    st = con.createStatement(); 
                    String query = "INSERT INTO forsale VALUES('"+object+"','"+category+"',"+price+","+mobile+",'"+password+"')";
                    if (errorlist.isEmpty())
                    {
                        st.executeUpdate(query);
                        
                    }
                    
                    
                }
                
                catch(Exception e)
                { 
                   
                    
                }
                
                finally
                {
                        con.close();
                        %> <br><br><center>
                        <table align="center" halign="center" valign="center" border="10" cellspacing="10" cellpadding="10">
                            <tbody style="font-family: cursive ; font-style: italic; color: red">
                                    <% if(errorlist.isEmpty())
                                    {
                                        %><tr><td><h1 style="color: green"><%out.println("SUCCESS! ");%><br></h1></td></tr><tr><td>
                                                <%out.println(object + "  has been successfully posted for sale!");%></td></tr>
                                        <%
                                    }
                                    else
                                    {   for(String x : errorlist)
                                    {
                                        %><tr><td><%out.println(x);%></td></tr><%
                                    }
                                    }
                                    %>
                                    <tr><td>
                         
                        <form action="index.jsp"><input align="center" type="submit" value="<--Home"></form>
                         </td></tr>
                        </tbody>
                        </table>
    </center>
                    <%
                }
             
            
                   
             %>
    </body>
</html>
