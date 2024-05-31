package dao;

import model.Students;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class StudentsDao {

    public int saveStudents(Students students) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(students);
            transaction.commit();
            return 1;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        }
        return 0;
    }

    public boolean updateStudent(int studentId, String firstName, String lastName, String dob) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            // Retrieve the student by ID
            Students student = session.get(Students.class, studentId);
            if (student != null) {
                // Update the student fields
                student.setFirst_name(firstName);
                student.setLast_name(lastName);
                student.setDate_of_birth(dob);

                // Save the updated student
                session.update(student);

                // Commit the transaction
                transaction.commit();
                return true;
            } else {
                // Student with the given ID not found
                return false;
            }
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
            return false;
        }
    }


    public int deleteStudents(int studentId) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            // Get the student entity by ID
            Students student = session.get(Students.class, studentId);

            if (student != null) {
                // Delete the student
                session.delete(student);
                transaction.commit();
                return 1;
            } else {
                // Student not found
                return 0;
            }
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
            return 0;
        }
    }


    public List<Students> getAllStudents() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Students", Students.class).list();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    public Students getStudentById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Students.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

//    public boolean updateStudent(int studentId, String firstName, String lastName, String dob) {
//    }
}
