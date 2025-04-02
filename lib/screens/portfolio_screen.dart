import 'package:flutter/material.dart';
import 'package:portfolio/services/github_service.dart';
import 'package:portfolio/models/project.dart';
import '../../config/theme.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  List<Project> projects = [];

  @override
  void initState() {
    super.initState();
    GitHubService.fetchPinnedRepositories().then((repos) {
      setState(() => projects = repos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mein Portfolio"),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: ThemeManager.toggleTheme,
          ),
        ],
      ),
      body: ListView(),
    );
  }
}
