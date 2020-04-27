import 'package:cdd_mobile_frontend/common/api/api.dart';
import 'package:cdd_mobile_frontend/common/entity/entity.dart';
import 'package:cdd_mobile_frontend/common/util/util.dart';
import 'package:cdd_mobile_frontend/common/value/value.dart';
import 'package:cdd_mobile_frontend/common/widget/widget.dart';
import 'package:cdd_mobile_frontend/global.dart';
import 'package:cdd_mobile_frontend/page/home/pet/pet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  APIResponse<List<PetEntity>> _apiResponse;

  bool _isLoading = false;

  // 处理添加宠物按钮
  _handleAddPetButton() {
    print("Press add pet");
  }

  // 从服务器获取宠物列表
  _fetchPets() async {
    setState(() {
      _isLoading = true;
    });
    _apiResponse =
        await PetAPI.getAllPets(userId: int.parse(Global.accessToken));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchPets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: cddSetHeight(250.0),
          child: Image.asset(
            "assets/images/pet_header.png",
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBarWidget(bgColor: Colors.transparent),
          body: Column(
            children: <Widget>[
              _buildAddPet(),
              SizedBox(height: cddSetHeight(20)),
              _buildPetList(),
              // SizedBox(height: cddSetHeight(10)),
            ],
          ),
        ),
      ],
    );
  }

  // 构建添加宠物
  Widget _buildAddPet() {
    return Padding(
      padding: EdgeInsets.only(
        left: cddSetWidth(43.0),
        right: cddSetWidth(43.0),
        top: cddSetHeight(250 - MediaQuery.of(context).padding.top),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "宠物",
            style: TextStyle(
              fontSize: cddSetFontSize(20.0),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          IconButton(
            color: Colors.black,
            icon: Icon(
              Iconfont.tianjia,
              size: cddSetFontSize(28.0),
            ),
            onPressed: _handleAddPetButton,
          ),
        ],
      ),
    );
  }

  // 构建宠物列表
  Widget _buildPetList() {
    return Builder(builder: (_) {
      if (_isLoading) {
        return Center(child: CircularProgressIndicator());
      }
      if (_apiResponse.error) {
        return Center(child: Text(_apiResponse.errorMessage));
      }
      if (_apiResponse.data.length == 0) {
        return Center(
          child: Text("No pet"),
        );
      }
      return SizedBox(
        height: cddSetHeight(320),
        child: Swiper(
          onTap: (index) async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PetPage(
                  petId: _apiResponse.data[index].id,
                ),
              ),
            );
            _fetchPets();
          },
          itemBuilder: (context, index) {
            return _buildPetCard(index);
          },
          itemCount: _apiResponse.data.length,
          viewportFraction: 0.5,
          scale: 0.6,
          loop: false,
          pagination: SwiperPagination(
            // alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: cddSetHeight(5)),
            builder: SwiperPagination.dots,
          ),
        ),
      );
    });
  }

  // 构建宠物卡片
  Widget _buildPetCard(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: Radii.k10pxRadius,
        gradient: AppColor.petCardColors[index % AppColor.petCardColors.length],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: cddSetWidth(10.0),
              top: cddSetHeight(10.0),
            ),
            child: _apiResponse.data[index].species == 'cat'
                ? Icon(
                    Iconfont.cat,
                    size: cddSetFontSize(40.0),
                    color: Colors.white,
                  )
                : Icon(
                    Iconfont.dog4,
                    size: cddSetFontSize(40.0),
                    color: Colors.white,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: cddSetHeight(15.0)),
                height: cddSetWidth(100),
                width: cddSetWidth(100),
                child: ClipOval(
                  child: Image.network(
                    _apiResponse.data[index].avatar,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: cddSetHeight(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _apiResponse.data[index].nickname,
                style: TextStyle(
                  fontSize: cddSetFontSize(16),
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: cddSetHeight(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "${cddGetAge(_apiResponse.data[index].birthday)} years old",
                style: TextStyle(
                  fontSize: cddSetFontSize(14),
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: cddSetHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _apiResponse.data[index].introduction,
                style: TextStyle(
                  fontSize: cddSetFontSize(14),
                  color: Colors.black.withOpacity(0.7),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
