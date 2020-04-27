import 'dart:math';
import 'package:cricket_app/cardDecoration/customStatisticCard.dart';
import 'package:flutter/material.dart';
import 'package:cricket_app/navigation/bottom_navigation.dart';
import 'package:cricket_app/graphs/bar_chart.dart';
import 'package:cricket_app/graphs/line_chart.dart';
import 'package:cricket_app/graphs/serieslegend.dart';
import 'package:cricket_app/graphs/donut.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cricket_app/pages/createStatistic.dart';
import 'package:cricket_app/pages/statisticDetails.dart';
import 'package:cricket_app/classes/statistics.dart';
import 'package:cricket_app/database/database.dart';

var allBarColors = [Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.indigo, Colors.cyan, Colors.orange, Colors.teal, Colors.amber];

List<StatisticInformation> statistics = [];

//Used to handle the tutorial page
class Statistics extends StatefulWidget {
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  var width;
  final List<Color> barColors = [Colors.amber, Colors.blue, Colors.green, Colors.red, Colors.orange, Colors.purple, Colors.yellow[700], Colors.cyan, Colors.indigo, Colors.lightGreen, Colors.deepOrange, Colors.teal]; 

  initState() {
    super.initState();
    refresh();
  }

  refresh() async {
    //Had to make read asynchronous to wait on the results of the database retrieval before rendering the UI
    await _read();
    if (this.mounted){
      setState(() {});
    }
  }

  List<Line_ChartData> generateBattingAverage() {
    List<int> dismissals = [];
    List<int> totalRuns = [];

    List<Line_ChartData> finalList = [];

    for (int i = 0; i < statistics.length; i++) {
      if (i == 0) {
        totalRuns.add(statistics[i].runs);
        if (statistics[i].not_out != 0) {
          dismissals.add(0);
        } else {
          dismissals.add(1);
        }
      } else {
        totalRuns.add(totalRuns[i-1] + statistics[i].runs);
        if (statistics[i].not_out != 0) {
          dismissals.add(dismissals[i-1]);
        } else {
          dismissals.add(dismissals[i-1] + 1);
        }
      }
    }

    for (int i = 0; i < statistics.length; i++) {
      double average = 0;
      if (dismissals[i] == 0 || totalRuns[i] == 0) {
        average = totalRuns[i].toDouble();
      } else {
        average = totalRuns[i] / dismissals[i];
      }
      finalList.add(Line_ChartData(i, average));
    } 
    return finalList;
  }

  List<Line_ChartData> generateBowlingAverage() {
    List<int> dismissals = [];
    List<int> totalRunsConceeded = [];

    List<Line_ChartData> finalList = [];

    for (int i = 0; i < statistics.length; i++) {
      if (i == 0) {
        totalRunsConceeded.add(statistics[i].runs_conceeded);
        dismissals.add(statistics[i].wickets);
      } else {
        totalRunsConceeded.add(totalRunsConceeded[i-1] + statistics[i].runs_conceeded);
        dismissals.add(dismissals[i-1] + statistics[i].wickets);
      }
    }

    for (int i = 0; i < statistics.length; i++) {
      double average = 0;
      if (dismissals[i] == 0 || totalRunsConceeded[i] == 0) {
        average = totalRunsConceeded[i].toDouble();
      } else {
        average = totalRunsConceeded[i] / dismissals[i];
      }
      finalList.add(Line_ChartData(i, average));
    } 
    return finalList;
  }

  static List<charts.Series<Series_ChartData, String>> _createFieldingChart() {
    List<Series_ChartData> catchesList;
    List<Series_ChartData> runOutsList;
    List<Series_ChartData> stumpingsList;

    catchesList = statistics.map((stat) => Series_ChartData(stat.name, stat.catches)).toList();
    runOutsList = statistics.map((stat) => Series_ChartData(stat.name, stat.run_outs)).toList();
    stumpingsList = statistics.map((stat) => Series_ChartData(stat.name, stat.stumpings)).toList();


    return [
      new charts.Series<Series_ChartData, String>(
        id: 'Catches',
        domainFn: (Series_ChartData runs, _) => runs.xAxis,
        measureFn: (Series_ChartData runs, _) => runs.yAxis,
        data: catchesList,
      ),
      new charts.Series<Series_ChartData, String>(
        id: 'Run Outs',
        domainFn: (Series_ChartData runs, _) => runs.xAxis,
        measureFn: (Series_ChartData runs, _) => runs.yAxis,
        data: runOutsList,
      ),
      new charts.Series<Series_ChartData, String>(
        id: 'Stumpings',
        domainFn: (Series_ChartData runs, _) => runs.xAxis,
        measureFn: (Series_ChartData runs, _) => runs.yAxis,
        data: stumpingsList,
      ),
    ];
  }

