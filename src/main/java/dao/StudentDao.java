package dao;

import model.Student;
import org.hibernate.Session;

public class StudentDao {
    public void studentRegister(Student student) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(student);
            session.getTransaction().commit();
            session.close();
        } catch (Exception exe) {
            exe.printStackTrace();
        }
    }
}
