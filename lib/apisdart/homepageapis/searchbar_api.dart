import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:learningapp/database/databaseapi.dart';

class BookSearch extends StatefulWidget {
  @override
  _BookSearchState createState() => _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];

  void _searchBooks(String query) async {
    try {
      final response = await http.get(Uri.parse(DatabaseApi.books));
      if (response.statusCode == 200) {
        setState(() {
          _searchResults = json.decode(response.body)['books'];
        });
      } else {
        // Handle error
        log('Failed to load search results');
      }
    } catch (e) {
      // Handle error
      log('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(Icons.search, color: Color(0xFF7D7CC9)),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search...',
                ),
                onSubmitted: _searchBooks,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
