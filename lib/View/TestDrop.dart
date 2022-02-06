import 'package:flutter/material.dart';
import 'package:itimaaty/Utils/AppColors.dart';

class GFMultiSelect<T> extends StatefulWidget {
  /// GF Multiselect let user to select multiple items from the number of
  /// Checkbox ListTile items and display selected items in the TitleTile box.
  /// It displays list of items in the overlay dropdown fashion.
  const GFMultiSelect({
    this.items,
    this.onSelect,
    this.dropdownTitleTileText = 'Select : ',
    this.dropdownTitleTileTextStyle =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    this.color,
    this.avatar,
    this.padding = const EdgeInsets.all(5),
    this.margin = const EdgeInsets.all(5),
    this.size = 30,
    this.type = GFCheckboxType.basic,
    this.activeBgColor = Colors.white,
    this.inactiveBgColor = Colors.white,
    this.activeBorderColor = Colors.white,
    this.inactiveBorderColor = Colors.white,
    this.submitButton,
    this.cancelButton,
    this.expandedIcon = const Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black87,
      size: 30,
    ),
    this.collapsedIcon = const Icon(
      Icons.keyboard_arrow_up,
      color: Colors.black87,
      size: 30,
    ),
    this.dropdownBgColor = Colors.white,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: Color(0xff222428),
    ),
    this.inactiveIcon,
    this.customBgColor = Colors.green,
    this.selected = false,
    this.dropdownTitleTileBorder,
    this.dropdownTitleTileBorderRadius =
    const BorderRadius.all(Radius.circular(4)),
    this.dropdownTitleTileColor = Colors.white,
    this.hideDropdownUnderline = false,
    this.dropdownUnderlineBorder =
    const BorderSide(color: Colors.black45, width: 1),
    this.dropdownTitleTileMargin = const EdgeInsets.all(16),
    this.dropdownTitleTilePadding = const EdgeInsets.all(12),
    this.dropdownTitleTileHintText,
    this.dropdownTitleTileHintTextStyle =
    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    this.dropdownButton,
    Key key,
  }) : super(key: key);

  /// defines the list of items the user can select
  final List<dynamic> items;

  /// callback when user select item from the dropdown,
  /// in callback we get list of selected items index
  final ValueChanged<List<dynamic>> onSelect;

  /// type of [String] to define the dropdownTitleTile  title
  final String dropdownTitleTileText;

  /// type of [TextStyle] to define the textStyle of [dropdownTitleTileText]
  final TextStyle dropdownTitleTileTextStyle;

  /// type of [String] to define the dropdownTitleTile hint text
  final String dropdownTitleTileHintText;

  /// type of [TextStyle] to define the textStyle of [dropdownTitleTileHintTextStyle]
  final TextStyle dropdownTitleTileHintTextStyle;

  /// defines the border radius  of the dropdownTitleTile
  final BorderRadius dropdownTitleTileBorderRadius;

  /// defines the border of the dropdownTitleTile.
  final Border dropdownTitleTileBorder;

  /// defines the background color of dropdownButton
  final dynamic dropdownTitleTileColor;

  /// on true state, it hides the Dropdown Underline border
  /// defaults value is false
  final bool hideDropdownUnderline;

  /// defines the border of the Dropdown Underline border
  final BorderSide dropdownUnderlineBorder;

  /// defines the dropdownTitleTile margin
  final EdgeInsets dropdownTitleTileMargin;

  /// defines the dropdownTitleTile padding
  final EdgeInsets dropdownTitleTilePadding;

  /// defines the dropdownTitleTile's trailing icon when dropdown is visible
  final Widget expandedIcon;

  /// defines the dropdownTitleTile's trailing icon when dropdown is not visible
  final Widget collapsedIcon;

  /// defines the submit button in the dropdown
  final Widget submitButton;

  /// defines the cancel button in the dropdown
  final Widget cancelButton;

  /// defines dropdown checkbox ListTile's background color. Can be given [Color] or [GFColors]
  final dynamic color;

  /// type of [Widget] or [GFAvatar] used to defines dropdown checkbox ListTile's leading
  final Widget avatar;

  /// defines the margin of dropdown checkbox ListTile
  final EdgeInsets margin;

  /// defines the padding of dropdown checkbox ListTile
  final EdgeInsets padding;

  /// defines dropdown ListTile's checkbox type
  /// type of [GFCheckboxType] which is of four type is basic, sqaure, circular and custom
  final GFCheckboxType type;

  /// defines dropdown ListTile's checkbox size
  /// type of [double] which is GFSize ie, small, medium and large and can use any double value
  final double size;

  /// defines dropdown ListTile's checkbox background color when its active
  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activeBgColor;

  /// defines dropdown ListTile's checkbox background color when its inactive
  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactiveBgColor;

  /// defines dropdown ListTile's checkbox border color when its active
  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// defines dropdown ListTile's checkbox border color when its inactive
  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// defines dropdown ListTile's checkbox's active icon
  /// type of [Widget] used to change the  checkbox's active icon
  final Widget activeIcon;

  /// defines dropdown ListTile's checkbox's inactive icon
  ///type of [Widget] used to change the  checkbox's inactive icon
  final Widget inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  checkbox only
  final Color customBgColor;

  /// To have the list tile appear selected when the checkbox is checked, pass the same value to both.
  /// Normally, this property is left to its default value, false.
  final bool selected;

  /// defines the background color of the dropdown. Can be given [Color] or [GFColors]
  final Color dropdownBgColor;

  final Widget dropdownButton;

  @override
  _GFMultiSelectState createState() => _GFMultiSelectState();
}

