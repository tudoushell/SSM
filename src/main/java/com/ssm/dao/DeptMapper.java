package com.ssm.dao;

import com.ssm.pojo.Dept;

import java.util.List;

public interface DeptMapper {

   void saveDept(Dept dept);

   List<Dept> listDepts();
}
