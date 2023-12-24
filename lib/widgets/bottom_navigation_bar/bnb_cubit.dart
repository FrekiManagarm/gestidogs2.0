import 'package:flutter_bloc/flutter_bloc.dart';

class BNBCubit extends Cubit<int> {
  BNBCubit() : super(0);

  void setIndex(int index) {
    emit(index);
  }
}
