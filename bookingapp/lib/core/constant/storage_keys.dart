/// Keys Used to Save Data to LocalStorage
enum StorageKeys {
  isLoggedInKey,
  loginResponseKey,
  usernameKey,
  firebaseTokenKey
}

extension StorageKeysExtension on StorageKeys {
  String? get key {
    switch (this) {
      case StorageKeys.isLoggedInKey:
        return 'isLoggedIn';
         case StorageKeys.firebaseTokenKey:
        return 'firebaseTokenKey';
      case StorageKeys.loginResponseKey:
        return 'LoginResponse';
      case StorageKeys.usernameKey:
        return 'username';
      default:
        return null;
    }
  }
}
