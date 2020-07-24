import 'package:flutter/material.dart';
import 'package:httpsample/models/people_model.dart';
import 'package:httpsample/view/people_view.dart';

abstract class PeopleViewModel extends State<PeopleView> {
  List<PeopleModel> people = [];
}
