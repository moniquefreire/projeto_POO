import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ForceChart extends StatefulWidget {
  const ForceChart({super.key});

  @override
  State<ForceChart> createState() => _ForceChartState();
}

class _ForceChartState extends State<ForceChart> {
  int _force = 0;
  int index = 0;
  late DatabaseReference _forceRef;
  late StreamSubscription<DatabaseEvent> _forceSubscription;
  final List<FlSpot> _spots = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    _forceRef = FirebaseDatabase.instance.ref('force');
    try {
      final counterSnapshot = await _forceRef.get();
      _force = counterSnapshot.value as int;
    } catch (err) {
      debugPrint(err.toString());
    }

    _forceSubscription = _forceRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        _force = (event.snapshot.value ?? 0) as int;
        _spots.add(FlSpot(index.toDouble(), _force.toDouble()));
        index++;
      });
    });
  }

  @override
  void dispose() {
    _forceSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildCaseNumber(context),
          const SizedBox(height: 15),
          Text(
            "From Health Center",
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w400,
              color: kTextColor,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 40),
          AspectRatio(
            aspectRatio: 2.2,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    spots: _spots,
                    isCurved: false,
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(show: false),
                    color: kPrimaryColor,
                    barWidth: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          _force.toString(),
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: kTextColor, height: 1.2, fontFamily: 'Quicksand'),
        ),
        const SizedBox(width: 10),
        const Text(
          "[ N ]",
          style: TextStyle(color: kTextColor, fontFamily: 'Quicksand'),
        ),
      ],
    );
  }
}
