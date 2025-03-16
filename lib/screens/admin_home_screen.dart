import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final TextEditingController _postController = TextEditingController();
  String _selectedPostType = 'Workshop';
  int _pendingReports = 5; // Example value

  // Example news items
  final List<Map<String, String>> newsItems = [
    {'title': 'Major Drug Bust in Downtown', 'time': '2 hours ago'},
    {'title': 'New Prevention Program Launched', 'time': '5 hours ago'},
  ];

  // Example tasks
  final List<Map<String, dynamic>> tasks = [
    {
      'title': 'Community Patrol',
      'description': 'Regular patrol in sector 7',
      'status': 'in-progress'
    },
    {
      'title': 'School Awareness Program',
      'description': 'Drug awareness session at City High',
      'status': 'pending'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Added to make the page scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GreyContainer(),
            const SizedBox(
              height: 2,
            ),
            const GreyContainer(),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Create Announcement'),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Announcement Details',
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Create'))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the reports screen
                    Navigator.pushNamed(context, '/view_reports');
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.notifications_active),
                      SizedBox(
                        width: 10,
                      ),
                      Text('View Reports')
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                    foregroundColor: Colors.blue, // Text color
                    padding: const EdgeInsets.symmetric(vertical: 20), // Increased vertical padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text('Map Functionality Coming Soon'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('NEWS'),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GreyContainer extends StatelessWidget {
  const GreyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('VEHICLE TRACKING'),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.home),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Enter no.'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [

                      SizedBox(
                        width: 5,
                      ),

                    ],
                  )
                ],
              ),
            ),
            ),
        );
    }
}