class _GFMultiSelectState<T> extends State<GFMultiSelect<T>> {
  bool showDropdown = false;
  final _controller = TextEditingController();
  final List _selectedTitles = [];
  final List _selectedTitlesIndex = [];

  void _onItemSelect(bool selected, int index) {
    if (selected == true) {
      setState(() {
        _selectedTitles.add(widget.items[index]);
        _selectedTitlesIndex.add(index);
      });
    } else {
      setState(() {
        _selectedTitles.remove(widget.items[index]);
        _selectedTitlesIndex.remove(index);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget dropdownTile() => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _selectedTitles.isEmpty
            ? Expanded(
            child: Text(widget.dropdownTitleTileText,
                style: widget.dropdownTitleTileTextStyle))
            : Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 8,right: 8),
              padding: EdgeInsets.only(left: 8,right: 8,top: 0,bottom: 2),
              decoration: BoxDecoration(
                  color: Color(0xffeaeaea),
                  // color: Colors.red,
                  border: Border.all(
                      color: Color(0xffeaeaea),
                      width: 0.6
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(9))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center ,//Center Row contents vertically,
                children: [
                  Container(
                    margin:EdgeInsets.only(top: 2),
                    child:Text(_selectedTitles.join(',  ').toString(),
                        style: widget.dropdownTitleTileTextStyle),
                  ),
                  const SizedBox(width: 4,),
                  Icon(Icons.clear,size: 20,color: grayTextColor,)
                ],
              ),
            ),
        ),
        !showDropdown ? widget.expandedIcon : widget.collapsedIcon,
      ],
    );

    return Column(
      children: [
        InkWell(
            onTap: () {
              setState(() {
                showDropdown = !showDropdown;
              });
            },
            child: Container(
                margin: widget.dropdownTitleTileMargin,
                padding: widget.dropdownTitleTilePadding,
                decoration: BoxDecoration(
                    color: widget.dropdownTitleTileColor,
                    border: widget.dropdownTitleTileBorder,
                    borderRadius: widget.dropdownTitleTileBorderRadius),
                child: Container(
                  decoration: BoxDecoration(
                    border: widget.hideDropdownUnderline
                        ? const Border(
                        bottom: BorderSide(color: Colors.transparent))
                        : Border(bottom: widget.dropdownUnderlineBorder),
                  ),
                  child: widget.dropdownTitleTileHintText == null
                      ? dropdownTile()
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.dropdownTitleTileHintText}',
                        style: widget.dropdownTitleTileHintTextStyle,
                      ),
                      dropdownTile(),
                      const SizedBox(
                        height: 2,
                      )
                    ],
                  ),
                ))),
        showDropdown
            ? Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: widget.dropdownBgColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3,
              )
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                    children: List.generate(
                        widget.items.length,
                            (index) => GFCheckboxListTile(
                          value: _selectedTitles.contains(widget.items[index]),
                          onChanged: (bool selected) {
                            _controller.text;
                            _onItemSelect(selected, index);

                            widget.onSelect(_selectedTitlesIndex);
                          },
                          selected: widget.selected,
                          avatar: widget.avatar,
                          titleText: widget.items[index],
                          color: widget.color,
                          padding: widget.padding,
                          margin: widget.margin,
                          size: widget.size,
                          activeBgColor: widget.activeBgColor,
                          inactiveIcon: widget.inactiveIcon,
                          activeBorderColor: widget.activeBorderColor,
                          inactiveBgColor: widget.inactiveBgColor,
                          activeIcon: widget.activeIcon,
                          inactiveBorderColor:
                          widget.inactiveBorderColor,
                          customBgColor: widget.customBgColor,
                          // checkColor: widget.checkColor,
                          type: widget.type,
                        ))),
                widget.dropdownButton ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              showDropdown = !showDropdown;
                              _selectedTitles.clear();
                              _selectedTitlesIndex.clear();
                            });
                          },
                          child: Text("CANCEL"),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              showDropdown = !showDropdown;
                            });
                          },
                          child: Text("ok"),
                        )
                      ],
                    )
              ],
            ),
          ),
        )
            : Container(),
      ],
    );
  }
}







