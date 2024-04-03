import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:instructor_dairy/features/authentication/models/user_model.dart';

class UserRepository {
  static UserRepository get instance => Get.find();

  final db = FirebaseFirestore.instance;
  createUser(UserModel user) async {
    await db.collection("Users").add(user.toJson()).whenComplete(
            () => Get.snackbar("Success", "Account is created",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green.withOpacity(0.1),
    colorText: Colors.green)
    )
       .catchError((error, stackTrace) {
      Get.snackbar("Error", "Sometheing went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    });
  }
}