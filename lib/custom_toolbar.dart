import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_100_projects/tab_item.dart';
import 'package:rive/rive.dart';

class CustomToolbar extends StatefulWidget {
  const CustomToolbar({super.key});

  @override
  State<CustomToolbar> createState() => _CustomToolbarState();
}

class _CustomToolbarState extends State<CustomToolbar> {
  int _selectedTab = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 20,
                offset: Offset(0, 20),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              TabItem.tabItems.length,
              (index) {
                TabItem item = TabItem.tabItems[index];
                return CupertinoButton(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 20,
                  ),
                  onPressed: () {
                    _onTabPress(index);
                  },
                  child: AnimatedOpacity(
                    opacity: _selectedTab == index ? 1 : 0.5,
                    duration: const Duration(milliseconds: 200),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: -4,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 4,
                            width: _selectedTab == index ? 18 : 0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: RiveAnimation.asset(
                            'assets/icons.riv',
                            stateMachines: [item.stateMachine],
                            artboard: item.artboard,
                            onInit: (artboard) {
                              _onRiveIconInit(artboard, index);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _onRiveIconInit(Artboard artboard, int index) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      TabItem.tabItems[index].stateMachine,
    );
    artboard.addController(controller!);
    TabItem.tabItems[index].status =
        controller.findInput<bool>('active') as SMIBool;
  }

  void _onTabPress(int index) {
    setState(() {
      _selectedTab = index;
    });
    TabItem.tabItems[index].status!.change(true);
    Future.delayed(const Duration(milliseconds: 1000), () {
      TabItem.tabItems[index].status!.change(false);
    });
  }
}
