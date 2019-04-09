package ch07;

import java.sql.*;

public class MySQLConnection2 {
	
	private DBConnectionMgr pool;


	public MySQLConnection2() {
		//싱글톤 패턴 -> 객체를 only 한개만 생성
		pool = DBConnectionMgr.getInstance();
	}
	
	public void selectTeam() {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			//pool에 빌려옴.
			con = pool.getConnection();
			sql = "select * from tblTeam";
			pstmt = con.prepareStatement(sql);
			//결과값 날리기
			rs =  pstmt.executeQuery();
			System.out.println("번 호\t성 명\t사는곳\t나이\t팀 명");
			while(rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				String city = rs.getString("city");
				int age = rs.getInt("age");
				String team = rs.getString("team");
				System.out.println(num+"\t"+name +"\t" + city +"\t"+age+"\t"+team);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//빌려온 con 반남, pstmt / rs는 close
			pool.freeConnection(con, pstmt, rs);
			
		}
	}
	
	public static void main(String[] args) {
		MySQLConnection2 mcon = new MySQLConnection2();
		mcon.selectTeam();
	}
}
