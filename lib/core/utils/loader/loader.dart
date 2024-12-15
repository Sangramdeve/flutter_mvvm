import 'package:loader_overlay/loader_overlay.dart';
import 'package:mvvm/main.dart';

showLoader({required String progress}) {
  navigatorKey.currentState!.context.loaderOverlay.show(
    progress: progress,
  );
}
