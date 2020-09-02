import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/models/tea.dart';
import 'package:firebase_project/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference teaCollection =
      Firestore.instance.collection('Tea');

  Future updateUserData(String sugars, String name, int strength) async {
    return await teaCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // tea lost from snapshot
  List<Tea> _teaListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(
      (doc) {
        return Tea(
            name: doc.data['name'] ?? '',
            strength: doc.data['strength'] ?? 0,
            sugars: doc.data['sugars'] ?? '0');
      },
    ).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );
  }

  // get tea stream

  Stream<List<Tea>> get tea {
    return teaCollection.snapshots().map(_teaListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return teaCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
