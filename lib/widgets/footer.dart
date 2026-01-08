import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    // Koulè ki sou flyers Rivayo Tech la
    const Color tealRivayo = Color(0xFF00B4AD);
    const Color nwaFonse = Color(0xFF0B0D0E);

    return Container(
      width: double.infinity,
      color: nwaFonse, // Nwa pwofesyonèl flyers la
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        children: [
          // 1. HEADER FOOTER (LOGO + NON)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 45,
                height: 45,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.business, color: tealRivayo, size: 30),
              ),
              const SizedBox(width: 12),
              const Text(
                'RIVAYO TECH',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // 2. KONTAK YO (WhatsApp / Email)
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 30,
            runSpacing: 15,
            children: [
              _contactItem(
                Icons.phone,
                "+509 48 86 89 64",
                tealRivayo,
                context,
              ),
              _contactItem(
                Icons.email,
                "rivayo003@gmail.com",
                tealRivayo,
                context,
              ),
              _contactItem(
                Icons.language,
                "rivayo3.netlify.app",
                tealRivayo,
                context,
              ),
            ],
          ),

          const SizedBox(height: 30),

          // 3. NAVIGASYON RAPID
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _footerLink(context, 'Accueil', '/'),
              _footerLink(context, 'Services', '/services'),
              _footerLink(context, 'Contact', '/contact'),
            ],
          ),

          const Divider(height: 50, color: Colors.white10, thickness: 1),

          // 4. COPYRIGHT
          const Text(
            '© 2026 RIVAYO TECH – Entreprise technologique',
            style: TextStyle(color: Colors.white38, fontSize: 13),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Solisyon Dijital Entéljan pou Ti & Gwo Biznis',
            style: TextStyle(
              color: tealRivayo,
              fontSize: 11,
              fontStyle: FontStyle.italic,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  // Widget pou afiche kontak yo ak opsyon pou kopye
  Widget _contactItem(
    IconData icon,
    String label,
    Color color,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: label));
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: color,
              content: Text(
                '$label kopye ak siksè!',
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // Widget pou lyen navigasyon yo
  Widget _footerLink(BuildContext context, String title, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white54, fontSize: 14),
      ),
    );
  }
}
