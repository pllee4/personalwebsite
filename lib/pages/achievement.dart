import 'package:flutter/material.dart';
import 'package:personalwebsite/widgets/achievement_item.dart';

class Achievement extends StatelessWidget {
  const Achievement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
        alignment: Alignment.center,
        child: Row(children: [
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                AchievementItem(
                    title: "ABU ROBOCON Tokyo 2017",
                    award: "First Runner Up",
                    subtitle1:
                        "Worked on robot programming of several robot prototypes",
                    subtitle2:
                        "Head of international robot management to coordinate the preparation of cargo shipping of robots to Japan",
                    url: "https://www.youtube.com/watch?v=u5b37wgaGD8",
                    iconData: Icons.play_circle_filled),
                AchievementItem(
                    title: "ABU ROBOCON 2018",
                    award: "Best Idea Award",
                    subtitle1:
                        "Worked on planning of the design frameworks and programmed the robot that took part in the contest",
                    subtitle2:
                        "One of the six representatives of Malaysia Team, was roled as robot operator to handle the operation of robot in the competition",
                    url:
                        "https://www.youtube.com/watch?v=bN3NCOuwKUw&list=UU9fYb6SvcRHXnNiv25Qba9A&index=21",
                    iconData: Icons.play_circle_filled),
                AchievementItem(
                    title: "ROBOCON Malaysia 2018",
                    award: "Champion",
                    subtitle1:
                        "Handled robot programmes for 2 robots (1 autonomous, 1 semi-autonomous) to compete in the competition and won Best Engineering Award",
                    url:
                        "https://www.facebook.com/RoboconMalaysia/videos/finals-robocon-malaysia-2018-utm-a-s-utm-b/164200287560567/",
                    iconData: Icons.play_circle_filled),
                AchievementItem(
                    title: "Hack for Good 2.0 Hackathon 2019",
                    award: "1st Prize",
                    subtitle1: "Project leader for water quality IoT system",
                    subtitle2:
                        "Embedded programmer of a solar-powered system to analyse water quality and published to online database through NB-IoT",
                    url:
                        "https://www.nst.com.my/education/2019/06/499309/finding-water-quality-solutions-hackathon",
                    iconData: Icons.link),
                AchievementItem(
                    title: "The Great Lab (TGL) Grand Design Challenge 2019",
                    award: "First Runner Up",
                    subtitle1:
                        "Main presenter for the project and won the vote for Crowd Favourite Award",
                    url:
                        "https://news.utm.my/2019/12/utm-won-1st-and-2nd-place-in-the-great-lab-tgl-grand-design-challenge-2019/",
                    iconData: Icons.link),
                AchievementItem(
                    title: "UNBLOCKATHON 2019",
                    award: "Top 5 finalist",
                    subtitle1:
                        "Participated with a project named Freshlytics, an AI-powered smart agriculture application that helps the farmers to reduce lost of produce",
                    subtitle2: "Web application designer for the project",
                    url:
                        "https://www.facebook.com/watch/?v=2435987153303018&t=75",
                    iconData: Icons.play_circle_filled),
                AchievementItem(
                    title: "UTM Grand Challenges Competition 2019",
                    award: "1st Prize",
                    subtitle1:
                        "Grand Prize (Sustainable Cities and Communities)",
                    url:
                        "https://engineering.utm.my/innovationday2019/grandchallenges/",
                    iconData: Icons.info),
              ]))
        ]));
  }
}
