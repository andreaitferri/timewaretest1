import 'package:flutter/material.dart';
import 'package:timewaretest1/models/detailed_species.dart';

class DetailedSpeciesWidget extends StatelessWidget {
  final DetailedSpecies detailedSpecies;

  const DetailedSpeciesWidget(this.detailedSpecies, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DetailedSpeciesInfoWidget(detailedSpecies),
            ],
          ),
        ),
      );
}

class DetailedSpeciesInfoWidget extends StatelessWidget {
  final DetailedSpecies detailedSpecies;

  const DetailedSpeciesInfoWidget(this.detailedSpecies, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextStyle textStyle = _getTextStyleForWidth(width);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            detailedSpecies.photo,
            width: width * 0.95,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Icon(Icons.error),
          ),
          Text(
            'Kingdom: ${detailedSpecies.kingdom}',
            style: textStyle,
          ),
          Text(
            'Class: ${detailedSpecies.animalClass}',
            style: textStyle,
          ),
          Text(
            'Main Common Name: ${detailedSpecies.mainCommonName}',
            style: textStyle,
          ),
          Image.network(
            detailedSpecies.photo,
            width: width * 0.95,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Icon(Icons.error),
          ),
        ],
      ),
    );
  }

  TextStyle _getTextStyleForWidth(double width) {
    if (width > 800) {
      return const TextStyle(fontSize: 24);
    } else if (width > 600) {
      return const TextStyle(fontSize: 20);
    } else {
      return const TextStyle(fontSize: 16);
    }
  }
}
