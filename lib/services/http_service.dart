// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:http/http.dart' as http;

import '../models/erros/error_model.dart';
import '../models/sessao/sessao_model.dart';
import '../stores/download/download_store.dart';
import '../utils/response_validate.dart';
import 'internet_service.dart';
import 'service_locator.dart';

class HttpService {
  static final _session = getIt<SessaoModel>();
  static final _downloadStore = getIt<DownloadStore>();

  ///Responsável por fazer requisições do tipo `GET`
  ///
  ///Utilize a propriedade [url] quando desejar usar um link completo, sem interferências da base url selecionada
  static Future<dynamic> get({
    required String? rota,
    String? url,
    Map? params,
    Map? headers,
    bool validResponse = true,
    bool useToken = true,
  }) async {
    //Se não houver conexão com a internet, não é realizado a tentativa da requisição
    if (!await hasInternet()) {
      throw ErrorModel.internet();
    }

    try {
      String urlRequest;
      if (url == null) {
        urlRequest = '${_session.servidor!.url}$rota';
      } else {
        urlRequest = url;
      }

      final dio = Dio();

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;

        client.idleTimeout = const Duration(seconds: 60);

        client.connectionTimeout = const Duration(minutes: 2);

        return null;
      };

      if (useToken) {
        try {
          //Automaticamente adiciona o token a requisição
          headers ??= {}; //Caso seja nulo, cria um map vazio
          // headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${await retornaJWT()}'});
        } catch (_) {}
      }

      if (headers != null) {
        headers.addAll({
          HttpHeaders.acceptHeader: 'application/json',
        });
      }

      Response response = await dio.get(
        urlRequest,
        queryParameters: params?.cast(),
        options: Options(
          headers: headers?.cast(),
          followRedirects: false,
          contentType: 'application/json',
          maxRedirects: 0,
          method: 'GET',
          validateStatus: (status) {
            return (status ?? 404) < 400;
          },
        ),
        onReceiveProgress: (progress, total) {
          _downloadStore.setProgress(progress);
          _downloadStore.setTotal(total);
        },
      );

      if (validResponse) {
        ResponseValidate.validate(resp: response);
      }

      return response.data;
    } on DioError catch (err) {
      if (validResponse) {
        ResponseValidate.validateDioError(error: err, rota: rota);
      }
    } catch (_) {
      rethrow;
    }
  }

  ///Responsável por fazer requisições do tipo `POST`
  ///
  ///Utilize a propriedade [url] quando desejar usar um link completo, sem interferências da base url selecionada
  static Future<dynamic> post({
    required String? rota,
    String? url,
    dynamic body,
    Map? params,
    Map? headers,
    bool validResponse = true,
    bool useToken = true,
  }) async {
    //Se não houver conexão com a internet, não é realizado a tentativa da requisição
    if (!await hasInternet()) {
      throw ErrorModel.internet();
    }

    try {
      String urlRequest;
      if (url == null) {
        urlRequest = '${_session.servidor!.url}$rota';
      } else {
        urlRequest = url;
      }

      final dio = Dio();

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;

        client.idleTimeout = const Duration(seconds: 60);

        client.connectionTimeout = const Duration(minutes: 2);

        return null;
      };

      if (useToken) {
        try {
          //Automaticamente adiciona o token a requisição
          headers ??= {}; //Caso seja nulo, cria um map vazio
          // headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${await retornaJWT()}'});
        } catch (_) {}
      }

      Response response = await dio.post(
        urlRequest,
        data: body,
        queryParameters: params?.cast(),
        options: Options(
          headers: headers?.cast(),
          followRedirects: false,
          contentType: 'application/json',
          maxRedirects: 0,
          method: 'POST',
          validateStatus: (status) {
            return (status ?? 404) < 400;
          },
        ),
        onReceiveProgress: (progress, total) {
          _downloadStore.setProgress(progress);
          _downloadStore.setTotal(total);
        },
      );

      if (validResponse) {
        ResponseValidate.validate(resp: response);
      }

      return response.data;
    } on DioError catch (err) {
      if (validResponse) {
        ResponseValidate.validateDioError(error: err, rota: rota!);
      }
    } catch (_) {
      rethrow;
    }
  }

  ///Faz uma requisição `GET` para download de um arquivo
  ///
  ///Utilize a propriedade [url] quando desejar usar um link completo, sem interferências da base url selecionada na tela de login
  static Future<void> downloadFile({
    required String? rota,
    required File file,
    String? url,
    dynamic body,
    Map? params,
    Map? headers,
    String? method = 'GET',
  }) async {
    //Se não houver conexão com a internet, não é realizado a tentativa da requisição
    if (!await hasInternet()) {
      throw ErrorModel.internet();
    }

    try {
      String urlRequest;
      if (url == null) {
        urlRequest = '${_session.servidor!.url}$rota';
      } else {
        urlRequest = url;
      }

      final dio = Dio();

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;

        client.idleTimeout = const Duration(seconds: 60);

        client.connectionTimeout = const Duration(minutes: 2);

        return null;
      };

      try {
        //Automaticamente adiciona o token a requisição
        headers ??= {}; //Caso seja nulo, cria um map vazio
        // headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${await retornaJWT()}'});
      } catch (_) {}

      await dio.download(
        urlRequest,
        file.path,
        data: body,
        queryParameters: params?.cast(),
        options: Options(
          headers: headers?.cast(),
          contentType: 'application/octet-stream',
          responseType: ResponseType.bytes,
          method: method,
          validateStatus: (status) {
            return (status ?? 404) < 400;
          },
        ),
        deleteOnError: true,
        onReceiveProgress: (progress, total) {
          _downloadStore.setProgress(progress);
          _downloadStore.setTotal(total);
        },
      );
    } on DioError catch (err) {
      ResponseValidate.validateDioError(error: err, rota: rota);
    } catch (_) {
      rethrow;
    }
  }

  static Future<List<int>> downloadHttp({
    required String? rota,
    http.MultipartFile? file,
    String? url,
    Map? body,
    Map? headers,
    String? method = 'GET',
  }) async {
    //Se não houver conexão com a internet, não é realizado a tentativa da requisição
    if (!await hasInternet()) {
      throw ErrorModel.internet();
    }

    String urlRequest;
    if (url == null) {
      urlRequest = '${_session.servidor!.url}$rota';
    } else {
      urlRequest = url;
    }

    dynamic request;
    if (file != null) {
      request = http.MultipartRequest(method!, Uri.parse(urlRequest));
      request.files.add(file);
    } else {
      request = http.Request(method!, Uri.parse(urlRequest));
    }

    if (request is http.Request) {
      if (body != null) {
        request.bodyFields.addAll(body.cast());
      }
    } else if (request is http.MultipartRequest) {
      if (body != null) {
        request.fields.addAll(body.cast());
      }
    }

    if (headers != null) {
      request.headers.addAll(headers);
    } else {
      // request.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${await retornaJWT()}'});
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List<int> bytes = [];
      var st = response.stream.listen((value) {
        bytes.addAll(value);
      });

      await st.asFuture();
      return bytes;
    } else {
      throw ErrorModel("Não foi possível completar a requisição");
    }
  }
}
