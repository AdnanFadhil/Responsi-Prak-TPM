import 'base_network.dart';

class Teknologi {
  static Teknologi instance = Teknologi();
  Future<Map<String, dynamic>> loadTeknologi() {
    return BaseNetwork.get("teknologi");
  }
}
