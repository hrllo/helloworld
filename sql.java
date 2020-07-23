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

public static void CreatTable_Link(String a) throws Exception{

    Connection c=getConn();
    Statement stmt = c.createStatement();	
    String sql ="CREATE TABLE " + a +" (ID  INT   NOT NULL,"+"NAME  TEXT   NOT NULL, " +  " LINK   CHAR(100),"+" NUMBER   INT   NOT NULL ) " ;
   
    stmt.executeUpdate(sql);
    System.out.println("Table_Link created successfully");        
    stmt.close();
    c.close();
}

public static void CreatTable_Login(String a) throws Exception{

    Connection c=getConn();
    Statement stmt = c.createStatement();	
    String sql ="CREATE TABLE " + a +" (NAME  TEXT   NOT NULL, " +  " PASSWORD   CHAR(100),"+"IP CHAR(100)) " ;
   
    stmt.executeUpdate(sql);
    System.out.println("Table_Login created successfully");        
    stmt.close();
    c.close();
}

public static void InsertTable(int dd,String aa,String bb,String cc) throws Exception{
	Connection c = getConn();
	Statement stmt=c.createStatement();
	String sql = "INSERT INTO " +aa+"(ID,NAME,LINK,NUMBER)"+"VALUES('"+dd+"','"+ bb + "','" + cc + "','"+0+"');";
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
String aa="login";CreatTable_Login(aa);
String a="tv";CreatTable_Link(a);
String b="mail";CreatTable_Link(b);
String c="shop";CreatTable_Link(c);
String d="bank";CreatTable_Link(d);
String e="music";CreatTable_Link(e);
String f="news";CreatTable_Link(f);

String a1="tv";String ab1="爱奇艺";String ac1="https://www.iqiyi.com/";int ad1=1 ;InsertTable(ad1,a1,ab1,ac1);
String a2="tv";String ab2="腾讯视频";String ac2="https://v.qq.com/";int ad2=2;InsertTable(ad2,a2,ab2,ac2);
String a3="tv";String ab3="优酷";String ac3="https://www.youku.com/";int ad3=3;InsertTable(ad3,a3,ab3,ac3);
String a4="tv";String ab4="哔哩哔哩动画";String ac4="https://www.bilibili.com/";int ad4=4;InsertTable(ad4,a4,ab4,ac4);
String a5="tv";String ab5="芒果TV";String ac5="https://www.mgtv.com/";int ad5=5;InsertTable(ad5,a5,ab5,ac5);

String b1="mail";String bb1="163邮箱";String bc1="https://mail.163.com/";int bd1=1;InsertTable(bd1,b1,bb1,bc1);
String b2="mail";String bb2="阿里云";String bc2="https://mail.aliyun.com/";int bd2=2;InsertTable(bd2,b2,bb2,bc2);
String b3="mail";String bb3="126邮箱";String bc3="https://www.126.com/";int bd3=3;InsertTable(bd3,b3,bb3,bc3);
String b4="mail";String bb4="新浪邮箱";String bc4="https://mail.sina.com.cn/";int bd4=4;InsertTable(bd4,b4,bb4,bc4);
String b5="mail";String bb5="QQ邮箱";String bc5="https://mail.qq.com/";int bd5=5;InsertTable(bd5,b5,bb5,bc5);
String b6="mail";String bb6="139邮箱";String bc6="https://mail.10086.cn/";int bd6=6;InsertTable(bd6,b6,bb6,bc6);
	     			
String c1="shop";String cb1="1号店";String cc1="https://www.yhd.com/";int cd1=1;InsertTable(cd1,c1,cb1,cc1);
String c2="shop";String cb2="苏宁易购";String cc2="https://www.suning.com/";int cd2=2;InsertTable(cd2,c2,cb2,cc2);
String c3="shop";String cb3="阿里1688";String cc3="https://page.1688.com/";int cd3=3;InsertTable(cd3,c3,cb3,cc3);
String c4="shop";String cb4="唯品会";String cc4="https://www.vip.com/";int cd4=4;InsertTable(cd4,c4,cb4,cc4);
String c5="shop";String cb5="淘宝特卖";String cc5="https://ai.taobao.com";int cd5=5;InsertTable(cd5,c5,cb5,cc5);
String c6="shop";String cb6="京东";String cc6="https://www.jd.com";int cd6=6;InsertTable(cd6,c6,cb6,cc6);
					
String d1="bank";String db1="工商银行";String dc1="http://www.icbc.com.cn/";int dd1=1;InsertTable(dd1,d1,db1,dc1);
String d2="bank";String db2="农业银行";String dc2="http://www.abchina.com/";int dd2=2;InsertTable(dd2,d2,db2,dc2);
String d3="bank";String db3="中国银行";String dc3="http://www.boc.cn/";int dd3=3;InsertTable(dd3,d3,db3,dc3);
String d4="bank";String db4="招商银行";String dc4="http://www.cmbchina.com/";int dd4=4;InsertTable(dd4,d4,db4,dc4);
String d5="bank";String db5="建设银行";String dc5="http://www.ccb.com/";int dd5=5;InsertTable(dd5,d5,db5,dc5);
String d6="bank";String db6="中信银行";String dc6="http://www.citicbank.com/";int dd6=6;InsertTable(dd6,d6,db6,dc6);
String d7="bank";String db7="邮政储蓄";String dc7="http://www.psbc.com/";int dd7=7;InsertTable(dd7,d7,db7,dc7);

String e1="music";String eb1="酷狗音乐";String ec1="http://www.kugou.com/";int ed1=1;InsertTable(ed1,e1,eb1,ec1);	
String e2="music";String eb2="一听音乐";String ec2="https://www.1ting.com/";int ed2=2;InsertTable(ed2,e2,eb2,ec2);	
String e3="music";String eb3="虾米音乐";String ec3="https://www.xiami.com/";int ed3=3;InsertTable(ed3,e3,eb3,ec3);	
String e4="music";String eb4="百度音乐";String ec4="http://music.taihe.com/";int ed4=4;InsertTable(ed4,e4,eb4,ec4);	
String e5="music";String eb5="QQ音乐";String ec5="https://y.qq.com/";int ed5=5;InsertTable(ed5,e5,eb5,ec5);	
String e6="music";String eb6="酷我音乐";String ec6="http://www.kuwo.cn/";int ed6=6;InsertTable(ed6,e6,eb6,ec6);	
String e7="music";String eb7="网易云音乐";String ec7="https://music.163.com/";int ed7=7;InsertTable(ed7,e7,eb7,ec7);

String f1="news";String fb1="新浪新闻";String fc1="https://news.sina.com.cn/";int fd1=1;InsertTable(fd1,f1,fb1,fc1);
String f2="news";String fb2="腾讯新闻";String fc2="https://news.qq.com/";int fd2=2;InsertTable(fd2,f2,fb2,fc2);
String f3="news";String fb3="热点新闻";String fc3="https://kan.china.com/?qudao=sgkz";int fd3=3;InsertTable(fd3,f3,fb3,fc3);
String f4="news";String fb4="今日热点";String fc4="https://top.voc.com.cn/sg_xwkz/list/4.html";int fd4=4;InsertTable(fd4,f4,fb4,fc4);

//String aa="tv";String bb="爱奇艺";DeleteTable(aa,bb);
//String aa="news";String bb="https://news.sina.com.cn/";String cc="https://mail.aliyun.com/";UpdateTable(aa,bb,cc);



       } catch ( Exception e ) {
         System.err.println( e.getClass().getName()+": "+ e.getMessage() );
         System.exit(0);
       }

     }
}




