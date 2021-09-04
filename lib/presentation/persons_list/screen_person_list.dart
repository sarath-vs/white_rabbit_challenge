import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:white_rabbit_challenge/application/employee_controller.dart';
import 'package:white_rabbit_challenge/presentation/persons_list/employee_item.dart';

class ScreenPersonList extends StatelessWidget {
  static final routeName = '/ScreenPersonList';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<EmployeController>().getEmployeeList();
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<EmployeController>(
            id: Get.find<EmployeController>().employeeListWidgetID,
            builder: (controller) {
              if (controller.isEmployeeListLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.isEmployeeListLoadingError) {
                return Center(
                  child: Text(controller.employeeListLoadingErrorMessage),
                );
              } else {
                return Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search here',
                      ),
                      onChanged: (v) {
                        Get.find<EmployeController>().searchEmployee(v);
                      },
                    ),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          if (controller.employeeShowcaseList[index].id !=
                              null) {
                            return EmployeeWidgetItem(
                                controller.employeeShowcaseList[index].id!);
                          } else {
                            return const SizedBox();
                          }
                        },
                        separatorBuilder: (ctx, index) => SizedBox(height: 10),
                        itemCount: controller.employeeShowcaseList.length,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
