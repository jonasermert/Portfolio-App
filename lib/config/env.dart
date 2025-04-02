import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get githubUsername => dotenv.env['GITHUB_USERNAME'] ?? '';
  static String get githubToken => dotenv.env['GITHUB_TOKEN'] ?? '';
}
