import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlashim/screens/home_state.dart';

class CountCubit extends Cubit<CountState> {
  CountCubit() : super(CountInitial());

  List sonlar = [];
  Color color = Colors.white;
  List Takrorlashga = [];
  int a = 0;
  List<Color> colores = [
    Colors.pink,
    Colors.pink,
    Colors.pink,
    Colors.pink,
    Colors.pink,
    Colors.pink,
  ];
  void toldir() {
    sonlar.clear();
    for (var i = 0; i < 6; i++) {
      sonlar.add(Random().nextInt(100));
      Takrorlashga = sonlar..sort();
      emit(ChangeCount());
    }
  }

  void rang() async {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      color = Colors.transparent;
      emit(ChangeCount());
    });
  }

  void tekshir(int son) {
    if (sonlar[son] == Takrorlashga[a]) {
      a += 1;
      colores[son] = Colors.green;
      if (a == 6) {
        emit(ChangeError());
      } else {
        emit(ChangeCount());
      }
   
    } else {
      a += 1;
      colores[son] = Colors.black;
      if (a == 6) {
        emit(ChangeError());
      }else{
        emit(ChangeCount());
      }
    
    }
  }
}
