// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/setting/component/menu_item.dart';
import 'package:cash_stacker_flutter_app/setting/component/menu_section.dart';
import 'package:cash_stacker_flutter_app/setting/screen/category_management/all_management_screen.dart';
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
              MenuSection(
                title: 'Account',
                items: [
                  MenuItem(
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
              MenuSection(
                title: 'General',
                items: [
                  MenuItem(
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
                  MenuItem(
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
                  MenuItem(
                    title: 'Category',
                    subTitle: '가계부와 포트폴리오의 카테고리를 관리해요',
                    leftNode: const Icon(Icons.category_outlined),
                    rightNode: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const CategoryManagementScreen()));
                      },
                      icon: const Icon(
                        Icons.chevron_right,
                        color: AppColors.bodyText,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MenuSection(
                items: [
                  MenuItem(
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
