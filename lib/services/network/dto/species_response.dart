import 'package:equatable/equatable.dart';
import 'species_dto.dart';

// Risposta dell'API che include una lista di specie
class SpeciesResponse extends Equatable {
  final List<SpeciesDTO> response;

  const SpeciesResponse({required this.response});

  factory SpeciesResponse.fromJson(List<dynamic> jsonList) => SpeciesResponse(
        response: jsonList
            .map((jsonItem) =>
                SpeciesDTO.fromJson(jsonItem as Map<String, dynamic>))
            .toList(growable: false),
      );

  @override
  List<Object> get props => [response];
}
