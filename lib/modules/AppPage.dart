import 'package:e_commerce_app/layouts/customBottomNavBar.dart';
import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: customBottomNavBar(),
    );
  }
}
