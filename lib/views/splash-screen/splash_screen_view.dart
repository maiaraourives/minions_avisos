import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../configs/assets/assets_path.dart';
import '../../configs/routes/local_routes.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../widgets/cs_circular_progress_indicador.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    _prepareLogin();
  }

  void _prepareLogin() async {
    try {
      // Verifique se já existe um usuário autenticado no Firebase
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // Se já existe um usuário autenticado, redirecione para a tela inicial
        getIt<NavigationService>().pushNamedAndRemoveUntil(LocalRoutes.HOME);
      } else {
        Future.delayed(const Duration(seconds: 2), () => getIt<NavigationService>().pushNamedAndRemoveUntil(LocalRoutes.LOGIN, args: true));
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 170,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsPath.BANNER),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                child: Image.asset(AssetsPath.LOGO, fit: BoxFit.contain, height: 150, width: 350),
              ),
              const SizedBox(height: 15),
              const CsCircularProgressIndicador.dark(),
            ],
          ),
        ),
      ),
    );
  }
}
