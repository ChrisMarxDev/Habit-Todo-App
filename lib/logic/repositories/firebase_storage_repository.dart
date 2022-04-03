import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
@singleton
class FirebaseStorageRepository {
  // ignore: unused_field
  final FirebaseStorage _storage;

  FirebaseStorageRepository({required FirebaseStorage storage})
      : _storage = storage;

  // Future<String> uploadImageToFirebase(String fileName, File file) async {
  //   final uploadFile = File(file.path);
  //
  //   final firebaseStorageRef =
  //       FirebaseStorage.instance.ref().child('profileImages/$fileName.jpg');
  //   final uploadTask = firebaseStorageRef.putFile(uploadFile);
  //   final taskSnapshot = await uploadTask;
  //   return taskSnapshot.ref.getDownloadURL();
  // }
}
