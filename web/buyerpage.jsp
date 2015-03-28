<%-- 
    Document   : buyerpage
    Created on : Apr 23, 2014, 4:04:17 PM
    Author     : Nikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%! boolean table=true ;%>
<%! Connection con; %>
<%! Statement st; %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel ="stylesheet" type="text/css" href="Style.css">
        
        <title>Buyer Page</title>
    </head>
    <body>
       
            <%  String query = request.getParameter("query");
                String category=request.getParameter("category");
                
               try 
                { 
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost/marketdb","root", "root"); 
                    st = con.createStatement();
                    String q;
                    if ((query=="")&&(category==null))
                    {
                     q="SELECT * FROM forsale";
                    }
                    else if (query=="")
                    {
                        q="SELECT * FROM forsale WHERE category='"+category+"'";   
                        
                    }
                    else if(category==null)
                    {
                    
                        q="SELECT * FROM forsale WHERE object like '%"+query+"%'";
                    }
                    else
                    {
                        q="SELECT * FROM forsale WHERE category='"+category+"' AND object like '%"+query+"%'";
                    }
                    
                    
                    ResultSet rs = st.executeQuery(q);
                    if (!rs.next())
                    { table=false;
                        %>
                            
    <center><h1 style="font-family: cursive;font-size: xx-large;color: red" halign="center" valign="center" >
                               Sorry!</h1><br>
                               <h6 style="font-family: cursive;font-size: xx-large;color: red" halign="center" valign="center" > No Results Found.<br>Try another search!</h6>
                        
    </center>                    
                            <%}
                     rs = st.executeQuery(q);    
                    while (rs.next())
                    {
                        String obj = rs.getString("object");
                        String cat = rs.getString("category");
                        int price = rs.getInt("price");
                        String mobile = rs.getString("mobile");
                       
                        %><table width="100%" align="center" cellpadding="10" cellspacing="10" border="10">
                            <tr>
                                <th style="font-weight: bolder">Item Name</th><th>Category</th><th>Expected Price</th><th>Contact</th>
                            </tr>
                            <tbody>
                                <tr style="color: seagreen; font-weight: bold">
                                    <td><% out.println(obj); %></td><td><% out.println(cat); %></td><td><% out.println(price); %></td><td><% out.println(mobile); %></td>
                                </tr>
                            </tbody>
                        </table><%
                                    
                    }
                }
               
               catch(Exception e)
               {
                   
               }
               finally
               {
                        con.close() ; %>
                        
                             <table width="100%" align=center" cellpadding="0" cellspacing="0" border="0">
                            <tbody>
                            

                            <tr><td style="text-align: justify">
                                   <form action="index.jsp">
                                       <input type="submit" value=" <--Home">
                                   </form>
                            </td>
                            </tr>
                            </tbody>
                            </table> 
                            
                 <%   
                        
              
            
               
               
                   
               }
               
                
             %>
        
    </body>
</html>
