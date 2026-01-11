import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const Color tealRivayo = Color(0xFF00B4AD);
    const Color nwaRivayo = Color(0xFF1A1D1E);

    return Drawer(
      backgroundColor: nwaRivayo,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF0B0D0E)),
            child: Center(
              child: Image.asset('assets/images/logo.png', height: 60),
            ),
          ),
          _drawerItem(context, Icons.home, "ACCUEIL", "/"),
          _drawerItem(context, Icons.settings, "SERVICES", "/services"),
          _drawerItem(context, Icons.work, "PROJETS", "/projects"),
          _drawerItem(context, Icons.info, "À PROPOS", "/about"),
          _drawerItem(context, Icons.contact_mail, "CONTACT", "/contact"),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "RIVAYO TECH © 2026",
              style: TextStyle(color: Colors.white24, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context,
    IconData icon,
    String title,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF00B4AD)),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Fèmen drawer a anvan
        Navigator.pushNamed(context, route); // Ale nan paj la
      },
    );
  }
}
