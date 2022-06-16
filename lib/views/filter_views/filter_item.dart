import 'package:chayxana/pages/main/home/filter_page/filter_page.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/services/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  String childIcon;
  int count;
  Color? iconColor;
  Color? backgrounColor;

  FilterItem({
    Key? key,
    this.count = 0,
    this.backgrounColor,
    this.iconColor,
    required this.childIcon,
  }) : super(key: key);

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 60, end: widget.count != 0 ? 90 : 60),
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 3),
        builder: (context, width, _) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Material(
              color: widget.backgrounColor,
              borderRadius: BorderRadius.circular(4132),
              child: InkWell(
                borderRadius: BorderRadius.circular(4132),
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 400),
                          transitionsBuilder: (asd, asdf, animation, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                      begin: Offset(0, 1), end: Offset.zero)
                                  .animate(asdf),
                              child: child,
                            );
                          },
                          pageBuilder: (c, a, an) {
                            return FilterPage();
                          }));
                },
                child: Container(
                  width: width,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12313),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        widget.childIcon,
                        width: 25,
                        height: 25,
                        color: widget.iconColor,
                        fit: BoxFit.fill,
                      ),
                      widget.count != 0
                          ? TweenAnimationBuilder<double>(
                              tween: Tween(
                                  begin: 0, end: widget.count != 0 ? 15 : 0),
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 700),
                              builder: (context, radius, _) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CircleAvatar(
                                    radius: radius,
                                    backgroundColor:
                                        AppColors.colorShayxanaItemCalendar,
                                    child: Text(
                                      widget.count.toString(),
                                      style: AppFonts.chayxanaItemHour(),
                                    ),
                                  ),
                                );
                              })
                          : SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
