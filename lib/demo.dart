import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Document ID in Flutter'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('categories').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text('No documents found.');
          }

          var documents = snapshot.data?.docs;
          List<Widget> items = [];

          for (var document in documents!) {
            var data = document.data() as Map<String, dynamic>;
            var documentId = document.id; // Access the document ID
            items.add(ListTile(
              title: Text('ID: $documentId'),
              subtitle: Text(data['field1']),
            ));
          }

          return ListView(
            children: items,
          );
        },
      ),
    );
  }
}
