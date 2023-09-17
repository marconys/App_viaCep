import 'package:via_cep_api/models/enderecos_back4app_model.dart';
import 'package:via_cep_api/repositories/back4app/back4app_custom_dio.dart';

class Back4AppHttpRepository {
  final _customDio = Back4AppCustomDio();

  Back4AppHttpRepository();

  Future<CepsBack4AppModel> getCeps() async {
    var result = await _customDio.dio.get("/enderecos");

    return CepsBack4AppModel.fromJson(result.data);
  }

  Future<EnderecosBack4AppModel?> getEnderecoByObjectId(String objectId) async {
  try {
    final result = await _customDio.dio.get("/enderecos/$objectId");
    return EnderecosBack4AppModel.fromJson(result.data);
  } catch (e) {
    throw Exception('Ocorreu um erro ao buscar o endereço: $e');
  }
}


  Future<void> createEndereco(
      EnderecosBack4AppModel enderecosBack4AppModel) async {
    try {
      await _customDio.dio
          .post("/enderecos", data: enderecosBack4AppModel.toJsonEndpoint());
    } catch (e) {
      throw Exception('Ocorreu um erro ao criar o endereço: $e');
    }
  }

  Future<void> updateEndereco(
      EnderecosBack4AppModel enderecosBack4AppModel) async {
    try {
       await _customDio.dio.put(
          "/enderecos/${enderecosBack4AppModel.objectId}",
          data: enderecosBack4AppModel.toJsonEndpoint());
    } catch (e) {
      throw Exception('Ocorreu um erro ao atualizar o endereço: $e');
    }
  }

  Future<void> deleteEndereco(String objectId) async {
    try {
      await _customDio.dio.delete("/enderecos/$objectId");
    } catch (e) {
      throw Exception('Ocorreu um erro ao excluir o endereço: $e');
    }
  }
}
