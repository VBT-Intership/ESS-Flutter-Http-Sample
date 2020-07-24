import 'package:flutter/material.dart';
import 'package:httpsample/viewmodels/people_view_model.dart';

class PeopleViewView extends PeopleViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP DENEME"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            visible: isLoading,
            child: CircularProgressIndicator(),
          ),
          buildPeopleList(),
        ],
      ),
    );
  }

  Expanded buildPeopleList() {
    return Expanded(
      flex: 5,
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return buildPeopleCard(index, context);
        },
      ),
    );
  }

  Padding buildPeopleCard(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            buildPersonAvatarImage(index),
            buildPeopleInformation(index, context)
          ],
        ),
      ),
    );
  }

  Column buildPeopleInformation(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPeopleNameSurname(index, context),
        buildPeopleEmail(index, context),
      ],
    );
  }

  Padding buildPeopleEmail(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        users[index]["email"],
        style: Theme.of(context).primaryTextTheme.bodyText2.copyWith(
              color: Colors.black,
            ),
      ),
    );
  }

  Padding buildPeopleNameSurname(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        users[index]["first_name"] + " " + users[index]["last_name"],
        style: Theme.of(context).primaryTextTheme.headline6.copyWith(
              color: Colors.black,
            ),
      ),
    );
  }

  Padding buildPersonAvatarImage(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(users[index]["avatar"]),
      ),
    );
  }
}
