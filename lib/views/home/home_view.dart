import 'package:avisos_pendecias/configs/routes/local_routes.dart';
import 'package:avisos_pendecias/models/minions/minions_model.dart';
import 'package:avisos_pendecias/services/navigation_service.dart';
import 'package:avisos_pendecias/services/service_locator.dart';
import 'package:avisos_pendecias/widgets/cards/cards_minions.dart';
import 'package:flutter/material.dart';
import '../../configs/constants.dart';
import '../../services/firebase_messaging_service.dart';
import '../../services/shared_service.dart';
import '../../stores/minions/minios_store.dart';
import '../../widgets/cs_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Listas lista = getIt<Listas>();

  @override
  void initState() {
    super.initState();

    _atualizarTokenFCM();
  }

  void _atualizarTokenFCM() async {
    try {
      if (await SharedService.getBool(SharedKeys.NOTIFICACAO) ?? false) {
        await FirebaseMessagingService().getToken();
      }
    } catch (_) {}
  }

  void select(MinionsModel minions) {
    getIt<NavigationService>().pushNamed(LocalRoutes.MINIONS, args: minions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Home',
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        padding: const EdgeInsets.all(8.0),
        itemCount: lista.listaMinions.length,
        itemBuilder: (BuildContext context, int index) {
          final minions = lista.listaMinions[index];
          return CardMinions(
            minions: minions,
            select: select,
          );
        },
      ),
    );
  }
}
