import 'package:get/get.dart';

class HomeController extends GetxController {
  var _count = 0.obs;
  var _timeInText = 'teste'.obs;
  Worker intervalInstance;

  int get count => _count.value;
  set count(int newValue) => _count.value = newValue;
  String get timeInText => _timeInText.value;

  @override
  void onInit() {
    intervalInstance = interval(_count, (_) {
      print(_count.value);
      _count++;
      printDuration();
    });
    print(intervalInstance);
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    intervalInstance.dispose();
  }

  void printDuration() {
    final duration = Duration(seconds: _count.value);
    String twoDigits(int n) => n >= 10 ? "$n" : "0$n";
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    _timeInText.value =
        "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void resetCounter() {
    intervalInstance();
    print(intervalInstance);
  }
}
