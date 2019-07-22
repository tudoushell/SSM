package com.ssm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Pattern;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee {
    private Integer empId;
    @Pattern(regexp = "(^[a-z0-9_-]{4,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)",
            message = "姓名格式不正确")
    private String empName;
    private String gender;
    @Email
    private String email;
    private Integer dId;
    private Dept dept;
}
