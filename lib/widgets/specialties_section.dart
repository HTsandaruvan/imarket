import 'package:flutter/material.dart';
import 'package:imarket/constants/colors.dart';

class SpecialtiesSection extends StatelessWidget {
  final List<String> specialties;

  const SpecialtiesSection({super.key, required this.specialties});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Specialties',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                specialties
                    .map(
                      (specialty) => Chip(
                        label: Text(specialty),
                        backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
                        labelStyle: TextStyle(color: AppColors.primaryBlue),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
