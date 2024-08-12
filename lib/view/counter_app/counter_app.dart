import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_mangment/controller/counter_controller/counter_controller.dart';

class counterPage extends StatelessWidget {
  counterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Icon(Icons.menu),
          backgroundColor:  (counterController.isDark.value)
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.secondary,
        title: Center(child: const Text('Counter App')),
        actions: [
          Switch(
            value: counterController.isDark.value,
            onChanged: (value) {
              counterController.themeChange();
            },
          ),
        ],
      ),
      backgroundColor:  (counterController.isDark.value)
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.secondary,
      body: Column(

        children: [

          SizedBox(
            height: 300,
          ),
          Obx(
            () => Center(
              child: Text(
                '${counterController.count.value}',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: (counterController.isDark.value)
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
