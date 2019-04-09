package ch07;

import java.sql.*;

public class MySQLConnection {

	//mysql에 접속하기 위한 기본 세팅
	private String driver = "org.gjt.mm.mysql.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/mydb"
			//한글 세팅코드
			+ "?useUnicode=true&characterEncoding=EUC_KR";
	private String user = "root";
	private String pwd = "1234";
	Connection con;

	public MySQLConnection() {
		try {
			//DB 접속 공식
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);
			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//SELECT
	public void listTeam() {

		try {
			//query문 준비
			String sql = "select * from tblTeam";
			PreparedStatement pstmt = con.prepareStatement(sql);
			//결과값 날리기
			ResultSet rs =  pstmt.executeQuery();
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
		}
	}

	//INSERT
	public void InsertTeam(String name, String city, int age, String team) {
		try {
			String sql="insert into tblTeam (name, city, age, team) "
					+ "values(?, ?, ?, ?) ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, city);
			pstmt.setInt(3, age);
			pstmt.setString(4, team);
			//insert, update, delete 포함
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				System.out.println("추가 success");
			}else {
				System.out.println("추가 fail");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//UPDATE
	public void updateTeam(int num, String name) {
		try {
			String sql = "update tblTeam set name= ? where num =  ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, num);
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				System.out.println("업데이트 success");
			}else {
				System.out.println("업데이트 fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//DELETE
	public void deleteTeam(int num) {
		try {
			String sql = "delete from tblTeam where num = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				System.out.println("삭제 success");
			}else {
				System.out.println("삭제 fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		MySQLConnection mcon = new MySQLConnection();
//		mcon.InsertTeam("전민철", "부산", 28, "d?a");
		mcon.updateTeam(1, "전승진");
//		mcon.deleteTeam(8);
		mcon.listTeam();
	}
}
