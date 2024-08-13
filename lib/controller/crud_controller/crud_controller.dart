import 'package:get/get.dart';

import '../../modal/crud_modal/crud_modal.dart';



class CrudController extends GetxController {

  RxList<Employee> employeeList = <Employee>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  void addEmployee(Map employee) {
    employeeList.add(
      Employee.fromMap(employee),
    );
  }
  void updateEmployeeDetails(int index,Map employee)
  {
    employeeList[index]=Employee.fromMap(employee);
  }
  void deleteEmployeeDetails(int index
      )
  {
    employeeList.removeAt(index);
  }
}
