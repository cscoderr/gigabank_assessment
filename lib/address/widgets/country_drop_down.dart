import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterassignment/address/address.dart';

//TODO: Make it more prefect
class CountryDropdown extends StatefulWidget {
  const CountryDropdown({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  final _countryFocusNode = FocusNode();
  OverlayEntry? _countryOverlay;
  List<Country> _countries = [];
  List<Country>? _searchedcountries;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      setState(() {});
    });
    _countryFocusNodeListener();
    _loadCountries();
  }

  @override
  void dispose() {
    _countryOverlay?.dispose();
    super.dispose();
  }

  void _countryFocusNodeListener() {
    _countryFocusNode.addListener(() {
      if (_countryFocusNode.hasFocus) {
        _countryOverlay = _countryOverlayEntry();
        Overlay.of(context).insert(_countryOverlay!);
      } else {
        _countryOverlay?.remove();
      }
    });
  }

  Future<void> _loadCountries() async {
    final rawData = await rootBundle.loadString('assets/json/countries.json');
    final parsedData = jsonDecode(rawData) as List;
    final countries = parsedData
        .map((e) => Country.fromJson(e as Map<String, dynamic>))
        .toList();
    setState(() {
      _countries = countries;
    });
  }

  void _searchCountry(String text) {
    if (text.isEmpty) {
      _searchedcountries = null;
      _loadCountries();
      _countryOverlay?.markNeedsBuild();
      return;
    }
    final searchedCountries = _countries
        .where((element) =>
            element.name.toLowerCase().contains(text.toLowerCase()) ||
            element.code.toLowerCase().contains(text.toLowerCase()))
        .toList();
    setState(() {
      _searchedcountries = searchedCountries;
      _countryOverlay?.markNeedsBuild();
    });
  }

  OverlayEntry _countryOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx,
          top: offset.dy + size.height + 10,
          width: size.width,
          height: MediaQuery.sizeOf(context).height / 2,
          child: Material(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5,
                ),
              ]),
              child: (_searchedcountries?.isEmpty ?? false)
                  ? Center(
                      child: Text(
                          "No Country found with ${widget.controller?.text}"),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final country = (_searchedcountries?.isNotEmpty == true)
                            ? _searchedcountries![index]
                            : _countries[index];
                        return ListTile(
                          onTap: () {
                            widget.controller?.text = country.name;
                            setState(() {});
                            _removeOverlay();
                            _countryFocusNode.nextFocus();
                          },
                          title: Text(country.name),
                          leading: country.image != null
                              ? SvgPicture.network(
                                  country.image!,
                                  height: 40,
                                  width: 40,
                                  placeholderBuilder: (context) =>
                                      const Icon(Icons.flag),
                                )
                              : const Icon(Icons.flag),
                          subtitle: Text(country.code),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemCount: (_searchedcountries?.isNotEmpty == true)
                          ? _searchedcountries!.length
                          : _countries.length,
                    ),
            ),
          ),
        );
      },
    );
  }

  void _removeOverlay() {
    _countryOverlay?.remove();
    _countryOverlay?.dispose();
    _countryOverlay = null;
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      focusNode: _countryFocusNode,
      hintText: 'Country',
      onChange: (value) {
        _searchCountry(value);
      },
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Country is required';
        }
        return null;
      },
    );
  }
}
