import 'dart:convert';

import 'package:get/get.dart';
import 'package:showbox/core/route/route.dart';
import 'package:showbox/core/utils/url_container.dart';
import 'package:showbox/data/model/watch_history/WatchHistoryResponseModel.dart';
import 'package:showbox/data/repo/mywatch_repo/my_watch_history_repo.dart';

import '../../model/global/response_model/response_model.dart';

class MyWatchHistoryController extends GetxController implements GetxService {
  MyWatchHistoryRepo repo;
  MyWatchHistoryController({required this.repo});

  String? nextPageUrl;
  bool isLoading = true;
  List<Data> movieList = [];
  int categoryId = -1;
  String portraitImagePath = 'assets/images/item/portrait/';

  int page = 0;

  String getImagePath(int index) {
    String path = '';
    if (movieList[index].item != null) {
      path = '${UrlContainer.baseUrl}$portraitImagePath${movieList[index].item?.image!.portrait}';
    } else {
      path = '${UrlContainer.baseUrl}$portraitImagePath${movieList[index].episode?.image}';
    }

    return path;
  }

  void fetchInitialList() async {
    updateStatus(true);
    page = 1; //page+1;
    ResponseModel model = await repo.getWatchHistory(page);

    if (model.statusCode == 200) {
      WatchHistoryResponseModel responseModel = WatchHistoryResponseModel.fromJson(jsonDecode(model.responseJson));
      List<Data>? tempHistoryList = responseModel.data?.histories?.data;
      nextPageUrl = responseModel.data?.histories?.nextPageUrl;
      //portraitImagePath=responseModel.data?.histories?.path??'';
      if (tempHistoryList != null && !(tempHistoryList == [])) {
        //first time we need to clear previous data. but in other condition we can't clear bcz we store paginated data
        if (page == 1) {
          movieList.clear();
        }
        movieList.addAll(tempHistoryList);
        //portraitImagePath=searchResponse.data.items.path.
      }

      updateStatus(false);
    } else {
      updateStatus(false);
    }
  }

  void fetchNewList() async {
    page = page + 1; //page+1;
    ResponseModel model = await repo.getWatchHistory(page);

    if (model.statusCode == 200) {
      WatchHistoryResponseModel responseModel = WatchHistoryResponseModel.fromJson(jsonDecode(model.responseJson));
      List<Data>? tempHistoryList = responseModel.data?.histories?.data;
      nextPageUrl = responseModel.data?.histories?.nextPageUrl;

      if (tempHistoryList != null && !(tempHistoryList == [])) {
        movieList.addAll(tempHistoryList);
      }

      update();
    }
  }

  updateStatus(bool status) {
    isLoading = status;
    update();
  }

  bool hasNext() {
    return nextPageUrl != null ? true : false;
  }

  void clearAllData() {
    page = 0;
    isLoading = true;
    nextPageUrl = null;
    movieList.clear();
  }

  void gotoDetailsPage(int index) {
    int itemId = int.tryParse(movieList[index].itemId ?? '0') ?? 0;
    int episodeId = int.tryParse(movieList[index].episodeId ?? '-1') ?? -1;
    Get.toNamed(RouteHelper.movieDetailsScreen, arguments: [itemId, episodeId]);
  }
}
