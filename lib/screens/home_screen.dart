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
                      child: Text("Agents",style: TextStyle(color: Colors.white),),
                    ),Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: currentIndex==1?Color(0xffFD4556):Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("Maps",style: TextStyle(color: Colors.white),),
                    ),Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: currentIndex==2?Color(0xffFD4556):Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text("Weapons",style: TextStyle(color: Colors.white),),
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
                              Navigator.pushReplacementNamed(context, AgientDetail.routename,arguments: ageintIndex(index));
                            },
                            child: Card(
                              color: Colors.transparent,
                              elevation: 5,
                              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
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
                                             , child: Image(image: NetworkImage(role[index].fullPortrait??""),fit: BoxFit.cover,)),
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
                                    Expanded(child: Image(image: NetworkImage(maps[index].splash??""),fit: BoxFit.cover,)),
                                    Align(
                                      alignment: Alignment.topRight,
                                        child: Image(image: NetworkImage(maps[index].displayIcon??""))),
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

                        child: Image(image: NetworkImage(weapons[index].displayIcon??"")),
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



