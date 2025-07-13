// ✅ FILE: android_app_flutter/native_ui/lib/tabs/analytics_tab.dart

import 'package:flutter/material.dart';
import '../widgets/kpi_card.dart';
import '../charts/traffic_bar_chart.dart';
import '../services/kpi_api_service.dart';

class AnalyticsTab extends StatefulWidget {
  @override
  _AnalyticsTabState createState() => _AnalyticsTabState();
}

class _AnalyticsTabState extends State<AnalyticsTab> {
  late Future<Map<String, dynamic>> _kpiFuture;
  final _api = KpiApiService(baseUrl: "http://10.0.2.2:8000"); // Android emulator IP

  @override
  void initState() {
    super.initState();
    _kpiFuture = _api.fetchKpis();
  }

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
            FutureBuilder<Map<String, dynamic>>(
              future: _kpiFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error loading KPIs"));
                } else {
                  final kpis = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      children: [
                        KpiCard(title: "Frauds", value: "${kpis['Frauds']}"),
                        KpiCard(title: "Density", value: "${kpis['Density']}"),
                        KpiCard(title: "Revenue Loss", value: "₹${kpis['Revenue Loss']}"),
                        KpiCard(title: "Tags Missing", value: "${kpis['Tags Missing']}"),
                      ],
                    ),
                  );
                }
              },
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
