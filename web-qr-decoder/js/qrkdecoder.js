(function() {
  	window.qrkdecoder = function(options) {
  		var _this = this;

  		_this.browserPrefix;
  		_this.navigator = navigator;
  		_this.videoDevices = [];
  		_this.videoDeviceSelected;
  		_this.stream;
  		_this.track;
  		_this.video;
  		_this.canvas;
  		_this.activeContainer;
  		_this.activeContainerVersion;
  		_this.deviceSelector;

  		_this.isMobile = false;
  		_this.hasLight = false;
  		_this.lightOn  = false;
  		_this.canDecode = false;
  		_this.config = {
  			videoFramerate: 60,
  			canvasFramerate: 1000/ 60,
  			videoWidth: 1280,
  			videoHeight: 720,
  		};

  		_this.mobileTouches = {
  			start: null,
  			move: [],
  			end: null,
  		}
  		_this.canvasSwipeDirection = {
  			vertical: '',
  			horizontal: ''
  		};

  		// Init decoder
		_this.init = function(){
			_this.video = document.createElement('video');

			if(typeof options != 'undefined'){
				if('videoEl' in options){
					_this.video = document.getElementById(options.videoEl);
				}
			}else{
				options = {};
			}

			// Render plugin html
			_this.renderHtml();

			_this.activeContainer = document.getElementsByClassName('qrkdecoder-container')[0];
			_this.activeContainer.style.display = 'block';


			if(window.outerWidth <= 1024){
				_this.isMobile = true;
			}

			if(_this.isMobile){
				_this.activeContainerVersion = _this.activeContainer.getElementsByClassName('qrkdecoder-mobile')[0];

				_this.activeContainer.getElementsByClassName('qrkdecoder-desktop')[0].style.display = 'none';
			}else{
				_this.activeContainerVersion = _this.activeContainer.getElementsByClassName('qrkdecoder-desktop')[0];

				_this.activeContainer.getElementsByClassName('qrkdecoder-mobile')[0].style.display = 'none';
			}

			_this.activeContainerVersion.style.display = 'block';

			// Device select
			_this.deviceSelector = _this.activeContainer.getElementsByClassName('qrkdecoder-cam-selector')[0];
			_this.deviceSelector.addEventListener('change', _this.onDeviceSelector);

			// Start decode button
			_this.startButtonSelector = _this.activeContainerVersion.getElementsByClassName('qrkdecoder-scan-decode-button')[0];
			_this.startButtonSelector.addEventListener('click', _this.onStartClick);

			// Close button
			_this.closeButtonSelector = _this.activeContainerVersion.getElementsByClassName('qrkdecoder-close')[0];
			_this.closeButtonSelector.addEventListener('click', _this.onCloseClick);
			// Light button
			_this.lightButtonSelector = _this.activeContainerVersion.getElementsByClassName('qrkdecoder-light')[0];
			_this.lightButtonSelector.addEventListener('click', _this.toggleLight);
			// Container background
			_this.containerBackgroundSelector = _this.activeContainer.getElementsByClassName('qrkdecoder-container-background')[0];
			_this.containerBackgroundSelector.addEventListener('click', _this.onCloseClick);
			


			_this.config.mobileWidth = _this.activeContainer.getElementsByClassName('qrkdecoder-mobile')[0].offsetWidth;
			_this.config.mobileHeight = _this.activeContainer.getElementsByClassName('qrkdecoder-mobile')[0].offsetHeight;

			// Canvas touch
			_this.setCanvas(_this.activeContainerVersion.getElementsByTagName('canvas')[0]);
			_this.canvas.addEventListener("touchstart", _this.onCanvasTouchStart);
			_this.canvas.addEventListener("touchend", _this.onCanvasTouchEnd);

			// Set default device
			_this.selDefaultCam();
		}

		_this.renderHtml = function(){
			var template = 
						'<div class="qrkdecoder-container">'
					+ 		'<div class="qrkdecoder-container-background"></div>'

					+ 		'<div class="qrkdecoder-desktop">'
					+ 			'<canvas class="qrkdecoder-desktop-canvas"></canvas>'

					+ 			'<div class="qrkdecoder-desktop-control">'
					+ 				'<div class="qrkdecoder-close">&#10006;</div>'

					+ 				'<div class="qrkdecoder-cam-select">'
					+ 					'<select class="qrkdecoder-cam-selector"></select>'
					+ 				'</div>'

					+ 				'<div class="qrkdecoder-scan-decode">'
					+ 					'<button class="qrkdecoder-scan-decode-button" data-decode-text="Scanning...">'
					+ 						'Scan &amp; decode'
					+ 					'</button>'
					+ 				'</div>'
					+ 			'</div>'
					+		'</div>'

					+		'<div class="qrkdecoder-mobile">'
					+			'<canvas class="qrkdecoder-mobile-canvas"></canvas>'

					+			'<div class="qrkdecoder-mobile-control">'
					+				'<div class="qrkdecoder-close">&#10006;</div>'
					+				'<div class="qrkdecoder-light">Light On/Off</div>'

					+				'<div class="qrkdecoder-scan-decode">'
					+					'<div class="qrkdecoder-scan-decode-bg"></div>'

					+					'<button class="qrkdecoder-scan-decode-button" data-decode-text="Scanning...">'
					+					'	Scan &amp; decode'
					+					'</button>'
					+				'</div>'
					+			'</div>'
					+		'</div>'
					+	'</div>';

			var node = document.createElement('div');

			node.innerHTML = template;

			document.body.appendChild(node.childNodes[0]);
		}

		// Set default cam - back for smartphones
		_this.selDefaultCam = function(){
			if(_this.navigator.mediaDevices && _this.navigator.mediaDevices.enumerateDevices){
				var constraints = {
					video: {
						width: _this.config.videoWidth,
						height: _this.config.videoHeight,
						framerate: _this.config.framerate
					},
					audio: false
				};
				var camSet = false

				try{
		            _this.navigator.mediaDevices.enumerateDevices()
		            	.then(function(devices){
							for(device of devices){
		            			if(device.kind == 'videoinput'){
		            				_this.videoDevices.push(device);
		            			}
		            		}

		            		// Select default video device
		            		for(device of _this.videoDevices){
			                  	if(device.label.toLowerCase().search('back') > -1){
			                  		constraints.video = {
		                  				deviceId: device.deviceId,
										width: _this.config.videoWidth,
										height: _this.config.videoHeight,
										framerate: _this.config.videoFramerate
		                  			};
			                  		camSet = true;
			                  		_this.videoDeviceSelected = device;
			                  		_this.setCam(constraints);

			                  		break;
				                }
		            		}

		            		if(!camSet){
		            			for(device of _this.videoDevices){
			                  		constraints.video = {
		                  				deviceId: device.deviceId,
										width: _this.config.videoWidth,
										height: _this.config.videoHeight,
										framerate: _this.config.videoFramerate
		                  			};
			                  		camSet = true;
			                  		_this.videoDeviceSelected = device;
			                  		_this.setCam(constraints);

			                  		break;
			            		}
		            		}

		            		// Render video devices selector
		            		_this.renderDeviceSelector();
			            });		       
		        }catch(error){
		            _this.showError(error);
		        }

		        // Call user callback
				if(typeof options.onStart == 'function'){
		    		options.onStart();
		    	}
			}else{
				_this.showError("Browser not support mediaDevices.enumerateDevices");
			}
		}

		// Render device selector
		_this.renderDeviceSelector = function(){
			var html = '';

			for(device of _this.videoDevices){

				option = document.createElement('option');
				option.innerText = device.label;
				option.setAttribute('value', device.deviceId);

				if(_this.videoDeviceSelected.deviceId == device.deviceId){
					option.setAttribute('selected', '');
				}

				html += option.outerHTML;
			}

			_this.deviceSelector.innerHTML = html;
		}



		// Set active camera
		_this.setCam = function(constraints){
			if(typeof constraints == 'undefined'){
				constraints = {
					video: true,
					audio: false
				};
			}

			if(_this.navigator.getUserMedia){
				_this.navigator.getUserMedia(constraints, _this.mediaStreamSuccess, _this.mediaStreamError);
			}else if(_this.navigator.webkitGetUserMedia){
				_this.browserPrefix = 'webkit';
				_this.navigator.webkitGetUserMedia(constraints, _this.mediaStreamSuccess, _this.mediaStreamError);
			}else if(_this.navigator.mozGetUserMedia){
				_this.browserPrefix = 'moz';
				_this.navigator.mozGetUserMedia(constraints, _this.mediaStreamSuccess, _this.mediaStreamError);
			}else if(_this.navigator.msGetUserMedia){
				_this.browserPrefix = 'ms';
				_this.navigator.msGetUserMedia(constraints, _this.mediaStreamSuccess, _this.mediaStreamError);
			}else{
				_this.showError("Browser not support Media Capture API");
			}
		}

		// Set active canvas
		_this.setCanvas = function(canvas){
			_this.canvas = canvas;
		}

		// start decode
		_this.startDecode = function(){
			if(_this.canDecode == false){
				_this.canDecode = true;

				_this.startButtonSelector.setAttribute('data-normal-text', _this.startButtonSelector.innerText);

				_this.startButtonSelector.innerText = _this.startButtonSelector.hasAttribute('data-decode-text') 
					? _this.startButtonSelector.getAttribute('data-decode-text') 
					: 'Decoding...';

				_this.startButtonSelector.disabled = true;
			}
		}

		// Close decoder
		_this.closeDecoder = function(){
			// Clear draw loop
			if(_this.streamToCanvasInterval){
				clearInterval(_this.streamToCanvasInterval);
			}

			_this.activeContainer.remove();

			// Call user callback
			if(typeof options.onClose == 'function'){
	    		options.onClose();
	    	}
		}


		/**
			Callbacks
		*/
		// On device selector changed
		_this.onDeviceSelector = function(event){
			for(device of _this.videoDevices){
              	if(device.deviceId == event.target.value){
              		constraints = {
          				video: {
          					deviceId: device.deviceId,
							width: _this.config.videoWidth,
							height: _this.config.videoHeight,
							framerate: _this.config.videoFramerate
          				},
          				audio: false
          			};

              		_this.videoDeviceSelected = device;
              		_this.setCam(constraints);

              		break;
              	}
    		}

    		_this.renderDeviceSelector();
		}

		// Canvas start touch event
		_this.onCanvasTouchStart = function(e){
			e.preventDefault();
			_this.mobileTouches.start = e.changedTouches[0];
		}

		// Canvas end touch event
		_this.onCanvasTouchEnd = function(e){
			e.preventDefault();
			_this.mobileTouches.end = e.changedTouches[0];


			var differenceX = _this.mobileTouches.end.screenX - _this.mobileTouches.start.screenX;
			
			if(differenceX < 0){
				_this.canvasSwipeDirection.horizontal = 'left';
			}else{
				_this.canvasSwipeDirection.horizontal = 'right';
			}

			if(Math.abs(differenceX) > 40){
				var devicesList = _this.videoDevices;
				var currentVideoDeviceListIndex;


				for(deviceIndex in devicesList){
					if(devicesList[deviceIndex].deviceId == _this.videoDeviceSelected.deviceId){
						currentVideoDeviceListIndex = parseInt(deviceIndex);
					}
				}

				if(_this.canvasSwipeDirection.horizontal == 'right'){
					// Select prev video device
					if(currentVideoDeviceListIndex == 0){
						_this.videoDeviceSelected = devicesList[devicesList.length - 1];
					}else{
						_this.videoDeviceSelected = devicesList[currentVideoDeviceListIndex - 1];
					}
				}

				if(_this.canvasSwipeDirection.horizontal == 'left'){
					// Select next video device
					if(currentVideoDeviceListIndex == (devicesList.length - 1)){
						_this.videoDeviceSelected = devicesList[0];
					}else{
						_this.videoDeviceSelected = devicesList[currentVideoDeviceListIndex + 1];
					}
				}

				var constraints = {
      				video: {
      					deviceId: _this.videoDeviceSelected.deviceId,
						width: _this.config.videoWidth,
						height: _this.config.videoHeight,
						framerate: _this.config.videoFramerate
      				},
      				audio: false
      			};
      			
          		_this.setCam(constraints);
				_this.renderDeviceSelector();
			}
		}

		_this.onStartClick = function(){
			_this.startDecode();
		}

		_this.onCloseClick = function(){
			_this.setHasLight(false);
			
			_this.closeDecoder();
		}

		// Media stream success
		_this.mediaStreamSuccess = function(stream){
			_this.stream = stream;
			var track = stream.getVideoTracks()[0];
			var imageCapture = new ImageCapture(track)

			imageCapture.getPhotoCapabilities().then(function(self){
				if(self.fillLightMode.length > 0 && self.fillLightMode.indexOf('off') !== -1){
					_this.setHasLight(true);
				}else{
					_this.setHasLight(false);
				}

	      		_this.track = track;
	      	});

			if(_this.browserPrefix == 'webkit'){
				_this.video.src = window.webkitURL.createObjectURL(_this.stream);
			}else if(_this.browserPrefix == 'moz'){
				_this.video.mozSrcObject = _this.stream;
			}else{
				_this.video.src = URL.createObjectURL(_this.stream);
			}

			//_this.video.play().catch(_this.showError);
			_this.streamToCanvas();
		}

		// Media steam error
		_this.mediaStreamError = function(err){
			_this.showError(err);
		}

		_this.successDecode = function(result){
			if(_this.canDecode == true){
				_this.canDecode = false;

				_this.startButtonSelector.innerText = _this.startButtonSelector.getAttribute('data-normal-text');
				_this.startButtonSelector.disabled = false;
			}

			_this.closeDecoder();

			// Call user callback
			if(typeof options.onSuccess == 'function'){
	    		options.onSuccess(result);
	    	}
		}

		// Stream to active canvas
		_this.streamToCanvas = function(){
			var ctx = _this.canvas.getContext('2d');

			if(_this.isMobile){
				_this.canvas.width = _this.config.mobileWidth;
				_this.canvas.height = _this.config.mobileHeight;
			}else{
				_this.canvas.width = _this.config.videoWidth;
				_this.canvas.height = _this.config.videoHeight;
			}

			if(_this.streamToCanvasInterval){
				clearInterval(_this.streamToCanvasInterval);
			}

			// Autostart decode
			if(options.auto_start === true){
				_this.startDecode();
			}

			// Config qrcode lib
	    	qrcode.callback   = _this.successDecode;
			qrcode.canvas_qr2 = _this.canvas;
	    	qrcode.qrcontext2 = qrcode.canvas_qr2.getContext('2d');

			_this.streamToCanvasInterval = setInterval(function(){
				if(_this.isMobile){
					ctx.drawImage(
						_this.video, 
						0, 
						0, 
						_this.config.mobileWidth, 
						_this.config.mobileHeight 
					);
				}else{
					ctx.drawImage(
						_this.video, 
						0, 
						0, 
						_this.config.videoWidth, 
						_this.config.videoHeight 
					);
				}

				if(_this.canDecode){
					try{
		            	// use qrdecode lib for decode	            	
		                qrcode.decode();
		            }catch(error){       
		                //
		            };
				}
			}, _this.config.canvasFramerate);
		}

		// Show error
		_this.showError = function(err, useThrow){
			if(typeof useThrow == 'undefined'){
				useThrow = true;
			}

			if(useThrow){
				if(typeof err == 'object'){
					console.error(err);
				}

				throw new Error(err);
			}else{
				console.error(err);
			}
		}

		// Work with lights
		_this.setHasLight = function(value){
			_this.hasLight = value;

			if(value){
				_this.lightButtonSelector.style.display = 'block';
			}else{
				_this.lightButtonSelector.style.display = 'none';
				_this.setLightOn(false);
			}
		}

		_this.setLightOn = function(value){
			_this.lightOn = value;

			_this.track.applyConstraints({
            	advanced: [{torch: _this.lightOn}]
          	});
		}

		_this.toggleLight = function(){
			if(! _this.hasLight) return;

			_this.setLightOn(! _this.lightOn);
		}
  	
  		// Run when new object was initialized
		_this.init();
  	}
}(window));