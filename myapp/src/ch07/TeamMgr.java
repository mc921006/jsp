package ch07;

import java.sql.*;
import java.util.Vector;
/*
 DB�� ���õ� ����� �޼ҵ带 ������ Ŭ����
 */
public class TeamMgr {
	private DBConnectionMgr pool;

	public TeamMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	//INSERT
	//Bean�� �̿��Ͽ� ������ ��������
	public boolean insertTeam(TeamBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false; //����
		String sql = null;

		try {
			con = pool.getConnection();
			sql = "INSERT INTO tblTeam (name, city, age, team) "
					+ "VALUES (?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			//?�� ����
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getCity());
			pstmt.setInt(3, bean.getAge());
			pstmt.setString(4, bean.getTeam());

			//���� ����
			int cnt = pstmt.executeUpdate();
			if (cnt == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//List
	//Vector�� bean�� ����.
	public Vector<TeamBean> listTeam() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TeamBean> vlist = new Vector<TeamBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM tblTeam";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); //���� ����
			//
			while(rs.next()) {
				TeamBean bean = new TeamBean();
				/*int num = rs.getInt(1);*/
				//				int num = rs.getInt("num");
				//				bean.setNum(num);
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setCity(rs.getString("city"));
				bean.setAge(rs.getInt("age"));
				bean.setTeam(rs.getString("team"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	//GET
	public TeamBean getTeam(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		TeamBean bean = new TeamBean();
		try {
			con = pool.getConnection();
			sql = "SELECT num, name, city, age, team FROM tblteam "
					+ "WHERE num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCity(rs.getString(3));
				bean.setAge(rs.getInt(4));
				bean.setTeam(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean; 
	}
	//UPDATE
	public boolean updateTeam(TeamBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false; //����
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "UPDATE tblTeam set name = ?, city = ?, age = ?, team = ?"
					+"WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getCity());
			pstmt.setInt(3, bean.getAge());
			pstmt.setString(4, bean.getTeam());
			pstmt.setInt(5, bean.getNum());
			int cnt = pstmt.executeUpdate();
			if(cnt == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//DELETE
	public void deleteTeam(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "DELETE FROM tblTeam WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}
	}
}
