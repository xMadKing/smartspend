import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart'; //external library

class User {
  final String name;
  final String passcode; // not a very secure way to store a password, idk if this is ok
  bool newUser;

  User({required this.name, required this.passcode, required this.newUser});

  getName(){
    return name;
  }

  isNew(){
    return newUser;
  }

  getPasscode(){
    return passcode;
  }

}