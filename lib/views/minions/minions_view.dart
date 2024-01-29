import 'package:avisos_pendecias/models/minions/minions_model.dart';
import 'package:avisos_pendecias/widgets/cs_app_bar.dart';
import 'package:flutter/material.dart';

class MinionsView extends StatefulWidget {
  const MinionsView({
    required this.minions,
    super.key,
  });

  final MinionsModel minions;

  @override
  State<MinionsView> createState() => _MinionsViewState();
}

class _MinionsViewState extends State<MinionsView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CsAppBar(title: widget.minions.nome),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Image.network(
            widget.minions.foto,
            width: 100,
            height: 200,
          ),
          const SizedBox(height: 20),
          Text(
            widget.minions.nome,
            textAlign: TextAlign.center,
            style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.minions.descricao,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
