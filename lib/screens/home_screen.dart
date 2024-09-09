import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:routeexam/core/api_manger.dart';
import 'package:routeexam/models/agents_model.dart';
import 'package:routeexam/models/weapons_model.dart';
import 'package:routeexam/screens/agient_detail.dart';

import '../models/maps_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routename="homescreen";
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  Future<dynamic>? currentFuture;

  @override
  void initState() {
    super.initState();
    // عند البداية، عرض الشخصيات (agents)
    currentFuture = ApiManger.getagints();
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      if (index == 0) {
        currentFuture = ApiManger.getagints();
      } else if (index == 1) {
        currentFuture = ApiManger.getMaps();
      } else if (index == 2) {
        currentFuture = ApiManger.getWeapons();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
      elevation: 0,
      ),
      body: Column(
        children: [
          Center(child: Image.asset("assets/images/Mask group.png")),
          DefaultTabController(
              initialIndex: currentIndex,
              length: 3,
              child: TabBar(
                onTap: (index){
                  onTap: onTabTapped(index);
                },
                  indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                  tabs: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: currentIndex==0?Color(0xffFD4556):Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("Agents",style: TextStyle(fontFamily: "valorant",color: Colors.white),),
                    ),Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: currentIndex==1?Color(0xffFD4556):Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("Maps",style: TextStyle(fontFamily: "valorant",color: Colors.white),),
                    ),Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: currentIndex==2?Color(0xffFD4556):Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("Weapons",style: TextStyle(fontFamily: "valorant",color: Colors.white),),
                    ),

              ])),
          FutureBuilder(future: currentFuture,
              builder: (context, snapshot) {
                if(snapshot.connectionState ==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasError){
                  return Center(child: Text("has error"),);
                }else if(currentIndex==0){
                  List<Data> role =snapshot.data!.data??[];
                  return Expanded(
                    child: PageView.builder(
                      itemCount: role.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, AgientDetail.routename, arguments: ageintIndex(index));
                            },
                            child: Card(
                              color: Colors.transparent,
                              elevation: 5,
                              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: role[index].backgroundGradientColors?.map((colorHex) {
                                            if (colorHex.length == 8) {
                                              colorHex = colorHex.substring(6) + colorHex.substring(0, 6);
                                            }
                                            return Color(int.parse("0x$colorHex"));
                                          }).toList() ?? [Colors.green],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(100),
                                            bottomLeft: Radius.zero,
                                            topLeft: Radius.circular(100),
                                            topRight: Radius.circular(50)
                                        )),
                                    height: 100,
                                    child: Container(
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 700
                                             , child:   CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: role[index].fullPortrait??"",
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          )
                                          ),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(role[index].displayName??"",style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,fontWeight: FontWeight.bold),),
                                          )
                                        ],
                                      ),
                                    )),
                            ),
                          ),
                        );
                    },),
                  );
                }
                else if(currentIndex==1){
                  List<MapsData> maps =snapshot.data!.data??[];
                  return Expanded(
                    child: ListView.builder(
                      itemCount: maps.length,
                      itemBuilder: (context, index) {
                      return Card(
                        color: Colors.transparent,
                        elevation: 5,
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Expanded(
                          child: Container(
                              height: 200,
                              child: Expanded(
                                child: Stack(
                                  children: [
                                    Expanded(child:
                                    CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: maps[index].splash??"",
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),
                                    ),                                    Align(
                                      alignment: Alignment.topRight,
                            child:  CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: maps[index].displayIcon??"",
                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                                    Text(maps[index].displayName??"",style: TextStyle(
                                      fontSize: 30,
                                        color: Colors.white,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              )),
                        ),
                      );
                    },),
                  );
                }
                else if(currentIndex==2){
                  List<WeaponsData> weapons = (snapshot.data as WeaponsModel).data ?? [];
                  return Expanded(
                    child: ListView.builder(
                      itemCount: weapons.length,
                      itemBuilder: (context, index) {
                      return Card(
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Container(child:
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: weapons[index].displayIcon??"",
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        )
                            ),
                              Positioned(
                              bottom: 0,
                              left: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0), // Adding padding for better spacing
                                child: Text(
                                  weapons[index].displayName ?? "",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },),
                  );
                }
                return Container();
              },)
        ],
      ),
    );
  }
}



