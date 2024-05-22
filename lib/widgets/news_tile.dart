import 'package:flutter/material.dart';
import 'package:news_app/models/articals_model.dart';
import 'package:news_app/views/web_view.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.artical});

  final ArticalModel artical;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  WebView(url:artical.url);
        }));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(artical.image??'https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12,),
           Text(artical.title ,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:const TextStyle( fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(height: 1,),
            Text(artical.subTitle??'',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}