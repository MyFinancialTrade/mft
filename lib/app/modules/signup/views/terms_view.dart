import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TermsView extends GetView {
  const TermsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TermsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TermsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
