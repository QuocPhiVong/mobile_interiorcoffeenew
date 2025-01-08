import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/appbar/appbar.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelViewerScreen extends StatefulWidget {
  const ModelViewerScreen({super.key});

  @override
  State<ModelViewerScreen> createState() => _ModelViewerScreenState();
}

class _ModelViewerScreenState extends State<ModelViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Model Viewer',style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      backgroundColor: TColors.light,
      body: ModelViewer(
        src: 'assets/logos/chair.glb',
        autoRotate: false,
        cameraControls: true,
      ),
    );
  }
}
