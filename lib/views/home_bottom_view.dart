import 'package:chayxana/models/scroll_behavior.dart';
import 'package:chayxana/pages/main/home/filter_page/filter_controller.dart';
import 'package:chayxana/pages/main/home/home_controller.dart';
import 'package:chayxana/services/constants/app_assets.dart';
import 'package:chayxana/views/chayxana_item.dart';
import 'package:chayxana/views/filter_views/filter_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../services/constants/app_colors.dart';
import 'filter_views/icon_filter_view.dart';

class HomeBottomView extends StatelessWidget {
  HomeController controller;
  HomeBottomView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.40,
        minChildSize: 0.40,
        maxChildSize: 0.9,
        controller: controller.scrollController,
        builder: ((context, scrollController) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: controller.splashRadius),
                    ],
                    color: AppColors.colorHomeBottomViewBack,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(controller.borderRadius),
                      topRight: Radius.circular(controller.borderRadius),
                    )),
              ),
              ScrollConfiguration(
                behavior: MyBehavior(),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverAppBar(
                        pinned: true,
                        floating: false,
                        backgroundColor: AppColors.colorHomeBottomViewBack,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                        collapsedHeight: 120,
                        elevation: 0,
                        expandedHeight: 120,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: 60,
                                  height: 4,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                GetBuilder<FilterController>(
                                    init: FilterController(),
                                    builder: (filterColtroller) {
                                      return Container(
                                        height: 70,
                                        alignment: Alignment.centerLeft,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              FilterItem(
                                                childIcon: AppAssets.filter,
                                                count: 1,
                                                backgrounColor:
                                                    AppColors.activeColor,
                                              ),
                                              IconFilter(
                                                isChacked: filterColtroller
                                                    .selectedTabs[0],
                                                childIcon: AppAssets.glass,
                                                label: "Предзаказ",
                                                sizeWidth: 150,
                                                iconColor: AppColors
                                                    .colorShayxanaItemGlass,
                                                backgrounColor:
                                                    AppColors.activeColor,
                                              ),
                                              IconFilter(
                                                isChacked: filterColtroller
                                                    .selectedTabs[1],
                                                childIcon: AppAssets.total,
                                                label: "Счёт",
                                                sizeWidth: 120,
                                                iconColor: AppColors
                                                    .colorShayxanaItemTotal,
                                                backgrounColor:
                                                    AppColors.activeColor,
                                              ),
                                              IconFilter(
                                                isChacked: filterColtroller
                                                    .selectedTabs[2],
                                                childIcon: AppAssets.gift,
                                                label: "Бонусы",
                                                sizeWidth: 120,
                                                iconColor: AppColors
                                                    .colorShayxanaItemGift,
                                                backgrounColor:
                                                    AppColors.activeColor,
                                              ),
                                              IconFilter(
                                                isChacked: filterColtroller
                                                    .selectedTabs[3],
                                                sizeWidth: 120,
                                                childIcon: AppAssets.calendar,
                                                label: "Броны",
                                                iconColor: AppColors
                                                    .colorShayxanaItemCalendar,
                                                backgrounColor:
                                                    AppColors.activeColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                Container()
                              ],
                            ),
                          ),
                        )),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        List.generate(
                          100,
                          (index) {
                            return ChayxanaItem();
                          },
                        ),
                      ),
                    )

                    // SliverList(delegate: delegate)
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
