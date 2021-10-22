import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:newquikk/helper/constants.dart';
import 'package:newquikk/models/addressmodel.dart';
import 'package:newquikk/models/banner_model.dart';
import 'package:newquikk/models/category_model.dart';
import 'package:newquikk/models/coupon_model.dart';
import 'package:newquikk/models/market_model.dart';
import 'package:newquikk/repository/banner_repo.dart';
import 'package:newquikk/repository/user_repo.dart';
import 'package:newquikk/res/colors.dart';
import 'package:newquikk/res/custom_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:location/location.dart' as locationFetch;
import 'package:google_maps_webservice/places.dart';


class HomeController extends ChangeNotifier {

  late List<CategoryModel> categories;
  late List<AddressModel> addresses;
  late List<MarketModel> _shops;
  late List<CouponModel> _coupons;
  late SharedPreferences _preferences;
  String? lat;
  String? lng;
  locationFetch.Location location = locationFetch.Location();
  String? address;
  UserRepo userRepo = UserRepo();
  bool loading = false;
  HomeRepo _bannerRepo = HomeRepo();
  List<BannerModel> bannerDataList = [];
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);


  Future<void> init() async {
    _shops = [];
    _coupons = [];
    addresses = [];
    bannerDataList = [];
    categories = [];
    getBanner();
    getCategory();
    await getDefaultAddress();
  }

  Future<void> getAddress() async {
    _preferences = await SharedPreferences.getInstance();
    String token = _preferences.getString('token')!;
    addresses = await _bannerRepo.getAddressRepo(token);
    notifyListeners();
  }

  void setDefaultAddress(
      String newAddress, String defLat, String defLng) async {
    _preferences = await SharedPreferences.getInstance();
    print(address);
    lat = defLat;
    lng = defLng;
    _preferences.setString('defaultAddress', newAddress);
    _preferences.setString('lat', defLat);
    _preferences.setString('lng', defLng);
    address = newAddress;
    notifyListeners();
  }

  void getCoupons() async {
    _preferences = await SharedPreferences.getInstance();
    String token = _preferences.getString('token')!;
    _coupons = [];
    _coupons = await _bannerRepo.getCouponsRepo(token);
    notifyListeners();
  }

  void getShop(String lat, String long) async {
    loading = true;
    notifyListeners();
    _shops = await _bannerRepo.getShopsRepo(lat, long) ?? [];
    loading = false;
    notifyListeners();
  }

  void setLocationToDb(String lat, String lng) async {
    _preferences = await SharedPreferences.getInstance();
    String? token = _preferences.getString('token');
    await userRepo.addUserLocationToDbRepo(token: token!, lat: lat, lng: lng);
  }

  Future<void> getDefaultAddress() async {
    _preferences = await SharedPreferences.getInstance();
    var data = _preferences.getString('defaultAddress');
    var defLat = _preferences.getString('lat');
    var defLng = _preferences.getString('lng');
    print(data);
    print(data);
    print(data);
    if (data != null && defLat != null && defLng != null) {
      print('has default');
      address = data;
      lat = defLat;
      lng = defLng;
      getShop(defLat, defLng);
      getCategory();
      getCoupons();
      return;
    } else {
      print('has no default');
      await getCurrentLocation();
    }
  }

  Future<void> getCurrentLocation() async {
    loading = true;
    notifyListeners();
    var data = await location.getLocation();
    print(data.latitude);
    print(data.longitude);
    setLocationToDb(data.latitude.toString(), data.longitude.toString());
    try {
      var ll = await placemarkFromCoordinates(data.latitude!, data.longitude!);
      address = ll.map((e) => e.name).toString();
    } on Exception catch (e) {
      address = 'Unnamed Place';
    }
    print(address);
    lat = data.latitude.toString();
    lng = data.longitude.toString();
    getShop(
      data.latitude.toString(),
      data.longitude.toString(),
    );
    getCategory();
    getCoupons();
    setDefaultAddress(
      address!,
      data.latitude.toString(),
      data.longitude.toString(),
    );
    notifyListeners();
  }

  void onSearchLocation(BuildContext context) async {
    print('ddddddddddd');
    // const kGoogleApiKey = "AIzaSyBXhOliwczoeSYjOeZrFCzZBrrjBUTMg4Y";
    var p = await PlacesAutocomplete.show(
      offset: 0,
      radius: 1000,
      strictbounds: false,
      language: "en",
      context: context,
      mode: Mode.overlay,
      logo: Text(''),
      apiKey: Constant.KGoogleApiKey,
      // sessionToken: 'sessionToken',
      components: [
        Component(Component.country, "ind"),
      ],
      types: [],
      hint: "Search City",
      // startText: 's'
    );
    // print(p?.placeId);
    print(p?.description);
    address = p?.description!;
    Navigator.pop(context);
    // print(p?.terms);
    // print(p?.matchedSubstrings);
    // print(p?.distanceMeters);
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: Constant.KGoogleApiKey,
      // apiHeaders: await GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail =
    await _places.getDetailsByPlaceId(p!.placeId!);
    print(detail.result.geometry!.location.lat);
    print(detail.result.geometry!.location.lng);
    lat = detail.result.geometry!.location.lat.toString();
    lng = detail.result.geometry!.location.lng.toString();
    setDefaultAddress(p.description!, lat!, lng!);
    getShop(detail.result.geometry!.location.lat.toString(),
        detail.result.geometry!.location.lng.toString());
    notifyListeners();
  }

  void openBottomSheet(BuildContext context) {
    bool sheetLoading = false;
    bool first = false;
    print(first);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (_, setStateOfBottom) {
            if (!first) {
              setStateOfBottom(() {
                sheetLoading = true;
                getAddress().then((value) => setStateOfBottom(() {
                  first = true;
                  sheetLoading = false;
                }));
              });
            }

            return Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 32),
              height: MediaQuery.of(context).size.height * .7,
              child: sheetLoading
                  ? CustomLoading()
                  : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Search location',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          onSearchLocation(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.black12, width: 2),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Search for your location...',
                                style:
                                Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      TextButton.icon(
                        onPressed: () {
                          setStateOfBottom(() {
                            sheetLoading = true;
                            Future.delayed(Duration(seconds: 3)).then(
                                    (value) =>
                                    getCurrentLocation().then((value) {
                                      sheetLoading = false;
                                      Navigator.pop(context);
                                    }));
                          });
                        },
                        icon: Icon(
                          Icons.my_location,
                          color: AppColors.mainColor,
                        ),
                        label: Text(
                          'Use current location',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        height: 0,
                        color: Colors.black12,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      addresses.isEmpty
                          ? SizedBox()
                          : Text(
                        'Saved Addresses',
                        style:
                        Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      addresses.isEmpty
                          ? SizedBox()
                          : Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: addresses.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                address =
                                '${addresses[index].completeAddress} ${addresses[index].location!}';
                                getShop(addresses[index].lat!,
                                    addresses[index].lng!);
                                setDefaultAddress(
                                    '${addresses[index].completeAddress} ${addresses[index].location!}',
                                    addresses[index].lat!,
                                    addresses[index].lng!);
                                notifyListeners();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 16, left: 16),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.home,
                                      size: 18,
                                      color: Colors.black38,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          addresses[index].type!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        SizedBox(
                                          width:
                                          MediaQuery.of(context)
                                              .size
                                              .width *
                                              .7,
                                          child: Text(
                                            '${addresses[index].completeAddress} ${addresses[index].location}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                              color: Colors
                                                  .black38,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  List<MarketModel> get getShops {
    return _shops;
  }

  void getBanner() async {
    bannerDataList = await _bannerRepo.getBannerRepo();
    notifyListeners();
  }

  void getCategory() async {
    categories = await _bannerRepo.getAllCategoriesRepo();
    notifyListeners();
  }

  List<CategoryModel> get getCategories {
    return categories;
  }

  RefreshController get getRefreshController {
    return _refreshController;
  }

}