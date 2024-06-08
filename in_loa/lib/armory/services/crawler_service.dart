import 'package:http/http.dart' as http;

import '../models/armory_data.dart';
import '../utils/parser.dart';

class CrawlerService {
  final String baseUrl = 'https://m-lostark.game.onstove.com/Profile/Character/';
  final Parser parser = Parser();

  Future<ArmoryData> fetchArmoryData(String characterName) async {
    final url = Uri.parse(baseUrl + Uri.encodeComponent(characterName));
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return parser.parseArmoryData(response.body);
    } else {
      throw Exception('Failed to load character profile');
    }
  }
}