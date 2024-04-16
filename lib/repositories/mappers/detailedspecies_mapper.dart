import 'package:timewaretest1/misc/mapper.dart';
import 'package:timewaretest1/models/detailed_species.dart';
import 'package:timewaretest1/services/network/dto/detailed_species_dto.dart';

class DetailedSpeciesMapper
    extends DTOMapper<DetailedSpeciesDTO, DetailedSpecies> {
  @override
  DetailedSpecies toModel(DetailedSpeciesDTO dto) => DetailedSpecies(
        taxonid: dto.taxonid,
        scientificName: dto.scientificName,
        subspecies: dto.subspecies,
        rank: dto.rank,
        subpopulation: dto.subpopulation,
        category: dto.category,
        photo: dto.photo,
        kingdom: dto.kingdom,
        phylum: dto.phylum,
        animalClass: dto.animalClass,
        order: dto.order,
        family: dto.family,
        genus: dto.genus,
        mainCommonName: dto.mainCommonName,
        authority: dto.authority,
        publishedYear: dto.publishedYear,
        criteria: dto.criteria,
        marineSystem: dto.marineSystem,
        freshwaterSystem: dto.freshwaterSystem,
        terrestrialSystem: dto.terrestrialSystem,
        aooKm2: dto.aooKm2,
        eooKm2: dto.eooKm2,
        elevationUpper: dto.elevationUpper,
        elevationLower: dto.elevationLower,
        depthUpper: dto.depthUpper,
        depthLower: dto.depthLower,
        assessor: dto.assessor,
        reviewer: dto.reviewer,
        errataFlag: dto.errataFlag,
        errataReason: dto.errataReason,
        amendedFlag: dto.amendedFlag,
        amendedReason: dto.amendedReason,
      );

  @override
  DetailedSpeciesDTO toTransferObject(DetailedSpecies model) {
    throw UnimplementedError();
  }
}
