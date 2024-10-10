import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:webtoon_explorer/DetailScreen.dart';
import 'package:webtoon_explorer/constant_data.dart';
import 'package:webtoon_explorer/favouriteScreen.dart'; // Importing the favorites screen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Index of the currently selected tab

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of pages to display based on the current index
    final List<Widget> _pages = [
      _webtoonListView(), // Home Screen
      FavoritesScreen(), // Favorites Screen
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Webtoon Explorer',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // Simple solid color
        elevation: 4, // Slight shadow for depth
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: _pages[_currentIndex], // Display selected page
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        items: <Widget>[
          Icon(Icons.home,
              size: 30,
              color: _currentIndex == 0
                  ? Color.fromRGBO(255, 0, 98, 1)
                  : Colors.white),
          Icon(Icons.favorite,
              size: 30,
              color: _currentIndex == 1
                  ? Color.fromRGBO(255, 0, 98, 1)
                  : Colors.white),
        ],
        color: Colors.blueAccent,
        buttonBackgroundColor: Colors.white,
        backgroundColor:
            Color.fromRGBO(255, 157, 0, 1), // Overall background color
        animationCurve: Curves.linear,
        animationDuration: Duration(milliseconds: 300),
        onTap: _onItemTapped, // Handle item tap
        index: _currentIndex, // Current index
      ),
    );
  }

  // Method to display webtoon list
  Widget _webtoonListView() {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Add padding around the list
      child: ListView.builder(
        itemCount: webtoons.length,
        itemBuilder: (context, index) {
          final webtoon = webtoons[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            elevation: 4, // Shadow effect
            margin: EdgeInsets.symmetric(vertical: 8), // Space between cards
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Rounded image
                child: Image.network(
                  webtoon.thumbnail,
                  width: 60,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                webtoon.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                webtoon.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis, // Ellipsis for long text
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(webtoon: webtoon),
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
