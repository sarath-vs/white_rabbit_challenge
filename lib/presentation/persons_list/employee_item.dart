import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:white_rabbit_challenge/application/employee_controller.dart';
import 'package:white_rabbit_challenge/domain/models/model_person_list_response.dart';
import 'package:white_rabbit_challenge/presentation/person_info/screen_person_info.dart';

class EmployeeWidgetItem extends StatelessWidget {
  final int id;

  EmployeeWidgetItem(this.id);

  @override
  Widget build(BuildContext context) {
    final data = Get.find<EmployeController>().getEmployeeByID(id);

    return data == null
        ? const SizedBox()
        : ListTile(
            title: Text(data.name ?? 'Name not available'),
            subtitle: Text(getCompanyName(data)),
            leading: getProfileImage(data),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => ScreenPersonInfo(id: id)));
            },
          );
  }

  String getCompanyName(ModelEmployeeData employeeData) {
    if (employeeData.company == null) {
      return 'Company name not available';
    } else if (employeeData.company!.name == null) {
      return 'Company name not available';
    } else {
      return employeeData.company!.name!;
    }
  }

  Widget getProfileImage(ModelEmployeeData employeeData) {
    if (employeeData.profileImage == null) {
      return SizedBox();
    } else {
      return Image.network(employeeData.profileImage!);
    }
  }
}
