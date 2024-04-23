import 'package:clean_architecture_project/core/managers/storage_manager.dart';
import 'package:clean_architecture_project/features/session/presentation/bloc/session_bloc.dart';
import 'package:clean_architecture_project/features/session/presentation/bloc/session_event.dart';
import 'package:clean_architecture_project/features/session/presentation/bloc/session_state.dart';
import 'package:clean_architecture_project/injection_container.dart';
import 'package:clean_architecture_project/widgets/bottom_navigation_bar/bnb_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodaySessionsList extends StatefulWidget {
  const TodaySessionsList({super.key});

  @override
  State<TodaySessionsList> createState() => _TodaySessionsListState();
}

class _TodaySessionsListState extends State<TodaySessionsList> {
  late SessionsBloc sessionsBloc;

  @override
  void initState() {
    super.initState();
    sessionsBloc = sl<SessionsBloc>()..add(GetDailySessionsEvent(
      date: DateTime.now().toString(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final indexStateNotifier = context.watch<BNBCubit>();
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 4,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Sessions du jour",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              InkWell(
                onTap: () {
                  indexStateNotifier.setIndex(1);
                },
                child: Text(
                  "Voir plus",
                  style: TextStyle(
                    color: Colors.blue.shade400,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          BlocBuilder<SessionsBloc, SessionsState>(
            bloc: sessionsBloc,
            builder: (context, state) {
              if (state is SessionsLoaded) {
                return ListView.builder(
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.sessions!.length,
                  itemBuilder: (context, index) {
                    return Container();
                  },
                );
              } else if (state is SessionsLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is SessionsError) {
                return Center(
                  child: Text(
                    state.error.toString(),
                    style: TextStyle(
                      color: Colors.red.shade500,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    "Pas de sessions pour aujourd'hui",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
