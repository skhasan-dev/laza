import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart' show AppTextStyles, AppColors;
import 'package:laza/core/index.dart' show Failure;

class Toasts {
  static OverlayEntry? currEntry;

  static void _showToast(
    BuildContext context, {
    required String message,
    required Color backgroundClr,
    required Border border,
    required Widget icon,
    String? subtitle,
    Widget? trailing,
  }) {
    final overlay = Overlay.of(context); // just

    if (currEntry != null) return;

    // Animation controller
    AnimationController controller = AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(milliseconds: 300),
    );

    final overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: MediaQuery.of(context).padding.top + 10, // below status bar
          left: 20,
          right: 20,
          child: Material(
            color: Colors.transparent,
            child: SlideTransition(
              position: Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
                  .animate(
                    CurvedAnimation(parent: controller, curve: Curves.easeOut),
                  ),
              child: ColoredBox(
                color: AppColors.white,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                  decoration: BoxDecoration(
                    color: backgroundClr,
                    borderRadius: BorderRadius.circular(14),
                    border: border,
                  ),
                  child: Row(
                    children: [
                      icon,
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          spacing: 2,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message,
                              style: AppTextStyles.s15W400.copyWith(
                                color: AppColors.carbonBlack,
                              ),
                              maxLines: 2,
                            ),
                            if (subtitle != null)
                              Text(
                                subtitle,
                                style: AppTextStyles.s13W400.copyWith(
                                  color: AppColors.coolSteel,
                                ),
                                maxLines: 2,
                              ),
                          ],
                        ),
                      ),
                      if (trailing != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: trailing,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(overlayEntry);
    currEntry = overlayEntry;
    controller.forward();

    Future.delayed(Duration(seconds: 4), () {
      controller.reverse().then((_) {
        currEntry = null;
        overlayEntry.remove();
      });
    });
  }

  static void showInfoToast(
    BuildContext context, {
    required String message,
    String? subtitle,
    Widget? trailing,
  }) {
    _showToast(
      context,
      message: message,
      subtitle: subtitle,
      backgroundClr: AppColors.coralGlow.withValues(alpha: 0.1),
      border: Border.all(color: AppColors.coralGlow, width: 1.5),
      icon: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.coralGlow.withValues(alpha: 0.3),
        ),
        child: Icon(Icons.info_outline, size: 20, color: AppColors.coralGlow),
      ),
      trailing: trailing,
    );
  }

  // static void showLoginToast(BuildContext context) {
  //   showInfoToast(
  //     context,
  //     message: 'Please Login first',
  //     trailing: InkWell(
  //       splashFactory: NoSplash.splashFactory,
  //       onTap: () {
  //         ///
  //         context.pushNamed(RouteNames.loginRegister);
  //       },
  //       child: Container(
  //         padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
  //         decoration: BoxDecoration(
  //           color: Colors.orange.shade50,
  //           border: Border.all(color: Colors.orange),
  //           borderRadius: BorderRadius.circular(4),
  //         ),
  //         child: Text(
  //           'Login',
  //           style: AppTextStyles.s14W600.copyWith(color: Colors.black),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static void showErrorToast(
    BuildContext context, {
    required String? message,
    String? subtitle,
  }) {
    if (message == null) return;
    _showToast(
      context,
      message: message,
      subtitle: subtitle,
      backgroundClr: Color.fromRGBO(224, 120, 90, 0.1),
      border: Border.all(color: Color.fromRGBO(224, 120, 90, 0.35), width: 1),
      icon: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(224, 120, 90, 0.35),
        ),
        child: Icon(Icons.error, size: 20, color: AppColors.cinnabar),
      ),
    );
  }

  static void showSuccessToast(
    BuildContext context, {
    required String message,
    String? subtitle,
  }) {
    _showToast(
      context,
      message: message,
      subtitle: subtitle,
      backgroundClr: AppColors.wisteria.withValues(alpha: 0.2),
      border: Border.all(color: AppColors.wisteria, width: 1),
      icon: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.wisteria.withValues(alpha: 0.2),
        ),
        child: Icon(Icons.check, size: 20, color: AppColors.wisteria),
      ),
    );
  }

  static void showSuccessOrFailureToast(
    BuildContext context, {
    Failure? failure,
    String? failureMsg,
    VoidCallback? failureCallback,
    bool popOnFailure = false,
    bool hideFailure = false,
    bool popOnSuccess = false,
    bool hideSuccess = false,
    String? successMsg,
    String? successTitle,
    VoidCallback? successCallback,
  }) {
    if (failure == null) {
      if (!hideSuccess) {
        Toasts.showSuccessToast(
          context,
          message: successMsg ?? 'Api Hit Successfully',
        );
      }

      if (successCallback != null) {
        successCallback();
      }

      if (popOnSuccess) {
        context.pop(true);
      }
    } else {
      if (!hideFailure) {
        Toasts.showErrorToast(
          context,
          message: failureMsg ?? (failure.message ?? 'API hit Failed'),
        );
      }

      if (failureCallback != null) {
        failureCallback();
      }

      if (popOnFailure) {
        context.pop(true);
      }
    }
  }
}
