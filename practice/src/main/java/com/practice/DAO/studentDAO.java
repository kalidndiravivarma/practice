package com.practice.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.sql.DataSource;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.practice.Entiry.student;
import com.practice.spring.ResourceNotFoundException;
import com.practice.spring.controllers;

@Component
public class studentDAO {
	
	@Autowired
	SessionFactory sessfact;
	
	JdbcTemplate jdbc = new JdbcTemplate();
	@Autowired
	private DataSource ds;
	
	static final Logger logr = Logger.getLogger(studentDAO.class.getName());
	
	@Transactional
	public void addstudednt(student std){
		Session sess = sessfact.openSession();
		String sql = "INSERT INTO studentdata (age, groups, marks, name, id) values (?, ?, ?, ?, ?)";
		
		Query insertq = sessfact.getCurrentSession().createSQLQuery(sql);
		insertq.setParameter(0, std.getAge());
		insertq.setParameter(1, std.getGroups());
		insertq.setParameter(2, std.getMarks());
		insertq.setParameter(3, std.getName());
		insertq.setParameter(4, std.getId());
		
		insertq.executeUpdate();
		
		logr.info("Inserting date: "+std);
		sess.close();
	}
	
	@Transactional
	public ArrayList<student> getstudednts(){
		Session sess = sessfact.openSession();
		
		String SQL = "Select * FROM studentdata";
		SQLQuery query = sess.createSQLQuery(SQL);		
		
		ArrayList<student> list = (ArrayList<student>) query.getResultList();
		
		logr.info("sll student list :"+list);
		
		sess.close();
		
		return list;
		
	}
	
	@Transactional
	public int updatestudent(student std, int id){
		Session sess = sessfact.openSession();
		
		String updtusr = "UPDATE studentdata set name=:stname, marks=:stmarks, age=:stage, groups=:stgroup WHERE id=:stid";
		
		logr.info("updating student :"+std);
		
		Query insertq = sessfact.getCurrentSession().createSQLQuery(updtusr);
		insertq.setParameter("stage", std.getAge());
		insertq.setParameter("stgroup", std.getGroups());
		insertq.setParameter("stmarks", std.getMarks());
		insertq.setParameter("stname", std.getName());
		insertq.setParameter("stid", id);
		
		int result = insertq.executeUpdate();
			
		sess.close();
		
		return result;
	}
	
	@Transactional
	public List getstudednt(int id){
		Session sess = sessfact.openSession();
		
		String sql = "Select * FROM studentdata WHERE id=:std_id";
		
		
		SQLQuery query = sess.createSQLQuery(sql);
		query.addEntity(student.class);
		query.setParameter("std_id", id);
		
		List result = query.list();
		
		logr.info("get user result is :"+result.isEmpty());
		
		sess.close();
		
		return result;
		
	}
	
	@Transactional
	public boolean getcount(){
		Session sess = sessfact.openSession();
		
		String count = "Select count(*) FROM studentdata";		
		SQLQuery insertq = sess.createSQLQuery(count);
		
		boolean cnt = insertq.list().isEmpty();
		
		sess.close();
		
		return true;
	}
	
	
}
