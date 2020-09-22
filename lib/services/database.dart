import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference healthData =
      FirebaseFirestore.instance.collection('healthAndLocation');

  Future updateUserData(
      double heartRate, double temp, double latitude, double longitude) async {
    return await healthData.doc(uid).set({
      'heartRate': heartRate,
      'temperature': temp,
      'latitude': latitude,
      'longitude': longitude,
    });
  }

  Stream<QuerySnapshot> get healthAndLocation {
    return healthData.snapshots();
  }
}
