import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthomescreen/cubit/states.dart';

class SmartUiCubit extends Cubit<SmartUiStates> {
  SmartUiCubit() : super(SmartUiInitialState());
  static SmartUiCubit get(context) => BlocProvider.of(context);
  List mySmartDevice = [
    ["Smart Light", "images/light-bulb.png", false],
    ["Smart AC", "images/air-conditioner.png", false],
    ["Smart TV", "images/smart-tv.png", false],
    ["Smart Fan", "images/fan.png", false]
  ];
  void changeButtonm(int i) {
    mySmartDevice[i][2] = !mySmartDevice[i][2];
    emit(SmartUiChangeState());
  }
}
