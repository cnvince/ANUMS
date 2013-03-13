package servlet;
import java.sql.*;

public class ConnectionManager {
  public ConnectionManager() {
  }
  /**
   * 获得连接的方法
   * @return Connection
   */
  public static Connection getConnection() {

      /**数据库的连接对象*/
      Connection con = null;

      /**此连接是JDBC连接*/
      try {
        /**加载并注册驱动程序*/
        Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");

        /**获得连接对象*/
        con = DriverManager.getConnection(
            "jdbc:microsoft:sqlserver://localhost:1433;databaseName=Northwind",
            "accp", "accp");
          }
      catch (Exception ce) {
        ce.printStackTrace();
      }

      /**返回连接对象*/
      return con;
    }

    /**
     * 关闭连接Connection对象的方法
     * @param con Connection
     */
    public static void close(Connection con) {
      try {
        con.close();
      }
      catch (SQLException ce) {
        ce.printStackTrace();
      }
    }

    /**
     * 重载方法close()关闭Statement对象
     * @param s Statement
     */
    public static void close(Statement s) {
      try {
        s.close();
      }
      catch (SQLException ce) {
        ce.printStackTrace();
      }
    }

    /**
     * 重载方法close()关闭ResultSet对象
     * @param rs ResultSet
     */
    public static void close(ResultSet rs) {
      try {
        rs.close();
      }
      catch (SQLException ce) {
        ce.printStackTrace();
      }
    }

    /**
     * 重载方法close()关闭PreparedStatement对象
     * @param ps PreparedStatement
     */
    public static void close(PreparedStatement ps) {
      try {
        ps.close();
      }
      catch (SQLException ce) {
        ce.printStackTrace();
      }
    }

}
