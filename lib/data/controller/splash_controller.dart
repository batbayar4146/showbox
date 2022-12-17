import 'package:get/get.dart';
import 'package:showbox/core/helper/shared_pref_helper.dart';
import 'package:showbox/data/model/global/response_model/response_model.dart';
//import 'package:showbox/data/repo/auth/general_setting_repo.dart';
import 'package:showbox/view/components/show_custom_snackbar.dart';

import '../../core/route/route.dart';
import '../model/general_setting/GeneralSettingsResponseModel.dart';
import '../repo/splash/splash_repo.dart';

class SplashController extends GetxController implements GetxService {
  SplashRepo splashRepo;

  bool isLoading = true;
  String imageUrl = '';

  SplashController({required this.splashRepo});

  gotoNextPage() async {
    // GeneralSettingsResponseModel model = await repo.getGeneralSetting();
    // if (model.data == null) {
    //   return;
    // }
    isLoading = false;
    update();
    bool isRemember = splashRepo.apiClient.sharedPreferences.getBool(SharedPreferenceHelper.rememberMeKey) ?? false;
    if (isRemember) {
      Future.delayed(const Duration(seconds: 5), () {
        Get.offAndToNamed(RouteHelper.homeScreen);
      });
    } else {
      ResponseModel responseModel = await splashRepo.getOnboardingData();
      if (responseModel.statusCode == 200) {
        Future.delayed(const Duration(seconds: 5), () {
          Get.offAndToNamed(RouteHelper.onboardScreen, arguments: responseModel);
        });
      } else {
        CustomSnackbar.showCustomSnackbar(errorList: [responseModel.message], msg: [], isError: true);
      }
    }
  }
}
