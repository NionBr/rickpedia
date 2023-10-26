import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String species;
  final String status;
  final String gender;
  final String image;

  const CardWidget({
    super.key,
    required this.name,
    required this.image,
    required this.species,
    required this.status,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1.5,
              offset: const Offset(0, 2),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.network(
                image,
                height: height * 0.17,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text('Status: $status'),
                    Text('Specie: $species'),
                    Text('Gender: $gender'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
