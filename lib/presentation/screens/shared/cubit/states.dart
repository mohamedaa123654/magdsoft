import 'package:magdsoft/data/models/account_model.dart';
import 'package:magdsoft/data/network/responses/login_response.dart';

abstract class HomeStates {}

class MainInitialState extends HomeStates {}

class MainGetHelpLoadingState extends HomeStates {}

class MainGetHelpSuccessState extends HomeStates {}

class MainGetHelpErrorState extends HomeStates {
  String message;
  MainGetHelpErrorState({required this.message});
}

class MainGetProductsLoadingState extends HomeStates {}

class MainGetProductsSuccessState extends HomeStates {}

class MainGetProductsErrorState extends HomeStates {
  String message;
  MainGetProductsErrorState({required this.message});
}

class MainUpdateBottomNavigationBarState extends HomeStates {}

class MainChangeTabBarState extends HomeStates {}
