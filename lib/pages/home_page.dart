import 'package:flutter/material.dart';
import 'package:rive/rive.dart'; // Pacote correto para animações .riv
import '../main.dart';
import '../utils/AppColors.dart';
import '../utils/common_string.dart';
import '../utils/text_style.dart';
import '../widgets/app_shimmer_effect.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String crab = 'assets/crab.riv';

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    if (controller != null) {
      artboard.addController(controller);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mode ? backgrounddark : backgroundLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Exibe o nome
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "snapshot.data.toString()",
                    style: mode ? darkheaderTextStyle : headerTextStyle,
                  );
                }
                return AppShimmer(
                  child: Text(
                    "Luis Bernardinello",
                    style: mode ? darkheaderTextStyle : headerTextStyle,
                  ),
                );
              },
              future: null,
            ),
            // Exibe a designação
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20),
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      "snapshot.data.toString()",
                      style: mode ? darkheaderTextStyle : headerTextStyle,
                    );
                  }
                  return AppShimmer(
                    child: Text(
                      "Computer Science Undergraduate",
                      style: mode ? darkheaderTextStyle : headerTextStyle,
                    ),
                  );
                },
                future: null,
              ),
            ),
            // Exibe a descrição "Fullstack Developer"
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "snapshot.data.toString()",
                    style: mode ? darkbodyTextStyle : bodyTextStyle,
                  );
                }
                return AppShimmer(
                  child: Text(
                    "Fullstack Developer",
                    style: mode ? darkheaderTextStyle : headerTextStyle,
                  ),
                );
              },
              future: null,
            ),
            // Títulos e descrições
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Text(
                title3,
                style: mode ? darkheaderTextStyle : headerTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 0.05),
              child: Text(
                description2,
                style: mode ? darkbodyTextStyle : bodyTextStyle,
              ),
            ),
            Container(
              width: 300,
              height: 200,
              margin: const EdgeInsets.only(top: 10.0),
              child: const RiveAnimation.asset(
                "assets/squats.riv",
                animations: ['Demo'],
                fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: Text(
                title2,
                style: mode ? darkheaderTextStyle : headerTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 0.05),
              child: Text(
                description1,
                style: mode ? darkbodyTextStyle : bodyTextStyle,
              ),
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: RiveAnimation.asset(
                crab,
                onInit: _onRiveInit,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
