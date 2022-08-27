import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/modules/user/user.dart';

class UserService {
  UserService._();

  static final UserService _userService = UserService._();

  static UserService get instance => _userService;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Either<Failure, UserCredential>> loginUser({
    required LoginModel model,
  }) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      final user = credentials.user;
      if (user != null) {
        return Right(credentials);
      } else {
        return const Left(Failure());
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, UserCredential>> registerUser({
    required SignUpModel model,
  }) async {
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      final user = credentials.user;
      if (user != null) {
        await user.updateDisplayName(model.name);
        return Right(credentials);
      } else {
        return const Left(Failure());
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Either<Failure, User> getCurrentUser() {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        return Right(user);
      } else {
        return const Left(Failure());
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Stream<User?> get userStream => _firebaseAuth.userChanges();

  Future<Either<Failure, User>> changePassword({
    required String newPassword,
  }) async {
    try {
      return getCurrentUser().fold(Left.new, (user) async {
        await user.updatePassword(newPassword);
        return Right(user);
      });
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, User>> updateProfile({
    required SignUpModel model,
  }) async {
    try {
      return getCurrentUser().fold(Left.new, (user) async {
        if (model.name.isNotEmpty) {
          await user.updateDisplayName(model.name);
        }
        if (model.email.isNotEmpty) {
          await user.updateEmail(model.email);
        }
        return Right(user);
      });
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  void signOutUser() => _firebaseAuth.signOut();
}
