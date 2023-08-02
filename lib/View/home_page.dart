import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_ui/Getx/get_home.dart';
import 'package:plant_ui/widgets/categrory_widget.dart';
import 'package:plant_ui/widgets/inside_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeState controller=Get.put(HomeState());
  var images=
  const [
    AssetImage('assets/images/plant2.png'),
    AssetImage('assets/images/plant1.png'),
    AssetImage('assets/images/plant3.png'),
    AssetImage('assets/images/plant4.png'),
    AssetImage('assets/images/plant5.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: (controller.x.value>0) ? 300 : 450,
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(50)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 70, right: 10, left: 10, bottom: 20),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Florest",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(.3),
                              child: const Icon(
                                Icons.book_rounded,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      height: (controller.temp.value==0)? 180:0 ,
                      width: (controller.temp.value==0)? 200:0,
                      child: Image(
                        image: images[controller.temp1.value],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Top\nPicks",
                      style: TextStyle(
                        letterSpacing: 8,
                        color: Colors.limeAccent,
                        fontSize: 35,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),),
          Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10, top: 10),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 13,
                          child: Text(
                            "25",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Obx(() => AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: (controller.x.value!=0) ? 10 : 40,
                        )),
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(.8),
                          radius: 13,
                          child: const Text(
                            "30",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Obx(() => AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: (controller.x.value!=0) ? 10 : 70,
                        ),),
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(.8),
                          radius: 13,
                          child: const Text(
                            "39",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        child: const Row(
                          children: [
                            Category(text: "All"),
                            SizedBox(
                              width: 15,
                            ),
                            Category(text: "Outdoor"),
                            SizedBox(
                              width: 15,
                            ),
                            Category(text: "Indoor"),
                            SizedBox(
                              width: 15,
                            ),
                            Category(text: "Sunlight"),
                            SizedBox(
                              width: 15,
                            ),
                            Category(text: "Night"),
                            SizedBox(
                              width: 15,
                            ),
                            Category(text: "Plants")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListWheelScrollView(
                            onSelectedItemChanged: (value)  async{
                              controller.setTemp(1);
                              controller.setX(value);
                              await Future.delayed(const Duration(milliseconds: 500));
                                controller.setTemp(0);
                                controller.setTemp1(value);

                            },
                            itemExtent: 170,
                            children: [
                              0,1,2,3,4
                            ].map((e) => SizedBox(
                              height: 150,
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 40,
                                      child: Container(
                                        height: 150,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade700,
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              bottomLeft: Radius.circular(30)),
                                        ),
                                        child: Container(
                                          margin: const EdgeInsets.only(left: 90, top: 20),
                                          child: ListTile(
                                            title: Text(
                                              "Plant\nVera", style: TextStyle(
                                              color: Colors.yellow.shade400,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                            ),),
                                            subtitle: const Row(
                                              children: [
                                                InsideIcon(data: Icons.water_drop_outlined),
                                                SizedBox(width: 10,),
                                                InsideIcon(data: Icons.thermostat_auto),
                                                SizedBox(width: 10,),
                                                InsideIcon(data: Icons.sunny),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Obx(() => AnimatedContainer(
                                      duration: const Duration(milliseconds: 500),
                                      height: (controller.x.value==e)? 120: 0,
                                      width:(controller.x.value==e)? 150: 0,
                                      color: Colors.transparent,
                                      child: Image(
                                        image: images[e],
                                        fit: BoxFit.fill,
                                      ),
                                    ),),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      height: 70,
                                      width: 70,

                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          color: Colors.white
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )).toList()
                        ))
                  ],
                ),
              ))
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
