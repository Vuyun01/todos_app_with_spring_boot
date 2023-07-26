import 'dart:convert';

import '../models/todotask.dart';
import 'package:http/http.dart' as http;

import 'ap_constant.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper _instance = ApiHelper._();

  static ApiHelper instance() => _instance;

  Future<List<ToDoTask>?> getAllTasks() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final extracted = json.decode(response.body) as List;
      // print(extracted[0]);
      return extracted.map((e) => ToDoTask.fromMap(e)).toList();
    } else {
      print("Something went wrong");
    }
    return null;
  }

  Future<ToDoTask?> getTaskById(int id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return ToDoTask.fromJson(response.body);
    } else {
      print("Something went wrong");
    }
    return null;
  }

  Future<int> deleteTask(int id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      print(response.body);
      return 1;
    }
    return 0;
  }

  Future<int> deleteAll() async {
    final url = Uri.parse(baseUrl);
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      print('Deleted all records');
      return 1;
    }
    return 0;
  }

  Future<int> addTask(ToDoTask task) async {
    final url = Uri.parse(baseUrl);
    final body = task.toJson(); //define body
    final header = {
      'Content-Type':
          'application/json' //define header with body type which server will process
    };

    final response = await http.post(url, body: body, headers: header);
    print(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      //201 means the request has been fulfilled and the resourse will be created
      print(response.body);
      return 1;
    }
    return 0;
  }

  Future<int> updateTask(ToDoTask task, int id) async {
    final url = Uri.parse('$baseUrl/$id');
    final body = task.toJson(); //define body
    final header = {
      'Content-Type':
          'application/json' //define header with body type which server will process
    };

    final response = await http.put(url, body: body, headers: header);
    if (response.statusCode == 201 || response.statusCode == 200) {
      //201 means the request has been fulfilled and the resourse will be created
      print(response.body);
      return 1;
    }
    return 0;
  }
}
