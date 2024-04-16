import 'package:equatable/equatable.dart';

class Species extends Equatable {
  final int taxonid;
  final String scientificName;
  final String subspecies;
  final String rank;
  final String subpopulation;
  final String category;
  final String photo;

  const Species({
    required this.taxonid,
    required this.scientificName,
    required this.subspecies,
    required this.rank,
    required this.subpopulation,
    required this.category,
    required this.photo,
  });

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
