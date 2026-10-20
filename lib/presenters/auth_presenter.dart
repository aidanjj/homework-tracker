import '../models/auth_model.dart';

class AuthPresenter {
  final AuthModel _authModel = AuthModel();

  Future<String?> login(String email, String password) async {
    return await _authModel.login(email, password);
  }

  Future<String?> signUp(String email, String password) async {
    return await _authModel.signUp(email, password);
  }

  Future<String?> resetPassword(String email) async {
    return await _authModel.resetPassword(email);
  }

  Future<void> logout() => _authModel.signOut();

  Stream getAuthStateChanges() => _authModel.authStateChanges;

  String? getCurrentUserEmail() => _authModel.currentUser?.email;
}