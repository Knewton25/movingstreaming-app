import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:play_lab/core/utils/my_color.dart';
import 'package:play_lab/core/utils/util.dart';

class CustomLoader extends StatelessWidget {
  final bool isFullScreen;
  final bool isPagination;
  final double strokeWidth;
  final Color loaderColor;

  const CustomLoader({
    super.key,
    this.isFullScreen = false,
    this.isPagination = false,
    this.strokeWidth = 1,
    this.loaderColor = MyColor.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return isFullScreen
        ? SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: SpinKitThreeBounce(
              color: loaderColor,
              size: 20.0,
            )),
          )
        : isPagination
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircularProgressIndicator(
                    color: loaderColor,
                  ),
                ),
              )
            : Center(
                child: SpinKitThreeBounce(
                  color: loaderColor,
                  size: 20.0,
                ),
              );
  }
}

class LoadingIndicator extends StatelessWidget {
  final double strokeWidth;
  const LoadingIndicator({super.key, this.strokeWidth = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(shape: BoxShape.circle, color: MyColor.colorWhite, boxShadow: MyUtil.getShadow()),
      child: const CircularProgressIndicator(
        color: MyColor.primaryColor,
        strokeWidth: 3,
      ),
    );
  }
}
