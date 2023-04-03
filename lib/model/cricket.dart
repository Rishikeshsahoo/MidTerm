class Cricket {
  String name = '';
  String matchType = '';
  String status = "";
  String venue = '';
  String date = '';
  String image = '';

  Cricket(this.name, this.matchType, this.status, this.venue,
      this.date, this.image);

  Cricket.fromJson(Map<String, dynamic> cricketData) {
    this.name = cricketData['name'];
    this.matchType = cricketData['matchType'] ?? '';
    this.status = cricketData["status"]??"";// temperature in celcius
    this.venue = (cricketData['venue'])??"";
    this.date = cricketData['date'] ?? "";
    this.image = cricketData['teamInfo'][0]['img'] ?? "";
  }
}
