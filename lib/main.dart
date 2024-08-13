// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:getx_state_mangment/controller/crud_controller/crud_controller.dart';
// import 'package:getx_state_mangment/view/counter_app/counter_app.dart';
// import 'package:getx_state_mangment/view/crud_pages/crud_home_page/crud_home_page.dart';
//
// import 'controller/counter_controller/counter_controller.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//    MyApp({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//   //  final CounterController counterController = Get.put(CounterController());
//
//
//     return   GetMaterialApp(
//         // theme: ThemeData(
//         //   colorScheme: ColorScheme.light(
//         //     primary: Colors.black,
//         //     secondary: Colors.white,
//         //   ),
//         // ),
//         // darkTheme: ThemeData(
//         //   colorScheme: ColorScheme.light(
//         //     primary: Colors.blue.shade900,
//         //     secondary: Colors.blue.shade50,
//         //   ),
//         // ),
//         // themeMode: counterController.isDark.value
//         //     ? ThemeMode.dark
//         //     : ThemeMode.light,
//         // debugShowCheckedModeBanner: false,
//         getPages: [
//         //   // GetPage(
//         //   //   name: '/',
//         //   //   page: () => counterPage(),
//         //   // )
//           GetPage(
//             name: '/',
//             page: () => crudHomePage(),
//           )
//         ],
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_state_mangment/view/crud_pages/crud_home_page/crud_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => crudHomePage(),
        )
      ],
    );
  }
}
