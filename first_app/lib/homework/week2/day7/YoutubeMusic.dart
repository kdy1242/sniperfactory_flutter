// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:first_app/homework/week2/day7/MusicTile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Music {
  String imgUrl;
  String title;
  String singer;
  String time;
  Music(this.imgUrl, this.title, this.singer, this.time);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Music> musicList = [
      Music('assets/images/youtube_music/music_come_with_me.png', 'Come with me', 'Surfaces 및 salem ilese', '3:00'),
      Music('assets/images/youtube_music/music_good_day.png', 'Good day', 'Surfaces', '3:00'),
      Music('assets/images/youtube_music/music_honesty.png', 'Honesty', 'Pink Sweat\$', '3:00'),
      Music('assets/images/youtube_music/music_i_wish_i_missed_my_ex.png', 'I Wish I Missed My Ex', '마할리아 버크마', '3:00'),
      Music('assets/images/youtube_music/music_plastic_plants.png', 'Plastic Plants', '마할리아 버크마', '3:00'),
      Music('assets/images/youtube_music/music_sucker_for_you.png', 'Sucker for you', '맷 테리', '3:00'),
      Music('assets/images/youtube_music/music_summer_is_for_falling_in_love.png', 'Summer is for falling in love', 'Sarah Kang & Eye Love Brandon', '3:00'),
      Music('assets/images/youtube_music/music_these_days.png', 'These days(feat. Jess Glynne, Macklemore & Dan Caplen)', 'Rudimental', '3:00'),
      Music('assets/images/youtube_music/music_you_make_me.png', 'You Make Me', 'DAY6', '3:00'),
      Music('assets/images/youtube_music/music_zombie_pop.png', 'Zombie Pop', 'DRP IAN', '3:00'),
    ];

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          shape: Border(
            bottom: BorderSide(
                color: Colors.grey,
                width: 1
            )
          ),
          leading: Icon(Icons.arrow_back_ios),
          title: Text('아워리스트'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.monitor),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            )
          ],
        ),

        body: ListView.builder(
          shrinkWrap: true,
          itemCount: musicList.length,
          itemBuilder: (context, index) {
            return MusicTile(
              imgUrl: musicList[index].imgUrl,
              title: musicList[index].title,
              singer: musicList[index].singer,
              time: musicList[index].time,
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: '둘러보기'),
            BottomNavigationBarItem(icon: Icon(Icons.library_music_sharp), label: '보관함'),
          ],
          selectedItemColor: Colors.white,
        ),
        bottomSheet: Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1
              )
            )
          ),
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(musicList[0].imgUrl),
            ),
            title: Text(musicList[0].title, maxLines: 2, overflow: TextOverflow.ellipsis),
            subtitle: Text(musicList[0].singer, overflow: TextOverflow.ellipsis),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.play_arrow),
                ),
                Icon(Icons.skip_next),
              ],
            ),
          ),
        ),
      )
    );
  }
}
