//package dao;
//
//import model.Teacher;
//import org.hibernate.Session;
//import org.hibernate.Transaction;
//
//import java.util.List;
//
//public class TeacherDao {
//
//    public void saveTeacher(Teacher teacher) {
//        Transaction transaction = null;
//        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
//            transaction = session.beginTransaction();
//            session.save(teacher);
//            transaction.commit();
//        } catch (Exception ex) {
//            if (transaction != null) {
//                transaction.rollback();
//            }
//            ex.printStackTrace(); // You can log the exception instead of printing it
//        }
//    }
//
//    public void updateTeacher(Teacher teacher) {
//        Transaction transaction = null;
//        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
//            transaction = session.beginTransaction();
//            session.update(teacher);
//            transaction.commit();
//        } catch (Exception ex) {
//            if (transaction != null) {
//                transaction.rollback();
//            }
//            ex.printStackTrace();
//        }
//    }
//
//    public void deleteTeacher(Teacher teacher) {
//        Transaction transaction = null;
//        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
//            transaction = session.beginTransaction();
//            session.delete(teacher);
//            transaction.commit();
//        } catch (Exception ex) {
//            if (transaction != null) {
//                transaction.rollback();
//            }
//            ex.printStackTrace();
//        }
//    }
//
//    public List<Teacher> listTeachers() {
//        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
//            return session.createQuery("from Teacher", Teacher.class).list();
//        } catch (Exception ex) {
//            ex.printStackTrace();
//            return null;
//        }
//    }
//
//    public Teacher getTeacherById(int teacherId) {
//        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
//            return session.get(Teacher.class, teacherId);
//        } catch (Exception ex) {
//            ex.printStackTrace();
//            return null;
//        }
//    }
//}
package dao;

import model.Teacher;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TeacherDao {

    public void saveTeacher(Teacher teacher) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(teacher);
            transaction.commit();
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        }
    }
}

