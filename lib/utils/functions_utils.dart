import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../configs/constants.dart';
import '../services/dialog_service.dart';
import '../widgets/cs_icon.dart';
import '../widgets/cs_icon_button.dart';

///Converte a data vinda do banco de dados.
///
///Milissegundos -> DateTime
DateTime? convertDataDB(int? milliseconds) {
  if (milliseconds == null) {
    return null;
  }

  return DateTime.fromMillisecondsSinceEpoch(milliseconds);
}

///Redireciona usuário para a url informada
void launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  } else {
    showSnackbar('Não foi possível prosseguir com a solicitação', seconds: 2);
  }
}

bool isNullOrEmpty(dynamic value) {
  if (value == null) {
    return true;
  }

  if (value is String) {
    if (value.trim().isEmpty || value == 'null') {
      return true;
    }
  }

  return false;
}

Widget clearField({required dynamic value, required VoidCallback onClear}) {
  if (value == null || (value is String && value.isEmpty)) return const SizedBox();

  return CsIconButton.light(
    icon: const CsIcon.icon(icon: Icons.clear),
    onPressed: onClear,
    tooltip: 'Limpar filtro',
  );
}

///Verifica se duas datas são iguais
///
///Utilizado para verificar qual é a data selecionada
bool isSameTime(DateTime date1, DateTime date2) {
  return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
}

DateTime? tryParseDate(dynamic value, {NormalizeDate? normalizeDateType}) {
  if (value == null) {
    return null;
  }

  if (normalizeDateType != null) {
    try {
      value = _normalizeDate(normalizeDateType, value);
    } catch (_) {}
  }

  return DateTime.tryParse(value.toString());
}

//Recebe um tipo de data esperada em determinado formato e retorna uma data que pode ser convertida pelo DateTime.tryParse
String? _normalizeDate(NormalizeDate type, dynamic value) {
  switch (type) {
    //Formato esperado: dd/MM/yyyy
    case NormalizeDate.br_format:
      String v = (value as String).replaceAll('/', '');
      if (v.length >= 8) {
        String year = v.substring(4, 8);
        String month = v.substring(2, 4);
        String day = v.substring(0, 2);
        return '$year$month$day';
      }
      return null;

    //Formato esperado: HH:mm:ss
    case NormalizeDate.just_hour:
      if ((value as String).length == 5 || value.length == 8) {
        DateTime now = DateTime.now();
        String date = '${now.year}${(now.month).toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
        return '$date $value';
      }
      return value;

    default:
      return null;
  }
}
