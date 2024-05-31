package dao;

import model.Semester;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class SemesterDao {

    public int saveSemester(Semester semester) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(semester);
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

    public boolean updateSemester(int semesterId, String semesterName, String startDate, Date endDate) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            // Retrieve the semester by ID
            Semester semester = session.get(Semester.class, semesterId);
            if (semester != null) {
                // Update the semester fields
                semester.setSemester_name(semesterName);
                semester.setStarting_date(Timestamp.valueOf(startDate));
                semester.setEnd_date(endDate);

                // Save the updated semester
                session.update(semester);

                // Commit the transaction
                transaction.commit();
                return true;
            } else {
                // Semester with the given ID not found
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


    public int deleteSemester(int semesterId) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            // Get the semester entity by ID
            Semester semester = session.get(Semester.class, semesterId);

            if (semester != null) {
                // Delete the semester
                session.delete(semester);
                transaction.commit();
                return 1;
            } else {
                // Semester not found
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

    public List<Semester> getAllSemesters() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM Semester", Semester.class).list();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Semester getSemesterById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Semester.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
