Reference Manual
================

- [API](#api)
	* [Widget](#widget)
		+ [UI Base Widget](#ui-base-widget)
		+ [Button Widget](#button-widget)
		+ [Label Widget](#label-widget)
		+ [Image Widget](#image-widget)
		+ [Textfield Widget](#textfield-widget)
		+ [Textarea Widget](#textarea-widget)
		+ [View Widget](#view-widget)
		+ [HBox Widget](#hbox-widget)
		+ [VBox Widget](#vbox-widget)
		+ [Webview Widget](#webview-widget)
		+ [Video Widget](#video-widget)
		+ [List Widget](#list-widget)
		+ [Scrollview Widget](#scrollview-widget)
		+ [Frame Widget](#frame-widget)
	* [Service](#service)
		+ [device](#device) 
			- [PostScript](#postscript)
			- [DiskInfo](#diskinfo)
			- [SMSTable](#smstable)
		+ [email](#email)
		+ [appmanagement](#appmanagement)
		+ [locale](#locale)
		+ [mp3](#mp3)
		+ [location](#location)
		+ [ilbc](#ilbc)
		+ [zbar](#zbar)
		+ [barcode](#barcode)
		+ [contacts](#contacts)
		+ [alipay](#alipay)
		+ [image](#image)
			- [APIs](#apis)
			- [Samples](#samples)
	* [C Function](#c-function)
		+ [base64](#base64)
		+ [cjson](#cjson)
		+ [openssl](#openssl)
		+ [cv](#cv)
		+ [http](#http)
		+ [responsetable](#responsetable)
		+ [lfs](#lfs)
		+ [lpeg](#lpeg)
		+ [freeimage](#freeimage)
		+ [md5/sha256](#md5)
		+ [registry](#registry)
		+ [string](#string)
		+ [tcpd](#tcpd)
			- [AcceptConnection](#acceptconnection)
		+ [udpd](#udpd)
			- [UDP_ADDR_INFO](#udp_addr_info)
		+ [utd](#utd)
			- [HTTP_REQUEST](#http_request)
			- [HTTP_RESPONSE](#http_response)
		+ [zlib](#zlib)
	* [Class](#class)
		+ [SizeType](#sizetype)
		+ [ColorType](#colortype)
		+ [ImageType](#imagetype)
		+ [GradientType](#gradienttype)
		+ [ScaleType](#scaletype)
		+ [LuaImage](#luaimage)
		+ [LuaLocation](#lualocation)
		+ [LuaHeading](#luaheading)
		+ [LuaFunctionWatcher](#luafunctionwatcher)
- [Best Practice](#best-practice)
	* [Internationalization(i18n)](#internationalization)
- [Tutorial](#tutorial)
	* [Generate Sample Project](#generate-sample-project)
- [Samples](#samples)
	* [Switch Env](#switch-env)
- [Additions](#additions)

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
| getSnapshot | void | img:[LuaImage](#luaimage) | take snapshot of this widget |
| getContentSnapshot | void | img:[LuaImage](#luaimage) | take content snapshot of this widget |
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
<!-- [FILE] sample/client/default/scripts/widget/button.lua -->
```lua
widgetid.onclick = function()
    alert("Click on Button")
end
```

* page demo
<!-- [FILE] sample/client/default/button.xml -->
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

* lua sample

<!-- [FILE] sample/client/default/scripts/widget/label.lua -->

```lua
local ui = require "framework.ui"

local lb = ui.label{html = true, wrap = true}
lb.text = [[
<p style="line-height:100%;letter-spacing:10px;font-size:20px">
UTF-8 is an ASCII-preserving encoding method for Unicode (ISO 10646), the Universal Character Set (UCS).
</p>
]]

local view = ui.view{backgroundColor = "red", height = 50}
view:addChild(lb)

demoview:addChild(view)

local lb = ui.label{wrap = true, backgroundColor = "blue", fontSize=20}
lb.text = [[UTF-8 is an ASCII-preserving encoding method for Unicode (ISO 10646), the Universal Character Set (UCS).]]

local view = ui.view{backgroundColor = "red", height = 10, width = 100}
view:addChild(lb)

demoview:addChild(view)

local w,h = string.space([[UTF-8 is an ASCII-preserving encoding method for Unicode (ISO 10646), the Universal Character Set (UCS).]], 20, 100)

demoview:addChild(ui.view{backgroundColor = "yellow", backgroundAlpha = 0.5, width = w, height = h})
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

* lua sample

<!-- [FILE] sample/client/default/scripts/widget/hbox.lua -->

```lua
local ui = require "framework.ui"

local v = ui.hbox{height = "50%", width="100%", borderWidth=1, borderColor="red"}
v:addChild(ui.view{marginLeft = "5%", marginRight = "5%", width = "20%", borderWidth=1, borderColor="green"})
v:addChild(ui.view{marginLeft = "10%", marginRight = "10%", width = "30%", borderWidth=1, borderColor="blue"})
demoview:addChild(v)


local v = ui.hbox{marginTop = "50%", width="100%", layout="absolute", borderWidth=1, borderColor="red"}
v:addChild(ui.view{marginLeft = "5%", marginRight = "5%", width = "20%", borderWidth=1, borderColor="green"})
v:addChild(ui.view{marginLeft = "10%", marginRight = "10%", width = "30%", borderWidth=1, borderColor="blue"})
v:addChild(ui.view{width = "10%", backgroundColor = "red"})
demoview:addChild(v)
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

* lua sample

<!-- [FILE] sample/client/default/scripts/widget/vbox.lua -->

```lua
local ui = require "framework.ui"

local v = ui.vbox{width = "50%"}
v:addChild(ui.view{marginTop = "5%", marginBottom = "5%", height = "20%"})
v:addChild(ui.view{marginTop = "10%", marginBottom = "10%", height = "30%"})
demoview:addChild(v)


local v = ui.vbox{width = "50%", marginLeft = "50%", layout="absolute"}
v:addChild(ui.view{marginTop = "5%", marginBottom = "5%", height = "20%"})
v:addChild(ui.view{marginTop = "10%", marginBottom = "10%", height = "30%"})
v:addChild(ui.view{height = "10%", backgroundColor = "red"})
demoview:addChild(v)
```

### Webview Widget

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| src | string | the url/path of the html page to display. |
| zoomable | boolean | whether user could zoom the webpage. |
| opaque | boolean | the opaque of the webpage. |
| busyhidden | boolean | whether display webview loading view. |
| jit | boolean | if true, webview will use WKWebview in ios. |

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

<!-- [FILE] sample/client/default/scripts/widget/list.lua -->

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

<!-- [FILE] sample/client/default/scripts/widget/scrollview.lua -->

```lua
local base = require "framework.base"
local ui = require "framework.ui"

local v = ui.view{backgroundColor = "red"}
v:addChild(ui.label{id = "dragDownLabel", marginBottom = 0, height = 20})

local sv = demoview:addChild(ui.scrollview())
sv:addChild(ui.view{backgroundColor = "blue"})

sv.dragDownLayout = v -- 下拉区域view model,内部元素建议从下往上布局(因为下拉首先看到的是该view下部元素)
sv.dragDownMinMovement = 60 -- 最小下拉距离

sv.onDragDownStateChanged = function(sv, match) -- 下拉状态改变触发事件，match 表示是否符合下拉阈值
	dragDownLabel.text = string.format("onDragDownStateChanged %s", match and "1" or "0")
	print(string.format("onDragDownStateChanged %s", match and "1" or "0"))
end

sv.onDragDownAction = function(sv, match) -- 下拉松开触发事件，match 表示是否符合下拉阈值
	dragDownLabel.text = string.format("onDragDownAction %s", match and "1" or "0")
	print(string.format("onDragDownAction %s", match and "1" or "0"))

	if match then
		sleep(2)
		sv:closeDragDown() -- 刷新完成后，关闭下拉界面
	end
end
```

### Frame Widget

Frame Widget is most likely iframe in HTML.

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| appId | string | app to contain |
| pageId? | string | optional, page to contain |

* xml schema
```xml
<frame appId="xxx" pageId="xxx" width="xxx" />
```

* xml sample
```xml
<frame id="frame1" appId="demo" pageId="index" marignBottom="100" />
```

## Service

### device

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| getDiskInfos | void | [DiskInfoList](#diskinfo) | get disk infos |
| sms | [SMSTable](#smstable) | boolean | launch system sms |
| auth | msg:string, callback:LuaFunction | boolean | finger auth, ios only. |
| call | phonenumber:string | boolean | launch system phone call |
| getPasteboardText | void | string | get string from pasteboard |
| setPasteboardText | value:string | put string to pasteboard |
| getNetworkType | void | string | get network type in string |
| canOpenURL | url:string | boolean | check whether the url can be open. |
| openURL | url:string | boolean | open the url |
| hasApp | appidentifier:string | boolean | check whether app exist, scheme in ios or id in android. |
| openApp | appidentifier:string | boolean | open app |
| getUUID | void | string | get device uuid | get device uuid, it will change if user erase the system in ios. |
| loadFont | fontPath:string, fontname:string | void | load customize font, `fontname` must exactly match the [PostScript](#postscript) name of this font. |
| playSoundFile | path:string | void | play a short sound file. |
| clearSoundCache | void | void | ios only |
| vibrate | void | void | vibrate the device |

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| userAgent | string | get or change user agent on web request. |
| statusBarHidden | boolean | rw |
| statusBarStyle | StatusBarStyle | can be StatusBarStyleDefault / StatusBarStyleLightContent |
| batteryLevel | number | get battry level, read only. |
| flashlight | boolean | turn on or turn off the flashlight. |
| wlan | boolean | check whether wlan is available, read only. |
| statusBarHeight | number | get the statusBarHeight, read only |

* Constants

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| StatusBarStyleDefault | StatusBarStyle | |
| StatusBarStyleLightContent | StatusBarStyle | |

#### PostScript

* how to get PostScript name from font file

```bash
# for macosx with homebrew
brew install lcdf-typetools

otfinfo --info font.path
```

#### DiskInfo

```js
{
    {
        "freeSpace": 123,
        "totalSpace": 456,
        "deviceName": "/dev/disk1",
        "format": "nfs"
    }
    ...
}
```

#### SMSTable

```js
{
    "message": "xxx",
    "numbers": [
        13811111111,
        13822222222
    ]
}
```

* lua sample

```lua

local deviceservice = registry.getService("device")
local ui = require "framework.ui"

local btn = demoview:addChild(ui.button{label = "INFO"})

btn.onclick = function()
	for k,v in pairs(deviceservice) do
	    print(k,v)
	end
	print(deviceservice.batteryLevel) -- [16:18:27.236] 0.89999997615814
	print(deviceservice.wlan)  -- [16:18:27.242] true
	print(deviceservice.userAgent) -- [16:18:27.243] Mozilla/5.0 (iPhone; CPU iPhone OS 7_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D167 MaryKayMobility/1.2.0
	deviceservice.flashlight = not deviceservice.flashlight
	deviceservice.statusBarHidden = not deviceservice.statusBarHidden
	deviceservice:vibrate()
	sleep(5)
	deviceservice:playSoundFile("tap.aif")
end

local btn = demoview:addChild(ui.button{label = "Read Pasteboard", marginTop = 60})

btn.onclick = function()
	local value = deviceservice:getPasteboardText()
	if value and #(value) > 0 then
		alert(value)
	end
end

local btn = demoview:addChild(ui.button{label = "Write Pasteboard", marginTop = 120})

btn.onclick = function()
	deviceservice:setPasteboardText(string.format("%1.3f", math.random(10000) / 1000))
end

```

### email

* lua sample

```lua
local emailservice = registry.getService("email")
emailservice:send{
    subject = "Subject",
    recipients = {"test@test.com"},
    ccrecipients = {"test@test.com"},
    bccrecipients = {"test@test.com"},
    body = "Message Body",
    attachments = {
        {
            name = "snapshot.png",
            mime = "image/png",
            data = _root.snapshot:getPNGData()
        }
    }
}
```

### appmanagement

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| installFile | filePath:string, appId:string | result:boolean | install app from local path (path from downloadinfo) |
| installURL | url:string, appId:string | result:boolean | install app from remote url |
| scan | void | void | refresh installed apps |
| remove | appId:string, removeAll:boolean(optional) | result:boolean | remove app, if not removeAll, app data will not be removed. |
| list | category:string | sandboxs:EOSList | list apps by category |
| pathForApp | appId:string | path:string | return app's absolute path by appId |
| getAppSandbox | appId:string | sandbox:AppSandbox | return the sandbox by appId |
| getPageSandbox | appId:string, pageId:string(optional) | sandbox:PageSandbox | get page sandbox by appId and pageId, if pageId was not set, return the page sandbox of the default page. |

### locale

* lua sample

```lua
local locale = registry.getService("locale")
print(locale["some.locale.key"])
```

### mp3

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| load | filePath:string | void | load audio file to play |
| play | oncomplete:LuaFunction | void | |
| getDuration | void | number | |
| getCurrentTime | void | number | |
| setCurrentTime | double | void | |
| startRecord | filePath:string | void | |
| stopRecord | void | void | |
| setSampleRate | number | void | default 11025 |

* lua sample

```lua
local mp3 = registry.getService("mp3")
mp3:setSampleRate(8000)
mp3:startRecord("data:///record.mp3")

sleep(5)
mp3:stopRecord()
sleep(2)
mp3:load("data:///record.mp3")

print("duration", mp3:getDuration())
mp3:play()
sleep(2)
print("CurrentTime", mp3:getCurrentTime())
mp3:setCurrentTime(1)
sleep(3)
print("CurrentTime", mp3:getCurrentTime())
mp3:setCurrentTime(2)
```

### location

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| addLocationWatcher | callback:function | watcher:[LuaFunctionWatcher](#luafunctionwatcher) | add location watcher, will be called when location changes. callback(location:[LuaLocation](#lualocation)) |
| addHeadingWatcher | callback:function | watcher:[LuaFunctionWatcher](#luafunctionwatcher) | add heading watcher, will be called when heading changes. callback(heading:[LuaHeading](#luaheading)) |
| start | void | result:boolean | start location service |
| stop | void | result:boolean | stop location service |
| newLocation | latitude:number,longitude:number | location:[LuaLocation](#lualocation) | create a new LuaLocation Object |

### ilbc

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| play | filePath:string | void | |
| startRecord | filePath:string | void | |
| stopRecord | void | void | |

* lua sample

```lua
local ilbc = registry.getService("ilbc")
ilbc:startRecord("data:///record.ilbc")

sleep(5)
ilbc:stopRecord()
sleep(2)
ilbc:play("data:///record.ilbc")
```

### zbar

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| setOverlay | layout:[uiwidget](#ui-base-widget) | void | set the scan overlay ui. |
| removeAllConfig | void | void | remove all zbar configs |
| addConfig | string | void | add zbar config line. |
| setScanCrop | x,y,width,height | void | x,y,width,height [0,1] |
| scan | onfound:function | void | onfound(self, item1, item2?, ...), callback on recognized new item. item format: {type: xxx, data: xxx}  |
| cancel | oncompleted:funciton? | void | oncompleted will be called on cancel completed. |

* lua samples

<!-- [FILE] sample/client/default/scripts/service/zbar.lua -->

```lua
local zbs = registry.getService("zbar")
local barcode = registry.getService("barcode")

local ui = require "framework.ui"

local btn = demoview:addChild(ui.button{label = "X"})

btn.onclick = function()
	local overlay = ui.view{backgroundColor = "red", backgroundAlpha = 0.5}
	overlay:addChild(ui.view{backgroundColor = "blue", backgroundAlpha = 0.5, width = 200, height = 200, margin = "auto"})
	overlay:addChild(ui.button{label = "Cancel", color = "white", borderColor = "white", borderWidth = 1, onclick = function()
		zbs:cancel()
	end})
	zbs:setOverlay(overlay)

	zbs:removeAllConfig()

	zbs:setScanCrop((_root.width - 200) / 2 /_root.width, (_root.height - 200) / 2 /_root.height, 200 / _root.width, 200 / _root.height)
	zbs:scan(function(zbs, item)
		btn.label = item.data
		alert(item.type, item.data)
	end)
end

local btn = demoview:addChild(ui.button{label = "QRCode Only", marginTop = 60})

btn.onclick = function()
	local overlay = ui.view{backgroundColor = "red", backgroundAlpha = 0.5}
	overlay:addChild(ui.view{backgroundColor = "blue", backgroundAlpha = 0.5, width = 200, height = 200, margin = "auto"})
	overlay:addChild(ui.button{label = "Cancel", color = "white", borderColor = "white", borderWidth = 1, onclick = function()
		zbs:cancel()
	end})
	zbs:setOverlay(overlay)

	zbs:removeAllConfig()
	zbs:addConfig("*.enable=0")
	zbs:addConfig("qrcode.enable=1")

	zbs:setScanCrop((_root.width - 200) / 2 /_root.width, (_root.height - 200) / 2 /_root.height, 200 / _root.width, 200 / _root.height)
	zbs:scan(function(zbs, item)
		btn.label = item.data
		alert(item.type, item.data)
	end)
end

local btn = demoview:addChild(ui.button{label = "IOS", marginTop = 120})

btn.onclick = function()
	local overlay = ui.view{backgroundColor = "red", backgroundAlpha = 0.5}
	overlay:addChild(ui.view{backgroundColor = "blue", backgroundAlpha = 0.5, width = 200, height = 200, margin = "auto"})
	overlay:addChild(ui.button{label = "Cancel", color = "white", borderColor = "white", borderWidth = 1, onclick = function()
		barcode:cancel()
	end})
	barcode:setOverlay(overlay)
	barcode:setScanCrop((_root.width - 200) / 2 /_root.width, (_root.height - 200) / 2 /_root.height, 200 / _root.width, 200 / _root.height)
	barcode:scan(function(barcode, item)
		btn.label = item.data
		alert(item.type, item.data)
	end)
end

```

### barcode

same as [zbar serice](#zbar)

### contacts

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| load | func:function | void | load contacts, func will be invoked on complete |
| addChangeWatcher | func:function | LuaFunctionWatcher | func will be invoked on contacts changes. |
| getAll | void | List | get all contacts List, item in list: LuaRecord |

* lua sample

<!-- [FILE] sample/client/default/scripts/service/contacts.lua -->

```lua
local base = require "framework.base"
local ui = require "framework.ui"
local json = require "cjson"

local contactsService = registry.getService("contacts")

local watcher = contactsService:addChangeWatcher(function(...)
    print(...)
end)

contactsService:load(function(cs, success)
    print(cs, success)
    for i,v in ipairs(cs.all) do
        for i2,v2 in pairs(v) do
            print(i2,v2)
        end
        print(i,v.fullName, json.encode(v.phones))
    end

    -- test load again inside load callback
    contactsService:load(function(cs, success)
	    print("2", cs, success)
	    for i,v in ipairs(cs.all) do
	        for i2,v2 in pairs(v) do
	            print("2", i2,v2)
	        end
	        print("2",i,v.fullName, json.encode(v.phones))
	    end

	    
	end)
end)
```

### alipay

* lua sample

<!-- [FILE] sample/client/default/scripts/service/alipay.lua -->

```lua
-- If app has been killed before relaunch by alipay, you can get result from globalsandbox by key `$alipay_result`
local ret = sandbox:getGlobalSandbox():get("$alipay_result")
if ret then
	-- clear result
    sandbox:getGlobalSandbox():put("$alipay_result", nil)

	alert(ret.memo)
else
	local alipay = registry.getService("alipay")
	alipay:pay("test", function(res) alert(ret.memo) end)
end
```

### image

#### APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| load | filePath:string | [LuaImage](#luaimage) | load image file |

#### Samples

```lua
local imageservice = registry.getService("image")
local img = imageservice:load(filePath)
```

## C Function

### base64

* lua sample

```lua
local base64 = require "base64"
base64.encode(xxx)
base64.decode(xxx)
base64.code("different-code-map-with-size-64")

```

### cjson

* lua sample

```lua
local cjson = require "cjson"
-- local cjson = require "cjson.safe"

cjson.encode(xxx)
cjson.decode(xxx)

```

### openssl

[Document](http://zhaozg.github.io/lua-openssl/)

### cv

Check 3rdparty/luacv_doc.pdf

### http

* `escape(str:string)`
call to curl_escape

* `unescape(str:string)`
call to curl_unescape

* `cookiejar(path:string)`
set the default cookiejar path

* `cainfo(path:string)`
set the default cainfo path

* `capath(path:string)`
set the default capath path

* `get(arg:table or string)`
* `post(arg:table or string)`
* `put(arg:table or string)`
* `head(arg:table or string)`
* `update(arg:table or string)`
* `delete(arg:table or string)`

---------

if arg is string, use it as `url` key in the following arg table.

---------
keys in the `arg`:

* `url: string`

	the url path string

* `headers: table?`

	the request headers, format `{key = value, key2 = value2}`

* `verbose: boolean?`

	save all request message to file named verbose.log

* `dns_servers: string?`

	customize the dns servers, format `1.2.3.4,2.3.4.5`, refer to `CURLOPT_DNS_SERVERS`

* `onprogress: function?`

	progress callback, arg1 => dltotal:integer, arg2 => dlnow:integer, arg3 => ultotal:integer, arg4 => ulnow:integer, refer to `CURLOPT_PROGRESSFUNCTION`

* `timeout: number?`

	low speed timeout, less than 0 in 1min, refer to `CURLOPT_LOW_SPEED_TIME`

* `conntimeout: number?`

	connection timeout, `CURLOPT_TIMEOUT`

* `ssl_verifypeer: integer?`, refer to `CURLOPT_SSL_VERIFYPEER`

* `ssl_verifyhost: integer?`, refer to `CURLOPT_SSL_VERIFYHOST`

* `sslcert: string?`, refer to `CURLOPT_SSLCERT`

* `sslcertpasswd: string?`, refer to `CURLOPT_SSLCERTPASSWD`

* `sslcerttype: string?`, refer to `CURLOPT_SSLCERTTYPE`

* `sslkey: string?`, refer to `CURLOPT_SSLKEY`

* `sslkeypasswd: string?`, refer to `CURLOPT_SSLKEYPASSWD`

* `sslkeytype: string?`, refer to `CURLOPT_SSLKEYTYPE`

* `cainfo: string?`, refer to `CURLOPT_CAINFO`

* `capath: string?`, refer to `CURLOPT_CAPATH`

* `proxytunnel: integer?`, refer to `CURLOPT_HTTPPROXYTUNNEL`

* `proxy: string?`, refer to `CURLOPT_PROXY`, we did support http proxy only.

* `proxyport: integer?`, refer to `CURLOPT_PROXYPORT`

* `onsend: function?`

	callback for data upload, refer to `CURLOPT_READFUNCTION`

* `body: string?`

	full body for data to be sent, available if onsend not defined.

* `onreceive: function?`

	callback on receive data from remote, if not set, get the response body from reponsetable.body, arg1 => data:string

* `onheader: function?`

	callback on receive the header part, arg1 => header:table

* `oncomplete: function?`

	callback on http request complete, the http operation return nothing, if not set, the http operation return the responsetable only the request completed. arg1 => responsetable:table

* `forbid_reuse: integer?` forbidden connection reuse on http/1.1, refer to `CURLOPT_FORBID_REUSE`

* `cookiejar: string?`

	cookiejar used by this request, refer to `CURLOPT_COOKIEJAR`,`CURLOPT_COOKIEFILE`

---------

### responsetable

---------
keys in the responsetable:

* `responseCode: integer`

	response code of this request, available on `onheader` callback also.

* `body: string`

	response body, available on `onreceive` callback not set.

* `headers: table`

	response headers, format as `{singlekey = "value", multikey = {"value1", "value2"}}`

* `cookies: table`

	list of cookies.

* `error: string`

	error during request, must check this to make sure http request fully complete.


### lfs

[LuaFileSystem](https://keplerproject.github.io/luafilesystem/manual.html#reference)

### lpeg
[LPeg](http://www.inf.puc-rio.br/~roberto/lpeg/)

### freeimage

* lua sample
Gray Image

<!-- [FILE] sample/client/default/scripts/freeimage/demo.lua -->

```lua
local fi = require "freeimage"

print(fi.getInfo())

local function processGrayImage(dib)
	print("processGrayImage")
	for i=1,dib:getWidth() do
		for j=1,dib:getHeight() do
			local color = dib:getPixelColor(i - 1, j - 1)
			local r = color & 0xff
			local g = (color & 0xff00) >> 8
			local b = (color & 0xff0000) >> 16
			local a = (color & 0xff000000) >> 24
			local gray = math.floor(r * 0.299 + g * 0.587 + b * 0.114)
			color = (gray << 8) + (gray << 16) + (0xff << 24) + gray
			dib:setPixelColor(i - 1, j - 1, color)
		end
	end
end

local dib = fi.bitmap()

assert(dib:load("png", sandbox:resolveFile("images/image.png")))

processGrayImage(dib)
dib:save("png", sandbox:resolveFile("data:///grey.png"))
```
<!-- [FILE] sample/client/default/scripts/freeimage/gif.lua -->

```lua
local fi = require "freeimage"
local ui = require "framework.ui"

print(fi.getInfo())

local images = {}

local imga = fi.bitmap()
assert(imga:load("png", sandbox:resolveFile("images/a.png")))
table.insert(images, imga)

local width = imga:getWidth()
local height = imga:getHeight()
local bpp = imga:getBPP()

local imgb = fi.bitmap()
assert(imgb:load("png", sandbox:resolveFile("images/b.png")))
table.insert(images, imgb)


local body = fi.bitmap()
body:allocate("bitmap", width, height * #(images), 24, 0, 0, 0)

for i,v in ipairs(images) do
    local img = fi.bitmap()
    img:convertTo24Bits(v)
    body:paste(img, 0, (i - 1) * height, 0xFF)
end

local gifbody = fi.bitmap()
gifbody:colorQuantize(body, "n", 255)
gifbody:setTransparentIndex(255)

local output = fi.open_multi("gif", sandbox:resolveFile("data:///body.gif"), 1, 0, 0)

for i=1,#(images) do
    local dest = fi.bitmap()
    dest:copy(gifbody, 0, (i - 1) * height, width, i * height)

    local img = images[i]

    for i=1,img:getWidth() do
        for j=1,img:getHeight() do
            local color = img:getPixelColor(i - 1, j - 1)
            if color & 0xff000000 == 0 then
                dest:setPixelIndex(i - 1, j - 1, 0xFF)
            end
        end
    end

    output:AppendPage(dest)
end

output:Close()

demoview:addChild(ui.image{src = "data:///body.gif", width = 200, height = 200, backgroundColor = "red"})

```
### md5/sha256

* hash string

```lua
local md5 = require "md5"
local ctx = md5.new()
ctx:update(xxx)
print(ctx:digest()) -- ctx:digest(true) will return binary data

```

* hash file

```lua
local sha256 = require "sha256"
local ctx = sha256.new()

local f = io.open("filepath", "rb")

if f then
	while true do
		local buff = f:read(1024)
		
		if not buff then
			break
		end

		ctx:update(buff)
	end

	f:close()
else
	error("file open failed")
end

print(ctx:digest()) -- ctx:digest(true) will return binary data

```

### registry

```lua
registry.getService("service name")
```

### string

```lua
string.rijndael_128_cbc(str, isEncrypt, key, iv)
string.rijndael_256_cbc(str, isEncrypt, key, iv)
string.des(str, isEncrypt, key)

-- count string space for LabelWidget
string.space(str, fontSize, widthLimit, model, lineSpace, charSpace)
```

### tcpd

* `conn = tcpd.connect(arg:table)`

connect to remote tcp server.

---------
keys in the `arg`:

* `host: string`

	host to connect.

* `port: integer`

	port to connect.

* `onread: function?`

	stream input callback, arg1 => buffer_in:string

* `onsendready: function?`

	callback on ready to send new data (stream output complete), no arg

* `ondisconnected: function?`

	ondisconnected callback, arg1 => reason:string

* `onconnected: function?`

	onconnected callback

* `ssl: boolean?`

	whether ssl connection, default false.

* `ssl_host: string?`

	tls extension host name for ssl handshake, use `host` if this field is not set.

* `cainfo: string?`

	file path to cacert.pem

* `capath: string?`

	directory path of cacert.pem

* `ssl_verifyhost: integer?`

	verify server certificate's host. 1 verify, 0 ignore.

* `ssl_verifypeer: integer?`

	verify ssl certificate, 1 verify, 0 ignore.

* `pkcs12.path: string?`

	path to pkcs12 file, option available only if cainfo/capath has not been set. This option can be used to connect to apple's APNS server.

* `pkcs12.password: string?`

	password of pkcs12 file.

* `read_timeout: number?`

	connection's read timeout.

* `write_timeout: number?`

	connection's write timeout.

---------
`conn` apis:

* `send(buf)`

send out data buf.

* `close()`

close connection, ondisconnected may not callback.

* `reconnect()`

reconnect to the destination.

* `pause_read()`

pause `onread` callback.

* `resume_read()`

resume `onread` callback.

---------
* `serv = tcpd.bind(arg:table)`

listening on tcp socket.

---------
`serv` apis

* `close()` shutdown the server.

---------
keys in the `arg`:

* `host: string?`

	bind host, if not set, bind to "0.0.0.0"

* `port: integer?`

	port to listen, if not set, use random port which is available.

* `onaccept: function`

	new client connection callback, arg1 => [accept_connection](#acceptconnection)

* `ssl: boolean?`

	listening as ssl server, default false.

* `cert: string?`

	ssl cert file path.

* `key: string?`

	ssl key file path.

* `onsslhostname: function`

	ssl hostname (servername extension) callback, arg1 => hostname:string

* `send_buffer_size: integer?`

	client connection send buffer size.


* `receive_buffer_size: integer?`

	client connection receive buffer size.


#### AcceptConnection

* `send(buf)`
send data buf to client.

* `close()`
close client connection.

* `flush()`
flush data to client.

* `remoteinfo()`
return the client connection info table.
`{ip = "1.2.3.4", port = 1234}`

* `pause_read()`

pause `onread` (from bind) callback.

* `resume_read()`

resume `onread` (from bind) callback.

* `bind(arg:table)`
working on single connection.

---------
keys in the `arg`:

* `onread: function?`

	on read message from client callback, arg1 => databuf:string

* `onsendready: function?`

	on send ready callback, no arg.

* `ondisconnected`

	on client disconnected callback, arg1 => reason:string

### udpd

* `conn = udpd.new(arg:table)`
create a udp socket.

* `dest = udpd.make_dest(host:string, port:number)`
create a dest:[UDP_AddrInfo](#udp_addr_info), can be used in `conn:send`, this api is non-blocking.

---------
keys in the `arg`:

* `onread: function?`

	callback on receive data. arg1 => data:string, arg2 => [UDP_AddrInfo](#udp_addr_info)

* `onsendready: function?`

	callback on ready to send new data after `send_req`. no arg.

* `host: string?`

	host to send message to.

* `port: integer?`

	port to send message to.

* `bind_host: string?`

	local bind host, default "0.0.0.0"

* `bind_port: integer`

	local bind port

---------
conn apis:
* `send(buf, addr?)`
send out data buf, if addr:[UDP_AddrInfo](#udp_addr_info) specified, use it as the destination address, otherwise, use the host:port when create this udp object.

* `send_req()`
request to send data, when output buffer is available, onsendready will be called.

* `getPort()`
get the udp local binding port.

* `close()`
cleanup udp reference.

#### UDP_ADDR_INFO

* `getHost():string`
get the income message host.

* `getPort():integer`
get the income message port.

### utd

* `serv, port = utd.bind(arg:table)`
create a simple http server.

---------
keys in the `arg`:

* `host: string?`

http service listening host, default "0.0.0.0"

* `port: integer?`

http service listening port, leave empty for random port that available.

* `onService`

on request callback, arg1 => [http_request](#http_request), arg2 => [http_response](#http_response)

#### HTTP_REQUEST

properties:
* `path:string`

* `query:string`

* `method:string`

* `params:table`

* `body:string`
income body.

* `headers:table`
format as `{singlekey = "value", multikey = {"value1", "value2"}}`

* `remoteip:string`

* `remoteport:integer`

apis:
* `available():integer`
return available input stream length to read.

* `read()`
read data buf from input stream, return nil if no data.

#### HTTP_RESPONSE

apis:
* `addheader(k:string, v:string)`
add one response header.

* `reply(status_code:integer, msg:string, bodydata:string?)`
response to client.

* `reply_start(status_code:integer, msg:string)`

* `reply_chunk(data:string)`

* `reply_end()`

### zlib
[lzlib](https://github.com/LuaDist/lzlib)

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

### LuaImage

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| saveIntoPhotoLibrary | oncomplete:function? | void | save image into device photo library |
| save | path:string, format:string | void | save image into `path` with spec `format`, `format` can be jpeg or png |
| getSize | void | width:number, height:number | get the size of this image. |

### LuaLocation

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| distanceFromLocation | location:[LuaLocation](#lualocation) | meters:number | Returns the lateral distance between two locations in meters. |
| getCoordinate | void | latitude:number, longitude:number | Returns the coordinate of the current location. |

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| timestamp | number | the timestamp when this location was determined. |
| altitude | number | Returns the altitude of the location. Can be positive (above sea level) or negative (below sea level). |
| course | number | Returns the course of the location in degrees true North. Negative if course is invalid. 0.0 - 359.9 degrees, 0 being true North |
| speed | number | the speed of the location in m/s. Negative if speed is invalid. |

### LuaHeading

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| timestamp | number | Returns a timestamp for when the magnetic heading was determined. |
| magneticHeading | number | Represents the direction in degrees, where 0 degrees is magnetic North. The direction is referenced from the top of the device regardless of device orientation as well as the orientation of the user interface. |
| trueHeading | number | Represents the direction in degrees, where 0 degrees is true North. The direction is referenced from the top of the device regardless of device orientation as well as the orientation of the user interface. |
| headingAccuracy | number | Represents the maximum deviation of where the magnetic heading may differ from the actual geomagnetic heading in degrees. A negative value indicates an invalid heading. |
| x | number | Returns a raw value for the geomagnetism measured in the x-axis. |
| y | number | Returns a raw value for the geomagnetism measured in the y-axis. |
| z | number | Returns a raw value for the geomagnetism measured in the z-axis. |

### LuaFunctionWatcher

* APIs

| Property      | Parameters    | Return Type   | Description   |
| ------------- | ------------- | ------------- | ------------- |
| clear | void | void | invalid this watcher. |


# Best Practice

## Internationalization

### Where to place locale file

You need to place all locale files under `client/default/locale` folder, with the real locale name as the file name.

### How to change runtime locale

locale will be used automatically, but you can change the preferred locale by the following script.

```lua
local storage = require "framework.storage"
storage.save("preferredLanguage", "en", storage.SCOPE_GLOBAL)
```

### How to use locale in lua

[Locale Service](#locale)

### How to use locale in xml

surround your locale key with `@{}`

```xml
<label text="@{locale.key}"/>
```

### How to pass locale information to api

each api call by `resource.api` will contains a key named `_Culture` in the request header and the parameter field.

e.g.

```
GET /test?access_token=xxx&_Culture=zh&format=json HTTP/1.1
_Culture: zh

```

```
POST /test?access_token=xxx&format=json HTTP/1.1
Content-Type: application/json
_Culture: zh
Content-Length: xx

{
	"_Culture": "zh",
	"xxx": "..."
}
```

# Tutorial

## Generate Sample Project

You can generate sample project from this manual.

* Save the following file as `make.lua` under the same folder of `manual.md`

```lua
local f = io.open("manual.md", "rb")
local data = f:read("*all")
f:close()

local offset = 0

local function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function split(str, pat)
    local t = {}
    if str then
        local fpat = "(.-)" .. pat
        local last_end = 1
        local s, e, cap = str:find(fpat, 1)
        while s do
            if s ~= 1 or cap ~= "" then
                table.insert(t, cap)
            end
            last_end = e + 1
            s, e, cap = str:find(fpat, last_end)
        end
        if last_end <= #str then
            cap = str:sub(last_end)
            table.insert(t, cap)
        end
    end
    return t
end

while true do
    local st,ed = string.find(data, "<!--" .. " [FILE]", offset, true)
    if st and ed then
        offset = ed

        local st2,ed2 = string.find(data, "-->", offset, true)
        local filepath = trim(string.sub(data, ed + 1, st2 - 1))
        local parts = split(filepath, "/")
        local dir = table.concat(parts, "/", 1, #parts - 1)
        os.execute("mkdir -p " .. dir)

        local st3,_ = string.find(data, "```", ed2, true)
        local st4,ed4 = string.find(data, "\n", st3, true)

        local st5,ed5 = string.find(data, "```", ed4, true)

        local body = trim(string.sub(data, ed4 + 1, st5 - 1))

        local f = io.open(filepath, "wb")
        f:write(body)
        f:close()
    else
        break
    end
end
```
* execute the following command on the folder.

```bash
lua-5.3 make.lua
```

# Samples

## Switch Env

* env.lua

<!-- [FILE] sample/client/default/scripts/env.lua -->

```lua
local ui = require "framework.ui"
local storage = require "framework.storage"
local utils = require "framework.utils"
local apps = require "framework.apps"
local base = require "framework.base"
local user = require "framework.user"
local cjson = require "cjson"

local serverURL = storage.load("$serverURL", storage.SCOPE_GLOBAL) or ""

local v = ui.vbox{}

v:addChild(ui.button{
    height = 44,
    label = "Display Profile",
    onclick = function()
        local user = require "framework.user"
        local cjson = require "cjson"
        alert(cjson.encode(user.getProfile()))
    end
})

-- if current user is employee, display the employee profile.
if user.getProfile().isEmployee then
    v:addChild(ui.button{
        height = 44,
        label = "Display Employee Profile",
        onclick = function()
            alert(cjson.encode(user.getProfile().employeeProfile))
        end
    })
end

v:addChild(ui.textfield{
    text = serverURL,
    height = 44,
    id="textfield",
    borderWidth=1,
    borderColor="black",
    placeholder="type server address here."
})

v:addChild(ui.button{
    height = 44,
    label = "Change",
    onclick = function()
        local url = textfield.text
        url = url:trim()
        if string.find(url, "/client/", 1, true) then
            storage.save("$serverURL", textfield.text, storage.SCOPE_GLOBAL)
            alert("quit")
            os.exit()
        else
            alert("Please input correct server address, e.g. https://xxx.xxx.xxx/client/")
        end
    end
})

demoview:addChild(v)
```

# Additions

* manifest.xml

<!-- [FILE] sample/manifest.xml -->

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
	<mobilityapp category="user" id="sample" version="1.0.0">
		<name>@{app.name}</name>
		<description>@{app.description}</description>
		<vendor>@{app.vendor}</vendor>

		<imageLazyLoading>true</imageLazyLoading>

		<dependency>
			<libraries>
				<library id="framework" />
				<library id="CommonService" />
			</libraries>
		</dependency> 
		<metadata> 
			 <data key="section1" schema="layout">
			    <!--Set order in section1 -->
			    <attribute name="order">1</attribute>
			    <!--Set icon image -->
			    <view margin="25 auto auto auto" width="38" height="38" backgroundScale="fill" backgroundImage="app://sample/images/icon.png"/>
			    <!--Set module title label -->
			    <label margin="77 0 0 0" color="#1f1f1f" height="15" text="Sample" fontSize="12" align="center"/>
			    <button onclick="installAndPushApp('sample')"/>
			</data>
		</metadata>
		<security login="optional" roles="*" />

		<skins>
			<skin smallestWidth="320" skin="default" />
			<skin smallestWidth="640" skin="sw640dp" />
			<skin smallestWidth="1080" skin="sw1080dp" extends="sw640dp"/>
			<skin smallestWidth="320" retina="true" os="ios"
				skin="iphone-xhdpi-sw320dp" />
		</skins>
		<pages index="index">
			<page>index.xml</page>
		</pages>
	</mobilityapp>
</manifest>
```

* en.loc

<!-- [FILE] sample/client/default/locale/en.loc -->

```ini
# Mobility App
app.name=Sample
app.description=Sample

app.vendor=MK

test.key=Test
button.label.back=GoBack
format.string=Welcome, %s
```

* zh.loc

<!-- [FILE] sample/client/default/locale/zh.loc -->

```ini
# Mobility App
app.name=范例
app.description=范例

app.vendor=MK

test.key=测试
button.label.back=返回
format.string=%s, 欢迎您
```

* index.xml.lua

<!-- [FILE] sample/client/default/index.xml.lua -->

```xml
local ui = require "framework.ui"
local json = require "cjson"
local base = require "framework.base"
local apps = require "framework.apps"

local stop = false

local function goBack()
	stop = true

	apps.popPage()
end

function onNavBack()
	goBack()
	return true
end

function onCreated(ctx)
	-- if ctx then
	-- 	async(alert, json.encode(ctx))
	-- end

	_root.backgroundColor = "white"
	backBtn.onclick = goBack

	closeBtn.onclick = function ()
		demopanel.hidden = true
	end

	runBtn.onclick = function()
		loadstring(codearea.text, "", "t", _ENV)()
	end

	local items = {}

	local rowidx = 0

	local path = _S.tmpPath

	if not path then
		path = base.resolveFile("scripts")
	else
		_S.tmpPath = nil
	end

	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." then
			local fpath = path..'/'..file
			local attr = lfs.attributes(fpath)
			if attr.mode == "directory" then
				local idx = rowidx
				local data
				data = {
					count = 0,
					title = {
						text = string.format("<font color='blue' style='font-size:12pt'>%s</font> <font style='font-size:9pt' color='gray'>=></font>", file)
					},
					btn = {
						onclick = function()
							data.count = data.count + 1
							data.title.text = string.format("<font color='blue' style='font-size:12pt'>%s</font> (%d) <font style='font-size:9pt' color='gray'>=></font>", file, data.count)
							list:reload(0,idx)
							
							_S.tmpPath = fpath
							apps.pushPage({
								pageId = "index",
								frompath = path
							})
						end
					}
				}

				table.insert(items, data)
				rowidx = rowidx + 1
			end
		end
	end

	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." then
			local fpath = path..'/'..file
			local attr = lfs.attributes(fpath)
			if attr.mode ~= "directory" and string.find(file, ".lua", 1, true) then
				local f = io.open(fpath)
				local script = f:read("*all")
				f:close()

				local idx = rowidx
				local data
				data = {
					count = 0,
					title = {
						text = file
					},
					btn = {
						onclick = function()
							data.count = data.count + 1
							data.title.text = string.format("%s (%d)", file, data.count)
							list:reload(0,idx)
							demopanel.hidden = false
							demoview:removeAllChildren()
							
							codearea.text = script
						end
					}
				}

				table.insert(items, data)
				rowidx = rowidx + 1
			end
		end
	end

	-- list.dataProvider = {items = items}

	list.__row_count = #(items)
	list.__row_height = 40

	list.__row_data = function(list, section, row)
		return items[row + 1]
	end

	list.__section_count = 1

	list:reload()
end
```

* index.xml

<!-- [FILE] sample/client/default/index.xml -->

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
	<page>
		<layout>
			<button label="@{button.label.back}" id="backBtn" height="44"/>
			<list marginTop="44" id="list">
				<template>
					<body height="40">
						<label data="title" html="true"/>
						<button data="btn" />
					</body>
				</template>
			</list>

			<scrollview id="demopanel" hidden="true" backgroundColor="white">
				<button label="关闭" id="closeBtn" height="44" marginRight="50%"/>
				<button label="运行" id="runBtn" height="44" marginLeft="50%"/>
				<vbox marginTop="44" >
					<view id="demoview" overflow="hidden" />
					<textarea id="codearea" height="5" backgroundColor="blue" backgroundAlpha="0.5"/>
					<textarea editable="false" id="console" height="5" />
				</vbox>
			</scrollview>
		</layout>
	</page>
</manifest>
```

* skin.spec

<!-- [FILE] sample/client/default/skin.spec -->

```ini
scale=1
```

<!-- [FILE] sample/client/sw640dp/skin.spec -->

```ini
scale=2
```

<!-- [FILE] sample/client/sw1080dp/skin.spec -->

```ini
scale=3.4
```

<!-- [FILE] sample/client/iphone-xhdpi-sw320dp/skin.spec -->

```ini
scale=1
skinname=iphone-xhdpi-sw320dp
```