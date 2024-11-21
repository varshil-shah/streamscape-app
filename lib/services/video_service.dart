import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:streamscape/services/storage_service.dart';
import '../models/video_model.dart';
import '../constants.dart';

class VideoService {
  Future<List<VideoModel>> getVideos() async {
    final StorageService storageService = StorageService();
    final token = await storageService.get(jwtKey);

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/v1/videos'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['status'] == 'success') {
          final List<dynamic> videos = responseData['data']['videos'];
          print(videos.toString());
          return videos.map((video) => VideoModel.fromJson(video)).toList();
        } else {
          throw Exception('API returned unsuccessful status');
        }
      } else {
        throw Exception('Failed to load videos');
      }
    } catch (e) {
      throw Exception('Failed to load videos: $e');
    }
  }
}
