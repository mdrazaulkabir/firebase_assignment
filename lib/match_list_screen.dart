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
            return Center(child: CircularProgressIndicator());

          }
          if(snapshot.hasError){
            return Center( child: Text("Error${snapshot.hasError}"),);
          }
          if(snapshot.hasData){
            _listLiveScore.clear();
            for(QueryDocumentSnapshot<Map<String,dynamic>> doc in snapshot.data!.docs){
              LiveScore liveScore = LiveScore(id: doc.id,
                  team1: doc.get("team1"),
                  team2: doc.get('team2'),
                  team1_score: doc.get("team1_score"),
                  team2_score: doc.get('team2_score'),
                  time: doc.get('time'));
              _listLiveScore.add(liveScore);
            }
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


