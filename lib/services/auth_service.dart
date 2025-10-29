import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_sign_in/google_sign_in.dart'; // Temporalmente deshabilitado
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn(); // Temporalmente deshabilitado

  // Obtener usuario actual
  User? get currentUser => _auth.currentUser;

  // Stream del estado de autenticación
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Registro con email y contraseña
  Future<UserModel?> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // Crear usuario en Firebase Auth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Crear documento de usuario en Firestore
      final userModel = UserModel(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
        createdAt: DateTime.now(),
      );

      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toFirestore());

      return userModel;
    } on FirebaseAuthException catch (e) {
      print('Error al registrar usuario: ${e.message}');
      return null;
    } catch (e) {
      print('Error desconocido: $e');
      return null;
    }
  }

  // Login con email y contraseña
  Future<UserModel?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Obtener datos del usuario desde Firestore
      DocumentSnapshot doc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (doc.exists) {
        return UserModel.fromFirestore(doc);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      print('Error al iniciar sesión: ${e.message}');
      return null;
    } catch (e) {
      print('Error desconocido: $e');
      return null;
    }
  }

  // Login con Google - TEMPORALMENTE DESHABILITADO
  Future<UserModel?> signInWithGoogle() async {
    print('Google Sign-In está temporalmente deshabilitado');
    return null;
    
    /* CÓDIGO ORIGINAL - Requiere actualización de API
    try {
      // Iniciar proceso de autenticación con Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // Usuario canceló el login

      // Obtener credenciales de autenticación
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Crear credencial para Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Iniciar sesión en Firebase
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Verificar si es un usuario nuevo
      final userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (!userDoc.exists) {
        // Crear nuevo documento de usuario
        final userModel = UserModel(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email ?? '',
          name: userCredential.user!.displayName ?? 'Usuario',
          createdAt: DateTime.now(),
        );

        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userModel.toFirestore());

        return userModel;
      } else {
        return UserModel.fromFirestore(userDoc);
      }
    } catch (e) {
      print('Error al iniciar sesión con Google: $e');
      return null;
    }
    */
  }

  // Cerrar sesión
  Future<void> signOut() async {
    try {
      // await _googleSignIn.signOut(); // Temporalmente deshabilitado
      await _auth.signOut();
    } catch (e) {
      print('Error al cerrar sesión: $e');
    }
  }

  // Obtener datos del usuario
  Future<UserModel?> getUserData(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserModel.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      print('Error al obtener datos del usuario: $e');
      return null;
    }
  }

  // Actualizar datos del usuario
  Future<void> updateUserData(UserModel user) async {
    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .update(user.toFirestore());
    } catch (e) {
      print('Error al actualizar datos del usuario: $e');
    }
  }
}

