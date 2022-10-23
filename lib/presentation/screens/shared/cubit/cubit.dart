import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/constants/assets_manager.dart';
import 'package:magdsoft/constants/end_points.dart';
import 'package:magdsoft/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft/data/models/help_model.dart';
import 'package:magdsoft/data/models/products_model.dart';
import 'package:magdsoft/presentation/screens/shared/cubit/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(MainInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int index = 0;
  updateScreen(value) {
    index = value;
    emit(MainUpdateBottomNavigationBarState());
  }

  List companies = [
    ['All', ImageAssets.cup],
    ['Acer', ImageAssets.acerLogo],
    ['Apple', ImageAssets.iosLogo],
    ['Razer', ImageAssets.razerLogo],
  ];
  List<IconData> bIcons = const [
    Icons.home_outlined,
    Icons.favorite,
    Icons.notifications_rounded,
    Icons.settings,
  ];

  List<Widget> tabTitles = [
    Tab(
      text: 'Overview',
    ),
    Tab(
      text: 'Spesification',
    ),
    Tab(
      text: 'Review',
    ),
  ];

  late ProductsModel productsModel;
  List<Products> products = [];
  void getProducts() {
    emit(MainGetProductsLoadingState());
    DioHelper.getData(
      url: ApiConstants.getProducts,
      query: {},
    ).then((value) {
      productsModel = ProductsModel.fromJson(value.data);
      productsModel.products!.forEach(((element) => products.add(element)));
      emit(MainGetProductsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(MainGetProductsErrorState(message: error.toString()));
    });
  }

  late HelpModel helpModel;
  List<Help> help = [];
  void getHelp() {
    emit(MainGetHelpLoadingState());
    DioHelper.getData(
      url: ApiConstants.getHelp,
      query: {},
    ).then((value) {
      helpModel = HelpModel.fromJson(value.data);
      helpModel.help!.forEach(((element) => help.add(element)));
      emit(MainGetHelpSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(MainGetHelpErrorState(message: error.toString()));
    });
  }
}
