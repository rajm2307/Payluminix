import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:payluminix/screens/Carousel.dart';
import 'package:payluminix/screens/core_service.dart';
import 'package:payluminix/screens/notification.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isLoading = false;

  final List _services = [
    {
      "Pay and Receive": [
        {
          "label": "Prepaid\nRecharge",
          "icon": "assets/images/Prepaid_Recharge.png",
        },
        {
          "label": "PostPaid\nRecharge",
          "icon": "assets/images/Postpaid_Recharge.png",
        },
        {
          "label": "Electricity\nBills",
          "icon": "assets/images/Electricity_Bills.png",
        },
        {
          "label": "DTH\nRecharge",
          "icon": "assets/images/DTH_Recharge.png",
        },
        {
          "label": "Fastag\nRecharge",
          "icon": "assets/images/imag_7.png",
        },
        {
          "label": "Water\nBill",
          "icon": "assets/images/water.png",
        },
        {
          "label": "Gas\nCylinder",
          "icon": "assets/images/lpg.png",
        },
        {
          "label": "OTT\nRecharge",
          "icon": "assets/images/ott.png",
        },
      ]
    },
  ];

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _getHome();
    }
  }

  _getHome() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await _getHome();
        },
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: _isLoading
                ? Center(
                    child: LoadingAnimationWidget.flickr(
                        // color: Color.fromRGBO(32, 62, 76, 1),
                        size: 50,
                        leftDotColor: Colors.red,
                        rightDotColor: Colors.green),
                  )
                : SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 45,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  // controller: _searchController,
                                  decoration: const InputDecoration(
                                    labelText: 'Pay By Name or Phone Number',
                                    labelStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 139, 139, 139)),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Color.fromRGBO(188, 188, 188, 1),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40.0)),
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    // _filterContacts(value);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              NotificationPage(
                                hasNotification: true,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                              onTap: () {
                                print("wallet tapped");
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 17, right: 17),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45),
                                    border: Border.all(width: 0.2)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      "assets/images/image.png",
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "₹1,010",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 19),
                                    )
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 25,
                          ),
                          CarouselBanners(),
                          ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: _services.map<Widget>((category) {
                                String categoryName = category.keys.first;
                                List services = category.values.first;

                                return Column(children: [
                                  _buildSectionTitle(categoryName),
                                  GridView.count(
                                    crossAxisCount: 4,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    childAspectRatio: 0.95,
                                    children: services.map<Widget>((service) {
                                      return InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoreService()),
                                            );
                                          },
                                          customBorder: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: _buildItem(
                                            service['icon'],
                                            service['label'],
                                          ));
                                    }).toList(),
                                  )
                                ]);
                              }).toList())
                        ],
                      ),
                    ),
                  )),
      ),
    );
  }

  _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }

  _buildItem(String iconPath, String iconTitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
          width: 30,
          child: Image.asset(
            iconPath,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            iconTitle,
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
