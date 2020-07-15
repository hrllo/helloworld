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
            right: 635px;
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
     </script>

</head>


<body>

<%
String jdbcDriverName="org.postgresql.Driver";
Driver driver = (Driver) Class.forName(jdbcDriverName).newInstance();
DriverManager.registerDriver(driver);
Connection dbcon = DriverManager.getConnection("jdbc:postgresql:demo","postgres","a123456");
%>
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

<div  id ="content1" class="hide">

		
<%
Statement st1 = dbcon.createStatement();
ResultSet rt1 = st1.executeQuery("select * from tv");
while(rt1.next())
{
	String test1=rt1.getString(1);
	String test11=rt1.getString(2);
	out.println("<a " + " href='" + test11 + "'>" + test1 + "</>");
	out.println("<p>");
}
rt1.close();
st1.close();

%>


</div>

<div class = "hide" id ="content2">
<%
Statement st2 = dbcon.createStatement();
ResultSet rt2 = st2.executeQuery("select * from mail");
while(rt2.next())
{
String test2=rt2.getString(1);
String test22=rt2.getString(2);
out.println("<a " + " href='" + test22 + "'>" + test2 + "</>");
out.println("<p>");

}
rt2.close();
st2.close();


%>

</div>

<div class = "hide" id ="content3">
<%
Statement st3 = dbcon.createStatement();
ResultSet rt3 = st3.executeQuery("select * from shop");
while(rt3.next())
{
String test3=rt3.getString(1);
String test33=rt3.getString(2);
out.println("<a " + " href='" + test33 + "'>" + test3 + "</>");
out.println("<p>");
}
rt3.close();
st3.close();

%>
</div>


<div class = "hide" id ="content4">
<%
Statement st4 = dbcon.createStatement();
ResultSet rt4 = st4.executeQuery("select * from bank");
while(rt4.next())
{
String test4=rt4.getString(1);
String test44=rt4.getString(2);
out.println("<a " + " href='" + test44 + "'>" + test4 + "</>");
out.println("<p>");
}
rt4.close();
st4.close();
%>
</div>


<div class = "hide" id ="content5">
<%
Statement st5 = dbcon.createStatement();
ResultSet rt5 = st5.executeQuery("select * from music");
while(rt5.next())
{
String test5=rt5.getString(1);
String test55=rt5.getString(2);
out.println("<a " + " href='" + test55 + "'>" + test5 + "</>");
out.println("<p>");

}
rt5.close();
st5.close();

%>
</div>


<div class = "hide" id ="content6">
<%
Statement st6 = dbcon.createStatement();
ResultSet rt6 = st6.executeQuery("select * from news");
while(rt6.next())
{
String test6=rt6.getString(1);
String test66=rt6.getString(2);
out.println("<a " + " href='" + test66 + "'>" + test6 + "</>");
out.println("<p>");
}
rt6.close();
st6.close();
dbcon.close();
%>
</div>
</div>
</div>



<div class="page_layout"id="copy">
自制网址导航（简易版）
</div>



</body>


</html>