<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=GB18030" 
    pageEncoding="GB18030"%>
<html>
<head>
<title>网址导航</title>
<style type="text/css">      
           {
               margin: 0; padding:0
           }
		   body{
              background-color:#FFFFFF;
           }
    .page_layout{
            position: fixed;
            border:3px solid #999;
            border-radius: 10px;
            background-color:;
            box-sizing: border-box;
			background-color:#FFFFFF
        }
		 .index{
            position: fixed;
        }
          .win {
   POSITION:absolute; left:55%; top:60%;
   width:400px; height:250px;
   margin-left:-300px;margin-top:-200px; border:1px solid #888;
   background-color: #d6cfcb; text-align: center;
   line-height: 60px; z-Index:3;
  }
       #photo{
            top:80px;
			left:720px;
            right: 720px;           
            bottom: 570px
        }
	  #search{
            height: 45px;
            left: 380px;
            right: 380px;
            top:200px;
        }
       #index{
            height: 345px;
            left: 380px;
            right: 380px;
            top:320px;
        }
		#index #title{
		    height: 45px;
            left: 600px;
            right: 635px;-
            top:260px;
		}
		#index #title a {

              color: #000000;
          }
		#index #title #tag1{
		    height: 45px;
            left: 600px;
            right: 885px;
            top:260px;
		}
		#index #title #tag2{
		    height: 45px;
            left: 650px;
            right: 835px;
            top:260px;
		}
		#index #title #tag3{
		    height: 45px;
            left: 700px;
            right: 785px;
            top:260px;
		}
		#index #title #tag4{
		    height: 45px;
            left: 750px;
            right: 735px;
            top:260px;
		}
		#index #title #tag5{
		    height: 45px;
            left: 800px;
            right: 685px;
            top:260px;
		}
		#index #title #tag6{
		    height: 45px;
            left: 850px;
            right: 635px;
            top:260px;
		}
		#index #content {
            height: 300px;
            left: 380px;
            right: 380px;
            top:320px;
        }
		#index #content #content1{
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
   #copy{
            height: 30px;
            left:675px;
            right:675px;
            bottom:0;
        }
		.button {
    background-color:hsl(192, 89%, 49%);
    border: none;
    color: white;
    padding: 3px 30px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 0px 700px;
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
		 .hide {display:none;}
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
</head>
<body>
<%
String jdbcDriverName="org.postgresql.Driver";
Driver driver = (Driver) Class.forName(jdbcDriverName).newInstance();
DriverManager.registerDriver(driver);
Connection dbcon = DriverManager.getConnection("jdbc:postgresql:demo","postgres","123456");
%>

<%
    String id = request.getParameter("id_");
    String table = request.getParameter("test1");
    	if (id != null) {
    		Statement st_ = dbcon.createStatement();
        	st_.execute("update " + table + " set number = number + 1 where id = " +id);
        	System.out.println("update " + table + " set number = number + 1 where id = " +id);
        	st_.close();
    	}
    	String link= request.getParameter("link");
    	if (link != null) {
    		out.println(" <script language=\"javascript\">");
    		out.println("concle.info(\" " + "update " + table + " set number = number + 1 where id = '" +id+ "'"+" \")");
    		out.println("test(\" " + "update " + table + " set number = number + 1 where id = '" +id+ "'"+" \")");
        	out.println("window.location.href=\"" + link + "\";");
        	out.println("</script>");
    	}	
  
%>

<div id="login_in" class="log" style="display:none">
   <span style="font-size: 20px;"> 登录 </span> <br />
   <%
   out.println("<form action=\"index_2.jsp;\" method=\"post\">");
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
    out.println("<form  action=\"index_2.jsp;\" method=\"post\">");
    out.println("<label class=\"label\"> 用户名: </label> ");
    out.println("<input type=\"text\" class=\"input\" id=\"user\" name=\"user2\" /> <br />");
    out.println("<label class=\"label\"> 密码: </label> ");
    out.println("<input type=\"password\" class=\"input\" id=\"psw\" name=\"psw2\" /> <br />");
    out.println("<input type=\"submit\" value=\"确定\" class=\"input1\"/>");
    out.println("<input type=\"button\" value=\"退出\" class=\"input2\" onclick=\"closeLogin2();\" />");
    out.println("</form> ");
   %>
  </div>
  
 <a href="javascript:openLogin1();" >登录</a>
 <a href="javascript:openLogin2();" >注册</a>

<div class="page_layout"id="photo"> 
<img src="girl.jpg" width = "100" height="100"/>
</div>

<div class="page_layout"id="search"> 
<form action="http://www.baidu.com/s" method="get">
<input type="text"  name="wd" placeholder="百度一下你就知道"  style="width:770px;height:45px;">
<button type ="submit"class="button">搜索</button>
    </form>
</div>

<div class="page_layout"id="index">
<div class="page_layout" id ="title">
<ul>
<li class = "index" id ="tag1" ><a href = "#"onclick = "connect('tag1','content1');this.blur();"><span>视频</span></a></li>
<li class = "index" id ="tag2"><a href = "#"onclick = "connect('tag2','content2');this.blur();"><span>邮箱</span></a></li>
<li class = "index" id ="tag3"><a href = "#"onclick = "connect('tag3','content3');this.blur();"><span>商场</span></a></li>
<li class = "index" id ="tag4"><a href = "#"onclick = "connect('tag4','content4');this.blur();"><span>银行</span></a></li>
<li class = "index" id ="tag5"><a href = "#"onclick = "connect('tag5','content5');this.blur();"><span>音乐</span></a></li>
<li class = "index" id ="tag6"><a href = "#"onclick = "connect('tag6','content6');this.blur();"><span>新闻</span></a></li>
</ul>
</div>

<div id = "content"class = "index">
<%
String tables[] = new String[]{"tv", "mail", "shop", "bank", "music", "news"};
int number_id = 0;
for(String tableName : tables) {
	Statement st1 = dbcon.createStatement();
	ResultSet rt1 = st1.executeQuery("select * from " + tableName+ " order by NUMBER desc");	
	out.println("<div  id =\"content" + (++number_id) + "\" class=\"hide\">");
	while(rt1.next())
	{
		String id_ = rt1.getString(1);
		String test1=rt1.getString(2);
		String test11=rt1.getString(3);
		out.println("<a " + " href='" + test11 + "'"+"onclick ='count("+ id_ + ", \"" + tableName + "\")'"+";>" + test1 + "</>");
		out.println("<p>");
		out.println("<form name=\"frm_" + id_ + "\" action=\"index_2.jsp\" id=\"frmId_" + tableName + "_"+ id_ + "\" mothed=\"post\" />");
		out.println("<input name=\"id_\" value=\"" + id_ + "\" style=\"display:none\" />");
		out.println("<input name=\"test1\" value=\"" + tableName + "\" style=\"display:none\" />");
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
<div class="page_layout"id="copy">
自制网址导航（简易版）
</div>
</body>
</html>