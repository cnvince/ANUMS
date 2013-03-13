package servlet;
import java.sql.*;

public class ConnectionManager {
  public ConnectionManager() {
  }
  /**
   * ������ӵķ���
   * @return Connection
   */
  public static Connection getConnection() {

      /**���ݿ�����Ӷ���*/
      Connection con = null;

      /**��������JDBC����*/
      try {
        /**���ز�ע����������*/
        Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");

        /**������Ӷ���*/
        con = DriverManager.getConnection(
            "jdbc:microsoft:sqlserver://localhost:1433;databaseName=Northwind",
            "accp", "accp");
          }
      catch (Exception ce) {
        ce.printStackTrace();
      }

      /**�������Ӷ���*/
      return con;
    }

    /**
     * �ر�����Connection����ķ���
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
     * ���ط���close()�ر�Statement����
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
     * ���ط���close()�ر�ResultSet����
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
     * ���ط���close()�ر�PreparedStatement����
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
