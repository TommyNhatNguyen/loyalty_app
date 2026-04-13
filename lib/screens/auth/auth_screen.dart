import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/themes/app_colors.dart';

class AuthScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final GoRouterState goRouterState;

  const AuthScreen({
    super.key,
    required this.navigationShell,
    required this.goRouterState,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      initialIndex: widget.navigationShell.currentIndex,
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(covariant AuthScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_tabController.index != widget.navigationShell.currentIndex) {
      _tabController.animateTo(widget.navigationShell.currentIndex);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildHeader(context, widget.goRouterState),
              const SizedBox(height: 16),
              _buildTabs(context),
              const SizedBox(height: 16),
              Expanded(child: widget.navigationShell),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabs(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mutedText.withAlpha(50),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(4),
      child: TabBar(
        controller: _tabController,
        onTap: (index) => widget.navigationShell.goBranch(index),
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: AppColors.deepNavy,
          borderRadius: BorderRadius.circular(12),
        ),
        splashBorderRadius: BorderRadius.circular(12),
        unselectedLabelColor: AppColors.mutedText,
        labelColor: AppColors.lightSurface,
        unselectedLabelStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        labelStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        tabs: const [
          Tab(text: "Sign In"),
          Tab(text: "Register"),
        ],
      ),
    );
  }
}

Widget _buildHeader(BuildContext context, GoRouterState goRouterState) {
  final isSignIn = goRouterState.uri.path == "/sign-in";
  return Center(
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.deepNavy,
          ),
          child: Icon(CupertinoIcons.circle, color: AppColors.brandGold),
        ),
        const SizedBox(height: 8),
        Text(
          "LoyaltyPOS",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.deepNavy,
          ),
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 250),
          child: Text(
            isSignIn
                ? "Sign in to your account to continue"
                : "Create an account to get started",
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.mutedText),
          ),
        ),
      ],
    ),
  );
}
