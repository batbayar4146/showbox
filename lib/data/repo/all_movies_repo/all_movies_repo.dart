import 'package:showbox/constants/method.dart';
import 'package:showbox/core/utils/url_container.dart';
import 'package:showbox/data/services/api_service.dart';

class AllMoviesRepo {
  ApiClient apiClient;

  AllMoviesRepo({required this.apiClient});

  Future<dynamic> getMovie(int page) async {
    String url = '${UrlContainer.baseUrl}api/movies?page=$page';
    final response = await apiClient.request(url, Method.getMethod, null);
    return response;
  }
}
