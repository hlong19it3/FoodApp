import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../core/constants/breakpoints.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_values.dart';
import '../../../../core/widgets/appname.widget.dart';
import '../../../../core/widgets/dot_for_listview.widget.dart';
import '../../../../core/widgets/spacer.dart';
import '../controllers/onboaring.controller.dart';

class OnBoaringView extends GetView<OnBoaringController> {
  const OnBoaringView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<OnBoaringController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VSpacer(30 + AppValues.statusBarHeight),
            const AppName(),
            const VSpacer(10),
            Expanded(
              child: Stack(
                children: [
                  _buildBody(context),
                  _builDotsView(),
                ],
              ),
            ),
            _buildBottomButton()
          ],
        ),
      ),
    );
  }

  Widget _builDotsView() {
    return Positioned(
      top: 100,
      right: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          controller.onBoarings.length,
          (index) => DotForListView(
            currentPage: controller.currentPage.value,
            index: index,
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      onPageChanged: (value) => controller.currentPage.value = value,
      scrollDirection: Axis.vertical,
      pageSnapping: true,
      itemCount: controller.onBoarings.length,
      controller: controller.pageController,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              _buildImage(index),
              const VSpacer(40),
              _buildTitle(index: index, context: context),
              const VSpacer(10),
              _buildDescription(index: index, context: context),
              const Spacer(
                flex: 3,
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildDescription(
      {required BuildContext context, required int index}) {
    return AnimatedOpacity(
      opacity: controller.currentPage.value == index ? 1 : 0,
      duration: const Duration(milliseconds: 1300),
      child: Align(
        alignment: Breakpoints(context: Get.context).isMobile
            ? Alignment.bottomLeft
            : Alignment.bottomCenter,
        child: Text(
          controller.onBoarings[index].description.tr,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle({required BuildContext context, required int index}) {
    return AnimatedOpacity(
      opacity: controller.currentPage.value == index ? 1 : 0,
      duration: const Duration(milliseconds: 900),
      child: Center(
        child: Align(
          alignment: Breakpoints(context: context).isMobile
              ? Alignment.bottomLeft
              : Alignment.bottomCenter,
          child: Text(
            controller.onBoarings[index].title.tr,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(int index) {
    return AnimatedOpacity(
      opacity: controller.currentPage.value == index ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      child: SvgPicture.asset(
        controller.onBoarings[index].svgPath,
        height: 200,
      ),
    );
  }

  Widget _buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: Breakpoints(context: Get.context).isMobile
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.end,
        children: [
          Visibility(
            visible: !controller.isFirstPage,
            child: IconButton(
              onPressed: () => controller.onPreviousPage(),
              icon: SvgPicture.asset(
                Assets.icons.chevronsLeft,
                color: AppColors.iconColor,
              ),
            ),
          ),
          Breakpoints(context: Get.context).isMobile
              ? const HSpacer(0)
              : const HSpacer(24),
          IconButton(
            onPressed: () => controller.onNextPage(),
            icon: SvgPicture.asset(
              Assets.icons.chevronsRight,
              color: AppColors.iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
