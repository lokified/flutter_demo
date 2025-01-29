import 'package:flutter/material.dart';
import 'package:mentali/nft/widgets/nft_card.dart';

class TrendingTab extends StatelessWidget {
  const TrendingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return NftCard(imagePath: 'assets/images/nft-2.jpeg');
  }
}