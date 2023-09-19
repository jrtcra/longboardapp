import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:longboardapp/services/auth.dart';
import 'package:longboardapp/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Style>> getStyles() async {
    var ref = _db.collection('Styles');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var styles = data.map((d) => Style.fromJson(d));
    return styles.toList();
  }

  Future<Trick> getTrick(String trickId) async {
    var ref = _db.collection('Tricks').doc(trickId);
    var snapshot = await ref.get();
    return Trick.fromJson(snapshot.data() ?? {});
  }

  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('reports').doc(user.uid);
        return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([Report()]);
      }
    });
  }

  Future<void> updateUserReport(Trick trick) {
    var user = AuthService().user!;
    var ref = _db.collection('reports').doc(user.uid);

    var data = {
      'total': FieldValue.increment(1),
      'Styles': {
        trick.style: FieldValue.arrayUnion([trick.id])
      }
    };
    return ref.set(data, SetOptions(merge: true));
  }
}
