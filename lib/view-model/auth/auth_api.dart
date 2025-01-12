import 'package:get/get.dart';

import '../../core/api/api_services.dart';
import '../../core/api/api_state.dart';
import '../../core/constants/api_urls.dart';

mixin AuthApi on GetxController {
  final ApiServices apiServices = ApiServices();

  Future<void> signUpWithCred({required Map<String, dynamic> data}) async {
    final isLoading = false.obs;
    final authResponse = Rx<ApiState?>(null);
    final errorMessage = ''.obs;

    isLoading(true);
    try {
      final response = await apiServices.postRequest(ApiUrls.signUp, data);
      authResponse.value = response;
      if (response.status == Status.COMPLETED) {
        print("Response Data: ${response.data}");
      } else {
        errorMessage.value = response.message ?? "Unknown error";
        print("Error: ${response.message}");
      }
    } catch (e) {
      errorMessage.value = "Unexpected error: $e";
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> loginWithCred({required Map<String, dynamic> data}) async {
    final isLoading = false.obs;
    final authResponse = Rx<ApiState?>(null);
    final errorMessage = ''.obs;

    isLoading(true);  // Set loading state to true
    try {
      final response = await apiServices.postRequest(ApiUrls.login, data);
      authResponse.value = response;

      if (response.status == Status.COMPLETED) {
        print("Response Data: ${response.data}");
      } else {
        errorMessage.value = response.message ?? "Unknown error";
        print("Error: ${response.message}");
      }
    } catch (e) {
      errorMessage.value = "Unexpected error: $e";
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }

}