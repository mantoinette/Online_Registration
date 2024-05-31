package dao;

import model.Course;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CourseDao {

    public void saveCourse(Course course) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(course);
            transaction.commit();
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        }
    }

    public Course getCourseById(int courseId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Course.class, courseId);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    // Add other methods as needed, such as updateCourse, deleteCourse, listCourses, etc.


}
