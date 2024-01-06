import 'package:authentication_app/model/product_model.dart';
import 'package:authentication_app/profile_screen/signin_screen.dart';
import 'package:authentication_app/provider/product_provider.dart';
import 'package:authentication_app/share_preference/user_share_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({super.key, required this.token});

  String token;

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProductData();
  }
  bool _isclickEnabel = true;

  void toggleButtonColor(){
    setState(() {
      _isclickEnabel = !_isclickEnabel;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu_outlined)),
        title: Text('Wallpaper Hub', style: GoogleFonts.dancingScript(textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (BuildContext context, provider, _) {
          if (provider.dataLoading == true) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.productData == null ||
              provider.productData!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            return ListView.builder(
                itemCount: provider.productData!.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = provider.productData![index];
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 500,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            Container(
                              height: 450,
                              width: 400,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl: data.wallpaperUrl.toString(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:[
                                Text('Theme Name: '+data.wallpaperName.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

                                IconButton(onPressed: (){}, icon: Row(
                                  children: [
                                    Icon(Icons.visibility, color: Colors.green,),
                                    SizedBox(width: 6,),
                                    Text(data.totalViews.toString()),
                                      ],
                                )),
                                IconButton(onPressed: (){}, icon: Icon(Icons.download, color: Colors.orange.shade700,)),
                                IconButton(onPressed: (){
                                  toggleButtonColor();
                                }, icon: Icon(Icons.favorite_border, color: _isclickEnabel? Colors.orange.shade700: Colors.green,)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}

