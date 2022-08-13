import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProjectCard extends StatelessWidget {
  final Color cardColor;
  final int weekRemaining;
  final String projectTitle;
  final int noOfComments;
  final double progressPercent;

  const ProjectCard({
    Key? key,
    required this.cardColor,
    required this.weekRemaining,
    required this.projectTitle,
    required this.noOfComments,
    required this.progressPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162,
      width: 162,
      margin: const EdgeInsets.only(top: 10,  right: 10),
      padding: const EdgeInsets.only(top: 18, bottom: 12, left: 13, right: 13),
      decoration: BoxDecoration(
        color: cardColor,
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 18,
                width: 95,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    '$weekRemaining Week Remaining',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Spacer(),
              const Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              projectTitle,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: [
              Stack(
                children: [
                  const SizedBox(
                    height: 15,
                    width: 25,
                  ),
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(color: cardColor)),
                  ),
                  Positioned(
                      left: 8,
                      top: 0,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFB800),
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(color: Colors.blue.shade900)),
                      ))
                ],
              ),
              Text(
                '$noOfComments comments',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Progress',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: LinearPercentIndicator(
                  padding: const EdgeInsets.all(0),
                  width: 100.0,
                  lineHeight: 5.0,
                  percent: progressPercent,
                  progressColor: Colors.green,
                  barRadius: Radius.circular(20),
                ),
              ),
              Text(
                '${(progressPercent * 100).toInt()}%',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    );
  }
}
