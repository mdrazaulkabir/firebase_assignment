import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_assignment/match_detail_screen.dart';
import 'package:flutter/material.dart';
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
      body: ListView.builder(
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
                    MatchDetailScreen(),
              ),
            );
          },
        );
      }),
    );
  }
}

class LiveScore {
  final String id;
  final String team1;
  final String team2;
  final int team1_score;
  final int team2_score;
  final String time;

  LiveScore({required this.id, required this.team1, required this.team2, required this.team1_score, required this.team2_score, required this.time});

}
