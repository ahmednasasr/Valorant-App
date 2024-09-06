class AgentsModel {
  AgentsModel({
      this.status, 
      this.data,});

  AgentsModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  num? status;
  List<Data>? data;


}

class Data {
  Data({
      this.uuid, 
      this.displayName, 
      this.description, 
      this.developerName, 
      this.characterTags, 
      this.displayIcon, 
      this.displayIconSmall, 
      this.bustPortrait, 
      this.fullPortrait, 
      this.fullPortraitV2, 
      this.killfeedPortrait, 
      this.background, 
      this.backgroundGradientColors, 
      this.assetPath, 
      this.isFullPortraitRightFacing, 
      this.isPlayableCharacter, 
      this.isAvailableForTest, 
      this.isBaseContent, 
      this.role, 
      this.recruitmentData, 
      this.abilities, 
      this.voiceLine,});

  Data.fromJson(dynamic json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    developerName = json['developerName'];
    characterTags = json['characterTags'];
    displayIcon = json['displayIcon'];
    displayIconSmall = json['displayIconSmall'];
    bustPortrait = json['bustPortrait'];
    fullPortrait = json['fullPortrait'];
    fullPortraitV2 = json['fullPortraitV2'];
    killfeedPortrait = json['killfeedPortrait'];
    background = json['background'];
    backgroundGradientColors = json['backgroundGradientColors'] != null ? json['backgroundGradientColors'].cast<String>() : [];
    assetPath = json['assetPath'];
    isFullPortraitRightFacing = json['isFullPortraitRightFacing'];
    isPlayableCharacter = json['isPlayableCharacter'];
    isAvailableForTest = json['isAvailableForTest'];
    isBaseContent = json['isBaseContent'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    recruitmentData = json['recruitmentData'];
    if (json['abilities'] != null) {
      abilities = [];
      json['abilities'].forEach((v) {
        abilities?.add(Abilities.fromJson(v));
      });
    }
    voiceLine = json['voiceLine'];
  }
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  dynamic characterTags;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  List<String>? backgroundGradientColors;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;
  Role? role;
  dynamic recruitmentData;
  List<Abilities>? abilities;
  dynamic voiceLine;

}

class Abilities {
  Abilities({
      this.slot, 
      this.displayName, 
      this.description, 
      this.displayIcon,});

  Abilities.fromJson(dynamic json) {
    slot = json['slot'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
  }
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;


}

class Role {
  Role({
      this.uuid, 
      this.displayName, 
      this.description, 
      this.displayIcon, 
      this.assetPath,});

  Role.fromJson(dynamic json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
    assetPath = json['assetPath'];
  }
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;


}