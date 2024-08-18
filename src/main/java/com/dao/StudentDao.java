package com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.dto.Student;

public class StudentDao {

	EntityManagerFactory emf=Persistence.createEntityManagerFactory("sam");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	public void saveStudent(Student student)
	{
		et.begin();
		em.persist(student);
		et.commit();
	}
	
	public void updateEmployee(Student student)
	{
		et.begin();
		em.merge(student);
		et.commit();
	}
	
	public void deleteStudent(Student student)
	{
		et.begin();
		em.remove(student);
		et.commit();
	}
	
	public Student findStudentById(int id)
	{
		return em.find(Student.class, id);
	}
	
	public List<Student> findAllStudent()
	{
		Query q=em.createQuery("select s from Student s");
		List<Student> l=q.getResultList();
		return l;
	}
}
    