import 'package:flutter/material.dart';
import 'package:httpsample/viewmodels/people_view_model.dart';

class PeopleViewView extends PeopleViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP DENEME"),
      ),
      body: FloatingActionButton(onPressed: () => {getPeople()}),
    );
  }
}
