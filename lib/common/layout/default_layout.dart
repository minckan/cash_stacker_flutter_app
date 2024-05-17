import 'dart:io';

import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? isSliverView;

  const DefaultLayout({
    super.key,
    this.backgroundColor,
    required this.child,
    this.title,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.leading,
    this.actions,
    this.isSliverView = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSliverView == false ? renderAppBar() : null,
      backgroundColor: backgroundColor ?? Colors.white,
      body: isSliverView == false ? child : renderCustomScrollView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      extendBody: true,
    );
  }

  CustomScrollView renderCustomScrollView() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: 60.0,
          flexibleSpace: FlexibleSpaceBar(
            // 확장되는 영역
            title: Text(title ?? ''),
          ),
          actions: actions,
          leading: leading,
        ),
        SliverToBoxAdapter(
          child: child,
        )
      ],
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          title!,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.black,
        actions: actions,
        leading: leading,
      );
    }
  }
}
