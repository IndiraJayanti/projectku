import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: WebLayout(),
      ),
    );
  }
}

class WebLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Sidebar
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.blueGrey[800],
            child: Column(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(width: 10), // Spasi antara icon dan teks
                      Text(
                        'Menu',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text('Home', style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text('Settings', style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.info, color: Colors.white),
                  title: Text('About', style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        
        // Main Content
        Expanded(
          flex: 8,
          child: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(16),
                color: const Color.fromARGB(255, 58, 72, 79),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Header',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              
              // Content
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 214, 212, 212),
                  child: Center(
                    child: Text(
                      'This is Content Area',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
