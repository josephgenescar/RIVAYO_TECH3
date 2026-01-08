import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80); // Redui yon ti kras pou l pi elegant

  @override
  Widget build(BuildContext context) {
    // Koulè vè teal Rivayo a
    const Color tealRivayo = Color(0xFF00B4AD);

    return AppBar(
      // Nou mete l transparans pou gradyan ki nan background nan ka parèt
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false, // Nou mete l false pou logo a ka sou bò gòch

      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            // LOGO RIVAYO
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
            // TEKS RIVAYO TECH
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
        const SizedBox(width: 15),
      ],
    );
  }

  // Ti fonksyon pou bouton navigasyon yo pwofesyonèl
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
}
