import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/utils/constants.dart';

class TabBarMaterialWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const TabBarMaterialWidget({
    required this.index,
    required this.onChangedTab,
    Key? key,
  }) : super(key: key);

  @override
  _TabBarMaterialWidgetState createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    );

    return BottomAppBar(
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(
              index: 0, icon: "assets/icons/home_icon.png", text: ('Home')),
          buildTabItem(
              index: 1, icon: "assets/icons/mesages.png", text: ('Messages')),
          placeholder,
          buildTabItem(
              index: 2, icon: "assets/icons/projects.png", text: ('Projects')),
          buildTabItem(
              index: 3, icon: "assets/icons/setting.png", text: ('Setting')),
        ],
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required String icon,
    required String text,
  }) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? kPrimaryColor : kProgressInactiveColor,
      ),
      child: SizedBox(
        height: 60.h,
        child: InkWell(
          onTap: () {
            widget.onChangedTab(index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isSelected
                  ? Container(
                      height: 5.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                    )
                  : Container(
                      height: 5.h,
                      width: 35.w,
                      color: kWhiteColor,
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ImageIcon(
                  AssetImage(
                    icon,
                  ),
                ),
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? kPrimaryColor : kInactiveNavItemColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
