import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showLoading() async {
    dismissLoader();
    Get.closeAllSnackbars();
    Get.dialog(
      PopScope(
        canPop: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 60.0,
              height: 60.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void dismissLoader() async {
    bool? isOpen = Get.isDialogOpen;
    if (isOpen == true) {
      Get.back();
    }
  }
}
