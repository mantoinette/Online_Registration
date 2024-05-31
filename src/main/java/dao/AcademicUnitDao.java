package dao;

import model.Academic_Unit;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AcademicUnitDao {

    public void saveAcademicUnit(Academic_Unit academicUnit) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(academicUnit);
            transaction.commit();
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        }
    }

    public Academic_Unit getAcademicUnitById(int academicUnitId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Academic_Unit.class, academicUnitId);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    // Add other methods as needed, such as updateAcademicUnit, deleteAcademicUnit, listAcademicUnits, etc.
}
