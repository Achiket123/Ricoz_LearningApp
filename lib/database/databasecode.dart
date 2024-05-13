import 'dart:async';
import 'dart:developer';

class UserDatabase {
  static List<String> existingPhoneNumbers = ['8984180575'];

  static Future<bool> getUserByPhoneNumber(String phoneNumber) async {
    return existingPhoneNumbers.contains(phoneNumber);
  }

  static Future<void> addUser(String phoneNumber) async {
    if (!existingPhoneNumbers.contains(phoneNumber)) {
      existingPhoneNumbers.add(phoneNumber);
      log('User added with phone number: $phoneNumber');
    } else {
      log('User with phone number $phoneNumber already exists.');
    }
  }
}
