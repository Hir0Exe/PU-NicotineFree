import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _currentUser;
  bool _isLoading = false;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _currentUser != null;

  // Escuchar cambios en el estado de autenticación
  void initAuthListener() {
    _authService.authStateChanges.listen((User? user) async {
      if (user != null) {
        _currentUser = await _authService.getUserData(user.uid);
      } else {
        _currentUser = null;
      }
      notifyListeners();
    });
  }

  // Registro con email y contraseña
  Future<bool> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      _currentUser = await _authService.signUpWithEmail(
        email: email,
        password: password,
        name: name,
      );

      _isLoading = false;
      notifyListeners();
      return _currentUser != null;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Login con email y contraseña
  Future<bool> signInWithEmail({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      _currentUser = await _authService.signInWithEmail(
        email: email,
        password: password,
      );

      _isLoading = false;
      notifyListeners();
      return _currentUser != null;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Login con Google
  Future<bool> signInWithGoogle() async {
    _isLoading = true;
    notifyListeners();

    try {
      _currentUser = await _authService.signInWithGoogle();

      _isLoading = false;
      notifyListeners();
      return _currentUser != null;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Cerrar sesión
  Future<void> signOut() async {
    await _authService.signOut();
    _currentUser = null;
    notifyListeners();
  }

  // Actualizar datos del usuario
  Future<void> updateUser(UserModel user) async {
    await _authService.updateUserData(user);
    _currentUser = user;
    notifyListeners();
  }

  // Refrescar datos del usuario
  Future<void> refreshUser() async {
    if (_authService.currentUser != null) {
      _currentUser =
          await _authService.getUserData(_authService.currentUser!.uid);
      notifyListeners();
    }
  }
}
