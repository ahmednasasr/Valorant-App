import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:routeexam/models/agents_model.dart';
import 'package:routeexam/models/maps_model.dart';
import 'package:routeexam/models/weapons_model.dart';

class ApiManger{

  static Future<AgentsModel> getagints()async{
    Uri url = Uri.parse("https://valorant-api.com/v1/agents");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);

    return AgentsModel.fromJson(json);
  }
static Future<MapsModel> getMaps()async{
    Uri url = Uri.parse("https://valorant-api.com/v1/maps");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);

    return MapsModel.fromJson(json);
  }
static Future<WeaponsModel> getWeapons()async{
    Uri url = Uri.parse("https://valorant-api.com/v1/weapons");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);

    return WeaponsModel.fromJson(json);
  }

}