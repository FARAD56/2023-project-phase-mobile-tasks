import 'package:flutter/material.dart';

@immutable
class Failure {
  final String message;

  const Failure({required this.message});
}

class ServerException extends Failure {
  const ServerException({required super.message});
}

class CacheException extends Failure {
  const CacheException({required super.message});
}
