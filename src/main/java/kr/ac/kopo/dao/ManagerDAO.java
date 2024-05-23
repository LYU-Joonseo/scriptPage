package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import kr.ac.kopo.utill.ConnectionFactory;
import kr.ac.kopo.vo.MemberVO;

public class ManagerDAO {

	public List<MemberVO> selectMember(){
		List<MemberVO> list = new ArrayList<MemberVO>();
		StringBuilder sql = new StringBuilder();
		sql.append("select id, name ");
		sql.append(" from t_member ");
		sql.append(" where id <> 'sys' ");
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				
				MemberVO member = new MemberVO();
				member.setId(id);
				member.setName(name);
				list.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void deleteList(int no) {
		StringBuilder sql = new StringBuilder();
		sql.append("delete from t_board ");
		sql.append(" where no=? ");
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
