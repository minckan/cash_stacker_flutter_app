import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
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
  final bool? isFormView;

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
    this.isFormView = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          isSliverView == false ? renderAppBar(isFormView: isFormView) : null,
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
          floating: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          expandedHeight: 60.0,
          flexibleSpace: FlexibleSpaceBar(
            // 확장되는 영역
            title: Text(title ?? ''),
            background: Container(
              color: Colors.white, // 필요한 경우 배경색을 투명하게 설정
            ),
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

  AppBar? renderAppBar({bool? isFormView}) {
    if (title == null) {
      return null;
    } else {
      if (isFormView == false) {
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
      } else {
        return AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.primary,
          elevation: 0,
          title: Text(
            title!,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          foregroundColor: Colors.white,
          actions: actions,
          leading: leading,
        );
      }
    }
  }
}
