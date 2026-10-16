import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/artwork_storage_service.dart';
import '../services/audio_feedback_service.dart';
import '../theme/app_colors.dart';
import '../widgets/kid_button.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  void _showArtworkDetails(BuildContext context, SavedArtworkInfo artwork, ArtworkStorageService storage) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    artwork.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(ctx),
                    icon: const Icon(Icons.close_rounded, size: 28),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Image preview
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  File(artwork.filePath),
                  width: 280,
                  height: 280,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                'Colored on ${artwork.savedAt.day}/${artwork.savedAt.month}/${artwork.savedAt.year}',
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: KidButton(
                      color: const Color(0xFFFF4757),
                      onPressed: () {
                        AudioFeedbackService.tap();
                        storage.deleteArtwork(artwork.id);
                        Navigator.pop(ctx);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete_rounded, color: Colors.white, size: 20),
                          SizedBox(width: 6),
                          Text(
                            'Delete',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: KidButton(
                      color: AppColors.secondary,
                      onPressed: () => Navigator.pop(ctx),
                      child: const Center(
                        child: Text(
                          'Close',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final storage = context.watch<ArtworkStorageService>();
    final artworks = storage.artworks;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('My Art Museum'),
      ),
      body: SafeArea(
        child: artworks.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: AppColors.surfacePastelYellow,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.palette_rounded,
                          size: 72,
                          color: AppColors.accentOrange,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Your Museum is Empty!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Finish any coloring page to hang your masterwork in the museum gallery!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemCount: artworks.length,
                itemBuilder: (context, index) {
                  final item = artworks[index];

                  return GestureDetector(
                    onTap: () {
                      AudioFeedbackService.tap();
                      _showArtworkDetails(context, item, storage);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                              child: Image.file(
                                File(item.filePath),
                                fit: BoxFit.contain,
                                errorBuilder: (_, _, _) => const Center(
                                  child: Icon(Icons.broken_image_rounded, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: AppColors.textDark,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Level ${item.levelNumber}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textMuted,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
