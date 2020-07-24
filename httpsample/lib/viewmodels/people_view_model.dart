import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:httpsample/models/people_model.dart';
import 'package:httpsample/models/person_model.dart';
import 'package:httpsample/view/people_view.dart';
import 'package:http/http.dart' as http;

abstract class PeopleViewModel extends State<PeopleView> {
  List users = [];
  final String BASE_URL = "https://reqres.in/";
  //final String BASE_URL = "https://hwasampleapi.firebaseio.com//";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPeople();
  }

  Future<void> getPeople() async {
    //final response = await http.get(BASE_URL + "http.json");
    final response = await http.get(BASE_URL + "api/users?page=2");
    print(response.statusCode);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        List _users = [];
        users = jsonBody["data"];
        if (jsonBody["data"] is List) {
          _users = jsonBody["data"];
          users = _users;
          for (var user in users) {
            print(user["first_name"]);
          }
        }
        break;
      default:
    }
  }
}
