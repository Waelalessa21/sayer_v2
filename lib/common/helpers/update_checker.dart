import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/widgets/custom_shape/confirmation_contanier.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:restart_app/restart_app.dart';
import 'package:sayer_app/main.dart';

class UpdateChecker {
  Future<void> checkForUpdate(BuildContext context) async {
    if (!isFirebaseInitialized) {
      debugPrint('⚠️ Firebase not initialized, skipping update check');
      return;
    }

    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;

      final doc = await FirebaseFirestore.instance
          .collection('app_config')
          .doc('version')
          .get();
      final latestVersion = doc.data()?['latest_version'];

      if (latestVersion != null && latestVersion != currentVersion) {
        final shouldUpdate = await showDialog<bool>(
          context: context,
          barrierDismissible: true,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(20.w),
            child: ConfirmationContainer(
              title: "حدث التطبيق",
              subtitle:
                  "لأن تجربتك تهمنا، سوينا لك بعض التحديثات والتحسينات. حدّث التطبيق واستمتع بتجربة أفضل!",
              onCancel: () => Navigator.of(context).pop(false),
              onConfirm: () => Navigator.of(context).pop(true),
              cancelButtonText: "خلها بعدين",
              confirmButtonText: "تحديث",
            ),
          ),
        );

        if (shouldUpdate == true) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(20.w),
              child: ConfirmationContainer(
                title: "تم التحديث 🎉",
                subtitle:
                    "سيتم الآن إعادة تشغيل التطبيق لتطبيق التحديث الجديد.",
                canCancel: false,
                onConfirm: () {
                  Navigator.of(context).pop();
                  Restart.restartApp();
                },
                confirmButtonText: "إعادة تشغيل التطبيق",
              ),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('خطأ أثناء التحقق من التحديث: $e');
    }
  }
}
