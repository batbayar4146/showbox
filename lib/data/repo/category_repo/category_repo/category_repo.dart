import 'package:showbox/constants/method.dart';
import 'package:showbox/core/utils/url_container.dart';
import 'package:showbox/data/services/api_service.dart';

class CategoryRepo {
  ApiClient apiClient;
  CategoryRepo({required this.apiClient});

  Future<dynamic> getCategory(int page) async {
    String url = '${UrlContainer.baseUrl}${UrlContainer.categoryEndPoint}?page=$page';
    final response = await apiClient.request(url, Method.getMethod, null);
    return response;
  }
}
