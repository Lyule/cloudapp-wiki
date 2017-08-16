Reference Manual

# API

## Widget

### UI Base Widget
This the abstract class of all widget.

* Properties

| Property      | Type          | Description   |
| ------------- | ------------- | ------------- |
| id | string | readonly |
| alpha | number | widget alpha |
| transform | table | use affine lib to create transform table |
| touchDisabled | boolean | disable touch |
| hidden | boolean | |
| onchange | function | |
| onerror | function | |
| onload | function | |
| ontouchup | function | |
| ontouchdown | function | |
| ontouchmove | function | |
| backgroundAlpha | number | |
| backgroundColor | color:[ColorType](#ColorType) | |
| backgroundGradient | gradient:[GradientType](#GradientType) | |
| backgroundImage | image:[ImageType](../common/imagetype.md) | |
| backgroundScale | scale:[ScaleType](../common/scaletype.md) | |
| borderColor | color:[ColorType](../common/colortype.md) | |
| borderAlpha | number | |
| borderWidth | number | |
| cornerRadius | number | |
| width | size:[SizeType](../common/sizetype.md) | |
| height | size:[SizeType](../common/sizetype.md) | |
| marginLeft | size:[SizeType](../common/sizetype.md) | |
| marginRight | size:[SizeType](../common/sizetype.md) | |
| marginTop | size:[SizeType](../common/sizetype.md) | |
| marginBottom | size:[SizeType](../common/sizetype.md) | |
| margin | string | top,right,bottom,left |
| paddingLeft | size:[SizeType](../common/sizetype.md) | |
| paddingRight | size:[SizeType](../common/sizetype.md) | |
| paddingTop | size:[SizeType](../common/sizetype.md) | |
| paddingBottom | size:[SizeType](../common/sizetype.md) | |
| padding | string | top,right,bottom,left |

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
| getMarginOnView | widget:[uiwidget](uiwidget.md) | top:number,right:number,bottom:number,left:number | |
| getRectOnView | widget:[uiwidget](uiwidget.md) | x:number,y:number,width:number,height:number | |
| setStyle | styles:table | void | merge style table |

### Button Widget
### Label Widget
### Image Widget
### Textfield Widget
### Textarea Widget
### View Widget
### HBox Widget
### VBox Widget
### Webview Widget
### Video Widget
### List Widget
### Scrollview Widget

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

# Best Practice

# Tutorial
