<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=GB18030" 
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>网址导航</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
}

.header {
  background-color: #f1f1f1;
  padding: 20px;
  text-align: center;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.column {
  float: left;
  padding: 10px;
}

.column.side {
  width: 15%;
}

.column.middle {
  width: 70%;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}
.hide {display:none;}
 #index{
        }
		#index #title{
		}
		#index #title a {
              color: #000000;
          }
		#index #title #tag1{
		}
		#index #title #tag2{
		}
		#index #title #tag3{
		}
		#index #title #tag4{
		}
		#index #title #tag5{
		}
		#index #title #tag6{
		}
		#index #content {
        }
		#index #content #content1
		{
		}
		#index #content #content2{
		}
		#index #content #content3{
		}
		#index #content #content4{
		}
		#index #content #content5{
		}
		#index #content #content6{
		}
	.login{
            height: 45px;
            left: 2200px;
            right: 0px;
            top:0px;
        }
.log {
   POSITION:absolute; left:55%; top:60%;
   width:400px; height:250px;
   margin-left:-300px;margin-top:-200px; border:1px solid #888;
   background-color: hsl(192, 89%, 49%); 
   text-align: center;
   line-height: 60px; z-Index:3;
  }
  #login_in{}
  #register{}
.button {
    background-color:hsl(192, 89%, 49%);
    border: none;
    color: white;
    padding: 10px 30px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    /*margin: 0px 700px;*/
    cursor: pointer;
}
.button {border-radius: 8px;}
        button:hover{
            background-image: linear-gradient(#f7e4ef,#ffb8ea);   
        }
        button:active{
            background-image: linear-gradient(#fdceeb,#fd84d9);
            box-shadow: 0 0 2px #666;
        }
/* 响应式布局 - 宽度小于600px时设置上下布局 */
@media screen and (max-width: 600px) {
  .column.side, .column.middle {
    width: 100%;
  }
}
</style>
<script language="javascript">
         function connect(tag,content)
         {
             for(i=1; i < 7; i++)
             {
                 if ("content"+i==content)
                 {
                     document.getElementById(content).className="";
                 }else{
                     document.getElementById("content"+i).className="hide";
                 }
                 document.getElementById("content").className=content;
             }
         } 
      function count(no, tableName)
         {
        	 var frm = document.getElementById("frmId_" + tableName + "_"+ no); // 获取表单
             frm.submit();
         }
         function test(outstring) {
        	 alert(outstring);
         }
         function openLogin1(){
        	   document.getElementById("login_in").style.display="";
        	  }
         function closeLogin1(){
        	   document.getElementById("login_in").style.display="none";
        	  }
         function openLogin2(){
      	   document.getElementById("register").style.display="";
      	  }
       function closeLogin2(){
      	   document.getElementById("register").style.display="none";
      	  }
     </script>
     <%
String jdbcDriverName="org.postgresql.Driver";
Driver driver = (Driver) Class.forName(jdbcDriverName).newInstance();
DriverManager.registerDriver(driver);
Connection dbcon = DriverManager.getConnection("jdbc:postgresql:demo","postgres","123456");
%>

<%
    String id = request.getParameter("id_");
    String table = request.getParameter("tableName");
    	if (id != null) {
    		Statement st_ = dbcon.createStatement();
        	st_.execute("update " + table + " set number = number + 1 where id = " +id);
        	System.out.println("update " + table + " set number = number + 1 where id = " +id);
        	st_.close();
    	}
    	String link= request.getParameter("link");
    	if (link != null) {
    		out.println(" <script language=\"javascript\">");
    		out.println("window.location.href=\"" + link + "\";");
        	out.println("</script>");
    	}	
  
%>
     
</head>
<body>

<div id="login_in" class="log" style="display:none">
   <span style="font-size: 20px;"> 登录 </span> <br />
   <%
   out.println("<form action=\"index_4.jsp;\" method=\"post\">");
   out.println("<label class=\"label\"> 用户名: </label> ");
   out.println("<input type=\"text\" class=\"input\" id=\"user\" name=\"user1\" /> <br />");
   out.println("<label class=\"label\"> 密码: </label> ");
   out.println("<input type=\"password\" class=\"input\" id=\"psw\" name=\"psw1\"/> <br />");
   
   out.println("<input type=\"submit\" value=\"确定\" class=\"input1\" />");
   out.println("<input type=\"button\" value=\"退出\" class=\"input2\" onclick=\"closeLogin1();\" />");
   out.println("</form> ");
   %>
  </div>
  
  <div id="register" class="log" style="display:none">
    <span style="font-size: 20px;"> 注册 </span> <br />
    <%
    Statement st2 = dbcon.createStatement();
    out.println("<form  action=\"index_4.jsp;\" method=\"post\">");
    out.println("<label class=\"label\"> 用户名: </label> ");
    out.println("<input type=\"text\" class=\"input\" id=\"user\" name=\"user2\" /> <br />");
    out.println("<label class=\"label\"> 密码: </label> ");
    out.println("<input type=\"password\" class=\"input\" id=\"psw\" name=\"psw2\" /> <br />");
    out.println("<input type=\"submit\" value=\"确定\" class=\"input1\"/>");
    out.println("<input type=\"button\" value=\"退出\" class=\"input2\" onclick=\"closeLogin2();\" />");
    out.println("</form> ");
   %>
  </div>
<div class="header">
  <p> 
  <a href="javascript:openLogin1();" >登录</a>
  <a href="javascript:openLogin2();" >注册</a>
 </p>
  <p>
<img src="images/girl.jpg" width = "110" height="110"/>
</p>
<p>
<form action="http://www.baidu.com/s" method="get">
<input type="text"  name="wd" placeholder="百度一下你就知道"  style="width:770px;height:45px;">
<button type ="submit"class="button">搜索</button>
    </form>
</p>
</div>

  <div class="column side">
  </div>
  
  <div class="column middle">
  <div class="topnav"align="center">

<a href = "#"onclick = "connect('tag1','content1');this.blur();"><span>视频</span></a>
<a href = "#"onclick = "connect('tag2','content2');this.blur();"><span>邮箱</span></a>
<a href = "#"onclick = "connect('tag3','content3');this.blur();"><span>商场</span></a>
<a href = "#"onclick = "connect('tag4','content4');this.blur();"><span>银行</span></a>
<a href = "#"onclick = "connect('tag5','content5');this.blur();"><span>音乐</span></a>
<a href = "#"onclick = "connect('tag6','content6');this.blur();"><span>新闻</span></a>

</div>
<div id = "content"class = "index">
   <%
String tables[] = new String[]{"tv", "mail", "shop", "bank", "music", "news"};
int number_id = 0;
for(String tableName1 : tables) {
	Statement st1 = dbcon.createStatement();
	ResultSet rt1 = st1.executeQuery("select * from " + tableName1+ " order by NUMBER desc");	
	out.println("<div  id =\"content" + (++number_id) + "\" class=\"hide\">");
	while(rt1.next())
	{
		String id_no = rt1.getString(1);
		String test1=rt1.getString(2);
		String test11=rt1.getString(3);
		out.println("<a " + " href='#'"+"onclick ='count("+ id_no + ", \"" + tableName1 + "\")'"+";>" + test1 + "</>");
		out.println("<p>");
		out.println("<form name=\"frm_" + id_no + "\" action=\"index_4.jsp\" id=\"frmId_" + tableName1 + "_"+ id_no + "\" mothed=\"post\" />");
		out.println("<input name=\"id_\" value=\"" + id_no + "\" style=\"display:none\" />");
		out.println("<input name=\"tableName\" value=\"" + tableName1 + "\" style=\"display:none\" />");
 		out.println("<input name=\"link\" value=\" " + test11 + "\" style=\"display:none\" />");
		out.println("</form>");
	}
	out.println("</div>");
	rt1.close();
	st1.close();
}
	String user1 = request.getParameter("user1");
	String psw1 = request.getParameter("psw1");
	if (user1 != null && psw1 != null) {
		Statement st3 = dbcon.createStatement();
		ResultSet rt3 = st3.executeQuery("select count(*) totalCount from login where NAME ='" +user1+ "';");
		if ( rt3.next())
			{int row1 = rt3.getInt("totalCount");
		if(row1==0)
		{
        out.println(" <script language=\"javascript\">");
		out.println("alert(\"用户名不存在。\");");	
		out.println("</script>");
		}
			
		else{
		ResultSet rt4 = st3.executeQuery("select count(*) totalCount from login where NAME = '" + user1 + "'and PASSWORD = '" + psw1 + "';");
		if ( rt4.next()){
			int row2 = rt4.getInt("totalCount");
		 if(row2==0)
		      {
			 out.println(" <script language=\"javascript\">");
		     out.println("alert(\"密码错误。\");");	
		     out.println("</script>");	  
		      }
		      else{
		    	  out.println(" <script language=\"javascript\">");
		    	  out.println("alert(\"登录成功。\");");
		    	  out.println("</script>");
		    	  String realIP=request.getHeader("x-forwarded-for");
		    	  String ip = request.getRemoteAddr();
		    	  if(realIP==null||realIP.length()==0)
		    	  {
		    		  Statement st5 = dbcon.createStatement();
		    		  st5.execute("update login set IP= '"+ ip +"'where NAME= '"+user1+"';");
		    	  }
		    	  else
		    	  {
		    		  Statement st6 = dbcon.createStatement();
		    		  st6.execute("update login set IP= '"+ realIP +"'where NAME= '"+user1+"';");
		    	  }
		    	  }
	}}}}
	
	String user2 = request.getParameter("user2");
	String psw2 = request.getParameter("psw2");
	if (user2 != null && psw2 != null) {
		Statement st_ = dbcon.createStatement();
		st_.execute("insert into login (NAME,PASSWORD) values ('" + user2 +"','" + psw2 + "');");
		}
%>
   </div>
  </div>
  <div class="column side">
    <p></p>
  </div>

</body>
</html>