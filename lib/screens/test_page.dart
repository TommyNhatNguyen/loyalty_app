import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/screens/home_screen.dart';
import 'package:loyalty_app/screens/profile_screen.dart';

List<Map<String, dynamic>> routes = [
  {"path": "/", "widget": TestPage()},
  {"path": "/home", "widget": HomeScreen()},
  {"path": "/profile", "widget": ProfileScreen()},
  {"path": "/sign-in", "widget": "Auth screen"},
];

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: routes.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () => context.push(routes[index]['path']),
          child: Container(
            height: 50,
            color: Colors.amber.withAlpha((index + 1) * 50),
            child: Center(child: Text('Entry ${routes[index]['widget']}')),
          ),
        );
      },
    );
  }
}
