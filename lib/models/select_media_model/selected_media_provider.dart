import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class SelectedMediaProvider extends ChangeNotifier {
  List<AssetEntity> _selectedMedia = [];

  List<AssetEntity> get selectedMedia => _selectedMedia;

  void setSelectedMedia(List<AssetEntity> media) {
    _selectedMedia = media;
    notifyListeners();
  }

  void clear() {
    _selectedMedia = [];
    notifyListeners();
  }

  void addMedia(AssetEntity asset) {
    _selectedMedia.add(asset);
    notifyListeners();
  }

  void clearMedia() {
    _selectedMedia.clear();
    notifyListeners();
  }
}
