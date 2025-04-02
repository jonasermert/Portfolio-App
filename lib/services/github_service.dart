import 'package:graphql_flutter/graphql_flutter.dart';
import '../../config/env.dart';
import '../../models/project.dart';

class GitHubService {
  static Future<List<Project>> fetchPinnedRepositories() async {
    final String query = '''
    {
      user(login: "${Env.githubUsername}") {
        pinnedItems(first: 6, types: REPOSITORY) {
          nodes {
            ... on Repository {
              name
              description
              url
              stargazerCount
              primaryLanguage {
                name
              }
            }
          }
        }
      }
    }
    ''';

    final HttpLink link = HttpLink(
      'https://api.github.com/graphql',
      defaultHeaders: {
        'Authorization': 'Bearer ${Env.githubToken}',
      },
    );

    final GraphQLClient client =
        GraphQLClient(link: link, cache: GraphQLCache());
    final QueryResult result =
        await client.query(QueryOptions(document: gql(query)));

    if (result.hasException) {
      print(result.exception.toString());
      return [];
    }

    return (result.data?['user']['pinnedItems']['nodes'] ?? [])
        .map<Project>((repo) => Project.fromJson(repo))
        .toList();
  }
}
