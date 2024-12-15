import 'package:mvvm/core/api/api_state.dart';
import 'package:mvvm/core/api/api_services.dart';

class Test {
  final ApiServices apiServices = ApiServices();
  
  Future<void> getData() async {
    // Trigger the API request and wait for the response
    ApiState response = await apiServices.getRequest('https://reqres.in/api/users?delay=3');

    switch (response.status) {
      case Status.LOADING:
        print("Loading: ${response.status}");
        break;
      case Status.COMPLETED:
        print("Data received: ${response.data}");
        break;
      case Status.ERROR:
        print("Error: ${response.message}");
        break;

    }
  }
}
