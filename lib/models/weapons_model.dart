class WeaponsModel {
  WeaponsModel({
      this.status, 
      this.data,});

  WeaponsModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(WeaponsData.fromJson(v));
      });
    }
  }
  num? status;
  List<WeaponsData>? data;



}

class WeaponsData {
  WeaponsData({
      this.uuid, 
      this.displayName, 
      this.category, 
      this.defaultSkinUuid, 
      this.displayIcon, 
      this.killStreamIcon, 
      this.assetPath, 
      this.weaponStats, 
      this.shopData, 
      this.skins,});

  WeaponsData.fromJson(dynamic json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    category = json['category'];
    defaultSkinUuid = json['defaultSkinUuid'];
    displayIcon = json['displayIcon'];
    killStreamIcon = json['killStreamIcon'];
    assetPath = json['assetPath'];
    weaponStats = json['weaponStats'] != null ? WeaponStats.fromJson(json['weaponStats']) : null;
    shopData = json['shopData'] != null ? ShopData.fromJson(json['shopData']) : null;
    if (json['skins'] != null) {
      skins = [];
      json['skins'].forEach((v) {
        skins?.add(Skins.fromJson(v));
      });
    }
  }
  String? uuid;
  String? displayName;
  String? category;
  String? defaultSkinUuid;
  String? displayIcon;
  String? killStreamIcon;
  String? assetPath;
  WeaponStats? weaponStats;
  ShopData? shopData;
  List<Skins>? skins;

}

class Skins {
  Skins({
      this.uuid, 
      this.displayName, 
      this.themeUuid, 
      this.contentTierUuid, 
      this.displayIcon, 
      this.wallpaper, 
      this.assetPath, 
      this.chromas, 
      this.levels,});

  Skins.fromJson(dynamic json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    themeUuid = json['themeUuid'];
    contentTierUuid = json['contentTierUuid'];
    displayIcon = json['displayIcon'];
    wallpaper = json['wallpaper'];
    assetPath = json['assetPath'];
    if (json['chromas'] != null) {
      chromas = [];
      json['chromas'].forEach((v) {
        chromas?.add(Chromas.fromJson(v));
      });
    }
    if (json['levels'] != null) {
      levels = [];
      json['levels'].forEach((v) {
        levels?.add(Levels.fromJson(v));
      });
    }
  }
  String? uuid;
  String? displayName;
  String? themeUuid;
  String? contentTierUuid;
  String? displayIcon;
  dynamic wallpaper;
  String? assetPath;
  List<Chromas>? chromas;
  List<Levels>? levels;


}

class Levels {
  Levels({
      this.uuid, 
      this.displayName, 
      this.levelItem, 
      this.displayIcon, 
      this.streamedVideo, 
      this.assetPath,});

  Levels.fromJson(dynamic json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    levelItem = json['levelItem'];
    displayIcon = json['displayIcon'];
    streamedVideo = json['streamedVideo'];
    assetPath = json['assetPath'];
  }
  String? uuid;
  String? displayName;
  dynamic levelItem;
  String? displayIcon;
  dynamic streamedVideo;
  String? assetPath;



}

class Chromas {
  Chromas({
      this.uuid, 
      this.displayName, 
      this.displayIcon, 
      this.fullRender, 
      this.swatch, 
      this.streamedVideo, 
      this.assetPath,});

  Chromas.fromJson(dynamic json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    displayIcon = json['displayIcon'];
    fullRender = json['fullRender'];
    swatch = json['swatch'];
    streamedVideo = json['streamedVideo'];
    assetPath = json['assetPath'];
  }
  String? uuid;
  String? displayName;
  dynamic displayIcon;
  String? fullRender;
  dynamic swatch;
  dynamic streamedVideo;
  String? assetPath;



}

class ShopData {
  ShopData({
      this.cost, 
      this.category, 
      this.shopOrderPriority, 
      this.categoryText, 
      this.gridPosition, 
      this.canBeTrashed, 
      this.image, 
      this.newImage, 
      this.newImage2, 
      this.assetPath,});

