import 'package:flutter/material.dart';
import 'report_detail_page.dart';

class ReportsListPage extends StatelessWidget {
  const ReportsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for reported issues
    final List<Map<String, String>> reportedIssues = [
      {'location': 'Downtown', 'date': '2025-01-15', 'id': 'ANON123', 'description': 'A major drug bust involving 50kg of illegal substances.'},
      {'location': 'Sector 7', 'date': '2025-01-16', 'id': 'ANON456', 'description': 'Suspicious activities reported near the school area.'},
      {'location': 'City Center', 'date': '2025-01-17', 'id': 'ANON789', 'description': 'Illegal drugs found in a parked vehicle.'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reported Issues'),
      ),
      body: ListView.builder(
        itemCount: reportedIssues.length,
        itemBuilder: (context, index) {
          final issue = reportedIssues[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.report, color: Colors.red),
              title: Text('Location: ${issue['location']}'),
              subtitle: Text('Date: ${issue['date']}'),
              trailing: Text('ID: ${issue['id']}'),
              onTap: () {
                // Navigate to detailed description page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportDetailPage(issue: issue),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
