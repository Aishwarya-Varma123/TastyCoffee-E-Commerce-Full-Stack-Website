package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

public class registration {

    private Connection con;
    HttpSession se;
    PreparedStatement ps;
    Statement st = null;
    ResultSet rs = null;

    public registration(HttpSession session) {
        try {
            Class.forName("com.mysql.jdbc.Driver");  //load the driver.
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tastycoffee", "root", ""); 
            se = session; //assigning the session to the global scope 'se'.

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String registration(String name, String phone, String email, String pw) {
        String status = "", name1 = "";
        int slno = 0;
        try {
            st = con.createStatement();

            rs = st.executeQuery("select * from users where phone='" + phone + "' or email='" + email + "'; ");
            boolean b = rs.next();
            if (b) {
                status = "existed";
            } else {
                ps = (PreparedStatement) con.prepareStatement("insert into users values(0,?,?,?,?,now())");
                ps.setString(1, name);
                ps.setString(2, phone);
                ps.setString(3, email);
                ps.setString(4, pw);
                int a = ps.executeUpdate();

                if (a > 0) {
                    rs = st.executeQuery("select * from users where email='" + email + "' and password='" + pw + "'; ");
                    boolean b1 = rs.next();
                    if (b1 == true) {
                        name1 = rs.getString("name");
                        slno = rs.getInt("slno");

                        se.setAttribute("uname", name1);
                        se.setAttribute("id", slno);
                    }
                    status = "success";
                } else {
                    status = "failure";
                }

            }

        } catch (Exception e) {
            e.printStackTrace();

        }

        return status;

    }

    public String login(String email, String pass) {
        String status1 = "";
        String name = "", emails = "";
        int id = 0;
        try {

            st = con.createStatement();

            rs = st.executeQuery("select * from users where email='" + email + "' and password='" + pass + "'; ");

            boolean b = rs.next(); //if present returns true else false.

            if (b == true) {
                id = rs.getInt("slno");
                name = rs.getString("name");
                emails = rs.getString("email");
                se.setAttribute("uname", name);
                se.setAttribute("email", emails);
                se.setAttribute("id", id);

                status1 = "success";
            } else {
                status1 = "failure";
            }

        } catch (Exception e) {
            e.printStackTrace();

        }

        return status1;

    }

    public ArrayList<product> get_productinfo(String product) {
        
        ArrayList<product> a1 = new ArrayList<product>();

        try {
            st = con.createStatement();
            String qry = "select * from products where p_catagory= '" + product + "';";
            // products = new table in the database.
            // p_catagory = column name.

            rs = st.executeQuery(qry);
            
            while (rs.next()) {
                product p = new product();
                p.setP_id(rs.getString("p_id"));
                p.setP_image(rs.getString("p_image"));  //all images stories in 'images' folder.
                p.setP_name(rs.getString("p_name"));
                p.setP_cost(rs.getString("p_cost"));
                p.setP_details(rs.getString("p_details"));
                a1.add(p);
                
                
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return a1;

    }

    public String addtocart(String p_id , int quantity) {
        String status = "";
        
        try {

            st = (Statement) con.createStatement();
            String qry = "insert into cart select 0,p_name,p_image," + quantity + ",p_cost,'" + se.getAttribute("uname") + "'," + se.getAttribute("id") + ",0,'pending',p_id from products where p_id=" + p_id + " and '" + se.getAttribute("uname") + "' not like 'null';";

            int a = st.executeUpdate(qry);
            
             
                
                
            status = "success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public int deletecart(int c_id) {
        int status = 0;
        try {

            st = (Statement) con.createStatement();
            String qry = "update cart set status='deleted' where c_id='" + c_id + "'";
            status = st.executeUpdate(qry);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public ArrayList<cart> getcartinfo() {
        
        Statement st = null;
        ResultSet rs = null;
        //String name = request.getParameter("name");
        ArrayList<cart> al = new ArrayList<cart>();
        try {
            st = con.createStatement();
            String qry = ("select *  from cart where uid=" + se.getAttribute("id") + " and status='pending';");
            rs = st.executeQuery(qry);
            while (rs.next()) {
                cart p = new cart();
                p.setC_id(rs.getString("c_id"));
                p.setC_image(rs.getString("c_image"));
                p.setC_name(rs.getString("c_name"));
                p.setC_cost(rs.getString("c_cost"));
                p.setQuantity(rs.getString("quantity"));
                al.add(p);
                
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }

    public String orderdetails(String order_address, String order_city, String order_state, String order_pincode, String tcost) {
        
        ResultSet rs = null;
        String status = "", c_id = "";
        int order_id = 0;
        try {
            Statement st = null;
            PreparedStatement ps;
            st = (Statement) con.createStatement();
            ps = (PreparedStatement) con.prepareStatement("insert into orders select 0,?, ?, ?, ?,group_concat(c_id),'" + tcost + "','" + se.getAttribute("uname") + "','ordered',now()," + se.getAttribute("id") + ",quantity,group_concat(p_id) from cart where uid= " + se.getAttribute("id") + " and status='pending' group by order_id;");

            ps.setString(1, order_address);
            ps.setString(2, order_city);
            ps.setString(3, order_state);
            ps.setString(4, order_pincode);
            int a = ps.executeUpdate();
            
            if (a > 0) {
                
                status = "success";
            } else {
                status = "failure";
            }
            String qry1 = "select order_id,c_id from orders where uid=" + se.getAttribute("id") + " and status='ordered' order by order_id desc limit 1;";

            rs = st.executeQuery(qry1);
            while (rs.next()) {
                order_id = rs.getInt("order_id");
                c_id = rs.getString("c_id");
                
            }
            String qry = "update cart set status='ordered',order_id='" + order_id + "' where c_id in (" + c_id + ") and uid=" + se.getAttribute("id") + " and status='pending';";
            int b = st.executeUpdate(qry);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public int deleteorder(int Oid) {
        int status = 0;
        try {
            Statement st = null;
            st = (Statement) con.createStatement();
            String qry = "update orders set status='Canceled' where order_id='" + Oid + "'";
            status = st.executeUpdate(qry);
            String qry1 = "update cart set status='Canceled' where order_id='" + Oid + "'";
            status = st.executeUpdate(qry1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public ArrayList<order> getorderinfo() {
        
        Statement st = null;
        ResultSet rs = null;
        ArrayList<order> al = new ArrayList<order>();
        try {
            st = con.createStatement();
            String qry = "select *,date_format(date,'%b %d, %Y') as date1 from orders where uid='" + se.getAttribute("id") + "';";
            rs = st.executeQuery(qry);
            while (rs.next()) {
                order p = new order();
                p.setOid(rs.getInt("order_id"));
                p.setC_cost(rs.getString("c_cost"));
                p.setC_id(rs.getString("c_id"));
                p.setStatus(rs.getString("status"));
                p.setQuantity(rs.getString("quantity"));
                p.setDate(rs.getString("date1"));
                al.add(p);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }

    public ArrayList<order> getorderinfocart(int Oid) {
        Statement st = null;
        ResultSet rs = null;
        ArrayList<order> al = new ArrayList<order>();
        try {
            st = con.createStatement();
            String qry = ("select * from cart where uid='" + se.getAttribute("id") + "' and order_id = '" + Oid + "';");
            rs = st.executeQuery(qry);
            while (rs.next()) {
                order p = new order();
                p.setOid(rs.getInt("order_id"));
                p.setC_cost(rs.getString("c_cost"));
                p.setP_image(rs.getString("c_image"));
                p.setC_name(rs.getString("c_name"));
                p.setQuantity(rs.getString("quantity"));
               
                al.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    
    public ArrayList<user> getUserDetails() {
        Statement st;
        ResultSet rs;
        ArrayList<user> a1 = new ArrayList<user>(); //creating object for ArrayList class.
        try {
            st = con.createStatement();
            String qry = "select *,date_format(date,'%b %d, %Y') as date1 from users where slno not in(1);";
            rs = st.executeQuery(qry);
            while (rs.next()) {
                user p = new user();
                p.setId(rs.getString("slno"));
                p.setName(rs.getString("name"));
                p.setEmail(rs.getString("email"));
                p.setPhone(rs.getString("phone"));
                p.setDate(rs.getString("date1"));
                a1.add(p);
                
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return a1;
    }

    public String delete(int id) {
        int count = 0;
        String status = "";
        Statement st = null;

        try {
            st = con.createStatement();
            count = st.executeUpdate(" delete from users where slno='" + id + "' ");
            if (count > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;

    }
    
    public ArrayList<order> getorders() {
        Statement st;
        ResultSet rs;
        ArrayList<order> a1 = new ArrayList<order>(); 
        try {
            st = con.createStatement();
            String qry = "select *,date_format(date,'%b %d, %Y') as date1 from orders order by date desc;";
            rs = st.executeQuery(qry);
            while (rs.next()) {
                order p = new order();
                p.setOid(rs.getInt("order_id"));
                p.setP_id(rs.getString("p_id"));
                p.setName(rs.getString("usname"));
                p.setC_cost(rs.getString("c_cost"));
                p.setStatus(rs.getString("status"));
                p.setU_id(rs.getString("uid"));
                p.setQuantity(rs.getString("quantity"));
                p.setO_city(rs.getString("order_city"));
                p.setO_state(rs.getString("order_state"));
                p.setDate(rs.getString("date1"));
                a1.add(p);
                
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return a1;
    }

    public int admindeliverorder(int o_id) {
        int status=0;
        Statement st = null;

        try {
            
            st = (Statement) con.createStatement();
            String qry = "update orders set status='Delivered' where order_id='" + o_id + "'";
            status = st.executeUpdate(qry);
            String qry1 = "update cart set status='Delivered' where order_id='" + o_id + "'";
            status = st.executeUpdate(qry1);
      
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;

    }
    
    public ArrayList<product> get_products() {
        
        ArrayList<product> a1 = new ArrayList<product>();

        try {
            st = con.createStatement();
            String qry = "select * from products;";
            rs = st.executeQuery(qry);
            
            while (rs.next()) {
                product p = new product();
                p.setP_id(rs.getString("p_id"));
                p.setP_image(rs.getString("p_image"));  
                p.setP_name(rs.getString("p_name"));
                p.setP_cost(rs.getString("p_cost"));
                p.setP_cat(rs.getString("p_catagory"));
                a1.add(p);
                
                
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return a1;

    }
    
    public String admindeleteproduct(int p_id) {
        int count = 0;
        String status = "";
        Statement st = null;

        try {
            st = con.createStatement();
            count = st.executeUpdate("delete from products where p_id='" + p_id + "' ");
            if (count > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;

    }
    
    public String addproducts(String image, String name, String cost, String detail, String catagory) {
        PreparedStatement ps;
        String status = "";
        try {
            st = con.createStatement();

            ps = (PreparedStatement) con.prepareStatement("insert into products values(0,?,?,?,?,?)");
            ps.setString(1, image);
            ps.setString(2, name);
            ps.setString(3, cost);
            ps.setString(4, catagory);
            ps.setString(5, detail);

            int a = ps.executeUpdate();
            if (a > 0) {
                status = "success";
            } else {
                status = "failure";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public void SendMail(String msg, String subject, String email) {
        String from = "";  //add your email-id
        String password = "";  //add your email password 
        String to = email; 
        Properties prop = new Properties(); 
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "465");  
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator()
        {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });
        try 
        {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject); 
            message.setContent(msg, "text/html"); 
            Transport.send(message);
        } 
        catch (MessagingException e) 
        {
            throw new RuntimeException(e);
        }
    }

    public int ValidateEmail(String email) {
        int count = 0;
        ResultSet rs;
        try {
            String update = "select email from users where email=?;";
            PreparedStatement p1 = null;
            p1 = (PreparedStatement) con.prepareStatement(update);
            p1.setString(1, email);
            rs = p1.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public String FetchNameByEmail(String email) {
        String name = "", update = "";
        ResultSet rs = null;
        try {
            update = "select slno,name from users where email=?;";
            PreparedStatement p1 = null;
            p1 = (PreparedStatement) con.prepareStatement(update);
            p1.setString(1, email);
            rs = p1.executeQuery();
            while (rs.next()) {
                name = rs.getString("slno") + "_" + rs.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    public int PasswordTrack(String id, String name, String email, String password) {
        int status = 0;
        try {
            String qry = "insert into passwordtrack values(?,?,?,?,?,now());";
            PreparedStatement p1 = null;
            p1 = (PreparedStatement) con.prepareStatement(qry);
            p1.setInt(1, 0);
            p1.setString(2, id);
            p1.setString(3, name);
            p1.setString(4, email);
            p1.setString(5, password);
            status = p1.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public user getpasswordtrackdetails(String email, String code1) {
        user s = new user();
        try {
            Statement st = null;
            ResultSet rs = null;
            st = (Statement) con.createStatement();
            rs = st.executeQuery("select * from passwordtrack where email='" + email + "' and password='" + code1 + "' order by date desc limit 1;");
            while (rs.next()) {
                s.setName(rs.getString("name")); 
                s.setEmail(rs.getString("email"));
                s.setPw(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public int updatepassword(String uemail, String pass) {
        int status = 0;
        String update = "";
        try {
            update = "update users set password=? where email=?;";
            java.sql.PreparedStatement p1 = null;
            p1 = con.prepareStatement(update);
            p1.setString(1, pass);
            p1.setString(2, uemail);
            status = p1.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public int updatepasswordinpasstrack(String uemail, String scode, String pass) {
        int status = 0;
        String update = "";
        try {
            update = "update passwordtrack set password=? where email=? and password=?;";
            java.sql.PreparedStatement p1 = null;
            p1 = con.prepareStatement(update);
            p1.setString(1, pass); 
            p1.setString(2, uemail);
            p1.setString(3, scode);
            status = p1.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public user getInfo() {
        Statement st = null;
        ResultSet rs = null;
        user s = null; //creating student reference and assigning it to null.
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from users where slno= '" + se.getAttribute("id") + "' ");
            boolean b = rs.next(); 
            if (b == true) {
                s = new user();
                s.setName(rs.getString("name"));
                s.setPhone(rs.getString("phone"));
                s.setEmail(rs.getString("email"));
            } else {
                s = null;
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return s; 
    }

    public String update(String name, String pno) {
        String status = "";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = con.createStatement();
            st.executeUpdate(" update users set name='" + name + "',phone='" + pno + "' where slno= '" + se.getAttribute("id") + "' ");
            se.setAttribute("uname", name);
            status = "success";
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();

        }
        return status;
    }

}


