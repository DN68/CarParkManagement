package fa.training.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@ToString
public class Employee {
    private int employeeId;
    private String account;
    private String address;
    private String birthDate;
    private String email;
    private String name;
    private String phone;
    private String password;
    private boolean sex;
    private Department department;
}
