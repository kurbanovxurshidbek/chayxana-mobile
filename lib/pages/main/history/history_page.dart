import 'package:cached_network_image/cached_network_image.dart';
import 'package:chayxana/views/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

import 'history_controller.dart';

class HistoryPage extends StatelessWidget {
  static const String id = "/history_page";
  const HistoryPage({Key? key}) : super(key: key);

                      /// Doniyor
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d-MMMM').format(now);

    return GetBuilder(
        init: HistoryController(),
        builder: (HistoryController controller) =>

            Scaffold(
              appBar: appbar(title: "History Booking", leadingFunction: null, actionsFunction: null, centerTitle: false, leading: true),
              body:  ListView(
                children: [
                  controller.data != null  ?

                  ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 15,),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: 18,
                      itemBuilder: (context, index) {

                        /// All Container
                        return Container(
                          padding: EdgeInsets.only(top: Get.height /64),
                          margin: EdgeInsets.symmetric(vertical: 15),

                          height: 167,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [

                                  /// Image Container

                                  Container(
                                    margin: EdgeInsets.only(left: 15,right: 8),
                                    height: 95,
                                    width: Get.width / 3.9,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),

                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: "https://media-cdn.tripadvisor.com/media/photo-s/15/7d/d1/67/caption.jpg",
                                      imageBuilder: (context, imageProvider) => Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),

                                        ),
                                      ),


                                      alignment: Alignment.topLeft,
                                    ),
                                  ),

                                  Flexible(
                                    flex:2,
                                    child: Container(
                                        height: 95,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            /// Name Tea Hause
                                            Text(
                                              controller.limitedText("Tea House Vostok")  ,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),

                                            /// Location Tea House
                                            Flexible(
                                              child: Text(
                                                controller.limitedText( " Location: Street Darxon 45",),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),

                                            /// Order date time  room number
                                            Row (
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: Get.width / 1.682,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                      color: index.isOdd
                                                          ? Color.fromRGBO(
                                                          237, 237, 237, 1)
                                                          : Color.fromRGBO(
                                                          23, 183, 0, 0.7)
                                                    //Color.fromRGBO(23, 183, 0, 0.7),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          formattedDate,
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                      //  SizedBox(width:5,),

                                                      Container(

                                                        decoration: BoxDecoration(
                                                            border: Border.symmetric(vertical: BorderSide(color:  index.isOdd ? Color(0xFF000000) :  Color(0xFFFFFFFF), width: 1))),
                                                        child: Text("20:30",
                                                            style: TextStyle(
                                                                fontSize: 12),

                                                            textAlign: TextAlign.center),
                                                        width: 45,
                                                        height: Get.height * 0.061,
                                                        alignment: Alignment.center,


                                                      ),
                                                      //  SizedBox(width: 5,),

                                                      Expanded(
                                                        flex: 2,
                                                        child: Text("3-room",
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                            textAlign: TextAlign.center),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          ],

                                        )),
                                  ),
                                ],
                              ),

                              SizedBox(height: 12,),

                              Divider(
                                height: 1,
                                color: Color(0xFFB3B3B3),
                              ),
                              Container(
                                height: 45,
                                width: Get.mediaQuery.size.width,
                                child: index.isOdd

                                /// Order Completed

                                    ? MaterialButton(
                                  child: Text(
                                    "Order completed",
                                    style: TextStyle(
                                        color: Color.fromRGBO(158, 158, 158, 1)
                                    ),
                                  ),
                                  onPressed: (){
                                    /// BottomSheet
                                    orderBottomSheet();
                                  },
                                )
                                /// Cancel Order Button
                                    : MaterialButton(
                                  child: Text(
                                    "Cancel order",
                                    style: TextStyle(
                                        color: Color.fromRGBO(244, 67, 54, 1)),
                                  ),
                                  onPressed: (){},
                                ),

                              ),
                            ],
                          ),
                        );
                      })

                  ///   Center No orders
                      :  Center(
                    heightFactor: Get.height / 25.6,
                    child: Text("No orders yet", style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w500 ,color: Color(0xFF4F4F4F)),),
                  )
                ],
              ),
            )
    );
  }

  /// Order BottomSheet Method
  orderBottomSheet() {
    return Get.bottomSheet(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          margin: EdgeInsets.only(bottom: Get.height / 14.93),
          height: Get.height / 4.81,
          width: Get.height,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Book again", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
              Divider(height: 1, color: Color(0xFFB3B3B3),),
              Text("Call",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              Divider(height: 1, color: Color(0xFFB3B3B3),),
              Text("Abaut teahouse",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ],
          ),
        )
    );
  }

}
