import 'package:clean_architecture_project/config/routes/routes.dart';
import 'package:clean_architecture_project/config/theme/app_themes.dart';
import 'package:clean_architecture_project/features/activity/presentation/bloc/activity_bloc.dart';
import 'package:clean_architecture_project/features/authentication/presentation/bloc/user_bloc.dart';
import 'package:clean_architecture_project/features/dog/presentation/bloc/dog_bloc.dart';
import 'package:clean_architecture_project/features/establishment/presentation/bloc/establishment_bloc.dart';
import 'package:clean_architecture_project/features/holidays/presentation/bloc/holidays_bloc.dart';
import 'package:clean_architecture_project/features/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:clean_architecture_project/features/session/presentation/bloc/session_bloc.dart';
import 'package:clean_architecture_project/injection_container.dart';
import 'package:clean_architecture_project/widgets/bottom_navigation_bar/bnb_cubit.dart';
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
        BlocProvider(create: (context) => sl<SessionsBloc>()),
        BlocProvider(create: (context) => sl<ReservationsBloc>()),
        BlocProvider(create: (context) => sl<HolidaysBloc>()),
        BlocProvider(create: (context) => sl<EstablishmentBloc>()),
        BlocProvider(create: (context) => sl<DogBloc>()),
        BlocProvider(create: (context) => sl<UserBloc>()),
        BlocProvider(create: (context) => sl<ActivitiesBloc>()),
        BlocProvider(create: (context) => BNBCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Gestidogs',
        theme: theme(), 
      ),
    );
  }
}
