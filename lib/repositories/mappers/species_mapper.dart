import 'package:timewaretest1/misc/mapper.dart';
import 'package:timewaretest1/models/species.dart';
import 'package:timewaretest1/services/network/dto/species_dto.dart';

class SpeciesMapper extends DTOMapper<SpeciesDTO, Species> {
  @override
  Species toModel(SpeciesDTO dto) => Species(
        taxonid: dto.taxonid,
        scientificName: dto.scientificName,
        subspecies: dto.subspecies,
        rank: dto.rank,
        subpopulation: dto.subpopulation,
        category: dto.category,
        photo: dto.photo,
      );

  @override
  SpeciesDTO toTransferObject(Species model) {
    throw UnimplementedError();
  }
}
