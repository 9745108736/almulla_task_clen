import 'package:encrypt/encrypt.dart';

class EncryptData {
//for AES Algorithms

  static Encrypted? encrypted;
  static var decrypted;

  String? encryptAES({plainText, encryptionKey}) {
    // final key = Key.fromUtf8(encryptionKey);
    final key = Key.fromUtf8("This 32 char key have 256 bits..");

    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    encrypted = encrypter.encrypt(plainText, iv: iv);
    print(encrypted!.base64);
    return encrypted!.base64;
  }

  String? decryptAES({plainText, encryptionKey}) {
    final key = Key.fromUtf8(encryptionKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    decrypted = encrypter.decrypt(encrypted!, iv: iv);
    print(decrypted);
    return decrypted;
  }
}
