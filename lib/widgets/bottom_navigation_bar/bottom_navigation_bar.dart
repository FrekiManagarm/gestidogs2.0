import 'package:clean_architecture_project/config/theme/app_themes.dart';
import 'package:clean_architecture_project/widgets/bottom_navigation_bar/bnb_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final indexState = context.watch<BNBCubit>().state;
    final indexStateNotifier = context.read<BNBCubit>();
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 15,
        right: 15,
        top: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(2, 2),
              color: Colors.grey.shade600,
              spreadRadius: 2,
            ),
          ],
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        width: MediaQuery.sizeOf(context).width,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: indexState == 0
                    ? const LinearGradient(
                        colors: [
                          primaryColor,
                          secondaryColor,
                        ],
                        transform: GradientRotation(-18),
                      )
                    : null,
              ),
              child: InkWell(
                onTap: () {
                  indexStateNotifier.setIndex(0);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.home_outlined,
                    color: indexState == 0 ? Colors.black : Colors.white,
                    size: indexState == 0 ? 28 : 25,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: indexState == 1
                    ? const LinearGradient(
                        colors: [
                          primaryColor,
                          secondaryColor,
                        ],
                        transform: GradientRotation(-18),
                      )
                    : null,
              ),
              child: InkWell(
                onTap: () {
                  indexStateNotifier.setIndex(1);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.calendar_month_outlined,
                    color: indexState == 1 ? Colors.black : Colors.white,
                    size: indexState == 1 ? 28 : 25,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: indexState == 2
                    ? const LinearGradient(
                        colors: [
                          primaryColor,
                          secondaryColor,
                        ],
                        transform: GradientRotation(-18),
                      )
                    : null,
              ),
              child: InkWell(
                onTap: () {
                  indexStateNotifier.setIndex(2);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.wb_sunny_outlined,
                    color: indexState == 2 ? Colors.black : Colors.white,
                    size: indexState == 2 ? 28 : 25,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: indexState == 3
                    ? const LinearGradient(
                        colors: [
                          primaryColor,
                          secondaryColor,
                        ],
                        transform: GradientRotation(-18),
                      )
                    : null,
              ),
              child: InkWell(
                onTap: () {
                  indexStateNotifier.setIndex(3);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.person_outline,
                    color: indexState == 3 ? Colors.black : Colors.white,
                    size: indexState == 3 ? 28 : 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
