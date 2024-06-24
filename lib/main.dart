import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1516117172878-fd2c41f4a759',
    'https://images.unsplash.com/photo-1532009324734-20a7a5813719',
    'https://images.unsplash.com/photo-1524429656589-6633a470097c',
    'https://images.unsplash.com/photo-1530224264768-7ff8c1789d79',
    'https://images.unsplash.com/photo-1516979187457-637abb4f9353',
    'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61',
    'https://images.unsplash.com/photo-1522364723953-452d3431c267',
    'https://images.unsplash.com/photo-1522202176988-66273c2fd55f',
    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d',
    'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e',
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c',
    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
    'https://images.unsplash.com/photo-1474631245212-32dc3c8310c6',
    'https://images.unsplash.com/photo-1481349518771-20055b2a7b24',
    'https://images.unsplash.com/photo-1501854140801-50d01698950b',
    'https://images.unsplash.com/photo-1440407876336-62333a6f010f',
    'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa',
    'https://images.unsplash.com/photo-1421749810611-438cc492b581',
    'https://images.unsplash.com/photo-1494173853739-c21f58b16055',
    'https://images.unsplash.com/photo-1483721310020-03333e577078',
    'https://images.unsplash.com/photo-1432139509613-5c4255815697',
    'https://images.unsplash.com/photo-1472214103451-9374bd1c798e',
    'https://images.unsplash.com/photo-1489824904134-891ab64532f1',
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GridView.builder(
            padding: const EdgeInsets.only(top: 125),
            shrinkWrap: true,
            reverse: true,
            itemCount: imageUrls.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: imageUrls[index],
                fit: BoxFit.cover,
              );
            },
          ),
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withAlpha(200),
                  Colors.transparent,
                ],
              ),
            ),
            child: const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'June 22, 2024',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                    ),
                    Spacer(),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            label: 'For You',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        selectedItemColor: Colors.blue,
        selectedLabelStyle: const TextStyle(fontSize: 11.0),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(fontSize: 11.0),
        currentIndex: _selectedIndex,
        onTap: (value) => _onItemTapped(value),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
