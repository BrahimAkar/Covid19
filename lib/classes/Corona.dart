class Corona {
  final int recovered;
  final int deaths;
  final int totalCases;
  final String date;

  Corona({this.recovered, this.deaths, this.totalCases, this.date});

  factory Corona.fromJson(Map<String, dynamic> json) {
    return Corona(
      totalCases: json['Countries'][149]['TotalConfirmed'],
      deaths: json['Countries'][149]['TotalDeaths'],
      recovered: json['Countries'][149]['TotalRecovered'],
      date: json['Countries'][149]['Date'],
    );
  }
}
