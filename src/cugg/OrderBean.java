package cugg;

import java.sql.*;

public class OrderBean {

//如果修改为了MySQL数据库，删除以上两条语句，修改为以下四条语句：
	private static String strDBDriver = "com.mysql.jdbc.Driver";   //JDBC驱动
    private static String strDBUrl="jdbc:mysql://localhost:3306/bookstore"; //数据库bookstore
    private static final String USER_NAME="root";
	private static final String PASS_WORD="812921cqwabc";


	private Connection conn =null;
	private ResultSet rs = null;
	private java.lang.String bookinfo = null;
	private java.lang.String oderprice = null;
	private java.lang.String orderDate = null;
	private java.lang.String orderID = null;
	private java.lang.String orderRem = null;
	private java.lang.String receiverAddress = null;
	private java.lang.String receiverName = null;
	private java.lang.String receiverZip = null;
	private java.lang.String userID = null;

	public OrderBean(){
		try {
			Class.forName(strDBDriver );
		}
		catch(java.lang.ClassNotFoundException e){
			System.err.println("OrderBean ():" + e.getMessage());
		}
	}

	public  static void main(String args[]){
	}



/**
 * 返回定单的总价。
 * @return java.lang.String
 */
public java.lang.String getOrderPrice() {
		return oderprice;
}

/**
 *返回定单的日期 。
 * @return java.lang.String
 */
public java.lang.String getOrderDate() {
		orderDate = new java.util.Date().toString();
		return orderDate;
}

/**
 * 返回定单的ID号。
 * @return java.lang.String
 */
public java.lang.String getOrderID() {
		return orderID;
}

/**
 * 返回定单的备注信息。
 * @return java.lang.String
 */
public java.lang.String getOrderRem() {
		return orderRem;
}

/**
 * 返回接收者的地址
 * @return java.lang.String
 */
public java.lang.String getReceiverAddress() {
	return receiverAddress;
}

/**
 * 返回接收者的姓名。
 * @return java.lang.String
 */
public java.lang.String getReceiverName() {
		return receiverName;
}

/**
 * 返回接收者的邮政编码。
 * @return java.lang.String
 */
public java.lang.String getReceiverZip() {
		return receiverZip;
}

/**
 * 获得用户ID。
 * @return java.lang.String
 */
public java.lang.String getUserID() {
		return userID;
}

/**
 * 给图书信息赋值。
 * @param newBooks java.util.Properties
 */
public void setBookinfo(java.lang.String newBookinfo) {
		bookinfo = newBookinfo;
		createNewOrder();
		int fromIndex = 0;
		int tmpIndex = 0;
		int tmpEnd = 0;
		String strSql = null;
		try{
			
//如果修改为了MySQL数据库，删除以上一条语句，修改为以下语句：
            conn = DriverManager.getConnection(strDBUrl,USER_NAME,PASS_WORD);

			Statement stmt = conn.createStatement();
			while(bookinfo.indexOf(';',fromIndex) != -1 ){
				tmpEnd = bookinfo.indexOf(';',fromIndex);
				tmpIndex = bookinfo.lastIndexOf('=',tmpEnd);
				strSql = "insert into orderdetail (orderID ,bookISBN ,bookcount)"+ " values( '" + getOrderID() + "', '" + bookinfo.substring(fromIndex ,tmpIndex) + "', "+ bookinfo.substring(tmpIndex+1 ,tmpEnd) + " )" ;
				stmt.executeUpdate(strSql);
			fromIndex = tmpEnd + 1;
			}
			stmt.close();
			conn.close();
		}
		catch(SQLException e){
			System.err.println("BuyerBean.getLogontimes():" + e.getMessage());
		}
}

/**
 *给定单的总价赋值。
 * @param newOderprice java.lang.String
 */
public void setOrderprice(java.lang.String newOderprice) {
		oderprice = newOderprice;
}

/**
 * 给定单的备注赋值。
 * @param newOrderRem java.lang.String
 */
public void setOrderRem(java.lang.String newOrderRem) {
		orderRem = newOrderRem;
}

/**
 * 给接收者的地址赋值。
 * @param newReceiverAddress java.lang.String
 */
public void setReceiverAddress(java.lang.String newReceiverAddress) {
	receiverAddress = newReceiverAddress;
}
/**
 * 给接收者的姓名赋值。
 * @param newReceiverName java.lang.String
 */
public void setReceiverName(java.lang.String newReceiverName) {
	receiverName = newReceiverName;
}

/**
 * 给接收者的邮政编码代码赋值。
 * @param newReceiverZip java.lang.String
 */
public void setReceiverZip(java.lang.String newReceiverZip) {
		receiverZip = newReceiverZip;
}

/**
 * 给用户代码赋值。
 * @param newUserID java.lang.String
 */
public void setUserID(java.lang.String newUserID) {
		userID = newUserID;
}

/**
 * 创建一个新定单
 */
private void createNewOrder() {
		String strSql = null;
	try{
			
//如果修改为了MySQL数据库，删除以上一条语句，修改为以下语句：
            conn = DriverManager.getConnection(strDBUrl,USER_NAME,PASS_WORD);


			Statement stmt = conn.createStatement();
			strSql = "insert into orderInfo (userID,receiverName,receiverAddress,receiverZip,orderRem,orderPrice,Orderdate)"+ " values('" +getUserID() + "', '" + getReceiverName() + "', '"
				+ getReceiverAddress() + "', '"  
+ getReceiverZip() + "', '" + getOrderRem() + "', "+ getOrderPrice() + " ,'" + getOrderDate() + "')" ;
		stmt.executeUpdate(strSql);
		strSql = "select max(OrderID) from  orderInfo where userID = '" + getUserID() + "' and receiverName = '" + getReceiverName() 
+ "' and receiverAddress =  '" + getReceiverAddress() 
+"' and receiverZip =  '"  + getReceiverZip() 
+"' and orderRem = '" + getOrderRem() 
+ "' and orderPrice = " + getOrderPrice() 
+"  and Orderdate  = '"+ getOrderDate() + "'" ;
		orderID = "";
		rs = stmt.executeQuery(strSql);
		while (rs.next()){
			 orderID = rs.getString("OrderID");

		}
		rs.close();
		stmt.close();
		conn.close();

	}
	catch(SQLException e){
		System.err.println("BuyerBean.getLogontimes():" + e.getMessage());
	}
}
}
