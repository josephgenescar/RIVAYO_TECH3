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
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;

    return AppBar(
      backgroundColor: const Color(0xFF1A1D1E),
      elevation: 2,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, '/'),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: isMobile ? 35 : 45,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.bolt, color: tealRivayo, size: 30),
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
        if (!isMobile) ...[
          _navButton(context, 'Accueil', '/'),
          _navButton(context, 'Services', '/services'),
          _navButton(context, 'Projets', '/projects'),
          _navButton(context, 'À propos', '/about'),
          _navButton(context, 'Contact', '/contact'),
        ],

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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),

        if (isMobile)
          Builder(
            builder: (innerContext) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(innerContext).openEndDrawer();
              },
            ),
          ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _navButton(BuildContext context, String text, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      style: TextButton.styleFrom(foregroundColor: Colors.white70),
      child: Text(text.toUpperCase(), style: const TextStyle(fontSize: 13)),
    );
  }

  void _showSupportOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1D1E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: const BorderSide(color: Color(0xFF00B4AD), width: 1.5),
        ),
        title: const Text(
          "Soutenir Rivayo Tech",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _supportItem(
              context,
              "MonCash",
              "48868964",
              Icons.account_balance_wallet,
              const Color(0xFFE21217),
            ),
            _supportItem(
              context,
              "NatCash",
              "40683108",
              Icons.payments,
              const Color(0xFF00A19B),
            ),
            _supportItem(
              context,
              "PayPal",
              "josephbrunette26@gmail.com",
              Icons.paypal,
              const Color(0xFF003087),
            ),
            const Divider(color: Colors.white10, height: 30),

            // SEKSYON ADSTERRA KI MODIFYE
            Container(
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.amber.withOpacity(0.3)),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.play_arrow, color: Colors.black),
                ),
                title: const Text(
                  "Soutenir Gratuitement",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                subtitle: const Text(
                  "Regardez une annonce (Direct Link)",
                  style: TextStyle(color: Colors.white54, fontSize: 10),
                ),
                onTap: () {
                  Navigator.pop(context);

                  // METE LYEN ADSTERRA PA W LA LA
                  const String adsterraDirectLink =
                      "https://www.effectivegatecpm.com/fkciwcfuz?key=6a078d50925ec49a010f6f08265632ac";

                  try {
                    // Nou louvri lyen an nan yon lòt onglet
                    js.context.callMethod('open', [adsterraDirectLink]);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("🙏 Mèsi anpil pou sipò w!"),
                        backgroundColor: Color(0xFF00B4AD),
                        duration: Duration(seconds: 4),
                      ),
                    );
                  } catch (e) {
                    debugPrint("Erè: $e");
                  }
                },
              ),
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
        style: const TextStyle(color: Colors.white54, fontSize: 11),
      ),
      onTap: () {
        Clipboard.setData(ClipboardData(text: value));
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("✅ $title kopye!"), backgroundColor: color),
        );
      },
    );
  }
}
