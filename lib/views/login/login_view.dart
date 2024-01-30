// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../configs/assets/assets_path.dart';
import '../../configs/routes/local_routes.dart';
import '../../models/sessao/sessao_model.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../widgets/cards/card_error_login.dart';
import '../../widgets/cs_checkbox_list_tile.dart';
import '../../widgets/cs_circular_progress_indicador.dart';
import '../../widgets/cs_elevated_button.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_icon_button.dart';
import '../../widgets/cs_text_form_field.dart';
import 'login_state.dart';
import 'login_validate.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final sessao = getIt<SessaoModel>();
  final stateView = LoginState();

  final formKey = GlobalKey<FormState>();

  ///[Controllers]
  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _localAuth();
  }

  Future<void> _localAuth() async {
    try {
      // Verifique se já existe um usuário autenticado no Firebase
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // Se já existe um usuário autenticado, redirecione para a tela inicial
        getIt<NavigationService>().pushNamedAndRemoveUntil(LocalRoutes.HOME);
      }
    } catch (e) {
      // Trate quaisquer erros ao verificar a autenticação local
      print('Erro ao verificar autenticação local: $e');
    }
  }

  Future<void> _login() async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        stateView.setLogginIn(value: true);
        formKey.currentState?.save();

        // Faça a autenticação no Firebase Auth
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usuarioController.text,
          password: senhaController.text,
        );

        // Redirecione para a tela inicial após a autenticação bem-sucedida
        if (userCredential.user != null) {
          getIt<NavigationService>().pushNamedAndRemoveUntil(LocalRoutes.HOME);
        }
      }
    } catch (err) {
      stateView.setErrorMessage('Erro ao fazer login. Verifique suas credenciais.');
    } finally {
      stateView.setLogginIn(value: false);
    }
  }

  IconData _iconObscureText() {
    if (stateView.obscurePassword) {
      return Icons.visibility;
    }

    return Icons.visibility_off;
  }

  String _tooltipPassword() {
    if (stateView.obscurePassword) {
      return 'Mostrar senha';
    }

    return 'Esconder senha';
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
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Image.asset(AssetsPath.LOGO, fit: BoxFit.contain, height: 140, width: 350),

                    // Campo de Usuário
                    CsTextFormField(
                      label: 'Usuário',
                      hintText: 'Informe seu usuário',
                      controller: usuarioController,
                      validator: LoginValidate.usuario,
                      autocorrect: false,
                      enableSuggestions: false,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (usuario) {
                        sessao.setUsuario(usuario);
                      },
                      suffixIcon: const CsIconButton.light(
                        icon: CsIcon.icon(
                          icon: Icons.person,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Campo de Senha
                    Observer(
                      builder: (_) {
                        return CsTextFormField(
                          label: 'Senha',
                          hintText: 'Informe sua senha',
                          validator: LoginValidate.senha,
                          obscureText: stateView.obscurePassword,
                          textCapitalization: TextCapitalization.none,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          onSaved: (senha) {
                            sessao.setSenha(senha);
                          },
                          suffixIcon: CsIconButton.light(
                            onPressed: stateView.changeObscurePassword,
                            tooltip: _tooltipPassword(),
                            icon: CsIcon.icon(
                              icon: _iconObscureText(),
                            ),
                          ),
                          controller: senhaController,
                        );
                      },
                    ),
                    const SizedBox(height: 5),

                    Observer(
                      builder: (_) {
                        return CsCheckboxListTile(
                          onChanged: (value) async {
                            stateView.setLembrarSe(value: value!);
                          },
                          value: stateView.lembrarSe,
                          title: 'Lembrar-se de mim',
                        );
                      },
                    ),

                    const SizedBox(height: 15),

                    Observer(
                      builder: (_) {
                        return Visibility(
                          visible: stateView.errorMessage.isNotEmpty,
                          child: CardErrorLogin(message: stateView.errorMessage),
                        );
                      },
                    ),

                    const SizedBox(height: 15),

                    // Button Entrar/Login
                    Observer(
                      builder: (_) {
                        return AnimatedSwitcher(
                          duration: const Duration(seconds: 1),
                          child: stateView.loggingIn
                              ? const CsCircularProgressIndicador.dark()
                              : CsElevatedButton(
                                  label: 'Entrar',
                                  onPressed: _login,
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
