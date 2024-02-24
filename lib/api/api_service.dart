import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio();
  Future<void> signUpUser(
    String? idToken,
    String? uuid,
    String name,
    String password,
    String email,
    String image,
    String phoneNumber,
  ) async {
    try {
      final response = await dio.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCRDE0zjAD6NwsM3e-rAsr8b_PtlBD0kog',
        options: Options(contentType: "text/plain"),
        data: {
          "email": email,
          "password": password,
          "displayName": name,
          "photoUrl": image,
          "phoneNumber": phoneNumber,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        // ignore: unused_local_variable
        final String? idToken = responseData['idToken'] as String?;
        final String? localId = responseData['localId'] as String?;

        // Save user data to Firestore
        await FirebaseFirestore.instance.collection('Users').doc(localId).set({
          "displayName": name,
          "email": email,
          "phoneNumber": phoneNumber,
          "photoUrl": image,
          "password":password,
        });

      } else {
        throw Exception('Failed to sign up user');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error signing up: $e');
      // ignore: use_rethrow_when_possible
      throw e; // Rethrow the error to handle it in the UI if needed
    }
  }
}
