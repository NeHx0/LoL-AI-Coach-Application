import 'dart:convert';
import 'package:http/http.dart' as http;
import 'riot_champion.dart';

class RiotApiService {
  // API KEY'İNİ BURAYA EKLE
  static const String apiKey = 'YOUR-API-HERE';

  static const String baseUrl = 'https://ddragon.leagueoflegends.com/cdn';
  static const String championUrl =
      'https://ddragon.leagueoflegends.com/cdn/13.24.1/data/en_US/champion.json';
  static const String championDetailUrl =
      'https://ddragon.leagueoflegends.com/cdn/13.24.1/data/en_US/champion';
  static const String imageUrl =
      'https://ddragon.leagueoflegends.com/cdn/13.24.1/img/champion';

  // Headers with API key
  static Map<String, String> get headers => {
        'X-Riot-Token': apiKey,
        'Content-Type': 'application/json',
      };

  // Tüm championları getir
  static Future<List<RiotChampion>> getAllChampions() async {
    try {
      // Data Dragon API key gerektirmez, bu endpoint için header'ı kaldırıyoruz
      final response = await http.get(Uri.parse(championUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final Map<String, dynamic> champions = data['data'];

        List<RiotChampion> championList = [];

        champions.forEach((key, value) {
          championList.add(RiotChampion.fromJson(value));
        });

        return championList;
      } else {
        throw Exception('Failed to load champions: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching champions: $e');
      // Fallback - boş liste döndür, hata verme
      return [];
    }
  }

  // Belirli bir champion'un detaylarını getir
  static Future<RiotChampionDetail?> getChampionDetail(
      String championId) async {
    try {
      // Data Dragon API key gerektirmez
      final response =
          await http.get(Uri.parse('$championDetailUrl/$championId.json'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final championData = data['data'][championId];
        return RiotChampionDetail.fromJson(championData);
      }
      return null;
    } catch (e) {
      print('Error fetching champion detail: $e');
      return null;
    }
  }

  // Champion resim URL'ini getir
  static String getChampionImageUrl(String championId) {
    return '$imageUrl/$championId.png';
  }

  // Champion splash art URL'ini getir
  static String getChampionSplashUrl(String championId, int skinNum) {
    return 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${championId}_$skinNum.jpg';
  }

  // Match history için API key gerekli olan endpoint örneği
  static Future<List<dynamic>> getMatchHistory(String puuid,
      {int count = 10}) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://europe.api.riotgames.com/lol/match/v5/matches/by-puuid/$puuid/ids?count=$count'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load match history: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching match history: $e');
      return [];
    }
  }

  // Summoner bilgisi için API key gerekli olan endpoint örneği
  static Future<Map<String, dynamic>?> getSummonerByName(String summonerName,
      {String region = 'tr1'}) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://$region.api.riotgames.com/lol/summoner/v4/summoners/by-name/$summonerName'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load summoner: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching summoner: $e');
      return null;
    }
  }
}
