package fa.training.repository.impl;

import fa.training.entity.Department;
import fa.training.entity.Employee;
import fa.training.repository.EmployeeRepository;
import fa.training.util.DBContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl extends DBContext implements EmployeeRepository {
    public static String getSearchTitle(int typeSearch) {
        switch (typeSearch){
            case 0:
                return "account";
            case 1:
                return "employee_address";
            case 2:
                return "employee_email";
            case 3:
                return "employee_name";
            case 4:
                return "employee_phone";
            case 5:
                return "D.department_name";
            case 6:
                return "employee_birthdate";
        }
        return null;
    }

    @Override
    public List<Employee> getListEmployees(int page, int non, int typeSearch, String txtSearch,
                                           int departmentId) {
        String departmentAuthen = "";
        if(departmentId != 1) {
            departmentAuthen = "AND E.department_id != 1";
        }
        String sql = "SELECT E.*, D.department_name FROM employee AS E JOIN department AS D\n" +
                "                ON E.department_id = D.department_id\n" +
                "                WHERE "+getSearchTitle(typeSearch)+" LIKE ? "+departmentAuthen+"" +
                " ORDER BY employee_id OFFSET ? ROWS FETCH NEXT ? ROW ONLY";
        List<Employee> listEmployees = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%"+txtSearch+"%");
            ps.setInt(2, (page - 1) * non);
            ps.setInt(3, non);
            rs = ps.executeQuery();
            while (rs.next()) {
                Department department = Department.builder()
                        .departmentId(rs.getInt(10))
                        .departmentName(rs.getString(11))
                        .build();
                Employee employee = Employee.builder()
                        .employeeId(rs.getInt(1))
                        .account(rs.getString(2))
                        .address(rs.getString(3))
                        .birthDate(rs.getString(4))
                        .email(rs.getString(5))
                        .name(rs.getString(6))
                        .phone(rs.getString(7))
                        .password(rs.getString(8))
                        .sex(rs.getBoolean(9))
                        .department(department)
                        .build();
                listEmployees.add(employee);
            }
            return listEmployees;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int getTotalEmployees(int typeSearch, String txtSearch, int departmentId) {
        String departmentAuthen = "";
        if(departmentId != 1) {
            departmentAuthen = "AND E.department_id != 1";
        }
        String sql = "SELECT COUNT(*) FROM employee AS E JOIN department AS D\n" +
                "                ON E.department_id = D.department_id\n" +
                "                WHERE "+getSearchTitle(typeSearch)+" LIKE ? "+departmentAuthen;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%"+txtSearch+"%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean addEmployee(Employee employee) {
        String sql = "INSERT INTO [employee]([account],[employee_address],[employee_birthdate], \n" +
                "[employee_email], [employee_name], [employee_phone],\n" +
                "[password], [sex], [department_id])\n" +
                "     VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, employee.getAccount());
            ps.setString(2, employee.getAddress());
            ps.setString(3, employee.getBirthDate());
            ps.setString(4, employee.getEmail());
            ps.setString(5, employee.getName());
            ps.setString(6, employee.getPhone());
            ps.setString(7, employee.getPassword());
            ps.setBoolean(8, employee.isSex());
            ps.setInt(9, employee.getDepartment().getDepartmentId());
            int isSuccess = ps.executeUpdate();
            if(isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        String sql = "UPDATE [employee]\n" +
                "   SET [account] = ?\n" +
                "      ,[employee_address] = ?\n" +
                "      ,[employee_birthdate] = ?\n" +
                "      ,[employee_email] = ?\n" +
                "      ,[employee_name] = ?\n" +
                "      ,[employee_phone] = ?\n" +
                "      ,[password] = ?\n" +
                "      ,[sex] = ?\n" +
                "      ,[department_id] = ?\n" +
                " WHERE employee_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, employee.getAccount());
            ps.setString(2, employee.getAddress());
            ps.setString(3, employee.getBirthDate());
            ps.setString(4, employee.getEmail());
            ps.setString(5, employee.getName());
            ps.setString(6, employee.getPhone());
            ps.setString(7, employee.getPassword());
            ps.setBoolean(8, employee.isSex());
            ps.setInt(9, employee.getDepartment().getDepartmentId());
            ps.setInt(10 ,employee.getEmployeeId());
            int isSuccess = ps.executeUpdate();
            if(isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteEmployee(int employeeId) {
        String sql = "DELETE FROM [employee] WHERE employee_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, employeeId);
            int isSuccess = ps.executeUpdate();
            if(isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Employee getEmployeeById(int employeeId) {
        String sql = "SELECT E.*, D.department_name FROM employee AS E JOIN department AS D " +
                "ON E.department_id = D.department_id WHERE employee_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, employeeId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Department department = Department.builder()
                        .departmentId(rs.getInt(10))
                        .departmentName(rs.getString(11))
                        .build();
                Employee employee = Employee.builder()
                        .employeeId(rs.getInt(1))
                        .account(rs.getString(2))
                        .address(rs.getString(3))
                        .birthDate(rs.getString(4))
                        .email(rs.getString(5))
                        .name(rs.getString(6))
                        .phone(rs.getString(7))
                        .password(rs.getString(8))
                        .sex(rs.getBoolean(9))
                        .department(department)
                        .build();
                return employee;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Employee checkLogin(String txtLogin, String password) {
        String sql = "SELECT E.*, D.department_name FROM employee AS E JOIN department AS D\n" +
                "                ON E.department_id = D.department_id\n" +
                "                WHERE (account = ? OR employee_email = ?) AND password = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, txtLogin);
            ps.setString(2, txtLogin);
            ps.setString(3, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                Department department = Department.builder()
                        .departmentId(rs.getInt(10))
                        .departmentName(rs.getString(11))
                        .build();
                Employee employee = Employee.builder()
                        .employeeId(rs.getInt(1))
                        .account(rs.getString(2))
                        .address(rs.getString(3))
                        .birthDate(rs.getString(4))
                        .email(rs.getString(5))
                        .name(rs.getString(6))
                        .phone(rs.getString(7))
                        .password(rs.getString(8))
                        .sex(rs.getBoolean(9))
                        .department(department)
                        .build();
                return employee;
            }
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean updatePassword(int employeeId, String password) {
        String sql = "UPDATE [employee]\n" +
                "   SET [password] = ? WHERE employee_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setInt(2, employeeId);
            int isSuccess = ps.executeUpdate();
            if(isSuccess == 1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkEmailExist(String email) {
        String sql = "SELECT * FROM employee WHERE employee_email = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                if(rs!=null) return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkAccountExist(String account) {
        String sql = "SELECT * FROM employee WHERE account = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, account);
            rs = ps.executeQuery();
            while (rs.next()) {
                if(rs!=null) return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        EmployeeRepository repository = new EmployeeRepositoryImpl();

        repository.getListEmployees(1, 5, 0, "ll", 1)
                .forEach(System.out::println);

//        System.out.println(repository.getTotalEmployees(0, "", 2));

//        Employee employee = Employee.builder()
//                .account("abcde")
//                .address("abcde")
//                .birthDate("20251010")
//                .email("kazaf@gmail.com")
//                .name("kazaaaaaa")
//                .phone("035516640433")
//                .password("1234567833")
//                .sex(false)
//                .department(Department.builder().departmentId(2).build())
//                .build();
//        System.out.println(repository.addEmployee(employee));
//        System.out.println(repository.updateEmployee(employee));

//        System.out.println(repository.deleteEmployee(101));
//        System.out.println(repository.getEmployeeById(5));
//        System.out.println(new EmployeeRepositoryImpl().getSearchTitle(0));
//        System.out.println(repository.checkLogin("admina", "12345678"));
    }
}
