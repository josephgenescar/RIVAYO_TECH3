import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../widgets/custom_app_bar.dart';
import '../widgets/footer.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();
  bool _isSending = false;

  // Koulè Rivayo Tech
  static const Color tealRivayo = Color(0xFF00B4AD);
  static const Color nwaRivayo = Color(0xFF0B0D0E);
  static const Color kadNwa = Color(0xFF1A1D1E);

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _message.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSending = true);

    try {
      final response = await http.post(
        Uri.parse('https://formsubmit.co/ajax/josephgenescar@gmail.com'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': _name.text.trim(),
          'email': _email.text.trim(),
          'message': _message.text.trim(),
          '_subject': 'Nouvo mesaj soti nan Sit Rivayo Tech',
        }),
      );

      if (response.statusCode == 200) {
        _showSnackBar('Mesaj la voye ak siksè!', Colors.green);
        _name.clear();
        _email.clear();
        _message.clear();
      } else {
        throw Exception();
      }
    } catch (e) {
      _showSnackBar('Erreur: Mesaj la pa voye.', Colors.red);
    } finally {
      if (mounted) setState(() => _isSending = false);
    }
  }

  void _showSnackBar(String msg, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: color));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nwaRivayo,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [nwaRivayo, Color(0xFF162124)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 120, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'KONTAKTE NOU',
                style: TextStyle(
                  color: tealRivayo,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Ekri nou pou nenpòt pwojè oswa keksyon.',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 30),

              // FÒMILÈ A
              _buildContactForm(),

              const SizedBox(height: 40),

              // ENFÒMASYON KONTAK (Soti nan Flyer)
              const Text(
                'LÒT MOYEN KONTAK',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              _contactInfoTile(Icons.phone, 'WhatsApp', '+509 48 86 89 64'),
              _contactInfoTile(
                Icons.email,
                'Email',
                'josephgenescar@gmail.com',
              ),
              _contactInfoTile(
                Icons.language,
                'Sit Web',
                'rivayo3.netlify.app',
              ),

              const SizedBox(height: 60),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: kadNwa,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: tealRivayo.withOpacity(0.2)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _customField('Non ou', _name, Icons.person, false),
            const SizedBox(height: 15),
            _customField('Email ou', _email, Icons.email, false),
            const SizedBox(height: 15),
            _customField('Mesaj ou', _message, Icons.message, true),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: tealRivayo,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                onPressed: _isSending ? null : _submit,
                child: _isSending
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'VOYE MESAJ LA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customField(
    String label,
    TextEditingController ctr,
    IconData icon,
    bool isLarge,
  ) {
    return TextFormField(
      controller: ctr,
      maxLines: isLarge ? 5 : 1,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white60),
        prefixIcon: Icon(icon, color: tealRivayo),
        filled: true,
        fillColor: nwaRivayo,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: tealRivayo.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: tealRivayo),
        ),
      ),
      validator: (v) => v!.isEmpty ? 'Tanpri ranpli chan sa a' : null,
    );
  }

  Widget _contactInfoTile(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: kadNwa,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: tealRivayo, size: 24),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white60, fontSize: 12),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.copy, size: 18, color: tealRivayo),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: value));
              _showSnackBar('$title kopye!', tealRivayo);
            },
          ),
        ],
      ),
    );
  }
}
