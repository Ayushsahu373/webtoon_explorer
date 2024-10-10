import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webtoon_explorer/DetailScreen.dart';
import 'package:webtoon_explorer/constant_data.dart'; // Import your webtoons data

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> _favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _favorites = webtoons
          .map((webtoon) => webtoon.title) // Get titles from webtoon objects
          .where((title) => prefs.getBool('${title}_favorite') == true)
          .toList();
    });
  }

  Webtoon? _getWebtoonByTitle(String title) {
    return webtoons.firstWhere(
      (webtoon) => webtoon.title == title,
      // orElse: () => null, // Return null if not found
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _favorites.isEmpty
          ? Center(
              child: Text('No favorites added', style: TextStyle(fontSize: 18)))
          : ListView.builder(
              itemCount: _favorites.length,
              itemBuilder: (context, index) {
                String title = _favorites[index];
                Webtoon? webtoon = _getWebtoonByTitle(title); // Fetch webtoon

                return Card(
                  elevation: 4, // Shadow for card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  margin: EdgeInsets.symmetric(
                      vertical: 8, horizontal: 16), // Space between cards
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8), // Rounded image
                      child: Image.network(
                        webtoon?.thumbnail ?? '', // Safely handle null
                        width: 60,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      if (webtoon != null) {
                        // Webtoon found, navigate to detail screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(webtoon: webtoon),
                          ),
                        );
                      } else {
                        // Webtoon not found, show a snackbar message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Webtoon not found')),
                        );
                      }
                    },
                  ),
                );
              },
            ),
    );
  }
}