class GFCheckbox extends StatefulWidget {
  /// [GFCheckbox] is a small box (as in a checklist) in which to place a check mark to make a selection with various customization options.
  const GFCheckbox(
      {Key key,
        this.size = 35,
        this.type = GFCheckboxType.basic,
        this.activeBgColor = const Color(0xff3880FF),
        this.inactiveBgColor = Colors.white,
        this.activeBorderColor = Colors.white,
        this.inactiveBorderColor = const Color(0xff222428),
        this.onChanged,
        this.value,
        this.activeIcon = const Icon(
          Icons.check,
          size: 20,
          color: Colors.white,
        ),
        this.inactiveIcon,
        this.customBgColor = Colors.green,
        this.autofocus = false,
        this.focusNode})
      : super(key: key);

  /// type of [GFCheckboxType] which is of four type is basic, square, circular and custom
  final GFCheckboxType type;

  /// type of [double] which is GFSize ie, small, medium and large and can use any double value
  final double size;

  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activeBgColor;

  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactiveBgColor;

  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// Called when the user checks or unchecks the checkbox.
  final ValueChanged<bool> onChanged;

  /// Used to set the current state of the checkbox
  final bool value;

  /// type of [Widget] used to change the  checkbox's active icon
  final Widget activeIcon;

  /// type of [Widget] used to change the  checkbox's inactive icon
  final Widget inactiveIcon;

  /// type of [Color] used to change the background color of the custom active checkbox only
  final Color customBgColor;

  /// on true state this widget will be selected as the initial focus
  /// when no other node in its scope is currently focused
  final bool autofocus;

  /// an optional focus node to use as the focus node for this widget.
  final FocusNode focusNode;

  @override
  _GFCheckboxState createState() => _GFCheckboxState();
}

class _GFCheckboxState extends State<GFCheckbox> {
  bool get enabled => widget.onChanged != null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FocusableActionDetector(
    focusNode: widget.focusNode,
    autofocus: widget.autofocus,
    enabled: enabled,
    child: InkWell(
      canRequestFocus: enabled,
      onTap: widget.onChanged != null
          ? () {
        widget.onChanged(!widget.value);
      }
          : null,
      child: Container(
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
            color: enabled
                ? widget.value
                ? widget.type == GFCheckboxType.custom
                ? Colors.white
                : widget.activeBgColor
                : widget.inactiveBgColor
                : Colors.grey,
            borderRadius: widget.type == GFCheckboxType.basic
                ? BorderRadius.circular(3)
                : widget.type == GFCheckboxType.circle
                ? BorderRadius.circular(50)
                : BorderRadius.zero,
            border: Border.all(
                color: widget.value
                    ? widget.type == GFCheckboxType.custom
                    ? Colors.black87
                    : widget.activeBorderColor
                    : widget.inactiveBorderColor)),
        child: widget.value
            ? widget.type == GFCheckboxType.custom
            ? Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
            ),
            Container(
              margin: const EdgeInsets.all(5),
              alignment: Alignment.center,
              width: widget.size * 0.8,
              height: widget.size * 0.8,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: widget.customBgColor),
            )
          ],
        )
            : widget.activeIcon
            : widget.inactiveIcon,
      ),
    ),
  );
}


