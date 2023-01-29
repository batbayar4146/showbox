import 'package:showbox/constants/method.dart';
import 'package:showbox/core/utils/url_container.dart';
import 'package:showbox/data/services/api_service.dart';

class HomeRepo {
  ApiClient apiClient;
  HomeRepo({required this.apiClient});

  Future<dynamic> getSlider() async {
    String url = '${UrlContainer.baseUrl1}${UrlContainer.movieSliderEndPoint}';
    final response = await apiClient.request(url, Method.getMethod, null);
    return response;
  }

  Future<dynamic> getLiveTv() async {
    String url = '${UrlContainer.baseUrl1}${UrlContainer.liveTelevisionEndPoint}';
    final response = await apiClient.request(url, Method.getMethod, null);
    return response;
  }

  Future<dynamic> getFeaturedMovie() async {
    String url = '${UrlContainer.baseUrl1}${UrlContainer.featuredMovieEndPoint}';
    final response = await apiClient.request(url, Method.getMethod, null);
    return response;
  }

  Future<dynamic> getRecentMovie() async {
    String url = '${UrlContainer.baseUrl1}${UrlContainer.recentMovieEndPoint}';
    final response = await apiClient.request(url, Method.getMethod, null);
    return response;
  }

  Future<dynamic> getLatestSeries() async {
    String url = '${UrlContainer.baseUrl1}${UrlContainer.latestSeriesEndPoint}';
    final response = await apiClient.request(url, Method.getMethod, null);
    return response;
  }

  Future<dynamic> getSingleBannerImage() async {
    String url = '${UrlContainer.baseUrl1}${UrlContainer.singleBannerEndPoint}';
    final response = await apiClient.request(url, Method.getMethod, null);

    return response;
  }

  Future<dynamic> getTrailerMovie() async {
    String url = '${UrlContainer.baseUrl1}${UrlContainer.trailerMovieEndPoint}';
    final response = await apiClient.request(url, Method.getMethod, null);
    return response;
  }

  Future<dynamic> getFreeZoneMovie(int page) async {
    String url = '${UrlContainer.baseUrl1}${UrlContainer.freeZoneEndPoint}?page=${page.toString()}';
    final response = await apiClient.request(url, Method.getMethod, null);
    return response;
  }

  Future<dynamic> policePages() async {}
}
