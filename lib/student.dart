import 'package:flutter/cupertino.dart';

@immutable
class Student {
  Student(this.name, this.age);

  Student copyWith({String? name, int? age}) {
    return Student(name ?? this.name, age ?? this.age);
  }

  final String name;
  final int age;

}