class GFCheckboxListTile extends StatelessWidget {
  /// [GFCheckboxListTile] is a tile with small box at right (as in a checklist)
  /// in which to place a check mark to make a selection with various customization options.
  const GFCheckboxListTile({
    Key key,
    this.value,
    this.onChanged,
    this.titleText,
    this.subTitleText,
    this.color,
    this.avatar,
    this.title,
    this.subTitle,
    this.icon,
    this.description,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.size = 35,
    this.type = GFCheckboxType.basic,
    this.activeBgColor = const Color(0xff3880FF),
    this.inactiveBgColor = Colors.white,
    this.activeBorderColor = Colors.white,
    this.inactiveBorderColor = const Color(0xff222428),
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: Colors.white,
    ),
    this.inactiveIcon,
    this.customBgColor = Colors.green,
    this.position = GFPosition.end,
    this.selected = false,
    this.autofocus = false,
  }) : super(key: key);

  ///type of [String] used to pass text, alternative to title property and gets higher priority than title
  final String titleText;

  ///type of [String] used to pass text, alternative to subTitle property and gets higher priority than subTitle
  final String subTitleText;

  /// The GFListTile's background color. Can be given [Color] or [GFColors]
  final Color color;

  /// If position is start Checkbox will come instead of avatar,
  /// type of [Widget] or [GFAvatar] used to create rounded user profile
  final Widget avatar;

  /// The title to display inside the [GFListTile]. see [Text]
  final Widget title;

  /// The subTitle to display inside the [GFListTile]. see [Text]
  final Widget subTitle;

  /// The description to display inside the [GFListTile]. see [Text]
  final Widget description;

  /// defines the margin of GFListTile
  final EdgeInsets margin;

  /// defines the padding of GFListTile
  final EdgeInsets padding;

  /// type of [GFCheckboxType] which is of four type is basic, sqaure, circular and custom
  final GFCheckboxType type;

  /// type of [double] which is GFSize ie, small, medium and large and can use any double value
  final double size;

  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activeBgColor;

  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactiveBgColor;

  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// Called when the user checks or unchecks the checkbox.
  final ValueChanged<bool> onChanged;

  /// Used to set the current state of the checkbox
  final bool value;

  /// Position allows user to set position of [GFCheckbox] based on given [GFPosition]
  final GFPosition position;

  /// type of Widget used to change the  checkbox's active icon
  final Widget activeIcon;

  /// type of [Widget] used to change the  checkbox's inactive icon
  final Widget inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  checkbox only
  final Color customBgColor;

  /// To have the list tile appear selected when the checkbox is checked, pass the same value to both.
  /// Normally, this property is left to its default value, false.
  final bool selected;

  /// On true state it should focus itself if nothing else is already focused.
  /// Defaults to false
  final bool autofocus;

  /// If position is end Checkbox will come instead of icon, The icon to display inside the [GFListTile]. see [Icon]
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final GFCheckbox checkbox = GFCheckbox(
        autofocus: autofocus,
        onChanged: onChanged,
        value: value,
        size: size,
        activeBgColor: activeBgColor,
        inactiveIcon: inactiveIcon,
        activeBorderColor: activeBorderColor,
        inactiveBgColor: inactiveBgColor,
        activeIcon: activeIcon,
        inactiveBorderColor: inactiveBorderColor,
        customBgColor: customBgColor,
        // checkColor: checkColor,
        type: type);
    return MergeSemantics(
      child: GFListTile(
        autofocus: autofocus,
        enabled: onChanged != null,
        onTap: onChanged != null
            ? () {
          onChanged(!value);
        }
            : null,
        selected: selected,
        avatar: position == GFPosition.start ? checkbox : avatar,
        titleText: titleText,
        subTitle: subTitle,
        subTitleText: subTitleText,
        description: description,
        color: color,
        padding: padding,
        margin: margin,
        title: title,
        icon: position == GFPosition.end ? checkbox : icon,
      ),
    );
  }
}


