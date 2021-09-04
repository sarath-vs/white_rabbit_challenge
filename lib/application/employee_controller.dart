import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:white_rabbit_challenge/domain/models/model_person_list_response.dart';
import 'package:white_rabbit_challenge/domain/remote_storage/url_pool.dart';

class EmployeController extends GetxController {
  String get employeeListWidgetID => 'employeeListWidgetID';

  bool isEmployeeListLoading = false;
  bool isEmployeeListLoadingError = false;
  String employeeListLoadingErrorMessage = '';

  List<ModelEmployeeData> _employeeList = [];
  List<ModelEmployeeData> employeeShowcaseList = [];

  /*
  This function will get employee list from storgae and remote
  initially this fn will get data from locally
  if data seems to be empty, this will call fn to get data from remote
  */
  Future<void> getEmployeeList() async {
    print('Getting employee list from Local DB');
    await getEmployeeListFromLocalDB();
    print('Employees found in local DB : ${_employeeList.length}');
    if (_employeeList.isEmpty) {
      print('Since not data found in Local DB, fetching from remote');
      getEmployeeListFromRemote();
    } else {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: Text('Showing data from LocalDB')));
      searchEmployee('');
    }
  }

  /*
   * This fn will get data from remote
   */

  Future<void> getEmployeeListFromRemote() async {
    isEmployeeListLoading = true;
    isEmployeeListLoadingError = false;
    update([employeeListWidgetID]);
    print('Getting employee list from Remote DB');
    final response =
        await http.get(Uri.parse(RemoteStorageApiUrl.getEmployeeList));

    if (response.statusCode == 200) {
      final bodyAsMap = jsonDecode(response.body) as List<dynamic>;
      _employeeList.clear();
      bodyAsMap.forEach((e) {
        _employeeList
            .add(ModelEmployeeData.fromJson(e as Map<String, dynamic>));
      });
      print('${_employeeList.length} employess found in remote');
      await Future.forEach(
        _employeeList,
        (ModelEmployeeData employee) async {
          await saveEmployeeDataLocally(employee);
        },
      );
      isEmployeeListLoading = false;
      isEmployeeListLoadingError = false;
      searchEmployee('');
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: Text('Showing data from RemoteDB')));
    } else {
      isEmployeeListLoading = false;
      isEmployeeListLoadingError = true;
      employeeListLoadingErrorMessage =
          'Unable to get Data. Status ${response.statusCode}';
      update([employeeListWidgetID]);
    }
  }

  /**
   * This fn will get employee data WRT id
   */
  ModelEmployeeData? getEmployeeByID(int id) {
    try {
      final data = _employeeList.firstWhere(
        (element) => element.id == id,
      );
      return data;
    } catch (_) {
      return null;
    }
  }

/**
   * This fn will search employee WRT query
   */
  Future<void> searchEmployee(String query) async {
    if (query.trim().isEmpty) {
      print('Empty query');
      employeeShowcaseList.clear();
      employeeShowcaseList.addAll(_employeeList);
      update([employeeListWidgetID]);
    } else {
      print('Searching $query');
      employeeShowcaseList.clear();
      try {
        final resultList = _employeeList.where((element) =>
            (element.name ?? '').toLowerCase().contains(query.toLowerCase()) ||
            (element.email ?? '').toLowerCase().contains(query.toLowerCase()));
        employeeShowcaseList.addAll(resultList);
      } catch (_) {}
      update([employeeListWidgetID]);
    }
  }

  /**
   * This fn will save employee to DB
   */
  Future<void> saveEmployeeDataLocally(ModelEmployeeData data) async {
    try {
      final db = await Hive.openBox<ModelEmployeeData>('employee_list_db');
      await db.put(data.id!, data);
    } catch (e) {
      print('Unable to save employee ${data.id}');
      print(e);
    }
  }

/**
   * This fn will get all employee data from local db
   */
  Future<void> getEmployeeListFromLocalDB() async {
    isEmployeeListLoading = true;
    update([employeeListWidgetID]);
    final db = await Hive.openBox<ModelEmployeeData>('employee_list_db');
    _employeeList.clear();
    _employeeList.addAll(db.values);
    isEmployeeListLoading = false;
    update([employeeListWidgetID]);
  }
}
