// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:moviecatalog/menu-drawer.dart';
import 'data.dart'; // Importing the movie data

class GenreScreen extends StatelessWidget {
  final String genre;

  const GenreScreen({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    // Filter movies based on the selected genre
    List<Movie> filteredMovies =
        movies.where((movie) => movie.genre.contains(genre)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$genre Genre',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(12, 41, 65, 1),
      ),
      drawer: const MenuDrawer(),
      backgroundColor: const Color(0xFF00050D),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search by name',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Minimum Rating',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Maximum Rating',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 40,
              padding: const EdgeInsets.all(10),
              children: filteredMovies.map((movie) {
                return _buildPhotoListItem(
                  imageUrl: movie.moviePhotoLink,
                  description: movie.movieName,
                  rating: movie.rating,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoListItem({
    required String imageUrl,
    required String description,
    double? rating,
  }) {
    return Container(
      height: 200,
      width: 200,
      child: Card(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              height: 110,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(color: Colors.white),
            ),
            if (rating != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
