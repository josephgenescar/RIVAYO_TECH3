import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 183, 181, 181),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aliye tout bagay a gòch
        children: [
          Row(
            children: [
              // --- 1. LOGO OU A ISIT ---
              Image.asset(
                'assets/images/logo.png', // Tcheke si non an kòrèk
                width: 40,
                height: 40,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  // Si imaj la gen pwoblèm, l ap mete ti sèk sa a
                  return Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                    ),
                    child: const Icon(Icons.business, size: 20),
                  );
                },
              ),
              const SizedBox(width: 8),
              const Text(
                'RIVAYO TECH',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text('© 2026 RIVAYO TECH – Entreprise technologique'),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.email, size: 16),
              const SizedBox(width: 6),
              GestureDetector(
                onTap: () async {
                  final messenger = ScaffoldMessenger.maybeOf(context);
                  await Clipboard.setData(
                    const ClipboardData(text: 'josephgenescar@gmail.com'),
                  );
                  messenger?.showSnackBar(
                    const SnackBar(content: Text('Email copié')),
                  );
                },
                child: const Text('josephgenescar@gmail.com'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            children: [
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/'),
                child: const Text('Accueil'),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/services'),
                child: const Text('Services'),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/contact'),
                child: const Text('Contact'),
              ),
            ],
          ),

          // --- 2. FRAZ "KREYE PA..." LA ---
          const Divider(height: 30, thickness: 0.5), // Ti liy separasyon
          const Center(
            child: Text(
              'Créé par Rivayo Entreprise',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
