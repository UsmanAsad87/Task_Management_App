import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/comments/comments_textfield.dart';

class CommentsScreen extends StatefulWidget {
  static const routeName = '/comments_screen';
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();
  String searchModeValue = "Newest";

  List<DropdownMenuItem<String>> searchModeItems = [
    DropdownMenuItem(child: Text("Newest"), value: "Newest"),
    DropdownMenuItem(child: Text("Popular"), value: "Popular"),
    DropdownMenuItem(child: Text("oldest"), value: "oldest"),
  ];

  @override
  void dispose() {
    _commentController.dispose();
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: const BackButton(color: kSecondaryColor),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: (size.height * 0.25) - 30,
            child: Container(
              height: size.height - (size.height * 0.25),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(35.r)),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      height: 5.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: kWhiteColor.withOpacity(0.20),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Comments',
                              style: kHeadingStyle3,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          DropdownButton(
                              underline: SizedBox(),
                              value: searchModeValue,
                              //focusColor: Colors.white,
                              style: kBodyStyle9,
                              onChanged: (String? newValue) {
                                setState(() {
                                  searchModeValue = newValue!;
                                });
                              },
                              items: searchModeItems),
                        ],
                      ),
                    ),
                    CommentsTextField(
                      controller: _commentController,
                      hintText: 'Enter Comment here',
                      onChanged: (val) {},
                      onFieldSubmitted: (val) {},
                      maxLines: 2,
                    ),
                    Container(
                      height: 0.8.h,
                      margin: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 10.w),
                      width: double.infinity,
                      color: const Color(0xFFC9CBCB).withOpacity(0.61),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/originals/06/81/39/068139bff0b22024e775bfcbb42ed3b4.jpg'),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.76,
                          child: Column(
                            children: [
                              //name and time of admin
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Admin',
                                    style: kBodyStyle2,
                                  ),
                                  Spacer(),
                                  Text(
                                    '2 days Ago',
                                    style: kBodyStyle10,
                                  )
                                ],
                              ),
                              //admin comment
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus a neque varius Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus a neque varius ',
                                style: kBodyStyle6,
                              ),
                              Row(
                                children: [
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite_border),
                                    label: Text('Like'),
                                    style: TextButton.styleFrom(
                                      primary: kFontColor3,
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.reply),
                                    label: Text('Reply'),
                                    style: TextButton.styleFrom(
                                      primary: kFontColor3,
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.reply_all_outlined),
                                    label: Text(' 2 Replies'),
                                    style: TextButton.styleFrom(
                                      primary: kFontColor3,
                                    ),
                                  )
                                ],
                              ),

                              CommentsTextField(
                                controller: _replyController,
                                hintText: 'Reply to Admin\'s comment',
                                onChanged: (val) {},
                                onFieldSubmitted: (val) {},
                                maxLines: 2,
                              ),
                              Container(
                                height: 0.8.h,
                                margin: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 10.w),
                                width: double.infinity,
                                color:
                                    const Color(0xFFC9CBCB).withOpacity(0.61),
                              ),
                              //name and time of admin
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'You',
                                          style: kBodyStyle2,
                                        ),
                                        Spacer(),
                                        Text(
                                          '1 days Ago',
                                          style: kBodyStyle10,
                                        )
                                      ],
                                    ),
                                    // comment reply
                                    Text(
                                      'Lorem ipsum dolor sit amet, m ipsum dolor sit amet, consectlit. Sed ut purus a neque varius ',
                                      style: kBodyStyle6,
                                    ),

                                    Container(
                                      height: 0.8.h,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 20.h, horizontal: 0.w),
                                      width: double.infinity,
                                      color: const Color(0xFFC9CBCB)
                                          .withOpacity(0.61),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Admin',
                                          style: kBodyStyle2,
                                        ),
                                        Spacer(),
                                        Text(
                                          '1 days Ago',
                                          style: kBodyStyle10,
                                        )
                                      ],
                                    ),
                                    // comment reply
                                    Text(
                                      'Lorem ipsum dolor sit amet, m ipsum dolor sit amet, consectlit. Sed ut purus a neque varius ',
                                      style: kBodyStyle6,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 0.8.h,
                      margin: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 10.w),
                      width: double.infinity,
                      color: const Color(0xFFC9CBCB).withOpacity(0.61),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
