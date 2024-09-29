//'https://min-api.cryptocompare.com/data/pricemulty?fsyms=BTC,ETH,BNB,AVA&t'
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_1/main.dart';
//'https://min-api.cryptocompare.com/data/pricemulty?fsyms=BTC,ETH,BNB,AVA&t'

Future<List> getProjectlist() async {
  try {
    final response =
        await Dio().get('https://api-nodejs-todolist.herokuapp.com/task');

    // Проверяем успешность запроса
    if (response.statusCode == 200) {
      // Проверяем структуру данных в ответе
      if (response.data['tasks'] is List) {
        // Если данные по задачам представлены в виде списка
        return (response.data['tasks'] as List)
            .map((projectData) => Project.fromJson(projectData))
            .toList();
      } else {
        debugPrint('Tasks is not a List or does not exist');
        return []; // Возвращаем пустой список
      }
    } else {
      throw Exception(
          'Failed to load projects, status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching projects: $e'); // Обработка ошибок
  }
}
