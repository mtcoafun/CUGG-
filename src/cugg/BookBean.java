package cugg;

import java.sql.*;
public class BookBean {
	private String bookISBN = null;		//图书编号
	private String bookName = null;		//书名
	private String bookAuthor = null;		//作者
	private String publisher = null;			//出版社
	private String introduce = null;			//简介
	private String price = null;				//价格
//如果修改为了MySQL数据库，删除以上两条语句，修改为以下四条语句：
	private static String strDBDriver = "com.mysql.jdbc.Driver";   //JDBC驱动
    private static String strDBUrl = "jdbc:mysql://localhost:3306/bookstore"; //数据库bookstore
    private static final String USER_NAME = "root";
	private static final String PASS_WORD = "812921cqwabc";


	private Connection conn =null;
	private ResultSet rs = null;	
	
	public BookBean(){
		//加载驱动
		try {
			Class.forName(strDBDriver );
		}
		catch(java.lang.ClassNotFoundException e){
			System.err.println("BookBean ():" + e.getMessage());
		}	
	}
	//取当前书库中全部图书信息
	public ResultSet getBookList(){
		String strSql = null;
		try{
			//建立与数据库的连接
//如果修改为了MySQL数据库，删除以上一条语句，修改为以下语句：
           conn = DriverManager.getConnection(strDBUrl,USER_NAME,PASS_WORD);


			Statement stmt = conn.createStatement();
			strSql = "Select bookISBN,bookName,bookAuthor,publisher,price from bookInfo ";
			rs = stmt.executeQuery(strSql);			
		}
		//捕获异常
		catch(SQLException e){
			System.err.println("BookBean.getBookList():" + e.getMessage());
		}
		return rs ;
	}
	//根据图书的编号给图书的其他信息赋值
	private  void getBookInfo(String ISBN){
		String strSql = null;
		bookName = null;
		bookAuthor = null;
		publisher = null;
		introduce = null;
		price = null;
		try{
			//建立和数据库的连接
//如果修改为了MySQL数据库，删除以上一条语句，修改为以下语句：
            conn = DriverManager.getConnection(strDBUrl,USER_NAME,PASS_WORD);

			Statement stmt = conn.createStatement();
			strSql = "Select * from bookinfo where bookISBN = '" + ISBN + "'";
			rs = stmt.executeQuery(strSql);			
			while (rs.next()){
				bookName = rs.getString("bookName");
				bookAuthor = rs.getString("bookAuthor");
				publisher = rs.getString("publisher");
				introduce = rs.getString("introduce");
				price = rs.getString("price");
			}
		}
		//捕获异常
		catch(SQLException e){
			System.err.println("BookBean.getBookList():" + e.getMessage());
		}		
	}
	//给图书的编号赋值，同时调用函数给图书的其他信息赋值
	public  void setBookISBN (String ISBN){
		this.bookISBN = ISBN;
		getBookInfo(bookISBN);
	}
	//取图书编号
	public  String getBookISBN (){
		return bookISBN ;
	}	
	//取书名
	public String getBookName(){
		return bookName ;
	}
	//取作者信息
	public String getBookAuthor(){
		return bookAuthor;
	}
	//取出版社信息
	public String getPublisher(){
		return publisher;
	}
	//取图书简介
	public String getIntroduce(){
		return introduce ;
	}
	//取图书价格
	public String getPrice(){
		return price;
	}	
	//将Bean作为一个application进行测试用
	public  static void main(String args[]){
		BookBean book = new BookBean ();
		book.setBookISBN("7-5053-5316-4");
		
		System.out.println(book.getBookName());
		System.out.println(book.getBookAuthor());
		System.out.println(book.getPublisher());
		System.out.println(book.getIntroduce());
		System.out.println(book.getPrice());
		try{
			ResultSet tmpRS = book.getBookList();
			while (tmpRS.next()){		
				System.out.println(tmpRS.getString("bookname"));
			}
			tmpRS.close();
		}
		//捕获异常
		catch(Exception e){
			System.err.println("main()" + e.getMessage());
		}
	}	
}