import 'package:flutter/material.dart';
import 'package:mentali/nft/widgets/nft_card.dart';

class TopTab extends StatelessWidget {
  const TopTab({super.key});

  @override
  Widget build(BuildContext context) {
    return NftCard(imagePath: "assets/images/nft-3.jpeg");
  }
}