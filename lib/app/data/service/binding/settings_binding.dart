import 'package:employee_attendance_flutter/app/data/service/controller/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}