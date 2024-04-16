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
          child: Center(
            child: Column(
              children: [
                DetailedSpeciesInfoWidget(detailedSpecies),
              ],
            ),
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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        TextStyle textStyle = _getTextStyleForWidth(constraints.maxWidth);

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                detailedSpecies.photo,
                width: constraints.maxWidth * 0.35,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.error),
              ),
              SizedBox(height: 5),
              Text(
                'Main Common Name: ${detailedSpecies.mainCommonName}',
                style: textStyle,
                textAlign: TextAlign.center,
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
                'Order: ${detailedSpecies.order}',
                style: textStyle,
              ),
              Text(
                'Family: ${detailedSpecies.family}',
                style: textStyle,
              ),
            ],
          ),
        );
      },
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
