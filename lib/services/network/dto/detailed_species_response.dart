import 'package:equatable/equatable.dart';
import 'detailed_species_dto.dart';

class DetailedSpeciesResponse extends Equatable {
  final List<DetailedSpeciesDTO> response;

  const DetailedSpeciesResponse({required this.response});

  factory DetailedSpeciesResponse.fromJson(List<dynamic> jsonList) =>
      DetailedSpeciesResponse(
        response: jsonList
            .map((jsonItem) =>
                DetailedSpeciesDTO.fromJson(jsonItem as Map<String, dynamic>))
            .toList(growable: false),
      );

  @override
  List<Object> get props => [response];
}
