


import 'package:movies_app/core/Network/error_message_model.dart';

class ServerException implements Exception{

  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});


}