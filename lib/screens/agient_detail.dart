import 'package:flutter/material.dart';
import 'package:routeexam/core/api_manger.dart';
import 'package:routeexam/models/agents_model.dart';

class AgientDetail extends StatefulWidget {
  static const String routename="details";
  const AgientDetail({super.key});



  @override
  State<AgientDetail> createState() => _AgientDetailState();
}

class _AgientDetailState extends State<AgientDetail> {
  @override
  Widget build(BuildContext context) {

    var arg =ModalRoute.of(context)?.settings.arguments as ageintIndex;
    var theme =Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: theme.appBarTheme.foregroundColor,
        actions: [
          Image(image: AssetImage("assets/images/displayicon 1.png"))
        ],
      ),
      body: FutureBuilder(
          future: ApiManger.getagints(),
          builder: (context, snapshot) {
            if(snapshot.connectionState ==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasError){
              return Center(child: Text("has error"),);
            }else {
              List<Data> role =snapshot.data!.data??[];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 350,
                      width: 200,
                      child: Image(image: AssetImage(role[arg.ageintindex].fullPortrait as String))),


                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text("Description",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24,color: Colors.white),)),
                  Text( role[arg.ageintindex].description as String,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.white),),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Abilities",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 24,color: Colors.white),)),                  Row(
                    children: [
                      Image(image: AssetImage("assets/images/Group 9.png")),
                      Image(image: AssetImage("assets/images/Group 8.png")),
                      Image(image: AssetImage("assets/images/Group 7.png")),
                      Image(image: AssetImage("assets/images/Group 6.png")),
                    ],
                  )

                ],
              );
            }
          },),
    );
  }

}
class ageintIndex {
  final int ageintindex;

  ageintIndex(this.ageintindex);
}
