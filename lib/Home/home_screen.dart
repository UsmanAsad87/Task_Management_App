import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/constants.dart';
import 'package:task_management/widgets/homeScreen/active_project_tile.dart';
import 'package:task_management/widgets/homeScreen/project_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ListTile(
                  title: Row(
                    children: [
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 16,
                          width: 16,
                          child: Image.asset('assets/handImage.png')),
                    ],
                  ),
                  subtitle: const Text('Good Afternoon'),
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/06/81/39/068139bff0b22024e775bfcbb42ed3b4.jpg'),
                  ),
                  trailing: SizedBox(
                    width: 70,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                              onTap: () {},
                              child: const Icon(Icons.search,
                                  color: Color(0xFF004064))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                              onTap: () {},
                              child: Stack(
                                children: [
                                  const Icon(
                                    Icons.notifications,
                                    color: Color(0xFF004064),
                                  ),
                                  Positioned(
                                      right: 4,
                                      top: 0,
                                      child: Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFB800),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                      ))
                                ],
                              )),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    //Your Projects Title
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Your Projects',
                        style: GoogleFonts.poppins(
                            color: kFontColor1,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ),

                    //Tab Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Tab(
                          text: 'Pending',
                        ),
                        Tab(
                          text: 'Recent',
                        ),
                        Tab(
                          text: 'Completed',
                        ),
                        Tab(
                          text: 'All',
                        ),
                        Tab(
                          text: 'Weekly',
                        ),
                      ],
                    ),
                    //projects Card
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          ProjectCard(
                            cardColor: Color(0xFF004064),
                            weekRemaining: 2,
                            projectTitle: 'Management App Design',
                            noOfComments: 2,
                            progressPercent: 0.5,
                          ),
                          ProjectCard(
                            cardColor: Color(0xFF488DE5),
                            weekRemaining: 1,
                            projectTitle: 'Management App Design',
                            noOfComments: 3,
                            progressPercent: 0.6,
                          ),
                          ProjectCard(
                            cardColor: Color(0xFF4F283D),
                            weekRemaining: 3,
                            projectTitle: 'Management App Design',
                            noOfComments: 5,
                            progressPercent: 0.2,
                          ),
                          ProjectCard(
                            cardColor: Color(0xFF004064),
                            weekRemaining: 2,
                            projectTitle: 'Management App Design',
                            noOfComments: 2,
                            progressPercent: 0.5,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Active Projects',
                        style: GoogleFonts.poppins(
                            color: kFontColor1,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ),

                    Column(
                      children: const [
                        ActiveProjectTile(
                          projectTitle: 'Graphic Design',
                          progressStatus: 'Inprogress',
                          imagePath: 'assets/icons/graphicDesign.png',
                          statusCount: 4,
                          imageBgColor: Color(0xFF1D4064) ,
                        ),
                        ActiveProjectTile(
                          projectTitle: 'Web Development',
                          progressStatus: 'Completed',
                          imagePath: 'assets/icons/web.png',
                          statusCount: 4,
                          imageBgColor: Color(0xFF75BDF9) ,
                        ),
                        ActiveProjectTile(
                          projectTitle: 'App Development',
                          progressStatus: 'Inprogress',
                          imagePath: 'assets/icons/app.png',
                          statusCount: 4,
                          imageBgColor: Color(0xFF412A3C) ,
                        ),
                        ActiveProjectTile(
                          projectTitle: 'App Development',
                          progressStatus: 'Inprogress',
                          imagePath: 'assets/icons/app.png',
                          statusCount: 4,
                          imageBgColor: Color(0xFF412A3C) ,
                        ),
                        ActiveProjectTile(
                          projectTitle: 'App Development',
                          progressStatus: 'Inprogress',
                          imagePath: 'assets/icons/app.png',
                          statusCount: 4,
                          imageBgColor: Color(0xFF412A3C) ,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
