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
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                print(index);
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
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
