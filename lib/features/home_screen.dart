import 'package:clean_architecture_project/config/theme/app_themes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const BouncingScrollPhysics(
        decelerationRate: ScrollDecelerationRate.fast,
      ),
      scrollDirection: Axis.vertical,
      headerSliverBuilder: (context, innerBoxIsScrolled) => const [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          backgroundColor: primaryColor,
          floating: true,
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(-10),
            child: SizedBox(),
          ),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            stretchModes: [
              StretchMode.zoomBackground,
              StretchMode.fadeTitle,
            ],
            title: Text("Bonjour"),
          ),
        ),
      ],
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
