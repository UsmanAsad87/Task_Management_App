import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ActiveProjectTile extends StatelessWidget {
  final String projectTitle;
  final String progressStatus;
  final String imagePath;
  final int statusCount;
  final Color imageBgColor;
  const ActiveProjectTile({
    Key? key,
    required this.projectTitle,
    required this.progressStatus,
    required this.imagePath,
    required this.statusCount, required this.imageBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 20),
            blurRadius: 50,
            color: const Color(0xFF9F9F9F).withOpacity(0.18),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: imageBgColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: imageBgColor.withOpacity(0.2),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(imagePath),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projectTitle,
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          padding: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: progressStatus == 'Inprogress'
                                ? Colors.blue
                                : Colors.green,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '$progressStatus ($statusCount)',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
    );
  }
}
