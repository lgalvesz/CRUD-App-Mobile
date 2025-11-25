import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class ImageHelper {
  static const String backendUrl = 'http://localhost:3000';
  
  // Converte URL de imagem para usar proxy se estiver na web
  static String getImageUrl(String originalUrl) {
    if (originalUrl.isEmpty) return '';
    
    // Se estiver na Web, usa o proxy do backend
    if (kIsWeb) {
      return '$backendUrl/image/proxy?url=${Uri.encodeComponent(originalUrl)}';
    }
    
    // Se for mobile, usa a URL original
    return originalUrl;
  }
}

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    final url = ImageHelper.getImageUrl(imageUrl);
    
    if (url.isEmpty) {
      return errorWidget ?? 
        Icon(Icons.person, size: width ?? 50, color: Colors.grey);
    }

    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return placeholder ??
            Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
      },
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ??
            Icon(Icons.broken_image, size: width ?? 50, color: Colors.red);
      },
    );
  }
}