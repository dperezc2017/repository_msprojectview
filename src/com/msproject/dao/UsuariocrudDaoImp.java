package com.msproject.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;
import com.msproject.model.Tusuario;
import com.msproject.util.HibernateUtil;


public class UsuariocrudDaoImp implements UsuariocrudDAO{
	private Session session=HibernateUtil.getSessionFactory().openSession();
	private Transaction trans  = session.beginTransaction();
	private List<Tusuario> lstTusuario = null;
	
	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}

	public Transaction getTrans() {
		return trans;
	}

	public void setTrans(Transaction trans) {
		this.trans = trans;
	}

	public List<Tusuario> getLstTusuario() {
		return lstTusuario;
	}

	public void setLstTusuario(List<Tusuario> lstTusuario) {
		this.lstTusuario = lstTusuario;
	}


	@Override
    public List<Tusuario> mostrarUsuarios() {
        List<Tusuario> listarUsuarios = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        
        String hql="FROM Tusuario";
        try {
            listarUsuarios = session.createQuery(hql).list();
            transaction.commit();
            session.close();
            System.out.println("INGRESO usuariocrudDAOIMPL");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            transaction.rollback();
            System.out.println("NO INGRESO usuariocrudDAOIMPL");
        }
        
        return listarUsuarios;                        
    }

    @Override
    public void nuevoUsuario(Tusuario Tusuario) {
        Session session = null;
        
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(Tusuario);
            session.getTransaction().commit();   
            System.out.println("INGRESO nuevoUsuario usuarioCrudDaoImpl");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            session.getTransaction().rollback();            
        }finally{
            if (session!=null) {
                session.close();
            }
        }
    }    
    
    
    @Override
    public void modificarUsuario(Tusuario Tusuario) {
        Session session = null;
        
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.update(Tusuario);
            session.getTransaction().commit();
            System.out.println("MODIFICO nuevoUsuario usuarioCrudDaoImpl");
        } catch (Exception e) {
        	e.printStackTrace();
        	 System.out.println("antes MODIFICO nuevoUsuario usuarioCrudDaoImpl");
            System.out.println(e.getMessage());
            System.out.println("antes rollabck MODIFICO nuevoUsuario usuarioCrudDaoImpl");
            session.getTransaction().rollback();  
            System.out.println("no MODIFICO nuevoUsuario usuarioCrudDaoImpl");
        }finally{
            if (session!=null) {
                session.close();
            }
        }
    }

    @Override
    public void eliminarUsuario(Tusuario Tusuario) {
        Session session = null;
        
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.delete(Tusuario);
            session.getTransaction().commit();
            System.out.println("ELIMINADO usuarioCrudDaoImpl ****");
        } catch (Exception e) {
        	System.out.println("antes no ELIMINADO nuevoUsuario usuarioCrudDaoImpl");
        	System.out.println(e.getMessage());
         	System.out.println("antes rollabck  no ELIMINADO nuevoUsuario usuarioCrudDaoImpl");
        	session.getTransaction().rollback();
            System.out.println("no ELIMINADO usuarioCrudDaoImpl");
        }finally{
            if (session!=null) {
                session.close();
            }
        }
    }


    

   
    
    
    
    
}
