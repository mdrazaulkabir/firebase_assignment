import 'package:firebase_assignment/live_score_model.dart';
import 'package:flutter/material.dart';
class MatchDetailScreen extends StatelessWidget {
  final LiveScore liveScore;
  const MatchDetailScreen({super.key,required this.liveScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("${liveScore.id}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${liveScore.team1} vs ${liveScore.team2}",
              style: TextStyle(fontSize: 22, color: Colors.blueGrey),),
            Text("${liveScore.team1_score} : ${liveScore.team2_score}",
              style: TextStyle(fontSize: 22, color: Colors.black),),
            Text(liveScore.time,
              style: TextStyle(fontSize: 20, color: Colors.blueGrey),),
            Text("Total Time : 90:00",
              style: TextStyle(fontSize: 22, color: Colors.blueGrey),)
          ],
        ),
      ),
    );
  }
}
