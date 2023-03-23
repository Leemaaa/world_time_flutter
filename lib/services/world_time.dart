import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;

class WorldTime {
  String location; //location name for UI
  String? time; //time for UI
  String flag; //url to an asset flag icon
  String url;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  factory WorldTime.fromJson(json) {
    return WorldTime(
      location: json['location'],
      flag: json['flag'],
      url: json['url'],
    );
  }

  Future<void> getTime() async {
    final response = await http.get(Uri.parse(
        'https://www.timeapi.io/api/Time/current/zone?timeZone=$url'));

    Map data = Map.castFrom(jsonDecode(response.body));

    if (response.statusCode == 200) {
      data = Map.castFrom(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }

    String? datetime = data['date'];
    datetime = datetime?.replaceAll('/', '-');
    String? time = data['time'];

    DateTime now = DateTime.parse(datetime!);
    now = now.add(Duration(hours: int.parse(time!)));
  }
}
