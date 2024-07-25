import 'package:flutter_application_2/views/reports_page/barGraph/ind_bar.dart';

class BarData {
  final dynamic januaryEarning;
  final dynamic februaryEarning;
  final dynamic marchEarning;
  final dynamic aprilEarning;
  final dynamic mayEarning;
  final dynamic juneEarning;
  final dynamic jullietEarning;
  final dynamic augestEarning;
  final dynamic septemberEarning;
  final dynamic octoberEarning;
  final dynamic novemberEarning;
  final dynamic decemberEarning;
  BarData(
      {required this.januaryEarning,
      required this.februaryEarning,
      required this.marchEarning,
      required this.aprilEarning,
      required this.mayEarning,
      required this.juneEarning,
      required this.jullietEarning,
      required this.augestEarning,
      required this.septemberEarning,
      required this.octoberEarning,
      required this.novemberEarning,
      required this.decemberEarning});
  List<IndBar> barData = [];
  void initBarData(){
    barData=[
      IndBar(x: 1, y: januaryEarning),
      IndBar(x: 2, y: februaryEarning),
      IndBar(x: 3, y: marchEarning),
      IndBar(x: 4, y: aprilEarning),
      IndBar(x: 5, y: mayEarning),
      IndBar(x:6, y: juneEarning),
      IndBar(x: 7, y: jullietEarning),
      IndBar(x: 8, y: augestEarning),
      IndBar(x: 9, y: septemberEarning),
      IndBar(x: 10, y: octoberEarning),
      IndBar(x:11, y: novemberEarning),
      IndBar(x: 12, y: decemberEarning),
    ];
  }
}
