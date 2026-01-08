import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:js' as js;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    const Color tealRivayo = Color(0xFF00B4AD);
    // Nou tcheke lajè ekran an pou nou konnen si se yon telefòn
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;

    return AppBar(
      backgroundColor: const Color(0xFF1A1D1E), // Yon ti nwa pwofesyonèl
      elevation: 2,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, '/'),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo ak sekirite pou l pa janm disparèt
              Image.asset(
                'assets/images/logo.png',
                height: isMobile ? 35 : 45,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.bolt, // Yon ikon "Tech" si logo a gen pwoblèm
                  color: tealRivayo,
                  size: 30,
                ),
              ),
              if (!isMobile) ...[
                const SizedBox(width: 12),
                const Text(
                  'RIVAYO TECH',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      actions: [
        // Si se pa mobil, nou montre tout bouton yo
        if (!isMobile) ...[
          _navButton(context, 'Accueil', '/'),
          _navButton(context, 'Services', '/services'),
          _navButton(context, 'Projets', '/projects'),
          _navButton(context, 'À propos', '/about'),
          _navButton(context, 'Contact', '/contact'),
        ],

        // BOUTON SOUTENIR (Toujou vizib)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          child: ElevatedButton.icon(
            onPressed: () => _showSupportOptions(context),
            icon: const Icon(Icons.volunteer_activism, size: 16),
            label: Text(
              isMobile ? "AIDER" : "SOUTENIR",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: tealRivayo,
              foregroundColor: Colors.white,
              elevation: 5,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),

        // Si se mobil, nou ka ajoute yon Menu Hamburger isit la si w vle
        if (isMobile)
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),

        const SizedBox(width: 10),
      ],
    );
  }

  Widget _navButton(BuildContext context, String text, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
        padding: const EdgeInsets.symmetric(horizontal: 15),
      ),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
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
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: tealRivayo.withOpacity(0.5), width: 1.5),
        ),
        title: Column(
          children: [
            Icon(Icons.favorite, color: tealRivayo, size: 40),
            const SizedBox(height: 10),
            const Text(
              "Soutenir Rivayo Tech",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Chwazi yon opsyon pou ede nou avanse",
                style: TextStyle(color: Colors.white60, fontSize: 13),
              ),
              const SizedBox(height: 25),

              // MONCASH
              _supportItem(
                context,
                "MonCash",
                "48868964",
                Icons.account_balance_wallet,
                const Color(0xFFE21217), // Wouj MonCash
              ),

              // NATCASH
              _supportItem(
                context,
                "NatCash",
                "40683108",
                Icons.payments,
                const Color(0xFF00A19B), // Teal NatCash
              ),

              // PAYPAL
              _supportItem(
                context,
                "PayPal",
                "josephbrunette26@gmail.com",
                Icons.paypal,
                const Color(0xFF003087), // Blue PayPal
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(color: Colors.white10),
              ),

              // PUB UNITY
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                leading: const CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.play_arrow, color: Colors.black),
                ),
                title: const Text(
                  "Regarder une Pub",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "Soutien gratuit (Unity Ads)",
                  style: TextStyle(color: Colors.white54, fontSize: 11),
                ),
                onTap: () {
                  Navigator.pop(context);
                  js.context.callMethod('afichePubUnity');
                },
              ),
            ],
          ),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(color: Colors.white54, fontSize: 11),
        ),
        trailing: const Icon(Icons.copy, size: 16, color: Colors.white24),
        onTap: () {
          Clipboard.setData(ClipboardData(text: value));
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("$title kopye!"),
              backgroundColor: color,
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
      ),
    );
  }
}
