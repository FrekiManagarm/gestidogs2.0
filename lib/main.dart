import 'package:clean_architecture_project/config/theme/app_themes.dart';
import 'package:clean_architecture_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        
      ],
      child: MaterialApp(
        title: 'Flutter Clean Architecture Project',
        theme: theme(), 
        home: Scaffold(),
      ),
    );
  }
}
