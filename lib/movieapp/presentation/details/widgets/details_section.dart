import 'package:flutter/material.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';
import 'package:mentali/movieapp/presentation/details/widgets/about.dart';
import 'package:mentali/movieapp/presentation/details/widgets/production.dart';

class DetailsSection extends StatefulWidget {
  const DetailsSection({super.key, required this.movie});

  final MovieDetail movie;

  @override
  State<DetailsSection> createState() => _DetailsSectionState();
}

class _DetailsSectionState extends State<DetailsSection> {
  late List tabOptions = [];

  @override
  void initState() {
    tabOptions = [
      [
        "About",
        About(movie: widget.movie),
      ],
      [
        "Productions",
        Production(productions: widget.movie.productionCompanies!)
      ]
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabOptions.length,
      child: Column(
        children: [
          TabBar(
            tabs: tabOptions
                .map((option) => Tab(
                      text: option[0] as String,
                    ))
                .toList(),
          ),
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
                child: TabBarView(
                  children:
                      tabOptions.map((option) => option[1] as Widget).toList(),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
