import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class JobsPublisher {
  JobsPublisher(this.id, this.cname,this.location,this.salary,this.imageUrl,this.time,this.position,this.date);
  final String id;
  final String cname;
  final String location;
  final String salary;
  final String imageUrl;
  final String time;
  final String date;
  final String position;
  factory JobsPublisher.fromJson(Map<String, dynamic> parsedJson) {
    return JobsPublisher(
      parsedJson['id'].toString(),
      parsedJson['cname'].toString(),
      parsedJson['location'].toString(),
      parsedJson['salary'].toString(),
      parsedJson['imageUrl'].toString(),
      parsedJson['time'].toString(),
      parsedJson['position'].toString(),
      parsedJson['date'].toString(),
    );
  }
}
