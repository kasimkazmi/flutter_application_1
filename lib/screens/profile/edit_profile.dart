import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

import '../../controller/validation_controller.dart';

class EditProfile extends StatelessWidget {
   EditProfile({super.key});
  final ValidationController validationController = ValidationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Screen"),
      ),
      backgroundColor: AppStyles.bgColor,
    );
  }
}
