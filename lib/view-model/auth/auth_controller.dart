import 'package:get/get.dart';
import 'package:mvvm/view-model/auth/auth_api.dart';

import '../../core/api/api_state.dart';
import 'auth_validation.dart';

class AuthController extends GetxController with AuthApi,AuthValidation{
  final isLoading = false.obs;
  final authResponse = Rx<ApiState?>(null);
  final errorMessage = ''.obs;
}