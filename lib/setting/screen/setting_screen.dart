// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isLightMode = true;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Settings',
      child: Container(
        color: AppColors.lightGreyBackground,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              _MenuSection(
                title: 'Account',
                items: [
                  _MenuItem(
                    title: 'MJ',
                    subTitle: 'sign in with google',
                    leftNode: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: AppColors.bodyText,
                      ),
                      width: 44,
                      height: 44,
                      child: const Text(
                        '민주',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    rightNode: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chevron_right,
                        color: AppColors.bodyText,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),
              _MenuSection(
                title: 'General',
                items: [
                  _MenuItem(
                    title: 'Notification',
                    subTitle: '푸시 알림에 대한 설정을 할 수 있습니다',
                    leftNode: const Icon(Icons.alarm_outlined),
                    rightNode: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chevron_right,
                        color: AppColors.bodyText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _MenuItem(
                    title: 'Invitation',
                    subTitle: '가계부와 포트폴리오를 공유할 수 있어요',
                    leftNode: const Icon(Icons.shape_line_outlined),
                    rightNode: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chevron_right,
                        color: AppColors.bodyText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _MenuItem(
                    title: 'Category',
                    subTitle: '가계부와 포트폴리오의 카테고리를 관리해요',
                    leftNode: const Icon(Icons.category_outlined),
                    rightNode: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chevron_right,
                        color: AppColors.bodyText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _MenuSection(
                items: [
                  _MenuItem(
                    title: 'Light mode',
                    rightNode: Row(
                      children: [
                        Switch(
                          value: isLightMode,
                          activeTrackColor: AppColors.switchOn,
                          onChanged: (switchOn) {
                            setState(() {
                              isLightMode = switchOn;
                            });
                          },
                        ),
                        const SizedBox(width: 5)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  final List<dynamic> items;
  final String? title;

  const _MenuSection({super.key, required this.items, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: const TextStyle(
              fontFamily: 'DMSans',
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
        const SizedBox(
          height: 12,
        ),
        ...items.map((item) => item)
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget? leftNode;
  final Widget? rightNode;
  const _MenuItem({
    super.key,
    required this.title,
    this.subTitle,
    this.leftNode,
    this.rightNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 8, top: 14, bottom: 14),
        child: Row(
          children: [
            if (leftNode != null) leftNode!,
            if (leftNode != null) const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  if (subTitle != null)
                    Text(
                      subTitle!,
                      style: const TextStyle(fontSize: 12),
                    ),
                ],
              ),
            ),
            if (rightNode != null) rightNode!
          ],
        ),
      ),
    );
  }
}
