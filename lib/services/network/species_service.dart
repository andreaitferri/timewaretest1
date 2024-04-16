import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:timewaretest1/errors/network_error.dart';
import 'package:timewaretest1/services/network/dto/detailed_species_dto.dart';
import 'package:timewaretest1/services/network/dto/species_dto.dart';
import 'package:timewaretest1/services/network/dto/species_response.dart';

class SpeciesService {
  static const String _baseUrl = 'www.andreaitferri.com';
  static const String _apiPath = '/TEMP/testapi/demodata.php';

  Future<List<SpeciesDTO>> fetchSpecies() async {
    final response = await http.get(
      Uri.https(_baseUrl, _apiPath),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw NetworkError(
        response.statusCode,
        response.reasonPhrase ?? "No reason provided",
      );
    }

    final decodedResponse = jsonDecode(response.body) as List<dynamic>;
    return SpeciesResponse.fromJson(decodedResponse).response;
  }

  Future<DetailedSpeciesDTO> fetchSpeciesDetails(int details) async {
    final uri = Uri.https(_baseUrl, _apiPath, {'details': details.toString()});

    final response = await http.get(
      uri,
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw NetworkError(
        response.statusCode,
        response.reasonPhrase ?? "No reason provided",
      );
    }

    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return DetailedSpeciesDTO.fromJson(decodedResponse);
  }
}
