import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:house_jet_properties/constants/request_const.dart';
import 'package:house_jet_properties/ui/widgets/no_internet_dialog.dart';
import 'package:house_jet_properties/utils/shared_pref.dart';

class MyConnectivity {
  MyConnectivity._();

  static final _instance = MyConnectivity._();

  static MyConnectivity get instance => _instance;
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();

  Stream get myStream => _controller.stream;

  void initialise() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkStatus(result);
    _connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {

    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});


  }

  void disposeStream() => _controller.close();
}

listenConnection() {
  return hasInternet.addListener(() {
    if (preferences.getBool(SharedPreference.IS_LOGGED_IN) ?? false) {
      if (hasInternet.value) {
        Get.back();
        print("hasInternet true");
      } else {
        print("hasInternet false");
        showNoInternetDialog();
      }
    }
  });
}