<%-- 
    Document   : index
    Created on : Apr 22, 2014, 8:51:29 PM
    Author     : Nikhil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel ="stylesheet" type="text/css" href="Style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>NITC Market</title>
    <marquee><h1 class="banner">An exclusive market for NITC students!</h1></marquee>    
 </head>
    <body>
        <table width="1300" border="10" cellpadding="10" cellspacing="10" >
            <tbody>
                <tr width="1300"><center>
                    <td background="1.jpg" style="background-repeat: repeat-x"  align="center" class="banner">
                      NITC Market                     
                    </td></center>
                </tr>
         <tr width="1366">
             <td  width="650"align="center" class="links">
                <a href ="index.jsp">Home</a>
            </td>
             <td  width="650"align="center" class="links">
                <a href="itemsold.jsp">Delete a sold item</a>
            </td>
            <td class="links" align="center"><a href="ContactUS.jsp">Contact Us</a></td>
        </tr>
        <tr width ="1366"> 
        <td width="500" align="center">
            <form action="sellerpage.jsp" method="post" name="sellerform"><fieldset>
                    <legend> SELLERS </legend>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" >
                    <tbody>
                        <tr><td>
                    For Sale :  </td><td><input type="text" name="object"></td></tr>
                        <tr><td> Category</td><td><input type="radio" name="category" value="books">Books</td></tr>
                    <tr><td> &nbsp;</td><td><input type="radio" name="category"  value="gaming">Gaming</td></tr>
                    <tr><td> &nbsp;</td><td><input type="radio" name="category"  value="computer">Computers & accessories</td></tr>
                    <tr><td> &nbsp;</td><td><input type="radio" name="category" value="clothing">Clothing & Footwear</td></tr>
                    <tr><td> &nbsp;</td><td><input type="radio" name="category"  value="bikes">Bikes & accessories</td></tr>
                    <tr><td> &nbsp;</td><td><input type="radio" name="category"  value="others">Others</td></tr><tr></tr>
                    <tr><td>Expected price</td><td><input type="number" min ="0" name="price"></td></tr><tr></tr>
                    
                    <tr><td>Mobile No:</td><td><input type="text" name="mobile"></td></tr><br><br>
                    <tr><td>Password:</td><td><input type ="password" name="password"></td></tr>
                    <tr><td><input type ="submit" name="submitbutton" value="submit"></td></tr>
                </tbody>
                </table>
                </fieldset>
            </form>            
        </td>
        <td width="500">
            <fieldset>
                <legend>
                    HOT DEALS!
                </legend>
                <marquee direction="up" scrolldelay="300" style="font-size: large; font-family: monospace; color: brown; font-weight: bold">
                <% try
                {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/marketdb","root", "root"); 
                    Statement st = con.createStatement();
                    String query = "SELECT * FROM forsale";
                    ResultSet rs = st.executeQuery(query);
                    while (rs.next())
                    {
                        String obj = rs.getString("object");
                        int price = rs.getInt("price");
                        String mobile = rs.getString("mobile");
                        out.println(obj+" @ Rs"+price+ "! Contact : "+mobile);%><br><br><br><%
                    }
                    
}
                catch(Exception e)
                {
                    out.println("No Deals to display!");
                }
                %>
                </marquee>
            </fieldset>
        </td>
        <td width="500" align="center">
            <form action ="buyerpage.jsp" method ="get" name="buyerform">
                <fieldset>
                    <legend>
                        BUYERS
                    </legend>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                        <tbody>
                            <tr>
                                <td>
                                    Search for an item : <input type="text" name="query">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    select a category
                                </td>
                            </tr>
                            <tr><td><input type="radio" name="category" value="books">Books</td></tr>
                            <tr><td><input type="radio" name="category"  value="gaming">Gaming</td></tr>
                            <tr><td><input type="radio" name="category"  value="computer">Computers & accessories</td></tr>
                            <tr><td><input type="radio" name="category" value="clothing">Clothing & Footwear</td></tr>
                            <tr><td><input type="radio" name="category"  value="bikes">Bikes & accessories</td></tr>
                            <tr><td><input type="radio" name="category"  value="others">Others</td></tr>                            
                            <tr><td><input type="submit" value="submit" name="submitbutton"></td></tr>
                        </tbody>
                    </table>
                </fieldset>
            </form>
            
            
        </td>
        </tr>
        <tr>
            
        </tr>
        </tbody>
            
        </table>
    </body>
</html>
