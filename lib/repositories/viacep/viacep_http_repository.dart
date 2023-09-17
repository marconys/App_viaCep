import 'package:dio/dio.dart';
import 'package:via_cep_api/models/viacep_model.dart';

class ViaCepRepository {
  Future<ViaCepModel> consultarCEP(String cep) async {
    var dio = Dio();
    var result = await dio.get("https://viacep.com.br/ws/$cep/json/");
    if (result.statusCode == 200) {
      return ViaCepModel.fromJson(result.data);
    }
    return ViaCepModel();
  }
}
