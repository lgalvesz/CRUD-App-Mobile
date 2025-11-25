import 'package:flutter/material.dart';

class InitialAvatar extends StatelessWidget {
  final String name;
  final double size;

  const InitialAvatar({
    super.key,
    required this.name,
    this.size = 50,
  });

  String _getInitials() {
    List<String> names = name.trim().split(' ');
    if (names.isEmpty) return '?';
    
    if (names.length == 1) {
      return names[0][0].toUpperCase();
    }
    
    return (names[0][0] + names[names.length - 1][0]).toUpperCase();
  }

  Color _getColorFromName() {
    int hash = name.hashCode;
    List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.cyan,
    ];
    return colors[hash.abs() % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: _getColorFromName(),
      child: Text(
        _getInitials(),
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.4,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Widget que tenta carregar imagem, se falhar usa iniciais
class SmartAvatar extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double size;

  const SmartAvatar({
    super.key,
    required this.imageUrl,
    required this.name,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return InitialAvatar(name: name, size: size);
    }

    return CircleAvatar(
      radius: size / 2,
      child: ClipOval(
        child: Image.network(
          imageUrl,
          width: size,
          height: size,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return InitialAvatar(name: name, size: size);
          },
          errorBuilder: (context, error, stackTrace) {
            return InitialAvatar(name: name, size: size);
          },
        ),
      ),
    );
  }
}