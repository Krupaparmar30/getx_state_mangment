class Employee {
  late String employee_id,
      first_name,
    //  last_name,
      email,
      department,
      position,
      hire_date;


  Employee(
      {required this.employee_id,
      required this.first_name,

      required this.email,
      required this.department,
      required this.position,
      required this.hire_date,
    });

  factory Employee.fromMap(Map m1) {
    return Employee(
        employee_id: m1['employee_id'],
        first_name: m1['first_name'],

        email: m1['email'],
        department: m1['department'],
        position: m1['position'],
        hire_date: m1['hire_date'],
      );
  }
}
