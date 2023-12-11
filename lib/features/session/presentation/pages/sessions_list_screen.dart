import 'package:clean_architecture_project/features/session/presentation/bloc/session_bloc.dart';
import 'package:clean_architecture_project/features/session/presentation/bloc/session_event.dart';
import 'package:clean_architecture_project/features/session/presentation/bloc/session_state.dart';
import 'package:clean_architecture_project/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionsListScreen extends StatefulWidget {
  const SessionsListScreen({super.key});

  @override
  State<SessionsListScreen> createState() => _SessionsListScreenState();
}

class _SessionsListScreenState extends State<SessionsListScreen> {
  late SessionsBloc sessionsBloc;

  @override
  void initState() {
    super.initState();
    sessionsBloc = sl<SessionsBloc>()..add(const GetSessionsEvent());
  }

  @override
  void dispose() {
    super.dispose();
    sessionsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SessionsBloc, SessionsState>(
          bloc: sl<SessionsBloc>(),
          builder: (context, state) {
            if (state is SessionsLoading) {
              return const CircularProgressIndicator();
            }
            if (state is SessionsLoaded) {
              return ListView.builder(
                itemCount: state.sessions!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.sessions![index].educator!.firstname ?? "Aucun nom"),
                  );
                },
              );
            }
            if (state is SessionsError) {
              return Center(
                child: Text(state.error!.message!),
              );
            }
            return const CircularProgressIndicator.adaptive();
          },
        ),
      ),
    );
  }
}
