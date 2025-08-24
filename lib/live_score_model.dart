class LiveScore {
  final String id;
  final String team1;
  final String team2;
  final int team1_score;
  final int team2_score;
  final String time;

  LiveScore({required this.id, required this.team1, required this.team2, required this.team1_score, required this.team2_score, required this.time});
Map<String,dynamic>toMap(){
  return{
    'team1':team1Name,
    'team2':team2Name,
    "team1_Score":team1Score,
    "team2_Score":team2Score,
    "time":time
  };
}
}