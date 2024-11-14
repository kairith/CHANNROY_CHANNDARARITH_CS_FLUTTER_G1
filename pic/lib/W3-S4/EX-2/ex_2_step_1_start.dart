import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite Cards"),
        ),
        body: _FavoriteCards(),
      ),
    );
  }
}

class _FavoriteCards extends StatefulWidget {
  @override
  _FavoriteCardsState createState() => _FavoriteCardsState();
}

class _FavoriteCardsState extends State<_FavoriteCards> {
  // List to hold the favorite status of each card
  List<bool> favoriteStatus = [false, false, false];

  void toggleFavorite(int index) {
    setState(() {
      favoriteStatus[index] = !favoriteStatus[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteStatus.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(
              'Title $index',
              style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Description $index'),
            trailing: IconButton(
              icon: Icon(
                favoriteStatus[index] ? Icons.favorite : Icons.favorite_border,
                color: favoriteStatus[index] ? Colors.red : Colors.grey,
              ),
              onPressed: () => toggleFavorite(index),
            ),
          ),
        );
      },
    );
  }
}
