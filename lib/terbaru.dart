import 'base_network.dart';

class Terbaru {
  static Terbaru instance = Terbaru();
  Future<Map<String, dynamic>> loadTerbaru() {
    return BaseNetwork.get("terbaru");
  }
}
