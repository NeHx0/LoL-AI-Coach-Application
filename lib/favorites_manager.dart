import 'package:flutter/material.dart';

class FavoritesManager extends ChangeNotifier {
  static final FavoritesManager _instance = FavoritesManager._internal();
  factory FavoritesManager() => _instance;
  FavoritesManager._internal();

  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => List.unmodifiable(_favorites);

  bool isFavorite(String championId) {
    return _favorites.any((champion) => champion['championId'] == championId);
  }

  void addToFavorites(Map<String, dynamic> championData) {
    if (!isFavorite(championData['championId'])) {
      _favorites.add({
        'name': championData['name'],
        'championId': championData['championId'],
        'role': championData['role'],
        'difficulty': championData['difficulty'],
        'winRate': championData['winRate'],
        'pickRate': championData['pickRate'],
        'banRate': championData['banRate'],
        'addedDate': DateTime.now(),
      });
      notifyListeners();
    }
  }

  void removeFromFavorites(String championId) {
    _favorites.removeWhere((champion) => champion['championId'] == championId);
    notifyListeners();
  }

  void toggleFavorite(Map<String, dynamic> championData) {
    if (isFavorite(championData['championId'])) {
      removeFromFavorites(championData['championId']);
    } else {
      addToFavorites(championData);
    }
  }

  void clearAllFavorites() {
    _favorites.clear();
    notifyListeners();
  }

  int get favoriteCount => _favorites.length;
}
