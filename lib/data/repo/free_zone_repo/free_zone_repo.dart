import 'package:showbox/constants/method.dart';
import 'package:showbox/core/utils/url_container.dart';
import 'package:showbox/data/services/api_service.dart';

class FreeZoneRepo {
  ApiClient apiClient;

  FreeZoneRepo({required this.apiClient});

  Future<dynamic> getFreeZoneMovie(int page) async {
    String url = '${UrlContainer.baseUrl}${UrlContainer.freeZoneEndPoint}?page=${page.toString()}';
    final response = await apiClient.request(url, Method.getMethod, null);
    return response;
  }
}