   List<Bar_ChartData> generateEconomyRate() {
    var economyRates = [0, 0, 0, 0, 0];
    var ranges = ["0-4", "4-6", "6-8", "8-10", "10+"];

    List<Bar_ChartData> finalList = [];

    for (int i = 0; i < statistics.length; i++) {
      if (statistics[i].overs == 0 || statistics[i].runs_conceeded == 0) {
        economyRates[0] += 1;
      } else {
        double economy = statistics[i].runs_conceeded / statistics[i].overs;

        if (economy >= 0 && economy < 4) {
          economyRates[0] += 1;
        } else if (economy >= 4 && economy < 6) {
          economyRates[1] += 1;
        } else if (economy >= 6 && economy < 8) {
          economyRates[2] += 1;
        } else if (economy >= 8 && economy < 10) {
          economyRates[3] += 1;
        } else if (economy >= 10) {
          economyRates[4] += 1;
        }
      }
    }
    int j = 0;
    for (int i = 0; i < economyRates.length; i++) {
      if (j == (barColors.length - 1)) {
        j = 0;
      }
      finalList.add(Bar_ChartData(ranges[i], economyRates[i], barColors[j]));
      j++;
    }
    
    return finalList;
  }

     List<Bar_ChartData> generateStrikeRateRate() {
    var strikeRates = [0, 0, 0, 0, 0, 0];
    var ranges = ["0-60", "60-80", "80-100", "100-120", "120-140", "140+"];

    List<Bar_ChartData> finalList = [];

    for (int i = 0; i < statistics.length; i++) {
      if (statistics[i].balls_faced == 0 || statistics[i].runs == 0) {
        strikeRates[0] += 1;
      } else {
        double economy = (statistics[i].runs / statistics[i].balls_faced) * 100;

        if (economy >= 0 && economy < 60) {
          strikeRates[0] += 1;
        } else if (economy >= 60 && economy < 80) {
          strikeRates[1] += 1;
        } else if (economy >= 80 && economy < 100) {
          strikeRates[2] += 1;
        } else if (economy >= 100 && economy < 120) {
          strikeRates[3] += 1;
        } else if (economy >= 120 && economy < 140) {
          strikeRates[4] += 1;
        } else if (economy >= 140) {
          strikeRates[5] += 1;
        }
      }
    }
    int j = 0;
    for (int i = 0; i < strikeRates.length; i++) {
      if (j == (barColors.length - 1)) {
        j = 0;
      }
      finalList.add(Bar_ChartData(ranges[i], strikeRates[i], barColors[j]));
      j++;
    }
    
    return finalList;
  }


  /// Create one series with sample hard coded data.
  List<charts.Series<Bar_ChartData, String>> _createBarChart(String type) {
    List<Bar_ChartData> list = [];
    if (type == "Runs") {
      int j = 0;
      for (int i = 0; i < statistics.length; i++) {
        if (j == (barColors.length - 1)) {
          j = 0;
        }
        list.add(Bar_ChartData(statistics[i].name, statistics[i].runs, barColors[j]));
        j++;
      }
    } else if (type == "Strike Rate") {
      list = generateStrikeRateRate();
    } else if (type == "Wickets") {
      int j = 0;
      for (int i = 0; i < statistics.length; i++) {
        if (j == (barColors.length - 1)) {
          j = 0;
        }
        list.add(Bar_ChartData(statistics[i].name, statistics[i].wickets, barColors[j]));
        j++;
      }
    } else if (type == "Economy Rate") {
      //Need to fix
      list = generateEconomyRate();
    }

    return [
      new charts.Series<Bar_ChartData, String>(
        id: type,
        domainFn: (Bar_ChartData runs, _) => runs.xAxis,
        measureFn: (Bar_ChartData runs, _) => runs.yAxis,
        colorFn: (Bar_ChartData runs, _) => runs.color,
        data: list,
      )
    ];
  }

