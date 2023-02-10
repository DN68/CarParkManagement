package fa.training.repository.impl;

import fa.training.entity.Department;
import fa.training.repository.DepartmentRepository;
import fa.training.util.DBContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class DepartmentRepositoryImpl extends DBContext implements DepartmentRepository {

    @Override
    public List<Department> getListDepartmentCustom(int departmentId) {
        List<Department> listDepartments = new ArrayList<>();
        try {
            //admin
            if(departmentId == 1) {
                ps = connection.prepareStatement("SELECT * FROM department");
            }
            else if(departmentId == 2) {
                ps = connection.prepareStatement("SELECT * FROM department WHERE department_id != 1");
            }
            else {
                ps = connection.prepareStatement("SELECT * FROM department WHERE department_id = "+departmentId);
            }
            rs = ps.executeQuery();
            while(rs.next()) {
                Department department = Department.builder()
                        .departmentId(rs.getInt(1))
                        .departmentName(rs.getString(2))
                        .build();
                listDepartments.add(department);
            }
            return listDepartments;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        DepartmentRepository repository = new DepartmentRepositoryImpl();
//        repository.getListDepartments().forEach(System.out::println);
        repository.getListDepartmentCustom(2).forEach(System.out::println);
    }
}
