import 'package:e_commerce_app/layouts/customBottomNavBar.dart';
import 'package:e_commerce_app/shared/textStyle.dart';
import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  AppPage({super.key});
  List listViewText = [
    "Featured",
    "Collection",
    "Stores",
    "Tags",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const customBottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text("Market", style: textStyle.extrabold_32(context: context)),
              const SizedBox(height: 40),
              Row(
                children: [
                  customTextFormField(hintText: "Search on Tassel"),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: const Color(0xffF3F3F3), width: 3)),
                      child: const Center(
                        child: Text("W",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 19),
              SizedBox(
                height: 42,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: listViewText.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                        onPressed: () {},
                        child: Text(
                          listViewText[index],
                          style: textStyle.semibold_16(context: context),
                        ));
                  },
                ),
              ),
              const SizedBox(height: 24),
              Container(height: 196, color: Colors.red),
              const SizedBox(height: 24),
              subtitleAndIconBack(title: "New stores",fun: () {
                
              },),
              const SizedBox(height: 8),
              SizedBox(
                height: 128 + 12 + 52,
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 215,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 128,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Levi’s",
                            style: textStyle.reqular_16(context: context),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Denim, Casual",
                            style: textStyle
                                .reqular_16(context: context)
                                .copyWith(color: const Color(0xff6D6D6F)),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 8  ,
                    );
                  },
                ),
              ),
              const SizedBox(height: 24,),
                subtitleAndIconBack(title: "Products on sale",fun: () {
                
              },),
            ],
          ),
        ),
      ),
    );
  }
}

class subtitleAndIconBack extends StatelessWidget {
   subtitleAndIconBack({
    super.key,required this.title,required this.fun
  });
  String title;
  VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
              child: Text(
            title,
            style: textStyle.semibold_18(context: context),
          )),
          Transform.rotate(
              angle: -3.15,
              child: IconButton(
                  color: Colors.black,
                  onPressed: fun,
                  icon: const Icon(Icons.arrow_back_sharp)))
        ],
      ),
    );
  }
}

class customTextFormField extends StatelessWidget {
  customTextFormField({super.key, this.hintText = ""});
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: 48,
      child: TextFormField(
        decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.search,
              size: 30,
              color: Color(0xff868687),
            ),
            border: customBorderTextFormFeild(),
            enabledBorder: customBorderTextFormFeild(),
            filled: true,
            fillColor: const Color(0xffF3F3F3),
            focusedBorder: customBorderTextFormFeild(),
            contentPadding: const EdgeInsetsDirectional.only(start: 16),
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 20,
                color: Color(0xff6E6E70),
                fontWeight: FontWeight.w500)),
      ),
    ));
  }

  OutlineInputBorder customBorderTextFormFeild() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xffF3F3F3)));
}
