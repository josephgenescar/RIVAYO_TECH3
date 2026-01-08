import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    const Color tealRivayo = Color(0xFF00B4AD);

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 50,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: tealRivayo,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.business,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'RIVAYO TECH',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
      actions: [
        _navButton(context, 'Accueil', '/'),
        _navButton(context, 'Services', '/services'),
        _navButton(context, 'Projets', '/projects'),
        _navButton(context, 'À propos', '/about'),
        _navButton(context, 'Contact', '/contact'),

        // --- BOUTON POU DEKLANCHE REKLAM LAN ---
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: ElevatedButton.icon(
            onPressed: () {
              // TODO: METE KÒMAND REKLAM LAN ISIT LA
              // Pa egzanp: AdManager.showRewardedAd();
              print("Pub deklanche pou soutni Rivayo Tech!");

              _showSupportDialog(context); // Yon ti mesaj remèsiman
            },
            icon: const Icon(Icons.card_giftcard, size: 16),
            label: const Text(
              "SOUTENIR",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: tealRivayo,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),

        const SizedBox(width: 15),
      ],
    );
  }

  Widget _navButton(BuildContext context, String text, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  // Ti mesaj remèsiman lè yo klike sou bouton an
  void _showSupportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1D1E),
        title: const Text(
          "Merci !",
          style: TextStyle(color: Color(0xFF00B4AD)),
        ),
        content: const Text(
          "Merci de soutenir Rivayo Tech. La publicité va se lancer pour nous aider à continuer à vous servir.",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK", style: TextStyle(color: Color(0xFF00B4AD))),
          ),
        ],
      ),
    );
  }
}
