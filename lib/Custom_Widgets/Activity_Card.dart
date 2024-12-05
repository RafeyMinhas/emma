import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final double progress;
  final String status;
  final Color iconColor; // New property for icon color
  final Color progressColor; // New property for progress bar color

  const ActivityCard({
    super.key,
    required this.icon,
    required this.title,
    required this.progress,
    required this.status,
    required this.iconColor, // Marking icon color as required
    required this.progressColor, // Marking progress color as required
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0), // Reduced padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0), // Slightly smaller radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0, // Reduced blur radius
            offset: const Offset(0, 4), // Slightly smaller shadow offset
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 48, // Larger icon size
            color: iconColor, // Using custom icon color
          ),
          const SizedBox(width: 16), // Adjusted spacing
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Little Title Text
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14, // Smaller font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6), // Adjusted spacing
                // Big Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // Larger radius
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 10.0, // Larger height for the progress bar
                    color: progressColor, // Using custom progress color
                    backgroundColor: progressColor.withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12), // Adjusted spacing
          // Little Status Text
          Text(
            status,
            style: TextStyle(
              fontSize: 12, // Smaller font size
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
