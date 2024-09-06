class MapsModel {
  MapsModel({
      this.status, 
      this.data,});

  MapsModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(MapsData.fromJson(v));
      });
    }
  }
  num? status;
  List<MapsData>? data;


}

class MapsData {
  MapsData({
      this.uuid, 
      this.displayName, 
      this.narrativeDescription, 
      this.tacticalDescription, 
      this.coordinates, 
      this.displayIcon, 
      this.listViewIcon, 
      this.listViewIconTall, 
      this.splash, 
      this.stylizedBackgroundImage, 
      this.premierBackgroundImage, 
      this.assetPath, 
      this.mapUrl, 
      this.xMultiplier, 
      this.yMultiplier, 
      this.xScalarToAdd, 
      this.yScalarToAdd, 
      this.callouts,});

  MapsData.fromJson(dynamic json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    narrativeDescription = json['narrativeDescription'];
    tacticalDescription = json['tacticalDescription'];
    coordinates = json['coordinates'];
    displayIcon = json['displayIcon'];
    listViewIcon = json['listViewIcon'];
    listViewIconTall = json['listViewIconTall'];
    splash = json['splash'];
    stylizedBackgroundImage = json['stylizedBackgroundImage'];
    premierBackgroundImage = json['premierBackgroundImage'];
    assetPath = json['assetPath'];
    mapUrl = json['mapUrl'];
    xMultiplier = json['xMultiplier'];
    yMultiplier = json['yMultiplier'];
    xScalarToAdd = json['xScalarToAdd'];
    yScalarToAdd = json['yScalarToAdd'];
    if (json['callouts'] != null) {
      callouts = [];
      json['callouts'].forEach((v) {
        callouts?.add(Callouts.fromJson(v));
      });
    }
  }
  String? uuid;
  String? displayName;
  dynamic narrativeDescription;
  String? tacticalDescription;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? listViewIconTall;
  String? splash;
  String? stylizedBackgroundImage;
  String? premierBackgroundImage;
  String? assetPath;
  String? mapUrl;
  num? xMultiplier;
  num? yMultiplier;
  num? xScalarToAdd;
  num? yScalarToAdd;
  List<Callouts>? callouts;


}

class Callouts {
  Callouts({
      this.regionName, 
      this.superRegionName, 
      this.location,});

  Callouts.fromJson(dynamic json) {
    regionName = json['regionName'];
    superRegionName = json['superRegionName'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }
  String? regionName;
  String? superRegionName;
  Location? location;


}

class Location {
  Location({
      this.x, 
      this.y,});

  Location.fromJson(dynamic json) {
    x = json['x'];
    y = json['y'];
  }
  num? x;
  num? y;


}