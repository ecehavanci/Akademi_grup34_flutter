import 'package:flutter/material.dart';
import 'package:moodvicer/values.dart';
import 'package:moodvicer/widgets/label_container.dart';
import 'package:moodvicer/widgets/shaped_container.dart';

class LatestMovieContainer extends StatefulWidget {
  final double width;
  final double height;
  final double? radius;
  final EdgeInsetsGeometry padding;
  final String movieName;
  final String movieDuration;
  final double movieIMDB_Point;
  final List<String>? Moviegenres;

  const LatestMovieContainer(
      {Key? key,
      required this.width,
      required this.height,
      required this.padding,
      required this.movieName,
      required this.movieDuration,
      required this.movieIMDB_Point,
      this.Moviegenres,
      this.radius})
      : super(key: key);

  @override
  _LatestMovieContainerState createState() => _LatestMovieContainerState();
}

class _LatestMovieContainerState extends State<LatestMovieContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Container(
        width: widget.width,
        height: widget.height,
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, AppColors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.7, 1],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius!),
            image: const DecorationImage(fit: BoxFit.fill, image: AssetImage("assets/moodvicer_icon.jpg"))),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            Positioned(
              bottom: 5,
              child: Column(
                children: [
                  const Text(
                    "Star Wars: The Las Jedi",
                    style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 15),
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            const Icon(Icons.watch_later_outlined, color: AppColors.white),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                widget.movieDuration,
                                style:
                                    const TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: AppColors.white),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              widget.movieIMDB_Point.toString(),
                              style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: SizedBox(
                width: 200,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.Moviegenres?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieLabel(movieGenre: widget.Moviegenres![index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
    /*child: */
  }
}
