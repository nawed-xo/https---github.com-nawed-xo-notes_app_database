import 'package:flutter/material.dart';

class custom_widget {
  static custom_feild(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.arrow_forward_ios_outlined),
        hintText: "Enter Title...",
        hintStyle: TextStyle(
          color: const Color.fromARGB(148, 255, 255, 255),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
