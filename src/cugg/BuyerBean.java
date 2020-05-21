package cugg;

import java.sql.*;
public class BuyerBean {
	
	private String memberID = null ;     //��ԱID
	private String memberName = null;   //��Ա����
	private String pwd = null;			//����
	private int logontimes = -1;			//��¼�Ĵ���

	
//����޸�Ϊ��MySQL���ݿ⣬ɾ������������䣬�޸�Ϊ����������䣺
	private static String strDBDriver = "com.mysql.jdbc.Driver";   //JDBC����
    private static String strDBUrl="jdbc:mysql://localhost:3306/bookstore"; //���ݿ�bookstore
    private static final String USER_NAME="root";
    private static final String PASS_WORD="812921cqwabc";
	

	private Connection conn =null;             //����
	private ResultSet rs = null;					//�����
	
	public BuyerBean ( ){
		//����JDBC-ODBC����
		try {
			Class.forName(strDBDriver );
		}
		//�����쳣
		catch(java.lang.ClassNotFoundException e){
			System.err.println("BuyerBean():" + e.getMessage());
		}	
	}
	
	//��õ�¼��������¼�Ļ�Ա������Ҳ�ڸ÷�������ʱ���
	public int getLogontimes(){
		String strSql = null;
		try{
//����޸�Ϊ��MySQL���ݿ⣬ɾ������һ����䣬�޸�Ϊ������䣺
     conn = DriverManager.getConnection(strDBUrl,USER_NAME,PASS_WORD);

			Statement stmt = conn.createStatement();
	strSql = "Select logonTimes,membername from buyerinfo where memberID = '"+memberID+"' and pwd ='"+pwd+"'";
			rs = stmt.executeQuery(strSql);
			while (rs.next()){				
				// ��¼�Ĵ���
				logontimes = rs.getInt("logonTimes");
				//��Ա����
				 memberName = rs.getString("membername"); 						
			}			
			rs.close();
			//����ǺϷ���Ա�����¼������1
			if (logontimes != -1 ) {
				strSql = "Update buyerinfo set logonTimes = logonTimes +1 where memberID = '" + memberID + "'";
				stmt.executeUpdate(strSql);
			}
			stmt.close();
			conn.close();
		}
		//�����쳣
		catch(SQLException e){
			System.err.println("BuyerBean.getLogontimes( ):" + e.getMessage());
		}
		return logontimes ;
	}
	//����memberID���ԣ�
	public  void setMemberID(String ID){
		this.memberID = ID;
	}
	//����pwd ����
	public void  setPwd(String password){
		this.pwd = password;
	}
	//��øû�Ա����ʵ������������ȡ�û�Ա��¼�Ĵ���֮����ܱ�������ȷ��ֵ
	public String getMemberName(){
		return memberName;
	}
	//����Bean���������Ƿ��ܹ���������
}


