import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PeopleScannedScreen extends StatelessWidget {
  static const String id = 'people_scanned_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('People Scanned'),
        ),
        body: PeopleList(),
      ),
    );
  }
}

class PeopleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference est =
        FirebaseFirestore.instance.collection('establishments');

    return FutureBuilder<QuerySnapshot>(
        future: est.where('name', isEqualTo: 'sample_company').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final doc = snapshot.data.docs.first;
            final people = doc.data()['sc_people'];
            return ListView(
              children: [
                ...people.map((item) {
                  return FutureBuilder(
                      future: item['person'].get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          final data = snapshot.data.data();
                          final name = data['fullName'];
                          final timeStamp = item['sc_time'].seconds;
                          var date = DateTime.fromMillisecondsSinceEpoch(
                              timeStamp * 1000);

                          final formattedDate = date.toString().split(".")[0];
                          return ListTile(
                            title: Text(name),
                            subtitle: Text(formattedDate),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 35,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      });
                })
              ],
            );
          }
          return Text('');
        });
  }
}
