import '../utils/basic_import.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';


//   CustomSearchBarWidget<AllChatPersonModel>(
//               sourceList: controller.allChatPersonList,
//               searchField: (data) => '${data.name} ${data.lastMessage}',
//               onSearchResult: (filtered) {
//                 controller.filteredPersonList.value = filtered;
//               },
//               hintText: 'Search here...',
//             ),


class CustomSearchBarWidget<T> extends StatefulWidget {
  final List<T> sourceList;
  final String Function(T) searchField;
  final Function(List<T>) onSearchResult;
  final String hintText;
  final Duration debounceDuration;

  const CustomSearchBarWidget({
    super.key,
    required this.sourceList,
    required this.searchField,
    required this.onSearchResult,
    this.hintText = 'Search here...',
    this.debounceDuration = const Duration(milliseconds: 300),
  });

  @override
  State<CustomSearchBarWidget<T>> createState() =>
      _CustomSearchBarWidgetState<T>();
}

class _CustomSearchBarWidgetState<T> extends State<CustomSearchBarWidget<T>> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleTextChange);

    // Fix: Use WidgetsBinding to call after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onSearchResult(widget.sourceList);
    });
  }

  @override
  void didUpdateWidget(CustomSearchBarWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sourceList != widget.sourceList) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _performSearch(_controller.text);
      });
    }
  }

  void _handleTextChange() {
    if (_hasText != _controller.text.isNotEmpty) {
      setState(() {
        _hasText = _controller.text.isNotEmpty;
      });
    }

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(widget.debounceDuration, () {
      _performSearch(_controller.text);
    });
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      widget.onSearchResult(widget.sourceList);
    } else {
      final lowerQuery = query.toLowerCase();
      final filteredList = widget.sourceList.where((item) {
        final searchableText = widget.searchField(item).toLowerCase();
        return searchableText.contains(lowerQuery);
      }).toList();

      widget.onSearchResult(filteredList);
    }
  }

  void _clearSearch() {
    _controller.clear();
    widget.onSearchResult(widget.sourceList);
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
      ),
      height: Dimensions.inputBoxHeight * 0.8,
      decoration: BoxDecoration(
        color: Colors.black12.withOpacity(0.05),
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.search, color: CustomColors.grayShade),
          Expanded(
            child: TextField(
              controller: _controller,
              autofocus: true,
              cursorColor: CustomColors.primary,
              style: TextStyle(
                fontSize: Dimensions.titleMedium * 0.95,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: CustomColors.grayShade,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.titleMedium * 0.95,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: Dimensions.widthSize.edgeHorizontal,
              ),
            ),
          ),
          if (_hasText)
            GestureDetector(
              onTap: _clearSearch,
              child: Icon(
                Icons.clear,
                color: CustomColors.grayShade,
                size: 20.sp,
              ),
            ),
        ],
      ),
    );
  }
}


