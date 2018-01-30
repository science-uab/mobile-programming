Web QR Decoder
==
A simple web application that use device camera to decode QR Code

### Options
| option       | Type     | Default  | Description
| ---        | ---      | ---       | ---
| auto_start    | Boolean    | false | Auto start scanning on run
| onSuccess     | Function    | undefined      | Callback on success decode (param: result - decoded string)
| onClose      | Function    | undefined    | Callback on close
| videoEl      | String      | undefined    | ID of video element if want to see stream (By default is used local element) 

### Code example

```js
qrkdecoder({
	auto_start: true,
	onSuccess: function(result){
		// Do some magic with result
	}
});
```
