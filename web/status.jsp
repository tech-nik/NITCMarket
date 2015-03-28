<%-- 
    Document   : status
    Created on : Apr 24, 2014, 5:57:02 PM
    Author     : Nikhil
--%>

<%@page import="org.eclipse.jdt.internal.compiler.flow.FinallyFlowContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%! String x=null ;%>
<%! Connection con=null; %>
<%! boolean flag=false ;%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel ="stylesheet" type="text/css" href="Style.css">
        <title>Status</title>
    </head>
    <body>
        <% String mobile = request.getParameter("mobile");
            String password =request.getParameter("pwd");
            
            %>
            <form action ="index.jsp" method="get">
                <table align ="center" class ="banner">
                    <%
            try
            {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost/marketdb","root", "root"); 
                    Statement st = con.createStatement();
                    String query2 = "DELETE FROM forsale where mobile='"+mobile+"'AND password='"+password+"'";
                    String query1 = "SELECT * FROM forsale where  mobile='"+mobile+"'AND password='"+password+"'";
                    
                    out.println(query1);
                    out.println(query2);
                      
                    ResultSet rs = st.executeQuery(query1);
                    if(!rs.first())
                    {
                        x="Invalid mobile number or password!";
                        
                    }
                    
                    else
                    {
                        st.executeUpdate(query2);
                        x = "Succesfully Deleted" ;
                        flag = true;
                    }
                    
                    
                    %>
                    
                    <tr>
                        <td>
                            <h1 style="font-size: xx-large; font-family: sans-serif"><% if (flag){out.println("Success");}else{out.println("ERROR");}%></h1>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h6 style="font-size: large;font-weight: normal;font-family: inherit">
                                <% out.println(x); %>
                            </h6>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="<--Home">
                        </td>
                    </tr>
                    <%
                        }
           
            
            finally
            { 
                con.close() ;
            }
            
            
            %>
                </table>
            </form>
    </body>
</html>
