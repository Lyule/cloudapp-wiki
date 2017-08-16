Reference Manual

# API

## Widget

### UI Base Widget
This the abstract class of all widget.

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| id | string | readonly, the identifier of this widget |
| alpha | number | widget alpha, [0,1] |
| transform | table | the transform of this widget, you can use affine lib to create transform table |
| touchDisabled | boolean | whether touch is disabled |
| hidden | boolean | the visiblity of this widget |
| onchange | function | `onchange` will be called if this widget attribute is changed by user action. |
| onerror | function | `onerror` will be called if some error happens on this widget. e.g. image/backgroudImage download failed. |
| onload | function | `onload` will be called if widget is full loaded. e.g. image/backgroundImage loaded. |
| ontouchup | function | when user touch up on this widget |
| ontouchdown | function | when user touch down on this widget |
| ontouchmove | function | when user touch move on this widget |
| backgroundAlpha | number | the background alpha of this widget, [0,1] |
| backgroundColor | color:[ColorType](#colortype) | the background color of this widget |
| backgroundGradient | gradient:[GradientType](#gradienttype) | the background gradient of this widget |
| backgroundImage | image:[ImageType](#imagetype) | the background image of this widget, refer to `onload`/`onerror` |
| backgroundScale | scale:[ScaleType](#scaletype) | the background image scale |
| borderColor | color:[ColorType](#colortype) | border color |
| borderAlpha | number | border alpha |
| borderWidth | number | border width |
| cornerRadius | number | corner radius |
| width | size:[SizeType](#sizetype) | widget width |
| height | size:[SizeType](#sizetype) | widget height |
| marginLeft | size:[SizeType](#sizetype) | margin left to parent left |
| marginRight | size:[SizeType](#sizetype) | margin right to parent right |
| marginTop | size:[SizeType](#sizetype) | margin top to parent top |
| marginBottom | size:[SizeType](#sizetype) | margin bottom to parent bottom |
| margin | string | set margin in one line, `top,right,bottom,left` or `top,right,bottom`(left=right) or `top,right`(bottom=top, left=right) or `top`(all = top) |
| paddingLeft | size:[SizeType](#sizetype) | padding left of all children |
| paddingRight | size:[SizeType](#sizetype) | padding right of all children |
| paddingTop | size:[SizeType](#sizetype) | padding top of all children |
| paddingBottom | size:[SizeType](#sizetype) | padding bottom of all children |
| padding | string | top,right,bottom,left, the same rule to `margin` |

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| mark | void | void | save widget current status |
| reset | void | void | reset widget status by status saved before. |
| suspendLayout | void | void | suspend layout in order to do layout transaction. |
| resumeLayout | duration:float = 0, oncomplete:function = nil | void | commit layout changes |
| getSnapshot | void | img:[LuaImage] | take snapshot of this widget |
| getContentSnapshot | void | img:[LuaImage] | take content snapshot of this widget |
| getRect | void | x:number,y:number,width:number,height:number | 	get the rect of this widget |
| getMarginOnView | widget:[uiwidget](#ui-base-widget) | top:number,right:number,bottom:number,left:number | |
| getRectOnView | widget:[uiwidget](#ui-base-widget) | x:number,y:number,width:number,height:number | |
| setStyle | styles:table | void | merge style table |

### Button Widget

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| label | string | button text label |
| onclick | string/function | button onclick script |
| color | string/number | button label color |
| fontName | string | button label fontName |
| fontSize | number | button label fontSize |
| bold | boolean | button label bold |
| underline | boolean | button label underline |
| align | string | left,center,right |
| showsTouch | boolean | |
| showsTouchWhenHighlighted | boolean | ios only |
| exclusiveTouch | boolean | ios only |
| onmousedown | function | button onmousedown |
| onmouseup | function | button onmouseup |

* xml schema
```xml
<button label="string" color="#123456" align="left|center|right" fontSize="22" bold="true|false" underline="true|false" >
```

* xml sample
```xml
<button text="Say Hi" id="widgetid" height="50"/>
```

* lua sample
<!-- [FILE] sample/scripts/widget/button.lua -->
```lua
widgetid.onclick = function()
    alert("Click on Button")
end
```

* page demo
<!-- [FILE] sample/button.xml -->
```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
    <page>
        <layout>
            <button text="Say Hi" id="widgetid" height="50" />
        </layout>
    </page>
</manifest>
```

### Label Widget
* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| charSpace | number | the character horizontal space between each other. |
| lineSpace | number | the line space between different lines if wrap = true (multi-line enabled.) |
| text | string | the display content of this widget |
| color | [ColorType](#colortype) | text color |
| fontName | string | text font name |
| fontSize | number | text font size |
| align | string | the text align in this widget, can be left / center / right |
| verticalAlign | string | the text verticalAlign in this widget, can be top / middle / bottom |
| html | boolean | available on init only, if true, the text content will be rendered as html. |
| bold | boolean | available on `fontName` not set, set the default font bold property. |
| wrap | boolean | if true, the text content can be rendered multiple lines. |
| maxLines | number | the max available lines of this widget |

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| setText | string | boolean | set label's text |

* xml schema

```xml
<label text="string" align="left|center|right" height="44" html="true|false"/>
```

* xml sample

```xml
<label text="hello world." align="left" height="44"/>
```

### Image Widget

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| placeholder | [ImageType](#imagetype) except http | placeholder image before image from remote loaded. |
| scale | string | none / fill / center / fitWidth / fitHeight / clip([0-9]+,[0-9]+(,[0-9]+,[0-9]+)?) |
| src | [ImageType](#imagetype) | set image source |

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| setImage | image | boolean | set image |
| getImage | void | image | get image |

* xml schema
```xml
<image src="some path" placeholder="local path" scale="none|fill|center|fitWidth|fitHeight|clip()" />
```

* xml sample
```xml
<image src="app://login_resources/login_background.jpg" scale="none"/>
```

### Textfield Widget

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| text | string | the text content of this widget |
| color | [ColorType](#colortype) | text color |
| fontName | string | text font name |
| fontSize | number | text font size |
| align | string | the text align in this widget, can be left / center / right |
| password | boolean | whether password field. |
| editable | boolean | whether editable |
| doneable | boolean | whether textfield's input method has done button. |
| maxLength | number | max input length of this textfield. |
| keyboard | string | the keyboard type, can be number/numberpad/ascii/url/tel/email/decimal/namephone/twitter |
| returnType | string | return button on the keyboard, can be next/done/go/search |
| borderStyle | string | textfield border style, can be roundrect / line / bezel， ios only. |
| placeholder | string | placeholder of textfield. |

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| setText | text:string | void | set textfield's text |
| getText | void | string | get textfield's text |
| setFocus | width:number,height:number | void | set the content size, ios only. |
| clearFocus | void | width:number, height:number | get the content size, ios only. |

* callback list

| Property      | Parameters    | Description   |
| ------------- | ------------- | ------------- |
| onReturnClick | void | callback on keyboard return click, refer to `returnType` |
| onDoneClick | void | callback on keyboard done click, refer to `doneable` |
| onblur | void | callback on blur |
| onfocus | void | callback on focus |

* xml schema

```xml
<textfield placeholder="Input some text" maxLength="100" keyboard="number|numberpad|ascii" />
```

* xml sample

```xml
<textfield text="display" align="left" height="50"/>
```

### Textarea Widget

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| text | string | the text content of this widget |
| color | [ColorType](#colortype) | text color |
| fontName | string | text font name |
| fontSize | number | text font size |
| password | boolean | whether password field. |
| editable | boolean | whether editable |
| doneable | boolean | whether textfield's input method has done button. |
| maxLength | number | max input length of this textfield. |
| keyboard | string | the keyboard type, can be number/numberpad/ascii/url/tel/email/decimal/namephone/twitter |
| returnType | string | return button on the keyboard, can be next/done/go/search |
| placeholder | string | placeholder of textfield. |

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| setText | text:string | void | set textfield's text |
| getText | void | string | get textfield's text |
| setFocus | width:number,height:number | void | set the content size, ios only. |
| clearFocus | void | width:number, height:number | get the content size, ios only. |

* callback list

| Property      | Parameters    | Description   |
| ------------- | ------------- | ------------- |
| onReturnClick | void | callback on keyboard return click, refer to `returnType` |
| onDoneClick | void | callback on keyboard done click, refer to `doneable` |
| onblur | void | callback on blur |
| onfocus | void | callback on focus |

* xml schema

```xml
<textaera placeholder="Input some text" maxLength="100" keyboard="number|numberpad|ascii" />
```

* xml sample

```xml
<textaera text="display" height="50"/>
```

### View Widget

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| overflow | string | visible / hidden, default visible |

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| reLayoutChildren | void | void | relayout all child items |
| addChild | child:object, position:number(optional) | child:[uiwidget](#ui-base-widget) | add a child model or widget inside this view |
| indexChild | child:object | position:number | find position of a child, child could be id/widget |
| removeChild | child:object | void | remove a child, child could be id/widget |
| removeChildAt | position:number | void | remove a child at position |
| removeAllChildren | void | void | remove all children |
| listChildren | void | children:table | get the list of all children |

* xml schema

```xml
<view layout="absolute|none" overflow="visible|hidden" >
```

* xml sample

```xml
<view width="50" backgroundColor="red">
  <button xxx>
</view>
```

### HBox Widget

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| layout | string | absolute / none, default none |
| overflow | string | visible / hidden, default visible |

* xml schema

```xml
<hbox>
  widget 1
  widget 2
</hbox>
```

* xml sample
```xml
<hbox>
    <label text="1"/>
    <label text="2"/>
</hbox>
```

### VBox Widget

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| layout | string | absolute / none, default none |
| overflow | string | visible / hidden, default visible |

* xml schema

```xml
<hbox>
  widget 1
  widget 2
</hbox>
```

* xml sample
```xml
<hbox>
    <label text="1"/>
    <label text="2"/>
</hbox>
```

### Webview Widget

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| src | string | the url/path of the html page to display. |
| zoomable | boolean | whether user could zoom the webpage. |
| opaque | boolean | the opaque of the webpage. |
| busyhidden | boolean | whether display webview loading view. |

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| loadURL | string | void | load url/path of the html page to display. |
| execute | string | void | execute js code on current page. |
| loadHTML | htmlString:string, basePath:string | void | load html content to display, with html's `basePath` |
| setSchemeHandler | scheme:string, handle:function | void | set scheme handler to handle web request inside html page. |

* xml schema

```xml
<webview src="path|url"/>
```

* xml sample
```xml
<webview src="http://www.example.com" height="100" />
```

### Video Widget

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| src | string | the video path/url to play. |
| sourceType | string | source type of this video, File / Streaming / Unknown |
| repeatMode | string | repeat mode of this video, One / None |
| controlStyle | string | video control style, Embedded / Fullscreen / None |
| scalingMode | string | video scaling mode, AspectFit / AspectFill / Fill |
| allowsAirPlay | boolean | android Unsupport |
| currentPlaybackTime | number | playback time property, in seconds. |
| currentPlaybackRate | number | android Unsupport |
| duration | number | video duration, in seconds, readonly |
| playableDuration | number | video buffered duration, in seconds, readonly |

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| seekingForward | void | void | seek video forward |
| seekingBackward | void | void | seek video backward |
| endSeeking | void | void | android Unsupport |
| play | void | void | start to play video |
| pause | void | void | pause the video |
| stop | void | void | stop the video |

* callback property list

| Property      | Parameters    | Description   |
| ------------- | ------------- | ------------- |
| onloadstate | function | onloadstate(LoadState), callback on video load state changed |
| onplaybackstate | void | onplaybackstate(PlaybackState), callback on playback state changed |
| onpreparedtoplay | void | onpreparedtoplay(prepared:boolean), callback on prepared state changed |
| onplaybackfinish | void | onplaybackfinish(FinishReason), callback on playback finished with reason. |

* Constants
    * LoadState
        * LoadStateUnknown
        * LoadStatePlayable
        * LoadStatePlaythroughOK
        * LoadStateStalled

    * Playback
        * PlaybackStateStopped
        * PlaybackStatePlaying
        * PlaybackStatePaused
        * PlaybackStateInterrupted
        * PlaybackStateSeekingForward
        * PlaybackStateSeekingBackward

    * FinishReason
        * FinishReasonPlaybackEnded
        * FinishReasonPlaybackError
        * FinishReasonUserExited

* xml schema
```xml
<video src="path|url" />
```

* xml sample
```xml
<video src="http://xxx.xxx.xxx/xxx.mp4" />
```

### List Widget

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| __section_header_height | number/function | __section_header_height(list, section) |
| __section_header_data | function | __section_header_data(list, section) |
| __section_header_layout | function | __section_header_layout(list, identifier) |
| __section_footer_height | number / function | __section_footer_height(list, section) |
| __section_footer_data | function | __section_footer_data(list, section) |
| __section_header_layout | function | __section_header_layout(list, identifier) |
| __row_height | number / function | __row_height(list, section, row) |
| __row_data | function | __row_data(list, section, row) |
| __row_layout | function | __row_layout(list, identifier) |
| __row_count | number / function | __row_count(list, section) |
| __row_moveable | function | __row_moveable(list, section, row), return whether row can be reorder. |
| __row_onmove | function | __row_onmove(list, fromsection, fromrow, tosection, torow), callback on row's reorder |
| __index_titles | function | __index_titles(list), return quick index titles of each section. |
| __title_index | function | __title_index(list, title, index), return section index of spec title and index |
| __section_count | number / function | __section_count(list), return the section count of this list. |
| dragDownLayout | layout:[uiwidget](#ui-base-widget) | the drag down view, layout from bottom to top. |
| dragDownMinMovement | number | the min movement that can trigger drag down event. |
| onDragDownStateChanged | function | onDragDownStateChanged(enoughMovement:boolean), callback drag state changed event. |
| onDragDownAction | function | onDragDownAction(enoughMovement:boolean), callback on user release drag |

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| reload | void | void | reload list |
| scrollTo | section:number, row:number?, animated:boolean? | void | scroll to spec section/row, with animation, `row` and `animated` can be none. |

* lua sample

<!-- [FILE] sample/scripts/widget/list.lua -->

```lua

local base = require "framework.base"
local ui = require "framework.ui"

local list = {qName = "list", template = {indexable = true}, id="demolist", marginTop=40}
local view = ui.view{backgroundColor = "blue"}
view:addChild(ui.label{data = "title"})
list.template.body = view
list.template.sectionHeader = ui.label{data = "title", backgroundColor = "gray", color = "white"}

local v = ui.view{backgroundColor = "red"}
v:addChild(ui.label{id = "dragDownLabel", marginBottom = 0, height = 20})

list.dragDownLayout = v -- 下拉区域view model,内部元素建议从下往上布局(因为下拉首先看到的是该view下部元素)
list.dragDownMinMovement = 60 -- 最小下拉距离

list.onDragDownStateChanged = function(lst, match) -- 下拉状态改变触发事件，match 表示是否符合下拉阈值
	dragDownLabel.text = string.format("onDragDownStateChanged %s", match and "1" or "0")
	print(string.format("onDragDownStateChanged %s", match and "1" or "0"))
end

list.onDragDownAction = function(lst, match) -- 下拉松开触发事件，match 表示是否符合下拉阈值
	dragDownLabel.text = string.format("onDragDownAction %s", match and "1" or "0")
	print(string.format("onDragDownAction %s", match and "1" or "0"))

	if match then
		sleep(2)
		lst:closeDragDown() -- 刷新完成后，关闭下拉界面
	end
end

demoview:addChild(list)

demoview:addChild(ui.button{height = 40, width = 40, label = "S2", onclick = function()
	demolist:scrollTo(2)
end})

demoview:addChild(ui.button{height = 40, width = 80, marginRight="auto", marginLeft="auto", label = "S5R3", onclick = function()
	demolist:scrollTo(5,3,false)
end})

demoview:addChild(ui.button{height = 40, width = 40, marginRight=0, label = "S7", onclick = function()
	demolist:scrollTo(7)
end})

demolist.__section_count = 10
demolist.__section_header_height = function(list, section)
	return section == 0 and 40 or 20
end

demolist.__section_header_data = function(list, section)
	if section == 0 then
		return {title = {text = string.format("S%d", section)}, identifier = "section0"}
	else
		return {title = {text = string.format("S%d", section)}, identifier = "sectionHeader"}
	end
end

demolist.__section_header_layout = function(list, identifier)
	if identifier == "section0" then
		return ui.label{data = "title", backgroundColor = "green", color = "white"}
	else
		return ui.label{data = "title", backgroundColor = "blue", color = "white"}
	end
end

demolist.__row_height = 30

demolist.__row_count = function(list, section)
	return section == 0 and 0 or (section * 2 + 1)
end

local cellmap = {}

cellmap.redviewkey = ui.view{backgroundColor = "red"}
cellmap.redviewkey:addChild(ui.label{data = "title"})

cellmap.yellowviewkey = ui.view{backgroundColor = "yellow"}
cellmap.yellowviewkey:addChild(ui.label{data = "title"})

demolist.__row_data = function(list, section, row)
	return {identifier = row % 2 == 0 and "redviewkey" or "yellowviewkey", title = {text = string.format("S%dR%d", section, row)}}
end

demolist.__row_layout = function(list, identifier)
	return cellmap[identifier]
end

local title_index_map = {}

demolist.__index_titles = function(list)
	local tb = {}
	for i=1,demolist.__section_count do
		local title = string.format("I%d", i - 1)
		
		title_index_map[title] = i - 1 -- section index start with 0, i start with 1, so ..
		table.insert(tb, title)
	end

	return tb
end

demolist.__title_index = function(list, title, index)
	return title_index_map[title] -- return the section-index by the right title and index
end

demolist.__row_moveable = function(list, section, row)
	return row % 2 == 0
end

demolist.__row_onmove = function(list, fromsection, fromrow, tosection, torow)
	print("onmove", fromsection, fromrow, tosection, torow)
end

demolist.__row_action = function(list, section, row)
	local v = ui.view{width = 100}
	v:addChild(ui.button{width = 50, height = "100%", backgroundColor = "blue", color="white", label = "测试1", onclick=function()
		alert("123")
	end})
	v:addChild(ui.button{width = 50, height = "100%", backgroundColor = "red", color="white", label = "测试2", marginLeft = 50})
	return v
end

demolist:reload()

demolist.editing = true

```

### Scrollview Widget

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| dragDownLayout | layout:[uiwidget](#ui-base-widget) | the drag down view, layout from bottom to top. |
| dragDownMinMovement | number | the min movement that can trigger drag down event. |
| onDragDownStateChanged | function | onDragDownStateChanged(enoughMovement:boolean), callback drag state changed event. |
| onDragDownAction | function | onDragDownAction(enoughMovement:boolean), callback on user release drag |
| pagingEnabled | boolean | scrollview paging, ios only |
| decelerationEnabled | boolean | scrollview deceleration, ios only |
| direction | string | android only, vertical / horizontal, default:vertical |
| scrollmodel | string | android only value:hvmodel, available on direction="horizontal" |

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| setContentOffset | x:number, y:number, animation:boolean(optional) | void | set content offset inside scrollview |
| getContentOffset | void | x:number, y:number | get the content offset. |
| setContentSize | width:number,height:number | void | set the content size, ios only. |
| getContentSize | void | width:number, height:number | get the content size, ios only. |

* callback list

| Property      | Parameters    | Description   |
| ------------- | ------------- | ------------- |
| onchange | scrollview:[ScrollView](scrollview.md), contentOffsetX:number, contentOffsetY:number | callback on scrollview's contentoffset changed. |
| ontouchup | scrollview:[ScrollView](scrollview.md), contentOffsetX:number, contentOffsetY:number | callback when touch up on scrollview. |
| ontouchdown | scrollview:[ScrollView](scrollview.md), contentOffsetX:number, contentOffsetY:number | callback when touch down on scrollview. |
| ontouchmove | scrollview:[ScrollView](scrollview.md), contentOffsetX:number, contentOffsetY:number | callback when touch move on scrollview. |

* xml schema
```xml
<scrollview pagingEnabled="true|false" decelerationEnabled="true|false" >
```

* xml sample
```xml
<scrollview id="widgetid">
  ...
</scrollview>
```

* lua sample

```lua
widgetid.ontouchup = function(sv,x,y)
    print("ontouchup",sv,x,y)
end

widgetid.ontouchdown = function(sv,x,y)
    print("ontouchdown",sv,x,y)
end

widgetid.ontouchmove = function(sv,x,y)
    print("ontouchmove",sv,x,y)
end

widgetid.onchange = function(sv,x,y)
    print("onchange",sv,x,y)
end

widgetid:setContentOffset(100,100)

local w,h = widgetid:getContentSize()
local x,y = widgetid:getContentOffset()
```


## Service

## C Function

## Class
### SizeType

* string
	* "200"
	* "50%"
	* "auto"
* number
	* 200.0

### ColorType

* css style
	* "black" "white" "lightgray" ...
	* "#FF0000"
	* "#55FF0000"(alpha 55)
* number
	* 0xff0000
	* 0x55ff0000 (alpha 55)

### ImageType

* string
	* "http://xxx.xx.xxx/xxx.jpg"
	* "app://<AppId>/xxx.jpg"
	* "data://<AppId>/xxx.jpg"
	* "xxx.jpg"
	* "data:base64, xxxx" (base64 format)
	* "data:AABB" (Hex format)
* [LuaImage](#luaimage)

### GradientType

* string
	* &lt;type: linear&gt; &lt;direction: top|bottom|left|right|top-left|bottom-right|top-right|bottom-left&gt; [ColorType](#colortype) [ColorType](#colortype) ...

* table

```
	{
	    mode = "linear",
	    coordinate = {
	        startX, startY,
	        endX, endY
	    },
	    color = {
	        ColorType, ColorType, ...
	    }
	}
```

### ScaleType

* string
	* "none"
	* "fill"
	* "fitWidth"
	* "fitHeight"
	* "repeat"
	* "clip([0-9]+,[0-9]+(,[0-9]+,[0-9]+)?)"

# Best Practice

# Tutorial
