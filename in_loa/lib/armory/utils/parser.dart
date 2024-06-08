import 'package:html/parser.dart' show parse;
import '../models/armory_data.dart';

class Parser {
  ArmoryData parseArmoryData(String responseBody) {
    final document = parse(responseBody);
    
    final nameElement = document.querySelector('.myinfo__character--button2');

    final nickName = nameElement?.text.trim() ?? 'Unknown';

    return ArmoryData(nickName: nickName);
  }
}