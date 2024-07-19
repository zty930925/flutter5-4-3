//引入核心套件
import 'package:flutter/material.dart';
//引入外部資料的http套件，用于发送HTTP请求
import 'package:http/http.dart' as http;

//建立類別函數FutureBuilderDemoScreen並繼承StatelessWidget
class FutureBuilderDemoScreen extends StatelessWidget {
  //要求外部資料，不能確保回應時間，通常會用Future包覆(取用外部資料 <-> Future)
  //告訴flutter，不要讓主程式等待這些行為，避免畫面延遲
  //將寫法單純化，使用async/await語法
  //取回的值的型態不確定，先宣告成dynamic
  Future<dynamic> getDataFromRemote() async {
    //解析遠端系統的網址
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    //透過http的get方法取用該網址
    var response = await http.get(url);
    //回傳取回的值(封包內容)
    return response.body;
  }

  @override
  //執行build方法，構建UI
  Widget build(BuildContext context) {
    //Future不會及時回傳數據渲染桌布，因此使用FutureBuilder物件
    //FutureBuilder物件，透過Future參數，協助調度Future函數
    return FutureBuilder(
      future: getDataFromRemote(),
      //initialData，數據未回傳時，初步渲染畫面
      initialData: [],
      //FutureBuilder核心參數:builder
      //builder有固定兩個參數BuildContext、AsyncSnapshot<T>
      builder: (BuildContext context, AsyncSnapshot<dynamic> asyncSnapshot) {
        return Scaffold(
          body: Text(asyncSnapshot.data),
        );
      },
    );
  }
}
