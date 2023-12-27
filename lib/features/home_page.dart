import 'package:clean_architecture_project/features/authentication/presentation/pages/profile_screen.dart';
import 'package:clean_architecture_project/features/holidays/presentation/pages/holidays_home_screen.dart';
import 'package:clean_architecture_project/features/home_screen.dart';
import 'package:clean_architecture_project/features/session/presentation/pages/calendar_screen.dart';
import 'package:clean_architecture_project/widgets/bottom_navigation_bar/bnb_cubit.dart';
import 'package:clean_architecture_project/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> tabs = const [
    HomeScreen(),
    CalendarScreen(),
    HolidaysHomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final indexState = context.watch<BNBCubit>().state;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const CustomBottomNavBar(),
      body: tabs[indexState],
    );
  }
}
