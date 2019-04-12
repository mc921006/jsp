package ch08;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ch07.DBConnectionMgr;
import ch07.TeamBean;

public class RegisterMgr2 {
	
	private DBConnectionMgr pool;

	public RegisterMgr2() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean loginRegister2 (String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false; //제어
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "SELECT id FROM tblregister "
					+ "WHERE id = ? AND pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery(); //실제 실행
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
}
