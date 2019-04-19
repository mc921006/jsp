package member;

import java.sql.*;
import java.util.*;

public class MemberMgr {

	private DBConnectionMgr pool;

	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	//id 중복확인
	public boolean checkId(String id) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "SELECT id FROM tblmember WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); //sql문 실행
			flag = rs.next(); //true면 중복, false면 중복 x

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	//우편번호 검색
	public Vector<ZipcodeBean> zipcodeRead(String area3) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM tblzipcode WHERE area3 LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+area3+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipcodeBean bean = new ZipcodeBean(); //bean에 있는
				bean.setZipcode(rs.getString(1)); //zipcode와
				bean.setArea1(rs.getString(2)); //area1
				bean.setArea2(rs.getString(3)); //area2
				bean.setArea3(rs.getString(4)); //area3을
				vlist.addElement(bean); //vector에 넣는다.
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	//회원가입
	public boolean insertMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "INSERT INTO tblmember(id,pwd,name,gender,birthday,"
					+ "email,zipcode,address,hobby,job) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			String hobby[] = bean.getHobby();
			char hb[] = {'0', '0', '0', '0', '0'};
			String lists[] = { "인터넷", "여행", "게임", "영화", "운동" };
			for (int i = 0; i < hobby.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if (hobby[i].equals(lists[j])) {
						hb[j] = '1';
						break;
					}
				}
			}
			//    public String(char value[]) {
			//  this(value, 0, value.length, null);
			//} 의 new String의 생성장
			pstmt.setString(9, new String(hb));
			pstmt.setString(10, bean.getJob());
			if (pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// 로그인

	// 회원정보 가져오기

	//회원정보 수정

}
