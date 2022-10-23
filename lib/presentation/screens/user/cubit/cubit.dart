import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/constants/end_points.dart';
import 'package:magdsoft/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft/data/models/account_model.dart';
import 'package:magdsoft/data/network/requests/login_request.dart';
import 'package:magdsoft/data/network/responses/login_response.dart';
import 'package:magdsoft/presentation/screens/user/cubit/states.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates> {
  AuthenticationCubit() : super(AuthenticationInitialState());

  static AuthenticationCubit get(context) => BlocProvider.of(context);
  LoginRequest? loginModel;




  late LoginResponse loginResponse;

  ///Create Account fun by name and phone number
  void createAccount({
    required String name,
    required String phone,
  }) {
    emit(AuthenticationCreateAccountLoadingState());

    DioHelper.postData(url: ApiConstants.verifyPhone, body: {
      'name': name,
      'phone': phone,
    }, query: {}).then((value) {
      loginResponse = LoginResponse.fromJson(value.data);
      emit(AuthenticationCreateAccountSuccessState(
          loginResponse: loginResponse));
    }).catchError((error) {
      print(error.toString());
      emit(AuthenticationCreateAccountErrorState(error.toString()));
    });
  }

  late AccountModel accountModel;

  ///Verify your Phone fun by OTP
  late Account userData;
  void verifyPhone({
    required String code,
    required String phone,
  }) {
    emit(AuthenticationVerifyPhoneLoadingState());

    DioHelper.postData(url: ApiConstants.otp, body: {
      'code': code,
      'phone': phone,
    }, query: {}).then((value) {
      accountModel = AccountModel.fromJson(value.data);
      userData = accountModel.account!;
      print('///////${userData.name}');

      emit(AuthenticationVerifyPhoneSuccessState(account: userData));

    }).catchError((error) {
      print(error.toString());
      emit(AuthenticationVerifyPhoneErrorState(error.toString()));
    });
  }
}
