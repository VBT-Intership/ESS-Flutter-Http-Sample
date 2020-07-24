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
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                print(index);
                return Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        users[index]["avatar"],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
