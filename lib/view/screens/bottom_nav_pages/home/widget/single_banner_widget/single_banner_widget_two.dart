import 'package:play_lab/core/route/route.dart';
import 'package:play_lab/data/controller/home/home_controller.dart';
import 'package:play_lab/view/components/dialog/login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/utils/url_container.dart';
import '../../../../../components/dialog/subscribe_now_dialog.dart';
import '../custom_network_image/custom_network_image.dart';

class SecondSingleBannerWidget extends StatefulWidget {
  const SecondSingleBannerWidget({super.key});

  @override
  State<SecondSingleBannerWidget> createState() => _SecondSingleBannerWidgetState();
}

class _SecondSingleBannerWidgetState extends State<SecondSingleBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => controller.singleBannerImageLoading || controller.singleBannerList.isEmpty || controller.singleBannerList.length < 2
            ? const SizedBox.shrink()
            : GestureDetector(
                onTap: () {
                  bool isFree = controller.singleBannerList[1].version == '0' ? true : false;
                  bool isPaidUser = controller.homeRepo.apiClient.isPaidUser();
                  if (controller.isGuest() && isFree == false) {
                    showLoginDialog(context);
                  } else if (!isPaidUser && isFree == false) {
                    showSubscribeDialog(context);
                  } else {
                    Get.toNamed(RouteHelper.movieDetailsScreen, arguments: [controller.singleBannerList[1].id, -1]);
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.black, Colors.black]),
                  ),
                  child: CustomNetworkImage(
                    boxFit: BoxFit.cover,
                    imageUrl: '${UrlContainer.baseUrl}${controller.singleBannerImagePath}${controller.singleBannerList[1].image?.landscape}',
                  ),
                ),
              ));
  }
}
