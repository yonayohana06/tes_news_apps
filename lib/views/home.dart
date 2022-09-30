// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tes_news/api/api_service.dart';
import 'package:tes_news/views/details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map> menuFavorites = [
    {
      'label': 'KLINIK TERDEKAT', 
      'image': 'assets/images/hospital.png'
    },
    {
      'label': 'RIWAYAT',
      'image': 'assets/images/riwayat.png',
    },
    {
      'label': 'DATA SCAN',
      'image': 'assets/images/data.png',
    },
    {
      'label': 'NOTIFIKASI',
      'image': 'assets/images/notifikasi.png',
    },
    {
      'label': 'BERI NILAI',
      'image': 'assets/images/nilai.png',
    },
    {
      'label': 'PENGATURAN',
      'image': 'assets/images/pengaturan.png',
    }
  ];

  final List<String> imgs = [
    'assets/images/slide.png',
  ];

  late bool _loading;
  var listArticle;

  getData() async {
    ApiService news = ApiService();
    await news.getArticle();
    listArticle = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("Halo, Raka"),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.person),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 231, 231, 231),
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 0, 21, 255),
                                Color.fromARGB(255, 248, 2, 149)
                              ]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10, left: 15, right: 15),
                            child: Row(
                              children: const [
                                Text(
                                  "INFO ANTRIAN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            thickness: 1,
                            indent: 0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                            child: Row(children: [
                              Column(children: const [
                                Text(
                                  "21",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Nomor Antrian",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                              const SizedBox(
                                width: 25,
                              ),
                              Column(children: const [
                                Text(
                                  "5",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Sisa antrian",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Dokter anda",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Color.fromARGB(255, 255, 224, 130),
                                      ),
                                    ),
                                    Text(
                                      "dr. Rina Agustina",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Klinik / RS anda",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Color.fromARGB(255, 255, 224, 130),
                                      ),
                                    ),
                                    Text(
                                      "RS. National Hospital",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]),
                            ]),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Wrap(
                            runSpacing: 10,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              for (final menus in menuFavorites) Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  height: 70,
                                  width: 90,
                                  child: Column(
                                    children: [
                                      Image.asset(menus['image'],
                                        scale: 1.3,
                                        ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(menus['label'],
                                        style: const TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children:[
                      CarouselSlider(
                        items: imgs
                          .map((imgs) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              child: Image.asset(imgs.toString(),),
                            ),
                          ))
                          .toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                        ),
                      ),
                  ]),
                  ListView.builder(
                      itemCount: listArticle.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () { Navigator.push(
                                context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                      ArticlePage(
                                        title: listArticle[index].title,
                                        imgUrl: listArticle[index].urlToImage,
                                        desc: listArticle[index].description,
                                        date: DateFormat.yMMMd().format(listArticle[index].publishedAt),
                                        content: listArticle[index].content,
                                        author: listArticle[index].author,
                                        )
                                      )
                                    );
                                  },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(15),
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              listArticle[index].urlToImage),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 20, right: 20),
                                    child: Text(
                                      listArticle[index].title,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 15, left: 20, right: 20, bottom: 20),
                                    child: Text(
                                      listArticle[index].description,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
      ),
    );
  }
}
