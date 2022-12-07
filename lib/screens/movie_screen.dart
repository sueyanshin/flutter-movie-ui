import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/movie_model.dart';
import '../widgets/movie_player.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  const MovieScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ..._buildBackground(context, movie),
        _buildMoiveInformation(context),
        _buildActions(context),
      ]),
    );
  }

  Positioned _buildActions(BuildContext context) {
    return Positioned(
        bottom: 50,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20.0),
                      backgroundColor: const Color(0xFFFF7272),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.425, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                        children: [
                          TextSpan(
                              text: 'Add to',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                          const TextSpan(text: ' Watchlist')
                        ]),
                  )),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20.0),
                      backgroundColor: Colors.white,
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.425, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MoviePlayer(movie: movie)));
                  },
                  child: RichText(
                    text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                        children: [
                          TextSpan(
                              text: 'Start',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: ' Watching',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                        ]),
                  ))
            ],
          ),
        ));
  }

  Positioned _buildMoiveInformation(BuildContext context) {
    return Positioned(
      bottom: 150,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              movie.name,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${movie.year} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            RatingBar.builder(
                initialRating: 3.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemSize: 20,
                unratedColor: Colors.white,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (rating) {}),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'lorem this is  hthso is a big aihd oa kdfiojdoif oisdfoisdhf oihsdf osidf dsflsdkhdlsf lsdfh lorem this is  hthso is a big aihd oa kdfiojdoif oisdfoisdhf oihsdf osidf dsflsdkhdlsf lsdfh lorem this is  hthso is a big aihd oa kdfiojdoif oisdfoisdhf oihsdf osidf dsflsdkhdlsf lsdfh lorem this is  hthso is a big aihd oa kdfiojdoif oisdfoisdhf oihsdf osidf dsflsdkhdlsf lsdfh lorem this is  hthso is a big aihd oa kdfiojdoif oisdfoisdhf oihsdf osidf dsflsdkhdlsf lsdfh lorem this is  hthso is a big aihd oa kdfiojdoif oisdfoisdhf oihsdf osidf dsflsdkhdlsf lsdfh lorem this is  hthso is a big aihd oa kdfiojdoif oisdfoisdhf oihsdf osidf dsflsdkhdlsf lsdfh lorem this is  hthso is a big aihd oa kdfiojdoif oisdfoisdhf oihsdf osidf dsflsdkhdlsf lsdfh lorem this is  hthso is a big aihd oa kdfiojdoif oisdfoisdhf oihsdf osidf dsflsdkhdlsf lsdfh',
              maxLines: 8,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(height: 1.75, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBackground(context, movie) {
    return [
      Container(
        height: double.infinity,
        color: const Color(0xFF000849),
      ),
      Image.network(
        movie.imagePath,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.cover,
      ),
      const Positioned.fill(
          child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
        colors: [Colors.transparent, Color(0xFF000B49)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.3, 0.5],
      )))),
    ];
  }
}
