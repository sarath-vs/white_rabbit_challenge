import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:white_rabbit_challenge/application/employee_controller.dart';
import 'package:white_rabbit_challenge/domain/models/model_person_list_response.dart';
import 'package:white_rabbit_challenge/presentation/persons_list/screen_person_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ModelEmployeeDataAdapter());
  Hive.registerAdapter(GeoAdapter());
  Hive.registerAdapter(CompanyAdapter());
  Hive.registerAdapter(AddressAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: GetxBindings(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScreenPersonList(),
      routes: {
        ScreenPersonList.routeName: (ctx) => ScreenPersonList(),
      },
    );
  }
}

class GetxBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(EmployeController(), permanent: true);
  }
}
