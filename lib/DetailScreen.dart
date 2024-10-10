import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webtoon_explorer/constant_data.dart';

class DetailScreen extends StatefulWidget {
  final Webtoon webtoon;

  DetailScreen({required this.webtoon});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double _rating = 0.0;

  @override
  void initState() {
    super.initState();
    _loadRating();
  }

  Future<void> _loadRating() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _rating =
          prefs.getDouble(widget.webtoon.title) ?? 0.0; // Load existing rating
    });
  }

  Future<void> _saveRating(double rating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(widget.webtoon.title, rating); // Save rating by title
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFavorite = !(prefs.getBool(widget.webtoon.title + '_favorite') ??
        false); // Toggle favorite status

    if (isFavorite) {
      // If it is being added to favorites
      await prefs.setBool(
          widget.webtoon.title + '_favorite', true); // Save favorite status
    } else {
      // If it is being removed from favorites
      await prefs.setBool(
          widget.webtoon.title + '_favorite', false); // Remove from favorites
      // Optionally, you can also clear the rating if desired
      await prefs
          .remove(widget.webtoon.title); // Remove the rating as well if desired
    }

    // Update local webtoon state
    setState(() {
      widget.webtoon.isFavorite =
          isFavorite; // Update the local isFavorite state
    });

    // Show a snackbar to confirm the action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            isFavorite ? 'Added to favorites!' : 'Removed from favorites!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.webtoon.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.webtoon.thumbnail),
            SizedBox(height: 10),
            Text(widget.webtoon.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Rate this Webtoon:', style: TextStyle(fontSize: 18)),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40.0,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating; // Update the rating
                });
                _saveRating(rating); // Save the rating
              },
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _toggleFavorite, // Toggle favorite on tap
              child: Icon(
                widget.webtoon.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 40,
                color: widget.webtoon.isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
