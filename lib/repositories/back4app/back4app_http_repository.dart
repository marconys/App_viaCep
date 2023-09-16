import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:via_cep_api/models/enderecos_back4app_model.dart';

class Back4AppHttpRepository {
  Future<List<EnderecosBack4AppModel>> getCeps() async {
    String baseUrl = dotenv.env['BACK4APPBASEURL'] ?? '';
    String applicationId = dotenv.env['BACK4APPAPPLICATIONID'] ?? '';
    String restApiKey = dotenv.env['BACK4APPRESTAPIKEY'] ?? '';

    final response = await http.get(
      Uri.parse(baseUrl), // Usa a URL contida no arquivo .env para obter todos os endereços
      headers: <String, String>{
        'X-Parse-Application-Id': applicationId, // Usa a chave do arquivo .env
        'X-Parse-REST-API-Key': restApiKey, // Usa a chave do arquivo .env
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var jsonPosts = jsonDecode(response.body);
      return (jsonPosts as List)
          .map((e) => EnderecosBack4AppModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> createEndereco(EnderecosBack4AppModel endereco) async {
    String baseUrl = dotenv.env['BACK4APPBASEURL'] ?? '';
    String applicationId = dotenv.env['BACK4APPAPPLICATIONID'] ?? '';
    String restApiKey = dotenv.env['BACK4APPRESTAPIKEY'] ?? '';

    final response = await http.post(
      Uri.parse(baseUrl), // Usa a URL contida no arquivo .env para inserir um novo endereço
      headers: <String, String>{
        'X-Parse-Application-Id': applicationId, // Usa a chave do arquivo .env
        'X-Parse-REST-API-Key': restApiKey, // Usa a chave do arquivo .env
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(endereco
          .toJson()), // Converte o objeto EnderecosBack4AppModel em JSON
    );

    if (response.statusCode == 201) {
      print("Endereço foi criado com sucesso.");
    } else {
      print("Não foi possível criar o endereço.");
    }
  }

  Future<void> updateEndereco(EnderecosBack4AppModel endereco) async {
    String baseUrl = dotenv.env['BACK4APPBASEURL'] ?? '';
    String applicationId = dotenv.env['BACK4APPAPPLICATIONID'] ?? '';
    String restApiKey = dotenv.env['BACK4APPRESTAPIKEY'] ?? '';

    final response = await http.put(
      Uri.parse(
          '$baseUrl/${endereco.objectId}'), // Usa a URL contida no arquivo .env para atualizar o endereço específico
      headers: <String, String>{
        'X-Parse-Application-Id': applicationId, // Usa a chave do arquivo .env
        'X-Parse-REST-API-Key': restApiKey, // Usa a chave do arquivo .env
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(endereco
          .toJson()), // Converte o objeto EnderecosBack4AppModel em JSON
    );

    if (response.statusCode == 200) {
      print("Endereço foi atualizado com sucesso.");
    } else {
      print("Não foi possível atualizar o endereço.");
    }
  }

  Future<void> deleteEndereco(String objectId) async {
    String baseUrl = dotenv.env['BACK4APPBASEURL'] ?? '';
    String applicationId = dotenv.env['BACK4APPAPPLICATIONID'] ?? '';
    String restApiKey = dotenv.env['BACK4APPRESTAPIKEY'] ?? '';

    final response = await http.delete(
      Uri.parse(
          '$baseUrl/$objectId'), // Use a URL correta para deletar o endereço específico
      headers: <String, String>{
        'X-Parse-Application-Id': applicationId, // Use a chave do arquivo .env
        'X-Parse-REST-API-Key': restApiKey, // Use a chave do arquivo .env
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("Endereço foi deletado com sucesso.");
    } else {
      print("Não foi possível deletar o endereço.");
    }
  }
}
