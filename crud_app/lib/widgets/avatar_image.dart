import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final Color backgroundColor;
  final Color iconColor;

  const AvatarImage({
    super.key,
    required this.imageUrl,
    this.size = 50,
    this.backgroundColor = Colors.blue,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: backgroundColor.withOpacity(0.2),
      child: ClipOval(
        child: imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                width: size,
                height: size,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  
                  return Center(
                    child: SizedBox(
                      width: size * 0.4,
                      height: size * 0.4,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        color: backgroundColor,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  print('Erro ao carregar imagem: $error'); // DEBUG
                  return Icon(
                    Icons.person,
                    color: backgroundColor,
                    size: size * 0.6,
                  );
                },
              )
            : Icon(
                Icons.person,
                color: backgroundColor,
                size: size * 0.6,
              ),
      ),
    );
  }
}