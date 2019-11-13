import 'package:http/http.dart';

import 'hero.dart';
import 'dart:async';
import 'dart:convert';


class HeroService {
  static const _heroesUrl = 'api/heroes';
  final Client _http;

  HeroService(this._http);


  Future<List<Hero>> getAll() async {
    try {
      final response = await _http.get(_heroesUrl);
      print((_extractData(response) as List));
      final heroes = (_extractData(response) as List)
        .map((json) => Hero.fromJson(json))
        .toList();
      print('Http data loaded successfully');
      return heroes;
    } catch(e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e);
    return Exception('Server error; casse: $e');
  }

  Future<List<Hero>> getAllSlowly() {
    return Future.delayed(Duration(seconds: 1), getAll);
  }

  Future<Hero> get(int id) async {
    try {
      final response = await _http.get('$_heroesUrl/$id');
      return Hero.fromJson(_extractData(response));
    } catch(e) {
      throw _handleError(e);
    }
  }
} 