import 'package:flutter/material.dart';
import 'package:admin_dashboard/date/date_display.dart';
import 'package:admin_dashboard/screens/custom_search_delegate.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DateTime selectedDate = DateTime.now();
  final List<String> searchTerms = [
    "Customers",
    "Staffs",
    "Services",
    "Support Tickets",
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            DateDisplay(alignment: Alignment.centerLeft),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(searchTerms),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notifications clicked!')),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 2.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 116, 163).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 16.0,
                      top: 16.0,
                      child: Text(
                        'Today\'s Sales',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16.0,
                      top: 50.0,
                      child: Text(
                        'Sales Summary',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 16.0,
                      top: 16.0,
                      child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Row(
                          children: [
                            Text(
                              DateFormat('yyyy-MM-dd').format(selectedDate),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Icon(Icons.calendar_today, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.attach_money_rounded, color: Colors.grey[700], size: 20),
                                  SizedBox(height: 8),
                                  Text(
                                    'Total Sales',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '₱ 20K',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '+10% from yesterday',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 125, 105, 0),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.sell, color: Colors.grey[700], size: 20),
                                  SizedBox(height: 8),
                                  Text(
                                    'Sold Services',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '+10% from yesterday',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.person_add_alt_1, color: Colors.grey[700], size: 20),
                                  SizedBox(height: 8),
                                  Text(
                                    'Customers',
                                    style: TextStyle(
                                      color: const Color.fromARGB(255, 123, 113, 113),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '10',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '+10% from yesterday',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 8,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TopServicesBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class TopServicesBox extends StatelessWidget {
  final List<Service> services = [
    Service('Glutathione IV Push', 62),
    Service('Gluta Fairy Push', 78),
    Service('Cinderella Drip', 59),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink[400],
              ),
            ),
            SizedBox(height: 16.0),
            DataTable(
              columns: [
                DataColumn(label: Text('#')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Popularity')),
                DataColumn(label: Text('Sales')),
              ],
              rows: List<DataRow>.generate(
                services.length,
                (index) => DataRow(
                  cells: [
                    DataCell(Text('${index + 1}')),
                    DataCell(Text(services[index].name)),
                    DataCell(
                      Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          Container(
                            width: (100 * services[index].popularity / 100).toDouble(),
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.pink[300],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DataCell(Text('${services[index].popularity}%')),
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

class Service {
  final String name;
  final int popularity;

  Service(this.name, this.popularity);
}