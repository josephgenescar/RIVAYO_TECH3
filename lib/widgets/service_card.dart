import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? description;
  final Color? color;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.description,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Koulè Flyers Rivayo Tech yo
    const Color tealRivayo = Color(0xFF00B4AD);
    const Color nwaKoleksyon = Color(0xFF1A1D1E);
    final primaryColor = color ?? tealRivayo;

    return SizedBox(
      width: 300,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: description == null
            ? null
            : () => _showServiceDetails(context, primaryColor),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          decoration: BoxDecoration(
            color: nwaKoleksyon, // Fond fonse pou style teknolojik
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: primaryColor.withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.1),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // --- LOGO AN BACKGROUND (Dèyè nèt) ---
                Positioned(
                  bottom: -20,
                  right: -20,
                  child: Opacity(
                    opacity: 0.05,
                    child: Image.asset(
                      'assets/images/logo.png', // Sèvi ak logo prensipal la
                      width: 120,
                    ),
                  ),
                ),

                // --- KONTNI KAT LA ---
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icône la ak yon ti glow
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.15),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryColor.withOpacity(0.5),
                          ),
                        ),
                        child: Icon(icon, size: 32, color: primaryColor),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        subtitle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                      const Spacer(),
                      // Ti flèch ki endike ka gen plis enfòmasyon
                      if (description != null)
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: primaryColor,
                            size: 20,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fonksyon pou afiche detay yo ak style nwa/teal
  void _showServiceDetails(BuildContext context, Color primaryColor) {
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        backgroundColor: const Color(0xFF0B0D0E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: primaryColor, width: 1),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              description!,
              style: const TextStyle(color: Colors.white70, height: 1.6),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(c),
            child: Text('OK', style: TextStyle(color: primaryColor)),
          ),
        ],
      ),
    );
  }
}
