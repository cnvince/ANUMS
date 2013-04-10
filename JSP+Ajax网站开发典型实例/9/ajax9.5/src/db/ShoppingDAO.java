package db;

import java.sql.*;
import javax.naming.*;

public class ShoppingDAO {
	private Connection conn;
	private Statement state;
	private PreparedStatement pstate;
	private ResultSet rs;

	public ShoppingDAO() {
		if (conn == null) {
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance(); //装载数据库连接驱动
				conn = DriverManager
						.getConnection(
								"jdbc:mysql://localhost:3306/jspajax?useUnicode=true&amp;characterEncoding=gb2312",
								"root", "19841025");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public String getShopping() {   //查询数据库
		String value = "";
		try {
			state = conn.createStatement();
			rs = state.executeQuery("select * from shopping");
			while (rs.next()) {
				value = value.concat(rs.getInt(1) + "," + rs.getString(2) + ","
						+ rs.getDouble(3) + ";");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				state.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return value;
	}
	public String getShoppingById(String id) {
		String value = "";
		try {
			state = conn.createStatement();
			rs = state.executeQuery("select * from shopping where id=" + id);
			if (rs.next()) {
				value = rs.getInt("id") + "," + rs.getString("name") + ","
						+ rs.getDouble("num");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				state.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return value;
	}
	public boolean addShopping(String name, String num) //向数据库中添加记录
	{
		int jg = 0;
		try {
			pstate = conn.prepareStatement("insert into shopping (name,num) values (?,?)");
			pstate.setString(1, name);
			pstate.setDouble(2, Double.parseDouble(num));
			jg = pstate.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstate.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (jg > 0)
			return true;
		else
			return false;
	}
	public boolean delShopping(String id) //从数据库中删除记录��ﳵ��ɾ����Ʒ
	{
		int jg = 0;
		try {
			state = conn.createStatement();
			jg = state.executeUpdate("delete from shopping where id in (" + id+ ")");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				state.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (jg > 0)
			return true;
		return false;
	}
}
