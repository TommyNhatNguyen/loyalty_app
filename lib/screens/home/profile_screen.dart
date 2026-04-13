import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_app/blocs/member/member_bloc.dart';
import 'package:loyalty_app/blocs/member/member_event.dart';
import 'package:loyalty_app/blocs/member/member_state.dart';
import 'package:loyalty_app/dto/member_dto.dart';
import 'package:loyalty_app/themes/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MemberBloc>().add(
      MemberFetchDetailEvent(
        id: "e5642959-abe1-40a4-b452-05412cf8ba74",
        payload: MemberDetailDTO(
          include: [MemberDetailInclude.user, MemberDetailInclude.owned_stores],
        ),
      ),
    );
    return BlocBuilder<MemberBloc, MemberState>(
      builder: (context, state) {
        return Container(
          color: AppColors.surface,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                centerTitle: false,
                pinned: true,
                title: SizedBox(
                  child: Row(
                    children: [
                      Text(
                        "My Profile",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.surface,
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      _buildAvatar(context, state),
                      const SizedBox(height: 8),
                      _buildName(context, state),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _buildStats(context, state),
                      const SizedBox(height: 8),
                      _buildAccount(context, state),
                      const SizedBox(height: 8),
                      _buildInfo(context, state),
                      const SizedBox(height: 8),
                      _buildActions(context, state),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildStats(BuildContext context, MemberState state) {
  final storesCount = state.member?.owned_stores?.length ?? 0;
  return Row(
    children: [
      Expanded(
        child: Card.outlined(
          color: AppColors.lightSurface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  storesCount.toString(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.deepNavy,
                  ),
                ),
                Text(
                  "Stores managed",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.deepNavy),
                ),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        child: Card.outlined(
          color: AppColors.lightSurface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "10",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.deepNavy,
                  ),
                ),
                Text(
                  "Staff members",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.deepNavy),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildAccount(BuildContext context, MemberState state) {
  List<Map<String, dynamic>> accountItems = [
    {
      "icon": CupertinoIcons.person,
      "title": "username",
      "value": state.member?.user?.username ?? "",
      "bgColor": AppColors.border,
      "iconColor": AppColors.deepNavy,
    },
    {
      "icon": CupertinoIcons.lock,
      "title": "Password",
      "value": "********",
      "bgColor": AppColors.border,
      "iconColor": AppColors.deepNavy,
      "isPassword": true,
    },
  ];
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "Account".toUpperCase(),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.mutedText,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.lightSurface,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: accountItems
                .map(
                  (item) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.border),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: item["bgColor"],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(item["icon"], color: item["iconColor"]),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["title"]?.toString().toUpperCase() ?? "",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: AppColors.mutedText),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item["value"] ?? "",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: AppColors.deepNavy,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        if (item["isPassword"] == true)
                          OutlinedButton(
                            onPressed: () {
                              print("Change");
                            },
                            child: Text("Change"),
                          ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    ),
  );
}

Widget _buildInfo(BuildContext context, MemberState state) {
  List<Map<String, dynamic>> infoItems = [
    {
      "icon": CupertinoIcons.person_fill,
      "title": "Fullname",
      "iconColor": AppColors.deepNavy,
      "bgColor": AppColors.border,
      "value":
          "${state.member?.first_name ?? ""} ${state.member?.last_name ?? ""}",
    },
    {
      "icon": CupertinoIcons.person_fill,
      "title": "Gender",
      "iconColor": AppColors.deepNavy,
      "bgColor": AppColors.border,
      "value": state.member?.gender == 1 ? "Male" : "Female",
    },
    {
      "icon": CupertinoIcons.calendar,
      "title": "Member since",
      "iconColor": AppColors.deepNavy,
      "bgColor": AppColors.border,
      "value": DateFormat(
        "dd-MM-yyyy",
      ).format(state.member?.created_at?.toLocal() ?? DateTime.now()),
    },
  ];
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "Personal Info".toUpperCase(),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.mutedText,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.lightSurface,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: infoItems
                .map(
                  (item) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.border),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: item["bgColor"],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(item["icon"], color: item["iconColor"]),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["title"]?.toString().toUpperCase() ?? "",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: AppColors.mutedText),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item["value"] ?? "",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: AppColors.deepNavy,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        if (item["isPassword"] == true)
                          OutlinedButton(
                            onPressed: () {
                              print("Change");
                            },
                            child: Text("Change"),
                          ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    ),
  );
}

Widget _buildAvatar(BuildContext context, MemberState state) {
  final firstName = state.member?.first_name?.substring(0, 1) ?? "";
  final lastName = state.member?.last_name.substring(0, 1) ?? "";
  return CircleAvatar(
    radius: 54,
    backgroundColor: AppColors.brandGold,
    child: CircleAvatar(
      radius: 50,
      backgroundColor: AppColors.darkSurface,
      child: Text(
        "${firstName}${lastName}",
        style: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _buildName(BuildContext context, MemberState state) {
  final fullname =
      "${state.member?.first_name ?? ""} ${state.member?.last_name ?? ""}";
  return Column(
    children: [
      Text(
        fullname,
        style: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 4),
      Text(
        state.member?.email ?? "",
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: AppColors.mutedText),
      ),
      const SizedBox(height: 4),
      Chip(
        backgroundColor: AppColors.brandGold,
        side: BorderSide(color: AppColors.brandGold),
        padding: EdgeInsets.symmetric(horizontal: 16),
        avatar: Icon(CupertinoIcons.star_fill, color: AppColors.deepNavy),
        label: Text(
          "Owner",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.deepNavy,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 4),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: state.member?.user?.is_active == true
                  ? AppColors.success
                  : AppColors.error,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            state.member?.user?.is_active == true ? "Active" : "Inactive",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.mutedText),
          ),
        ],
      ),
    ],
  );
}

Widget _buildActions(BuildContext context, MemberState state) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () {
              print("Edit profile");
            },
            child: Text("Edit profile"),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              print("Logout");
            },
            child: Text("Manage stores"),
          ),
        ),
      ],
    ),
  );
}
