package hellotest;
import java.sql.Connection;	
import java.sql.DriverManager;
import java.sql.Statement;

public class Insert {
	
		static Connection c =null;	
		
public  static Connection getConn() throws Exception{
	try{
		Class.forName("org.postgresql.Driver");
		c = DriverManager.getConnection("jdbc:postgresql://127.0.0.1:5432/demo", "postgres", "123456");	
		System.out.println("Opened database successfully");
	}catch ( Exception e ) {
        System.err.println( e.getClass().getName()+": "+ e.getMessage() );
        System.exit(0);
      }
	return c;
}

public static void CreatTable(String a) throws Exception{

    Connection c=getConn();
    Statement stmt = c.createStatement();	
    String sql ="CREATE TABLE " + a +" (NAME  TEXT   NOT NULL, " +  " LINK   CHAR(100) ) " ;
    stmt.executeUpdate(sql);
    System.out.println("Table created successfully");        
    stmt.close();
    c.close();
}


public static void InsertTable(String aa,String bb,String cc) throws Exception{
	Connection c = getConn();
	Statement stmt=c.createStatement();
	String sql = "INSERT INTO " +aa+"(NAME,LINK)"+"VALUES('"+ bb + "','" + cc + "');";
    stmt.executeUpdate(sql);
    System.out.println("Table insterted successfully");        
    stmt.close();
    c.close();
}

public static void UpdateTable(String aa,String bb,String cc) throws Exception{
	Connection c = getConn();
	Statement stmt=c.createStatement();
	String sql = "update " +aa+" set LINK= '"+ bb +"'where LINK= '"+cc+"';";
    stmt.executeUpdate(sql);
    System.out.println("Table updated successfully");        
    stmt.close();
    c.close();
}

public static void DeleteTable(String aa,String bb) throws Exception{
	Connection c = getConn();
	Statement stmt=c.createStatement();
	String sql = "delete from " +aa +" where NAME= '"+ bb +"';";
    stmt.executeUpdate(sql);
    System.out.println("Table deleted successfully");        
    stmt.close();
    c.close();
}

	
	public static void main(String[] args) throws Exception {

		try {

String a="tv";CreatTable(a);
String b="mail";CreatTable(b);
String c="shop";CreatTable(c);
String d="bank";CreatTable(d);
String e="music";CreatTable(e);
String f="news";CreatTable(f);

String a1="tv";String ab1="爱奇艺";String ac1="https://www.iqiyi.com/";InsertTable(a1,ab1,ac1);
String a2="tv";String ab2="腾讯视频";String ac2="https://v.qq.com/";InsertTable(a2,ab2,ac2);
String a3="tv";String ab3="优酷";String ac3="https://www.youku.com/";InsertTable(a3,ab3,ac3);
String a4="tv";String ab4="哔哩哔哩动画";String ac4="https://www.bilibili.com/";InsertTable(a3,ab3,ac3);
String a5="tv";String ab5="芒果TV";String ac5="https://www.mgtv.com/";InsertTable(a3,ab3,ac3);

String b1="mail";String bb1="163邮箱";String bc1="https://mail.163.com/";InsertTable(b1,bb1,bc1);
String b2="mail";String bb2="阿里云";String bc2="https://mail.aliyun.com/";InsertTable(b2,bb2,bc2);
String b3="mail";String bb3="126邮箱";String bc3="https://www.126.com/";InsertTable(b3,bb3,bc3);
String b4="mail";String bb4="新浪邮箱";String bc4="https://mail.sina.com.cn/";InsertTable(b4,bb4,bc4);
String b5="mail";String bb5="QQ邮箱";String bc5="https://mail.qq.com/";InsertTable(b5,bb5,bc5);
String b6="mail";String bb6="139邮箱";String bc6="https://mail.10086.cn/";InsertTable(b6,bb6,bc6);
	     			
String c1="shop";String cb1="1号店";String cc1="https://www.yhd.com/";InsertTable(c1,cb1,cc1);
String c2="shop";String cb2="苏宁易购";String cc2="https://www.suning.com/";InsertTable(c2,cb2,cc2);
String c3="shop";String cb3="阿里1688";String cc3="https://page.1688.com/";InsertTable(c3,cb3,cc3);
String c4="shop";String cb4="唯品会";String cc4="https://www.vip.com/";InsertTable(c4,cb4,cc4);
String c5="shop";String cb5="淘宝特卖";String cc5="https://ai.taobao.com";InsertTable(c5,cb5,cc5);
String c6="shop";String cb6="京东";String cc6="https://www.jd.com";InsertTable(c6,cb6,cc6);
					
String d1="bank";String db1="工商银行";String dc1="http://www.icbc.com.cn/";InsertTable(d1,db1,dc1);
String d2="bank";String db2="农业银行";String dc2="http://www.abchina.com/";InsertTable(d2,db2,dc2);
String d3="bank";String db3="中国银行";String dc3="http://www.boc.cn/";InsertTable(d3,db3,dc3);
String d4="bank";String db4="招商银行";String dc4="http://www.cmbchina.com/";InsertTable(d4,db4,dc4);
String d5="bank";String db5="建设银行";String dc5="http://www.ccb.com/";InsertTable(d5,db5,dc5);
String d6="bank";String db6="中信银行";String dc6="http://www.citicbank.com/";InsertTable(d6,db6,dc6);
String d7="bank";String db7="邮政储蓄";String dc7="http://www.psbc.com/";InsertTable(d7,db7,dc7);

String e1="music";String eb1="酷狗音乐";String ec1="http://www.kugou.com/";InsertTable(e1,eb1,ec1);	
String e2="music";String eb2="一听音乐";String ec2="https://www.1ting.com/";InsertTable(e2,eb2,ec2);	
String e3="music";String eb3="虾米音乐";String ec3="https://www.xiami.com/";InsertTable(e3,eb3,ec3);	
String e4="music";String eb4="百度音乐";String ec4="http://music.taihe.com/";InsertTable(e4,eb4,ec4);	
String e5="music";String eb5="QQ音乐";String ec5="https://y.qq.com/";InsertTable(e5,eb5,ec5);	
String e6="music";String eb6="酷我音乐";String ec6="http://www.kuwo.cn/";InsertTable(e6,eb6,ec6);	
String e7="music";String eb7="网易云音乐";String ec7="https://music.163.com/";InsertTable(e7,eb7,ec7);

String f1="news";String fb1="新浪新闻";String fc1="https://news.sina.com.cn/";InsertTable(f1,fb1,fc1);
String f2="news";String fb2="腾讯新闻";String fc2="https://mail.aliyun.com/";InsertTable(f2,fb2,fc2);
String f3="news";String fb3="热点新闻";String fc3="https://kan.china.com/?qudao=sgkz";InsertTable(f3,fb3,fc3);
String f4="news";String fb4="今日热点";String fc4="https://top.voc.com.cn/sg_xwkz/list/4.html";InsertTable(f4,fb4,fc4);

//String aa="tv";String bb="爱奇艺";DeleteTable(aa,bb);
//String aa="news";String bb="https://news.sina.com.cn/";String cc="https://mail.aliyun.com/";UpdateTable(aa,bb,cc);        

       } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         System.exit(0);
       }

     }
}




