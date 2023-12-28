import 'package:clean_architecture_project/features/session/presentation/pages/today_sessions_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TodaySessionsList(),
        ],
      ),
    );
  }
}
