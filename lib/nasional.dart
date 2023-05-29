import 'base_network.dart';

class Nasional {
  static Nasional instance = Nasional();
  Future<Map<String, dynamic>> loadNasional() {
    return BaseNetwork.get("nasional");
  }
}