  ShopData.fromJson(dynamic json) {
    cost = json['cost'];
    category = json['category'];
    shopOrderPriority = json['shopOrderPriority'];
    categoryText = json['categoryText'];
    gridPosition = json['gridPosition'] != null ? GridPosition.fromJson(json['gridPosition']) : null;
    canBeTrashed = json['canBeTrashed'];
    image = json['image'];
    newImage = json['newImage'];
    newImage2 = json['newImage2'];
    assetPath = json['assetPath'];
  }
  num? cost;
  String? category;
  num? shopOrderPriority;
  String? categoryText;
  GridPosition? gridPosition;
  bool? canBeTrashed;
  dynamic image;
  String? newImage;
  dynamic newImage2;
  String? assetPath;


}

class GridPosition {
  GridPosition({
      this.row, 
      this.column,});

  GridPosition.fromJson(dynamic json) {
    row = json['row'];
    column = json['column'];
  }
  num? row;
  num? column;


}

class WeaponStats {
  WeaponStats({
      this.fireRate, 
      this.magazineSize, 
      this.runSpeedMultiplier, 
      this.equipTimeSeconds, 
      this.reloadTimeSeconds, 
      this.firstBulletAccuracy, 
      this.shotgunPelletCount, 
      this.wallPenetration, 
      this.feature, 
      this.fireMode, 
      this.altFireType, 
      this.adsStats, 
      this.altShotgunStats, 
      this.airBurstStats, 
      this.damageRanges,});

  WeaponStats.fromJson(dynamic json) {
    fireRate = json['fireRate'];
    magazineSize = json['magazineSize'];
    runSpeedMultiplier = json['runSpeedMultiplier'];
    equipTimeSeconds = json['equipTimeSeconds'];
    reloadTimeSeconds = json['reloadTimeSeconds'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
    shotgunPelletCount = json['shotgunPelletCount'];
    wallPenetration = json['wallPenetration'];
    feature = json['feature'];
    fireMode = json['fireMode'];
    altFireType = json['altFireType'];
    adsStats = json['adsStats'] != null ? AdsStats.fromJson(json['adsStats']) : null;
    altShotgunStats = json['altShotgunStats'];
    airBurstStats = json['airBurstStats'];
    if (json['damageRanges'] != null) {
      damageRanges = [];
      json['damageRanges'].forEach((v) {
        damageRanges?.add(DamageRanges.fromJson(v));
      });
    }
  }
  num? fireRate;
  num? magazineSize;
  num? runSpeedMultiplier;
  num? equipTimeSeconds;
  num? reloadTimeSeconds;
  num? firstBulletAccuracy;
  num? shotgunPelletCount;
  String? wallPenetration;
  String? feature;
  dynamic fireMode;
  String? altFireType;
  AdsStats? adsStats;
  dynamic altShotgunStats;
  dynamic airBurstStats;
  List<DamageRanges>? damageRanges;



}

class DamageRanges {
  DamageRanges({
      this.rangeStartMeters, 
      this.rangeEndMeters, 
      this.headDamage, 
      this.bodyDamage, 
      this.legDamage,});

  DamageRanges.fromJson(dynamic json) {
    rangeStartMeters = json['rangeStartMeters'];
    rangeEndMeters = json['rangeEndMeters'];
    headDamage = json['headDamage'];
    bodyDamage = json['bodyDamage'];
    legDamage = json['legDamage'];
  }
  num? rangeStartMeters;
  num? rangeEndMeters;
  num? headDamage;
  num? bodyDamage;
  num? legDamage;



}

class AdsStats {
  AdsStats({
      this.zoomMultiplier, 
      this.fireRate, 
      this.runSpeedMultiplier, 
      this.burstCount, 
      this.firstBulletAccuracy,});

  AdsStats.fromJson(dynamic json) {
    zoomMultiplier = json['zoomMultiplier'];
    fireRate = json['fireRate'];
    runSpeedMultiplier = json['runSpeedMultiplier'];
    burstCount = json['burstCount'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
  }
  num? zoomMultiplier;
  num? fireRate;
  num? runSpeedMultiplier;
  num? burstCount;
  num? firstBulletAccuracy;



}