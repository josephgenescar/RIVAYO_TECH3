import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

        // BOUTON SOUTENIR
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: ElevatedButton.icon(
            onPressed: () => _showSupportOptions(context),
            icon: const Icon(Icons.favorite, size: 16),
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

  void _showSupportOptions(BuildContext context) {
    const Color tealRivayo = Color(0xFF00B4AD);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1D1E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          // ISIT LA NOU RANJE BORDER LA:
          side: BorderSide(color: tealRivayo.withOpacity(0.3), width: 1),
        ),
        title: const Text(
          "Soutenir Rivayo Tech",
          textAlign: TextAlign.center,
          style: TextStyle(color: tealRivayo, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Chwazi yon mwayen pou ede nou grandi :",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),
            _supportItem(
              context,
              "MonCash",
              "48868964",
              Icons.phone_android,
              tealRivayo,
            ),
            _supportItem(
              context,
              "NatCash",
              "40683108",
              Icons.tap_and_play,
              Colors.redAccent,
            ),
            _supportItem(
              context,
              "PayPal",
              "josephbrunette26@gmail.com",
              Icons.payment,
              Colors.blueAccent,
            ),
            const Divider(color: Colors.white10, height: 30),
            ListTile(
              leading: const Icon(Icons.play_circle_fill, color: Colors.amber),
              title: const Text(
                "Regarder une Pub",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                "Soutien gratuit",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Chargement de la publicité..."),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _supportItem(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(color: Colors.white54, fontSize: 12),
      ),
      trailing: const Icon(Icons.copy, size: 18, color: Colors.white24),
      onTap: () {
        Clipboard.setData(ClipboardData(text: value));
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$title kopye: $value"),
            backgroundColor: const Color(0xFF00B4AD),
          ),
        );
      },
    );
  }
}
