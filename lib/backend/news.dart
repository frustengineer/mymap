import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<Map<String, dynamic>> news = [];
Future<List<Map<String, dynamic>>> fetchNewsData() async {
  final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?q=india&apiKey=0e731526363d42d681164cf860a372ae');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status'] == 'ok') {
      print('object');
      news = List<Map<String, dynamic>>.from(jsonResponse['articles']);
      return news;

      print(news[2]['title']);
    } else {
      print('Error: ${jsonResponse['message']}');
      return news;
    }
  } else {
    print('Request failed with status: ${response.statusCode}');
    return news;
  }
}
