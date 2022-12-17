import 'package:showbox/constants/method.dart';
import 'package:showbox/core/utils/url_container.dart';
import 'package:showbox/data/model/global/response_model/response_model.dart';
import 'package:showbox/data/services/api_service.dart';

class OnboardingRepo {
  ApiClient apiClient;

  OnboardingRepo({required this.apiClient});

  Future<dynamic> getOnboardingData() async {
    ResponseModel model =
        await apiClient.request('${UrlContainer.baseUrl}${UrlContainer.onboardingEndPoint}', Method.getMethod, null);
    return model;
  }
}
