```dart
import 'package:flutter/material.dart';
import '../widgets/kpi_card.dart';
import '../charts/traffic_bar_chart.dart';

class AnalyticsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Analytics Dashboard"),
          bottom: TabBar(
            tabs: [
              Tab(text: "KPIs"),
              Tab(text: "Charts"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  KpiCard(title: "Frauds", value: "12"),
                  KpiCard(title: "Density", value: "86%"),
                  KpiCard(title: "Revenue Loss", value: "\$340"),
                  KpiCard(title: "Tags Missing", value: "9"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TrafficBarChart(data: {
                "TP31": 15,
                "TP33": 40,
                "TP37": 30,
                "TP39": 20,
              }),
            ),
          ],
        ),
      ),
    );
  }
}
