package member;

import java.sql.*;
import java.util.*;

public class MemberMgr {

	private DBConnectionMgr pool;

	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	//id �ߺ�Ȯ��
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
			rs = pstmt.executeQuery(); //sql�� ����
			flag = rs.next(); //true�� �ߺ�, false�� �ߺ� x

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	//�����ȣ �˻�
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
				ZipcodeBean bean = new ZipcodeBean(); //bean�� �ִ�
				bean.setZipcode(rs.getString(1)); //zipcode��
				bean.setArea1(rs.getString(2)); //area1
				bean.setArea2(rs.getString(3)); //area2
				bean.setArea3(rs.getString(4)); //area3��
				vlist.addElement(bean); //vector�� �ִ´�.
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	//ȸ������
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
			String lists[] = { "���ͳ�", "����", "����", "��ȭ", "�" };
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
			//} �� new String�� ������
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

	// �α���

	// ȸ������ ��������

	//ȸ������ ����

}