class GFListTile extends StatelessWidget {
  /// Creates ListTile with leading, title, trailing, image widget for almost every type of ListTile design.
  const GFListTile({
    Key key,
    this.titleText,
    this.subTitleText,
    this.color,
    this.avatar,
    this.title,
    this.subTitle,
    this.description,
    this.icon,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.focusColor,
    this.hoverColor,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  /// type of [String] used to pass text, alternative to title property and gets higher priority than title
  final String titleText;

  /// type of [String] used to pass text, alternative to subTitle property and gets higher priority than subTitle
  final String subTitleText;

  /// The GFListTile's background color. Can be given [Color] or [GFColors]
  final Color color;

  /// type of [Widget] or [GFAvatar] used to create rounded user profile
  final Widget avatar;

  /// The title to display inside the [GFListTile]. see [Text]
  final Widget title;

  /// The subTitle to display inside the [GFListTile]. see [Text]
  final Widget subTitle;

  /// The description to display inside the [GFListTile]. see [Text]
  final Widget description;

  /// The icon to display inside the [GFListTile]. see [Icon]
  final Widget icon;

  /// defines the margin of GFListTile
  final EdgeInsets margin;

  /// defines the padding of GFListTile
  final EdgeInsets padding;

  /// Whether this list tile is interactive.
  ///
  /// If false, this list tile is styled with the disabled color from the
  /// current [Theme] and the [onTap] and [onLongPress] callbacks are
  /// inoperative.
  final bool enabled;

  /// Called when the user taps this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final GestureTapCallback onTap;

  /// Called when the user long-presses on this list tile.
  ///
  /// Inoperative if [enabled] is false.
  final GestureLongPressCallback onLongPress;

  /// If this tile is also [enabled] then icons and text are rendered with the same color.
  ///
  /// By default the selected color is the theme's primary color. The selected color
  /// can be overridden with a [ListTileTheme].
  final bool selected;

  /// The color for the tile's [Material] when it has the input focus.
  final Color focusColor;

  /// The color for the tile's [Material] when a pointer is hovering over it.
  final Color hoverColor;

  /// Defines the keyboard focus for this widget.
  final FocusNode focusNode;

  /// On true state it should focus itself if nothing else is already focused.
  /// Defaults to false
  final bool autofocus;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: enabled ? onTap : null,
    onLongPress: enabled ? onLongPress : null,
    canRequestFocus: enabled,
    focusNode: focusNode,
    focusColor: focusColor,
    hoverColor: hoverColor,
    autofocus: autofocus,
    child: Semantics(
      selected: selected,
      enabled: enabled,
      child: Container(
        // constraints: const BoxConstraints(minHeight: 50),
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            avatar ?? Container(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    titleText != null
                        ? Text(
                      titleText,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff222428)),
                    )
                        : title ?? Container(),
                    subTitleText != null
                        ? Text(
                      subTitleText,
                      style: const TextStyle(
                        fontSize: 14.5,
                        color: Colors.black54,
                      ),
                    )
                        : subTitle ?? Container(),
                    description ?? Container()
                  ],
                ),
              ),
            ),
            icon ?? Container(),
          ],
        ),
      ),
    ),
  );
}

enum GFCheckboxType {
  basic,
  circle,
  square,
  custom,
}

enum GFPosition {
  /// [GFPosition.start] is used to place icon, badges to start of the GFButton and GFButtonBadge
  start,

  /// [GFPosition.end] is used to place icon, badges to end of the GFButton and GFButtonBadge
  end,
}