import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:streamscape/constants.dart';
import 'package:streamscape/services/storage_service.dart';
import 'package:streamscape/utils/error_handler.dart';
import 'package:streamscape/widgets/custom_snackbar.dart';

class AuthService {
  final StorageService storageService = StorageService();

  Future<bool> signup(
    BuildContext ctx,
    String displayName,
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/v1/users/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'displayName': displayName,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        if (body["status"] == "success") {
          final String token = body["token"];
          await storageService.set(jwtKey, token);

          CustomSnackBar.showSnackBar(ctx, "Account created successfully");
          return true;
        } else {
          ErrorHandler.handleError(ctx, response, "Storage permission denied!");
          return false;
        }
      } else {
        ErrorHandler.handleError(ctx, response, "Unexpected error occurred");
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> signin(BuildContext ctx, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/v1/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);
        if (body["status"] == "success") {
          final String token = body["token"];
          await storageService.set(jwtKey, token);

          CustomSnackBar.showSnackBar(ctx, "Signed in successfully");
          return true;
        } else {
          ErrorHandler.handleError(ctx, response, "Storage permission denied!");
          return false;
        }
      } else {
        ErrorHandler.handleError(ctx, response, "Unexpected error occurred");
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
