import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:rive/rive.dart' as rive;
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'pages/contact_page.dart';
import 'pages/experience_page.dart';
import 'pages/home_page.dart';
import 'utils/AppColors.dart';
import 'utils/AppIcons.dart';
import 'widgets/navigation_menu_widget.dart';

void main() {
  runApp(const MyApp());
}

bool mode = true;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LogoSplashScreen(), // Splash inicial com o logo
    );
  }
}

/// Splash Screen que exibe o logo da empresa
class LogoSplashScreen extends StatelessWidget {
  const LogoSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 500, // Duração reduzida para 1.5 segundos
      splash: 'assets/logo.png', // Caminho do logo da empresa
      nextScreen:
          const AdventurerSplashScreen(), // Vai para a splash com o adventurer.riv
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: 250,
      backgroundColor: Colors.white,
    );
  }
}

/// Segunda Splash Screen com a animação do adventurer.riv e o botão "Go to the light"
class AdventurerSplashScreen extends StatefulWidget {
  const AdventurerSplashScreen({super.key});

  @override
  _AdventurerSplashScreenState createState() => _AdventurerSplashScreenState();
}

class _AdventurerSplashScreenState extends State<AdventurerSplashScreen> {
  // Função chamada ao carregar a animação e obter o Artboard
  void _onRiveInit(rive.Artboard artboard) {
    final controller =
        rive.StateMachineController.fromArtboard(artboard, 'State Machine 1');
    if (controller != null) {
      artboard.addController(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 460,
            height: 300,
            child: rive.RiveAnimation.asset(
              'assets/adventurer.riv', // Caminho do adventurer.riv
              onInit: _onRiveInit, // Inicializa a State Machine 1
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          // Botão estilizado
          ElevatedButton(
            onPressed: () {
              // Navegar para MyHomePage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 142, 72, 208),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Arredondando o botão
              ),
              elevation: 5, // Elevação do botão
            ),
            child: const Text(
              "Start",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int selectedMenuIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {
        selectedMenuIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 20.0;
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        backgroundColor: mode ? backgrounddark : backgroundLight,
        body: Container(
          margin: const EdgeInsets.only(top: 10, left: 10),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onLongPress: () {},
                      child: Container(
                        width: 45,
                        height: 45,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: FullScreenWidget(
                          disposeLevel: DisposeLevel.Low,
                          backgroundColor:
                              mode ? backgrounddark : backgroundLight,
                          backgroundIsTransparent: true,
                          child: CircleAvatar(
                            child: Image.asset("assets/Untitled.png"),
                          ),
                        ),
                      ),
                    ),
                    NavigationMenu(navHome,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 0, onClick: () {
                      _tabController.animateTo(0,
                          duration: const Duration(milliseconds: 500));
                    }),
                    NavigationMenu(navTime,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 1, onClick: () {
                      _tabController.animateTo(1,
                          duration: const Duration(milliseconds: 500));
                    }),
                    NavigationMenu(navContact,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 2, onClick: () {
                      _tabController.animateTo(2,
                          duration: const Duration(milliseconds: 500));
                    }),
                    IconButton(
                      onPressed: () {
                        mode = !mode;
                        setState(() {});
                      },
                      icon: mode
                          ? const Icon(Icons.dark_mode)
                          : const Icon(Icons.light_mode),
                      color: mode
                          ? const Color.fromARGB(255, 33, 252, 233)
                          : Colors.grey,
                    )
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    HomePage(),
                    ExperiencePage(),
                    ContactPage(),
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
