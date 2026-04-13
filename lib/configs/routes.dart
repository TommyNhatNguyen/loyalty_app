import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:loyalty_app/blocs/auth/sign_in/sign_in_bloc.dart';
import 'package:loyalty_app/blocs/member/member_bloc.dart';
import 'package:loyalty_app/blocs/member/member_register/member_register_bloc.dart';
import 'package:loyalty_app/https/http.dart';
import 'package:loyalty_app/screens/auth/auth_screen.dart';
import 'package:loyalty_app/screens/auth/register_screen.dart';
import 'package:loyalty_app/screens/auth/sign_in_screen.dart';
import 'package:loyalty_app/screens/home/history_screen.dart';
import 'package:loyalty_app/screens/home/home_layout_screen.dart';
import 'package:loyalty_app/screens/home/home_screen.dart';
import 'package:loyalty_app/screens/home/profile_screen.dart';
import 'package:loyalty_app/screens/home/promo_screen.dart';
import 'package:loyalty_app/screens/test_page.dart';

// GoRouter configuration
final router = GoRouter(
  redirect: (context, state) async {
    if (state.uri.path == '/') {
      final token = await storage.read(key: 'accessToken');
      if (token != null && token.isNotEmpty && !Jwt.isExpired(token)) {
        return '/home';
      }
      return '/sign-in';
    }
    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => const TestPage()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeLayoutScreen(
          navigationShell: navigationShell,
          goRouterState: state,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/promo',
              builder: (context, state) => const PromoScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/history',
              builder: (context, state) => const HistoryScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) {
                return BlocProvider(
                  create: (context) => MemberBloc(),
                  child: ProfileScreen(),
                );
              },
            ),
          ],
        ),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AuthScreen(
          navigationShell: navigationShell,
          goRouterState: state,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/sign-in',
              pageBuilder: (context, state) => NoTransitionPage(
                child: BlocProvider(
                  create: (context) => SignInBloc(),
                  child: const SignInScreen(),
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/register',
              pageBuilder: (context, state) => NoTransitionPage(
                child: BlocProvider(
                  create: (context) => MemberRegisterBloc(),
                  child: const RegisterScreen(),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(path: '/error', builder: (context, state) => const TestPage()),
  ],
);
