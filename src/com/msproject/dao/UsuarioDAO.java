package com.msproject.dao;


import org.hibernate.Query;

import org.hibernate.Session;

import com.msproject.model.Tusuario;
import com.msproject.util.HibernateUtil;

public class UsuarioDAO {
private Session session;

public Tusuario verificarDatos(Tusuario usuario) throws Exception{
	Tusuario us= null;
	try {
		session = HibernateUtil.getSessionFactory().openSession();
		String hql="FROM Tusuario WHERE nombreUsuario='"+usuario.getNombreUsuario()
				+"' and clave='"+usuario.getClave()+"'";
		Query query = session.createQuery(hql);
		
		if(!query.list().isEmpty()){
			us=(Tusuario) query.list().get(0);
			
		}
		System.out.println("us: "+us);
	} catch (Exception e) {
		throw e;
	}
	
	return us;
}

}
