import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate/presentation/widget/custom_test_style.dart';
import 'package:real_estate/state_inject_package_names.dart';
import 'package:webview_flutter/webview_flutter.dart';


class LocationTab extends StatefulWidget {
  const LocationTab({Key? key}) : super(key: key);

  @override
  State<LocationTab> createState() => _LocationTabState();
}

class _LocationTabState extends State<LocationTab> {
  late WebViewController controller;
  late GoogleMapController mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    initController();
  }

  initController() {
    controller = WebViewController();
  }


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is PropertyDetailsLoaded) {
          final item = state.singlePropertyModel.propertyItemModel;
          // print("google maps ===================");
          //     print(item!.latitude);
          //     print(item.longitude);
          //     if(item.latitude == ""){
          //       print("empty");
          //     }
          return Column(
            children: [
              MyReadMoreText(text: item!.addressDescription, trimLines: 4, trimLength: 180),
              SizedBox(height: 12.h),
              // Container(
              //   height: 200.h,
              //   width: 600.w,
              //   alignment: Alignment.center,
              //   child: WebViewWidget(
              //     controller: controller
              //       ..setJavaScriptMode(JavaScriptMode.unrestricted)
              //       ..enableZoom(true)
              //       ..loadHtmlString(item.googleMap),
              //   ),
              // ),
              SizedBox(height: 20.h),

              SizedBox(
                height: 220,
                width: double.infinity,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: item.latitude == "" && item.longitude =="" ? const LatLng(11.5877962,104.896965):LatLng(double.parse(item.latitude), double.parse(item.longitude)),
                      zoom: item.latitude == "" && item.longitude =="" ? 5.5:17.5,
                    ),
                    mapType: MapType.normal,
                    zoomControlsEnabled: true,
                    myLocationButtonEnabled: false,
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                     
                     if(item.latitude != "" && item.longitude !=""){
                       setState(() {
                       markers.add(
                          Marker(
                            markerId: const MarkerId('property_location'),
                            position: LatLng(double.parse(item.latitude), double.parse(item.longitude)),
                            infoWindow: const InfoWindow(
                              title: 'Property location',
                              snippet: 'This is where the property is!',
                            ),
                          ),
                        );
                      });
                     }
                    },
                    markers: markers,
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
