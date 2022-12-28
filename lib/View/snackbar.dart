import 'package:get/get.dart';
import 'package:flutter/material.dart';

showAlert(String title, String message) {
  return Get.snackbar('Congratulation', 'Welcome In SMS',
      titleText:  Text(
        title,
        style: const TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
      ),
      messageText:  Text(
        message,
        style: const TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
      ),

      backgroundColor: Colors.grey,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      icon: const Icon(
        Icons.notifications,
        color: Colors.redAccent,
        size: 25,
      ),
      snackPosition: SnackPosition.TOP);
}
