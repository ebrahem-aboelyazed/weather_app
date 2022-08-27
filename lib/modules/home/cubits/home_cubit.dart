import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  final PageController pageController = PageController();

  void changePage(int index) {
    pageController.jumpToPage(index);
    emit(index);
  }
}
