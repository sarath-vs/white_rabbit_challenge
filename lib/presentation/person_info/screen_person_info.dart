import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:white_rabbit_challenge/application/employee_controller.dart';
import 'package:white_rabbit_challenge/domain/models/model_person_list_response.dart';

class ScreenPersonInfo extends StatefulWidget {
  static final routeName = '/ScreenPersonInfo';

  final int id;

  const ScreenPersonInfo({Key? key, required this.id}) : super(key: key);

  @override
  _ScreenPersonInfoState createState() => _ScreenPersonInfoState();
}

class _ScreenPersonInfoState extends State<ScreenPersonInfo> {
  ModelEmployeeData? data;

  @override
  void didChangeDependencies() {
    data = Get.find<EmployeController>().getEmployeeByID(widget.id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return const Center(
        child: Text('Unable to find employee data'),
      );
    }
    final widgetList = [
      data!.profileImage == null
          ? SizedBox()
          : SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(data!.profileImage!),
            ),
      ListTile(
        title: Text('Name'),
        subtitle: Text(data!.name ?? 'Name not available'),
      ),
      ListTile(
        title: Text('Username'),
        subtitle: Text(data!.username ?? 'Usename not available'),
      ),
      ListTile(
        title: Text('Email'),
        subtitle: Text(data!.email ?? 'Email not available'),
      ),
      ListTile(
        title: Text('Address'),
        subtitle: Text(
          data!.address == null
              ? 'Address not available'
              : '${data!.address!.street}\n${data!.address!.suite}\n${data!.address!.city}\n${data!.address!.zipcode}',
        ),
      ),
      ListTile(
        title: Text('Phone'),
        subtitle: Text(data!.phone ?? 'Phone not available'),
      ),
      ListTile(
        title: Text('Website'),
        subtitle: Text(data!.website ?? 'Website not available'),
      ),
      ListTile(
        title: Text('Company Details'),
        subtitle: Text(
          data!.company == null
              ? 'Company not available'
              : '${data!.company!.name}\n${data!.company!.catchPhrase}\n${data!.company!.bs}',
        ),
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) => widgetList[index],
          separatorBuilder: (ctx, index) {
            return const SizedBox(height: 10);
          },
          itemCount: widgetList.length,
        ),
      ),
    );
  }
}