    /// Create one series with sample hard coded data.
  List<charts.Series<Line_ChartData, int>> _createLineData(String type) {
    List<Line_ChartData> list;

    if (type == "Batting Average") {
      list = generateBattingAverage();
    } else if (type == "Bowling Average") {
      list = generateBowlingAverage();
    }


    return [
      new charts.Series<Line_ChartData, int>(
        id: type,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (Line_ChartData sales, _) => sales.xAxis,
        measureFn: (Line_ChartData sales, _) => sales.yAxis,
        data: list,
      )
    ];
}

  List<Donut_ChartData> createNotOutChart() {
    double notOuts = 0;
    double dismissals = 0;
    List<Donut_ChartData> finalList = [];

    for (int i = 0; i < statistics.length; i++) {
      if (statistics[i].not_out == 0) {
        dismissals += 1;
      } else {
        notOuts += 1;
      }
    }
    finalList.add(Donut_ChartData(0, dismissals, Colors.red));
    finalList.add(Donut_ChartData(1, notOuts, Colors.green));
    
    return finalList;
  }

    /// Create one series with sample hard coded data.
  List<charts.Series<Donut_ChartData, int>> _createDonutData(String type) {
    List<Donut_ChartData> list;
    if (type == "Not Out") {
      list = createNotOutChart();
    }
    return [
      new charts.Series<Donut_ChartData, int>(
        id: type,
        domainFn: (Donut_ChartData not_out, _) => not_out.xAxis,
        measureFn: (Donut_ChartData not_out, _) => not_out.yAxis,
        colorFn: (Donut_ChartData not_out, _) => not_out.color,
        data: list,
      )
    ];
}

Widget statList(int type) {
  width = MediaQuery.of(context).size.width;
  return ListView.builder (
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: statistics.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return InkWell(
              //This needs to be asynchronous since you have to wait on the results of the update page
                onTap: () async {
                //Pass the statistic information to the statisticDetails.dart page
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatisticDetails(
                      //Helps to prevent range issues
                        statistic: statistics?.elementAt(index) ?? "",
                      )
                    ),
                  );
                  //Then rebuild the widget
                  refresh();
                },
                //Render custom card for each goal
                child: CustomStatisticCard(object: statistics[index], width: width,type: type)
              );  
            }
        );
}

  Widget battingPage() {
    return ListView(children: <Widget>[
      SimpleBarChart(_createBarChart("Runs"), animate: true, title: "Runs per Game"),
      SimpleLineChart(_createLineData("Batting Average"), animate: true, title: "Batting Average Progression"),
      SimpleBarChart(_createBarChart("Strike Rate"), animate: true, title: "Strike Rate Frequency"),
      DonutPieChart(_createDonutData("Not Out"), animate: true, title: "Not Out vs Dismissals", subtitle: "0 is Dismissals and 1 is Not Outs",),
      statList(0),
    ]);
  }

  Widget bowlingPage() {
    return ListView(children: <Widget>[
      SimpleBarChart(_createBarChart("Wickets"), animate: true, title: "Wickets per Game"),
      SimpleLineChart(_createLineData("Bowling Average"), animate: true, title: "Bowling Average Progression"),
      SimpleBarChart(_createBarChart("Economy Rate"), animate: true, title: "Economy Rate Frequency"),
      statList(1),
    ]);
  }

  Widget fieldingPage() {
    return ListView(children: <Widget>[
      SimpleSeriesLegend(_createFieldingChart(), animate: true, title: "Fielding dismissals"),
      statList(2),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Bottom_Navigation().createBottomNavigation(context, 4),
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Image.asset('assets/images/statistics/bat.png', width: 35, height: 35), text: "Batting"),
                Tab(icon: Image.asset('assets/images/statistics/ball.png', width: 35, height: 35), text: "Bowling"),
                Tab(icon: Image.asset('assets/images/statistics/fielding.png', width: 35, height: 35), text: "Fielding"),
              ],
            ),
            title: Text("Statistics"),
          ),
          body: TabBarView(
            children: [
              battingPage(),
              bowlingPage(),
              fieldingPage(),
            ],
          ),
          floatingActionButton: FloatingActionButton (
          //Need this to be asynchronous since you have to wait on the results of the new goal page
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewStatistic(
                  //Helps to prevent range issues
                  statistic: StatisticInformation(),
                )
              ),
            );
          //Rebuild the widget
          refresh();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
        ),
      ),
    );
  }

    //Function to read all goals from the database for rendering
  _read() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    //goals now stores the index of each goalInformation in the database
    statistics = await helper.getStatistics();
  }
}