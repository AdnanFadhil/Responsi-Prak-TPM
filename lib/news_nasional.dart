import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsi/nasional.dart';
import 'package:responsi/terbaru.dart';
import 'base_network.dart';
import 'list_news_model.dart';

class NewsNasional extends StatefulWidget {
  const NewsNasional({Key? key}) : super(key: key);
  @override
  _NewsNasionalState createState() => _NewsNasionalState();
}

class _NewsNasionalState extends State<NewsNasional> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries Detail"),
      ),
      body: _buildDetailCountriesBody(),
    );
  }

  Widget _buildDetailCountriesBody() {
    return Container(
      child: FutureBuilder(
        future: Nasional.instance.loadNasional(),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            ListNewsModel nasionalModel = ListNewsModel.fromJson(snapshot.data);
            return _buildSuccessSection(nasionalModel);
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
