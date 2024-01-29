// ignore_for_file: depend_on_referenced_packages

import 'package:avisos_pendecias/models/minions/minions_model.dart';
import 'package:avisos_pendecias/views/minions/minions_view.dart';
import 'package:flutter/material.dart';

import 'views/login/login_view.dart';
import 'views/splash-screen/splash_screen_view.dart';
import 'widgets/cs_app_bar.dart';
import 'configs/routes/local_routes.dart';
import 'views/home/home_view.dart';
import 'widgets/cs_elevated_button.dart';
import 'widgets/nenhuma_informacao.dart';

class RouterApp {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LocalRoutes.HOME:
        return _PageBuilder(
          child: const HomeView(),
          settings: settings,
        );

      case LocalRoutes.SPLASH_SCREEN:
        return _PageBuilder(
          child: const SplashScreenView(),
          settings: settings,
        );

      case LocalRoutes.LOGIN:
        return _PageBuilder(
          child: const LoginView(),
          settings: settings,
        );

      case LocalRoutes.MINIONS:
        final minions = settings.arguments as MinionsModel;
        return _PageBuilder(
          child: MinionsView(
            minions: minions,
          ),
          settings: settings,
        );

      default:
        return _PageBuilder(
          child: const _RotaInexistenteView(),
          settings: settings,
        );
    }
  }
}

class _PageBuilder extends PageRouteBuilder {
  _PageBuilder({
    required this.child,
    required this.settings,
  }) : super(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 100),
          pageBuilder: (context, animation, secAnimation) => child,
        );

  final Widget child;

  @override
  final RouteSettings settings;
}

class _RotaInexistenteView extends StatelessWidget {
  const _RotaInexistenteView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CsAppBar(title: 'Ops! Ocorreu um erro'),
      body: Center(
        child: SingleChildScrollView(
          child: NenhumaInformacao(
            Image.network('https://i.pinimg.com/originals/e5/9f/e3/e59fe3c8628c9c25db5a417bd78a1d45.gif', width: 400, height: 400),
            message: 'Desculpe, a página que você está procurando não foi encontrada. Relate o seu problema abrindo um chamado no botão abaixo!',
            actions: [
              CsElevatedButton(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.8,
                label: 'Abrir chamado',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RotaErrorWidgetView extends StatelessWidget {
  const RotaErrorWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: NenhumaInformacao(
            Image.network('https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExdWs4NHNtbm5raDQ0ejg2bTBvenBzbjFleXNoMXczcnJueHBwNTRiZSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/eImrJKnOmuBDmqXNUj/giphy.gif', width: 400, height: 400),
            message: 'Ocorreu um problema desconhecido. Ajude a equipe de desenvolvimento abrindo um chamado no botão abaixo',
            actions: [
              CsElevatedButton(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.8,
                label: 'Abrir chamado',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
