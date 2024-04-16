import 'package:equatable/equatable.dart';

class SpeciesDTO extends Equatable {
  final int taxonid;
  final String scientificName;
  final String subspecies;
  final String rank;
  final String subpopulation;
  final String category;
  final String photo;

  const SpeciesDTO({
    required this.taxonid,
    required this.scientificName,
    required this.subspecies,
    required this.rank,
    required this.subpopulation,
    required this.category,
    required this.photo,
  });

  factory SpeciesDTO.fromJson(Map<String, dynamic> data) {
    return SpeciesDTO(
      taxonid: data['taxonid'] as int,
      scientificName: data['scientific_name'] as String,
      subspecies: data['subspecies'] as String,
      rank: data['rank'] as String,
      subpopulation: data['subpopulation'] as String,
      category: data['category'] as String,
      photo: data['photo'] as String,
    );
  }

  @override
  List<Object?> get props => [
        taxonid,
        scientificName,
        subspecies,
        rank,
        subpopulation,
        category,
        photo,
      ];
}
