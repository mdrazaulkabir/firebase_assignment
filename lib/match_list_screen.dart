import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_assignment/match_detail_screen.dart';
import 'package:flutter/material.dart';

import 'live_score_model.dart';
class MatchListScreen extends StatefulWidget {
  const MatchListScreen({super.key});

  @override
  State<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  final FirebaseFirestore db=FirebaseFirestore.instance;
  List<LiveScore>_listLiveScore=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("Match List",style: TextStyle(fontSize: 24,color: Colors.white),),
        backgroundColor: Colors.greenAccent,
      ),
      body: StreamBuilder(
        stream: db.collection('football').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){

          }
          if(snapshot.hasError){

          }
          if(snapshot.hasData){

          }
          {
            return ListView.builder(
                itemCount: _listLiveScore.length,
                itemBuilder: (context,index){
                  LiveScore liveScorelist=_listLiveScore[index];
                  return ListTile(
                    title: Text("${liveScorelist.team1} vs ${liveScorelist.team2}"),
                    trailing: Icon(Icons.arrow_right,color: Colors.green,size: 18,),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MatchDetailScreen(liveScore: liveScorelist,),
                        ),
                      );
                    },
                  );
                });
          }
        }
      ),
    );
  }
}


