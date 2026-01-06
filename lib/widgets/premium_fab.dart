import 'package:flutter/material.dart';

class PremiumServiceFab extends StatefulWidget {
  const PremiumServiceFab({super.key});

  @override
  State<PremiumServiceFab> createState() => _PremiumServiceFabState();
}

class _PremiumServiceFabState extends State<PremiumServiceFab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.amber,
      icon: const Icon(Icons.stars, color: Colors.black),
      label: const Text(
        'Service Premium',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      onPressed: () => _showConfirmation(context),
    );
  }

  // 1. Mande konfimasyon
  void _showConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Soutenir Rivayo Tech'),
        content: const Text(
          'Pour débloquer l\'accès Premium gratuitement, veuillez regarder une annonce sponsorisée.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showAd(context); // Lè l klike, nou montre pub la
            },
            child: const Text('Soutenir & Continuer'),
          ),
        ],
      ),
    );
  }

  // 2. Montre Pub la
  void _showAd(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Pub la ap fèmen otomatikman apre 8 segonn
        Future.delayed(const Duration(seconds: 8), () {
          if (mounted) {
            Navigator.pop(context);
            _showSuccess(context); // Montre siksè
          }
        });

        return AlertDialog(
          title: const Text('Annonce en cours...'),
          content: const SizedBox(
            width: 300,
            height: 250,
            child: HtmlElementView(
              viewType: 'adsense-view',
            ), // Rele kòd nan main.dart la
          ),
        );
      },
    );
  }

  // 3. Mesaj Siksè apre pub la
  void _showSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('✨ Accès Débloqué'),
        content: const Text(
          'Merci ! Vous avez maintenant accès à vos audits SEO et Sitemaps.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
