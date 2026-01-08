import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color tealRivayo = Color(0xFF00B4AD);
    const Color nwaRivayo = Color(0xFF0B0D0E);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),

      // KÒD DRAWER A KI GEN BOUTON POU SOTI
      endDrawer: Drawer(
        backgroundColor: const Color(0xFF1A1D1E),
        child: Column(
          children: [
            // BOUTON POU FÈMEN MENU AN
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            DrawerHeader(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white10)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 50,
                      errorBuilder: (c, e, s) =>
                          const Icon(Icons.bolt, color: tealRivayo, size: 40),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "RIVAYO TECH",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _drawerItem(context, 'ACCUEIL', '/', Icons.home),
            _drawerItem(context, 'SERVICES', '/services', Icons.settings),
            _drawerItem(context, 'PROJETS', '/projects', Icons.code),
            _drawerItem(context, 'À PROPOS', '/about', Icons.info),
            _drawerItem(context, 'CONTACT', '/contact', Icons.email),
          ],
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [nwaRivayo, Color(0xFF162124)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeroSection(),
              const SizedBox(height: 60),
              // ... rès kòd ou a ...
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context,
    String title,
    String route,
    IconData icon,
  ) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF00B4AD)),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
        // Si nou deja sou paj la, nou pa fè anyen
        if (ModalRoute.of(context)?.settings.name != route) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }
}
