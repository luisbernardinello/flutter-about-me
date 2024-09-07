import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/AppColors.dart';
import '../utils/text_style.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Previous Experience",
                style: mode ? darkheaderTextStyle : headerTextStyle,
              ),
              _itemWidget("2020 - 2021(Internship)",
                  "-IT Analysit.\n-TV TEM Bauru\n-Grupo GLOBO"),
              _itemWidget("2022 - 2023",
                  "-IT Coordinator, which included: \nB.I Analysis\nInfra and Computer Networks\n-Grupo NATARI"),
              _itemWidget("2024 - Present",
                  "-IT Coordinator, which included:\nFlutter Development \nWordpress\n-Biblioteca Falada"),
              _itemWidget("2022 - Present",
                  "-Fullstack Developer Freelancer, wich included: \nNodeJS + Express, SvelteKit, Javascript, HTML, CSS"),
              _itemWidget("2024 - Present",
                  "Computer vision researcher in smart cities, which included:\n Machine learning algorithms,\n Computer Vision, Continual Learning,\n Convolutional Networks, Class Incremental Learning"),
              const SizedBox(
                height: 10,
              ),
            ]));
  }

  Widget _itemWidget(title, description) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 15,
                width: 15,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: mode
                        ? const Color.fromARGB(255, 31, 243, 197)
                        : Colors.grey),
              ),
              Text(
                title,
                style: mode ? darksubHeaderTextStyle : subHeaderTextStyle,
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 6, top: 10),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        width: 2,
                        color: mode
                            ? const Color.fromARGB(255, 31, 243, 197)
                            : Colors.grey))),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: mode ? darkcardBGColor : cardBGColor),
              child: Text(
                description,
                style: TextStyle(color: mode ? Colors.white : Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
