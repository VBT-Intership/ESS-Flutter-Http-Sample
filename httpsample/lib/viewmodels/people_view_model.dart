import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:httpsample/view/people_view.dart';
import 'package:http/http.dart' as http;

abstract class PeopleViewModel extends State<PeopleView> {
  List users = [];
  final String BASE_URL = "https://reqres.in/";

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPeople();
  }

  Future<void> getPeople() async {
    isLoadingChange();
    final response = await http.get(BASE_URL + "api/users?page=2");
    print(response.statusCode);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody["data"] is List) {
          users = jsonBody["data"];
          print(users[0]["avatar"]);
        }
        break;
      default:
    }
    isLoadingChange();
  }

  void isLoadingChange() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
