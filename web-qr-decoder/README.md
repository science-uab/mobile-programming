Web QR Decoder
==
A simple `javascript` plugin that use device camera to decode QR Code

---
###  :small_blue_diamond: Options
| Option       | Type     | Default  | Description
| ---        | ---      | ---       | ---
| auto_start    | Boolean    | false | Auto start scanning on run
| video_el      | String      | undefined    | ID of video element if want to see stream (By default is used local element) 
| onSuccess     | Function    | undefined      | Callback on success decode (param: result - decoded string)
| onClose      | Function    | undefined    | Callback on close

---

### :small_blue_diamond: Usage

```js
qrkdecoder(options: Object);
```


#### :small_blue_diamond: Example

```js
qrkdecoder({
  auto_start: true,
  onSuccess: function(result){
    // Do some magic with result
  }
});
```

![](https://raw.githubusercontent.com/science-uab/mobile-programming/master/web-qr-decoder/screenshot.png)

---

### :small_blue_diamond: Author
Crafted by :copyright: Igor Golban