import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_mangment/controller/crud_controller/crud_controller.dart';

final crudController = Get.put(CrudController());
GlobalKey<FormState> crudKey = GlobalKey();
TextEditingController employee_id = TextEditingController();
TextEditingController first_name = TextEditingController();
TextEditingController last_name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController department = TextEditingController();
TextEditingController position = TextEditingController();
TextEditingController hire_date = TextEditingController();

class crudHomePage extends StatelessWidget {
  const crudHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Center(
            child: Text(
          'C R U D',
          style: TextStyle(color: Colors.white),
        )),
        elevation: 2,
        centerTitle: true,
      ),
      body: Obx(
        () {
          return ListView.builder(
              itemCount: crudController.employeeList.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Text(
                            '${crudController.employeeList[index].employee_id}',
                            style: TextStyle(
                                color: Colors.blue.shade900, fontSize: 16),
                          ),
                          title: Column(
                            children: [
                              Text(
                                '${crudController.employeeList[index].first_name}',
                                style: TextStyle(
                                    color: Colors.blue.shade900, fontSize: 18),
                              ),
                          Text(
                            '${crudController.employeeList[index].department}',
                            style: TextStyle(
                              color: Colors.blue.shade900,
                              fontSize: 18,
                            ),
                          )
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Text(
                                '${crudController.employeeList[index].position}',
                                style: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),


                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Update Employee Details'),
                                        actions: [
                                          TextFormField(
                                            controller: first_name,
                                            style: TextStyle(
                                                color: Colors.blue.shade900),
                                            decoration: InputDecoration(
                                              labelText: 'Name',
                                              labelStyle: TextStyle(
                                                  color: Colors.blue.shade900),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            controller: employee_id,
                                            style: TextStyle(
                                                color: Colors.blue.shade900),
                                            decoration: InputDecoration(
                                              labelText: 'employee_id',
                                              labelStyle: TextStyle(
                                                  color: Colors.blue.shade900),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            controller: department,
                                            style: TextStyle(
                                                color: Colors.blue.shade900),
                                            decoration: InputDecoration(
                                              labelText: 'Department',
                                              labelStyle: TextStyle(
                                                  color: Colors.blue.shade900),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            controller: position,
                                            style: TextStyle(
                                                color: Colors.blue.shade900),
                                            decoration: InputDecoration(
                                              labelText: 'position',
                                              labelStyle: TextStyle(
                                                  color: Colors.blue.shade900),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  crudController
                                                      .updateEmployeeDetails(
                                                      index, {
                                                    'first_name':
                                                    first_name.text,
                                                    'employee_id':
                                                    employee_id.text,
                                                    'email': email.text,
                                                    'department':
                                                    department.text,
                                                    'position': position.text,
                                                    'hire_date':
                                                    hire_date.text
                                                  });
                                                  first_name.clear();
                                                  employee_id.clear();
                                                  email.clear();
                                                  department.clear();
                                                  position.clear();
                                                  hire_date.clear();
                                                },
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .blue.shade900,
                                                      fontSize: 16),
                                                )),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 16),
                                              ),
                                            )
                                          ],
                                        )
                                        ],
                                      ),
                                    );
                                  },
                                  child: Icon(Icons.edit,
                                      color: Colors.blue.shade900, size: 28)),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onDoubleTap: () {
                                  crudController.deleteEmployeeDetails(index);
                                },
                                child: Icon(Icons.delete,
                                    color: Colors.red.shade900, size: 28),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => Form(
                    key: crudKey,
                    child: AlertDialog(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Add Employee Details',style: TextStyle(color: Colors.blue.shade900,fontSize: 18),),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.blue.shade900),
                              controller: first_name,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle:
                                    TextStyle(color: Colors.blue.shade900),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: employee_id,
                              style: TextStyle(color: Colors.blue.shade900),
                              decoration: InputDecoration(
                                labelText: 'employee_id',
                                labelStyle:
                                    TextStyle(color: Colors.blue.shade900),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: department,
                              style: TextStyle(color: Colors.blue.shade900),
                              decoration: InputDecoration(
                                labelText: 'Department',
                                labelStyle:
                                    TextStyle(color: Colors.blue.shade900),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: position,
                              style: TextStyle(color: Colors.blue.shade900),
                              decoration: InputDecoration(
                                labelText: 'position',
                                labelStyle:
                                    TextStyle(color: Colors.blue.shade900),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      bool re =
                                          crudKey.currentState!.validate();
                                      if (re) {
                                        crudController.addEmployee({
                                          'first_name': first_name.text,
                                          'employee_id': employee_id.text,
                                          'email': email.text,
                                          'department': department.text,
                                          'position': position.text,
                                          'hire_date': hire_date.text
                                        });
                                        first_name.clear();
                                        employee_id.clear();
                                        email.clear();
                                        department.clear();
                                        position.clear();
                                        hire_date.clear();
                                      }
                                    },
                                    child: Text('Save')),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

int index = 0;
