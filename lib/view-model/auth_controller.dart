import 'package:get/get.dart';
import 'package:mvvm/core/api/api_services.dart';
import 'package:mvvm/core/constants/api_urls.dart';
import 'package:mvvm/core/api/api_state.dart';

class AuthController extends GetxController {
  // Observables for state
  final isLoading = false.obs;
  final authResponse = Rx<ApiState?>(null);
  final errorMessage = ''.obs;

  final ApiServices apiServices = ApiServices();

  Future<void> signUpWithCred({required Map<String, dynamic> data}) async {
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

  // Login Method
  Future<void> loginWithCred({required Map<String, dynamic> data}) async {
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
