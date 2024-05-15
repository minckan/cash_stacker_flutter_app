import 'package:cash_stacker_flutter_app/common/const/color.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;

  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '',
      // bottomNavigationBar: BottomNavigationBar(
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   items: const [

      //   ],
      //   selectedItemColor: PRIMARY_COLOR,
      //   unselectedItemColor: BODY_TEXT_COLOR,
      //   selectedFontSize: 10,
      //   unselectedFontSize: 10,
      //   type: BottomNavigationBarType.fixed,
      //   onTap: (index) {
      //     controller.animateTo(index);
      //   },
      //   currentIndex: index,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        elevation: 0,
        backgroundColor: PRIMARY_COLOR,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomAppBar(
          height: 60,
          color: Colors.white,
          notchMargin: 5,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  color: PRIMARY_COLOR,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.attach_money,
                  color: PRIMARY_COLOR,
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(
                  Icons.real_estate_agent,
                  color: PRIMARY_COLOR,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: PRIMARY_COLOR,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          // const HomeScreen(),
          const HomeScreen(),
          Center(child: Container(child: const Text('음식'))),
          Center(child: Container(child: const Text('주문'))),
          Center(child: Container(child: const Text('프로필'))),
        ],
      ),
    );
  }
}
