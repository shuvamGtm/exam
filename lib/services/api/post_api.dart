import 'package:api_test/model/posts_model.dart';
import 'package:dio/dio.dart';

const String baseUrl = "https://jsonplaceholder.typicode.com";
const String postUrl = "/posts";
Dio dio = Dio();

Future<List<PostModel>> getPost() async {
  Response res = await dio.get(baseUrl + postUrl);

  List<dynamic> rawData = res.data;

  return rawData.map((e) => PostModel.fromJson(e)).toList();
}
