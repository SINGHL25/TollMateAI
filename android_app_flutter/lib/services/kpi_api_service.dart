// ✅ FILE: android_app_flutter/native_ui/lib/services/kpi_api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class KpiApiService {
  final String baseUrl;
  KpiApiService({required this.baseUrl});

  Future<Map<String, dynamic>> fetchKpis() async {
    final response = await http.get(Uri.parse("$baseUrl/kpi"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load KPIs");
    }
  }
}
