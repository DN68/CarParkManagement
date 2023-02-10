package fa.training.repository;

import fa.training.entity.Department;

import java.util.List;

public interface DepartmentRepository {
    public List<Department> getListDepartmentCustom(int departmentId);
}
