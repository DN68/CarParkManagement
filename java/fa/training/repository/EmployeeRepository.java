package fa.training.repository;

import fa.training.entity.Employee;

import java.util.List;

public interface EmployeeRepository {
    /**
     * Get all list employee include paging, search, authorization, sort
     * @param page page current
     * @param non number of record of a page
     * @param typeSearch type search return integer
     * @param txtSearch text to search
     * @param departmentId id of department
     * @return list of employee
     */
    public List<Employee> getListEmployees(int page, int non, int typeSearch, String txtSearch, int departmentId);

    public int getTotalEmployees(int typeSearch, String txtSearch, int departmentId);

    /**
     * Add an employee to employee table
     * @param employee new employee
     * @return true or false
     */
    public boolean addEmployee(Employee employee);

    /**
     * Update an employee to employee table
     * @param employee new employee
     * @return true or false
     */
    public boolean updateEmployee(Employee employee);

    /**
     * Delete an employee by id
     * @param employeeId id to delete
     * @return true or false
     */
    public boolean deleteEmployee(int employeeId);

    /**
     * Get an employee by id
     * @param employeeId new employee
     * @return true or false
     */
    public Employee getEmployeeById(int employeeId);

    /**
     * Check account exist to database
     * @param email email input
     * @param password password input
     * @return employee entity
     */
    public Employee checkLogin(String email, String password);

    public boolean updatePassword(int employeeId, String password);

    public boolean checkEmailExist(String email);

    public boolean checkAccountExist(String account);
}
