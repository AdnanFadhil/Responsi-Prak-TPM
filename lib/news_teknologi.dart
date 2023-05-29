import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsi/teknologi.dart';
import 'package:responsi/terbaru.dart';
import 'base_network.dart';
import 'list_news_model.dart';

class NewsTeknologi extends StatefulWidget {
  const NewsTeknologi({Key? key}) : super(key: key);
  @override
  _NewsTeknologiState createState() => _NewsTeknologiState();
}

class _NewsTeknologiState extends State<NewsTeknologi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Teknologi"),
      ),
      body: _buildDetailCountriesBody(),
    );
  }

  Widget _buildDetailCountriesBody() {
    return Container(
      child: FutureBuilder(
        future: Teknologi.instance.loadTeknologi(),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            ListNewsModel teknologiModel =
                ListNewsModel.fromJson(snapshot.data);
            return _buildSuccessSection(teknologiModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(ListNewsModel data) {
    return ListView.builder(
      itemCount: data.data?.image!.length,
      itemBuilder: (BuildContext, index) {
        return getcard(data.data);
      },
    );
  }

  Widget getcard(index) {
    var title = index.title;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(60 / 2),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(index.image))),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title.toString(),
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
