import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:showbox/core/utils/my_color.dart';
import 'package:showbox/core/utils/dimensions.dart';
import 'package:showbox/core/utils/styles.dart';
import 'package:showbox/data/controller/privacy/privacy_controller.dart';
import 'package:showbox/data/repo/privacy_repo/privacy_repo.dart';
import 'package:showbox/data/services/api_service.dart';
import 'package:showbox/view/screens/about/widget/privacy_shimmer/privacy_shimmer_widget.dart';
import 'package:showbox/view/components/app_bar/custom_appbar.dart';
import 'package:showbox/view/components/buttons/category_button.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(PrivacyRepo(apiClient: Get.find()));
    Get.put(PrivacyController(repo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<PrivacyController>().loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrivacyController>(
        builder: (controller) => Scaffold(
              backgroundColor: MyColor.secondaryColor2,
              appBar: const CustomAppBar(title: ''),
              body: controller.isLoading
                  ? const PrivacyPolicyShimmer()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 50,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    controller.list.length,
                                    (index) => Row(
                                      children: [
                                        CategoryButton(
                                            color: controller.selectedIndex == index
                                                ? MyColor.primaryColor
                                                : MyColor.bodyTextColor,
                                            horizontalPadding: 8,
                                            verticalPadding: 8,
                                            textSize: Dimensions.fontDefault,
                                            text: controller.list[index].dataValues?.title ?? '',
                                            press: () {
                                              controller.changeIndex(index);
                                            }),
                                        const SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          _headerWidget(context, controller.selectedHtml),
                        ],
                      ),
                    ),
            ));
  }

  _headerWidget(BuildContext context, var html) => Container(
        decoration: const BoxDecoration(
          color: MyColor.secondaryColor2,
        ),
        child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: HtmlWidget(
              html,
              textStyle: mulishSemiBold.copyWith(color: MyColor.colorWhite),
            )),
      );
}
