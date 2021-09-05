import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {

  final Connectivity connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return Future.value(connectivityResult != ConnectivityResult.none);
  }
}