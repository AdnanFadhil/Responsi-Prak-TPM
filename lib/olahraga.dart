import 'base_network.dart';

class Olahraga {
  static Olahraga instance = Olahraga();
  Future<Map<String, dynamic>> loadOlahraga() {
    return BaseNetwork.get("olahraga");
  }
}
