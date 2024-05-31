//package model;
//
//import jakarta.persistence.*;
//
//@Entity
//@Table(name ="teacher")
//public class Teacher {
//    @Id
//    @GeneratedValue(strategy = GenerationType.AUTO)
//    private int teacher_id;
//    private String first_name;
//    private String last_name;
//    @Enumerated(EnumType.STRING)
//    private EQualification qualification;
//    @ManyToOne
//    @JoinColumn(name ="course_id")
//    private Course course;
//
//    public Teacher() {
//    }
//
//    public Teacher(int teacher_id, String first_name, String last_name, EQualification qualification, Course course) {
//        this.teacher_id = teacher_id;
//        this.first_name = first_name;
//        this.last_name = last_name;
//        this.qualification = qualification;
//        this.course = course;
//    }
//
//    public int getTeacher_id() {
//        return teacher_id;
//    }
//
//    public void setTeacher_id(int teacher_id) {
//        this.teacher_id = teacher_id;
//    }
//
//    public String getFirst_name() {
//        return first_name;
//    }
//
//    public void setFirst_name(String first_name) {
//        this.first_name = first_name;
//    }
//
//    public String getLast_name() {
//        return last_name;
//    }
//
//    public void setLast_name(String last_name) {
//        this.last_name = last_name;
//    }
//
//    public EQualification getQualification() {
//        return qualification;
//    }
//
//    public void setQualification(EQualification qualification) {
//        this.qualification = qualification;
//    }
//
//    public Course getCourse() {
//        return course;
//    }
//
//    public void setCourse(Course course) {
//        this.course = course;
//    }
//}
package model;

import jakarta.persistence.*;

@Entity
@Table(name = "teacher")
public class Teacher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int teacher_id;
    private String first_name;
    private String last_name;
    @Enumerated(EnumType.STRING)
    private EQualification qualification;
    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    // Getters and setters
    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public EQualification getQualification() {
        return qualification;
    }

    public void setQualification(EQualification qualification) {
        this.qualification = qualification;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
}

