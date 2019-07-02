/*微喵*/
(function($){
var WM = {version:'2.0'};
window.WM = WM;
WM.getType = function(code){
	return Object.prototype.toString.call(code).replace(/]/,'').split(" ")[1];	
};
WM.getId = function(){
	return ('WM'+Math.random()+new Date().getTime()).replace('.','');
}
WM.checkUrl = function(url){
	var check = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
	return check.test(url);
}
WM.isNode = function(e){
	return e.nodeName;
}
WM.setButton = function(e,b,text){
	if(b){
		if(e.old==null)
			return;
		text = text||e.old.value;
		e.onclick = e.old.onclick;	
		if(e.old.jqClick!=null)
			$(e).bind('click',e.old.jqClick['handler']);
		$(e).css({background:e.old.background,color:e.old.color,borderColor:e.old.borderColor}).html(text);	
		e.old = null;
	}else{
		text = text||e.innerHTML;
		e.old = {
			onclick:e.onclick,
			value:e.innerHTML,
			background:$(e).css('backgroundColor'),
			color:$(e).css('color'),
			borderColor:$(e).css('borderColor')
		}
		if($(e).data('events')!=null)
			e.old.jqClick = $(e).data('events')['click'][0];
		$(e).unbind('click');
		e.onclick = null;
		$(e).css({background:'#999',color:'#f9f9f9',borderColor:'#999'}).html(text);
		//$(e).addClass('btnNormalDisabled').removeClass('btnNormal').html(text);	
	}
}
WM.setInput = function(e,txt){
	e._set = e._set==null?false:e._set;
	e.color = $(e).css('color');
	$(e).css({color:'#999'});
	e.value = txt;
	e._set = true;
	$(e).bind('focus',function(){
		var val = this.value;
		if(val.length==0||e._set){
			this.value = '';
			$(this).css({color:this.color});
		}
	});	
	$(e).bind('blur',function(){
		var val = this.value;
		if(val.length==0){
			$(this).css({color:'#999'}).val(txt);
			e._set = true;	
		}
		else
			e._set = false;	
	});
}
WM.setString = function(e,len){
	var val = $.trim(e.innerHTML);
	if(val.length<=len)
		return;
	var str = val;
	e.title = val;
	str = str.substring(0,len);
	str += '...';
	e.innerHTML = str;
}
WM.extend = function(a,b,bool){
	if(WM.getType(b)=='Object'){
		for(var i in b){
			if(bool&&WM.getType(b[i])=='Object'){
				if(!a[i]||WM.getType(a[i])!='Object')
					a[i] = {};
				WM.extend(a[i],b[i]);		
			}else	
				a[i] = b[i];	
		}	
	}
}
WM.Browser = function(){
	var browser = {
		opera:0,
		ie:0,
		chrome:0,
		firefox:0,
		safari:0,
		konq:0,
		name:0,
		version:0	
	}
	var n = navigator.userAgent,b = browser;
	if(window.opera){
		b.version = window.opera.version();
		b.opera = parseFloat(b.version);
		b.name = 'oprea';
	}else if(/AppleWebKit\/(\S+)/.test(n)){
		if(/Chrome\/(\S+)/.test(n)){
			b.version = RegExp["$1"];
			b.chrome = parseFloat(b.version);
			b.name = 'chrome';	
		}else if(/Version\/(\S+)/.test(n)){
			b.version = RegExp["$1"];
			b.safari = parseFloat(b.version);	
			b.name = 'safari';
		}
	}else if(/KHTML\/(\S+)/.test(n)||/Konqueror\/([^;]+)/.test(n)){
		b.version = RegExp["$1"];
		b.konq = parseFloat(b.version);		
		b.name = 'konq';
	}else if(/Firefox\/(\S+)/.test(n)){
		b.version = RegExp["$1"];
		b.firefox = parseFloat(b.version);
		b.name = 'firefox';	
	}else if(/MSIE ([^;]+)/.test(n)){
		b.version = RegExp["$1"];
		b.ie = parseFloat(b.version);	
		b.name = 'ie';	
	}
	return browser;
}();

WM.cookie = {
	setCookie:function(name,value,day){
		var dt = new Date();
		dt.setDate(dt.getDate()+day);
		value = value+"";
		document.cookie = name+"="+value+";expires="+dt.toGMTString();
		dt = void(0);	
	},
	getCookie:function(name){
		var cookies = document.cookie.split(";");
		for(var i=0;i<cookies.length;i++){
			cookies[i] = cookies[i].replace(/[ ]/g,"");
			var str = cookies[i].split("=");
			if(str[0]==name){
				return str[1];
			}
		}
		return null;	
	},
	delCookie:function(name){
		this.setCookie(name,'',-1);	
	}	
};


WM.moveToCenter = function(e){
	e = e.length>0?e[0]:e;
	var w = e.offsetWidth==0?$(e).width():e.offsetWidth;
	var h = e.offsetHeight==0?$(e).height():e.offsetHeight;
	$(e).css({top:($(window).height()-h)/2,left:($(window).width()-w)/2});	
}

WM.show = function(e,type,fn){
	e = e.length>0?e[0]:e;
	var len;
	switch(type){
		case 'left':
			len = e.offsetLeft;
			$(e).css({left:len-10});
			$(e).animate({
				opacity:1,
				filter:'alpha(opacity=100)',
				'-moz-opacity':1,
				left:len
			},100,function(){
				if(fn)
					fn();	
			});	
			break;
		case 'top':
			len = e.offsetTop;
			$(e).css({top:len-10});
			$(e).animate({
				opacity:1,
				'filter':'alpha(opacity=100)',
				'-moz-opacity':1,
				top:len
			},100,function(){
				if(fn)
					fn();	
			});	
			break;
		case 'opacity':
			$(e).css({
				opacity:0,
				filter:'alpha(opacity=0)',
				MozOpacity:0
			});
			$(e).animate({
				opacity:1,
				filter:'alpha(opacity=100)',
				MozOpacity:1
			},100,function(){
				if(fn)
					fn();	
			});
			break;
	}
}
WM.hide = function(e,type,fn){
	e = e.length>0?e[0]:e;
	var len;
	switch(type){
		case 'left':
			len = e.offsetLeft;
			$(e).animate({
				opacity:0,
				filter:'alpha(opacity=0)',
				MozOpacity:0,
				left:len+10
			},100,function(){
				if(fn)
					fn();	
			});	
			break;
		case 'top':
			len = e.offsetTop;
			$(e).animate({
				opacity:0,
				filter:'alpha(opacity=0)',
				MozOpacity:0,
				top:len-10
			},100,function(){
				if(fn)
					fn();	
			});	
			break;
		case 'opacity':
			$(e).animate({
				opacity:0,
				filter:'alpha(opacity=0)',
				MozOpacity:0		
			},100,function(){
				if(fn)
					fn();	
			});
			break;
	}
}

WM.setIframe = function(id){
	var fn = function(){
		try{
			var iframe = typeof id=='string'?document.getElementById(id):id;
			var height = iframe.contentWindow.document.body.scrollHeight;
			iframe.height = height;
		}catch (ex){};		
	}
	setInterval(fn,200);
}

WM.setIframeHeight = function(id){
	try{
		var iframe = typeof id=='string'?document.getElementById(id):id;
		var height = iframe.contentWindow.document.body.scrollHeight;
		iframe.height = height;
	}catch (ex){};		
}

//WM_checkBox
WM.checkBox = function(data){
	this.box = $('#'+data.id);
	this.multiple = data.multiple==null?false:data.multiple;
	this.notNull = data.notNull==null?false:data.notNull;
	this.check = typeof data.check=='number'?[data.check]:(data.check==null?0:data.check);
	this.init(data);
	this.set();
	if(data.fire!=null&&data.fire!=''&&data.fire!='null')
		this.fire(data.fire);
	if(data.fireArray!=null&&data.fireArray.length>0)
		this.fireArray(data.fireArray);
}

WM.checkBox.prototype = {
	init:function(data){
		this.id = WM.getId();
		var html = '<div class="WM_checkBox WM_all" id="'+this.id+'">';
		for(var i=0;i<data.group.length;i++){
			html += '<span class="WM_check_span">';
			html += '<a index="'+i+'" class="WM_check WM_check_noUse"></a>';
			html += '<span class="WM_check_txt">'+data.group[i]+'</span>';
			html += '</span>';	
		}
		html += '</div>';
		$(html).appendTo($(this.box));
		var self = this;
		$('#'+this.id).find('.WM_check_span').click(function(){
			if($(this).find('a').hasClass('WM_check_use')){
				if(self.getCheck().length<=1){
					if(!self.notNull){
						$(this).find('a').removeClass('WM_check_use').addClass('WM_check_noUse');
						if(data.onChange) data.onChange.call(self);		
					}
				}else{
					$(this).find('a').removeClass('WM_check_use').addClass('WM_check_noUse');
					if(data.onChange) data.onChange.call(self);	
				}
			}else{
				if(self.getCheck().length==0||self.multiple){
					$(this).find('a').removeClass('WM_check_noUse').addClass('WM_check_use');
					if(data.onChange) data.onChange.call(self);	
				}
				else if(self.getCheck().length>0&&!self.multiple){
					$('#'+self.id).find('.WM_check').removeClass('WM_check_use').addClass('WM_check_noUse');
					$(this).find('a').addClass('WM_check_use');
					if(data.onChange) data.onChange.call(self);	
				}
			}
							
		});
	},
	hasCheck:function(){
		return 	$('#'+this.id).find('.WM_check .WM_check_use').length>0?true:false;
	},
	getCheck:function(){
		var arr = $('#'+this.id).find('.WM_check');
		var newArr = [];
		for(var i=0;i<arr.length;i++){
			if($(arr[i]).hasClass('WM_check_use'))	
				newArr.push(i);
		}
		return newArr;
	},
	set:function(){
		var arr = $('#'+this.id).find('.WM_check');	
		for(var i=0;i<this.check.length;i++){
			$($('#'+this.id).find('.WM_check')[this.check[i]]).removeClass('WM_check_noUse').addClass('WM_check_use');
		}
	},
	cancel:function(index){
		try{
			var e = $('#'+this.id).find('.WM_check_span')[index];
			if($(e).find('a').hasClass('WM_check_use'))
				$(e).click();
		}catch(ex){}	
	},
	fire:function(index){
		try{
			var e = $('#'+this.id).find('.WM_check_span')[index];
			if(!$(e).find('a').hasClass('WM_check_use'))
				$(e).click();
		}catch(ex){}
	},
	fireArray:function(arr){
		for(var x=0;x<arr.length;x++)
			this.fire(arr[x])		
	},
	setCheck:function(index){
		$('#'+this.id).find('.WM_check_span').find('a').removeClass('WM_check_use');
		var arr = WM.getType(index)=='Array'?index:[index];
		for(var x=0;x<arr.length;x++)
			$($('#'+this.id).find('.WM_check_span')[arr[x]]).find('a').addClass('WM_check_use');	
	}
}
WM.select = function(data){
	data.options = data.options||[];
	this.data = data;
	this.able = true;
	this.init = function(){
		this.create();
		this.createOptions();
		this.set();	
	}
	this.init();
}
WM.select.prototype = {
	create:function(){
		var data = this.data;
		this.id = WM.getId();
		data.title = data.title==null?'请选择':data.title;
		data.title = '<span>'+data.title+'</span>';
		var html = '<a class="WM_select WM_all" tabIndex="1" id="'+this.id+'">';
		
		html += '<div class="WM_select_head">';
		html += '<span class="WM_select_headLeft">'+data.title+'</span>';
		html += '<span class="WM_select_headRight"><span></span></span>';
		html += '</div>';
		
		html += '</a>';
		if(data.div)
			$(html).appendTo($(data.div))
		else
			$(html).appendTo($('#'+data.box));

		this.index = null;
		this.isLock = false;
		this.onChange = data.onChange||null;
		$('#'+this.id).find('.WM_select_main').css({height:30*data.options.length});
		data.max = data.max==null?6:data.max;
	},
	createOptions:function(){
		var data = this.data;
		if(data.options.length==0)
			return;
		var html = '<div class="WM_select_main">';
		html += '<div class="WM_select_detail">';
		for(var i=0;i<data.options.length;i++){
			var cln = (i+1)%2==0?'ac_odd':'';
			if(i==data.options.length-1)
				html += '<div class="WM_select_one '+cln+'" style="border-bottom:0">';
			else
				html += '<div class="WM_select_one '+cln+'"">';
			if(typeof data.options[i]=='object'&&data.options[i].length>1){
				html += '<span class="WM_select_one_title">'+data.options[i][0]+'</span>';	
				html += '<span class="WM_select_one_span">'+data.options[i][1]+'</span>';
			}else
				html += '<span class="WM_select_one_span">'+data.options[i]+'</span>';
			html += '</div>';	
		}
		html += '</div>';
		html += '</div>';
		$(html).appendTo('#'+this.id);
		if(data.attr!=null){
			var list = $('#'+this.id).find('.WM_select_one');
			for(var x in data.attr){
				for(y=0;y<list.length;y++)
					list[y].setAttribute(x+'',data.attr[x][y]);
			}
		}
	},
	set:function(){
		var data = this.data;
		if(data.index!=null&&data.options.length>0){
			this.index = data.index;
			this.setIndex(data.index);	
		}
		if(data.width!=null){
			$('#'+this.id).find('.WM_select_headLeft').css({width:data.width-44});
			$('#'+this.id).find('.WM_select_head').css({width:data.width});
			$('#'+this.id).find('.WM_select_main').css({width:data.width});	
		}
		if(data.options.length>0)
			$('#'+this.id).find('.WM_select_main').css({height:data.options.length*(35-1)});
		if(data.options.length>data.max)
			$('#'+this.id).find('.WM_select_main').css({height:data.max*35});	
		if(data.options.length==0){
			this.lock(true);
			return;
		}
		var isShow = false;
		var self = this;
		var isOut = false;
		$('#'+this.id).mouseleave(function(){
			isOut = true;	
			//$('#'+this.id).find('.WM_select_head').css({borderBottom:'solid 1px #ebe4e4'});
			//$('#'+this.id).find('.WM_select_head').css({borderColor:'#ebe4e4'});
		});
		$('#'+this.id).mouseenter(function(){
			isOut = false;
			//$('#'+this.id).find('.WM_select_head').css({borderBottom:'solid 1px #fff'});
			//$('#'+this.id).find('.WM_select_head').css({borderColor:'#666'});
		});
		$(document).bind('click',function(){
			if(isShow&&isOut){	
				self.hide();
				isShow = false;		
			}
		});
		$('#'+this.id).find('.WM_select_head').click(function(){
			if(!isShow){
				self.show();
				isShow = true;
			}else{
				self.hide();
				isShow = false;
			}
		});	
		$('#'+this.id).find('.WM_select_one').click(function(){
			if(self.index!=$(this).index()){
				self.setIndex($(this).index());
				if(self.onChange)
					self.onChange($(this).index());
			}else
				self.setIndex($(this).index());
			self.hide();
			isShow = false;			
		}).bind('mouseover',function(){
			$(this.parentNode).find('.WM_select_one').removeClass('hover');
		});
	},
	show:function(){
		$('#'+this.id).find('.WM_select_head').addClass('WM_select_open');
		$('#'+this.id).find('.WM_select_main').show();
		this.rotate(180);
	},
	hide:function(){
		$('#'+this.id).find('.WM_select_head').removeClass('WM_select_open');
		$('#'+this.id).find('.WM_select_main').hide();
		//$('#'+this.id).find('.WM_select_main').slideUp('fast');
		this.rotate(0);	
	},
	rotate:function(end){
		var e = $('#'+this.id).find('.WM_select_headRight span')[0];
		if(e.deg!=null&&e.deg==end)
			return clearInterval(this.interval);	
		var dir,index = 0;
		if(e.deg==null)
			e.deg = 0;
		if(e.deg>end)
			dir = -10;
		else if(e.deg<end)
			dir = 10;
			
		clearInterval(this.interval);
		var self = this;
		this.interval = setInterval(function(){
			e.deg = e.deg+dir;
			with(e.style){
				transform = 
				MsTransform =		
				WebkitTransform =	
				Otransform =		
				MozTransform = 'rotate('+e.deg+'deg)';		
			}	
			if(e.deg==end)
				clearInterval(self.interval);
		},10);	
	},
	setVal:function(val){
		var arr = $('#'+this.id).find('.WM_select_one_span');
		for(var x=0;x<arr.length;x++){
			if($(arr[x]).html()==val)
				$(arr[x].parentNode).click();	
		}	
	},
	setValue:function(val){
		$('#'+this.id).find('.WM_select_headLeft').html(val);	
	},
	setN:function(index){
		$($('#'+this.id).find('.WM_select_one')[index]).click();
	},
	getValue:function(){
		if(this.index!=null&&$('#'+this.id).find('.WM_select_one')[this.index])
			return $($('#'+this.id).find('.WM_select_one')[this.index]).find('.WM_select_one_span').html();
		return null;
	},
	setIndex:function(index){
		if($('#'+this.id).find('.WM_select_one')[index]==null)
			return;
		this.index = index;
		var t = $('#'+this.id).find('.WM_select_one')[this.index];
		var val = $(t).find('.WM_select_one_span').html();
		this.setValue(val);
		$('#'+this.id).find('.WM_select_one').removeClass('WM_select_use');
		$(t).addClass('WM_select_use hover');		
	},
	getIndex:function(){
		return this.index;	
	},
	getObj:function(){
		var obj = $('#'+this.id).find('.WM_select_one.WM_select_use');
		return obj.length>0?obj[0]:null;	
	},
	lock:function(bool){
		if(bool){
			this.isLock = true;
			$('#'+this.id).addClass('disabled');		
		}else{
			this.isLock = false;
			$('#'+this.id).removeClass('disabled');
			this.set();	
		}
	},
	clear:function(){
		$('#'+this.id).remove();
	},
	reset:function(options){
		this.data.options = options||[];
		this.clear();
		this.init();		
	},
	addOption:function(){
			
	},
	removeOption:function(){
		
	}
}


/*分页*/
WM.page = function(boxId,nowPage,pageCount,pageNum,count){
	if(document.getElementById(boxId)==null)
		return $('#'+boxId).remove(),null;
	if(nowPage==''||pageCount==''||parseInt(nowPage)<=1&&parseInt(pageCount)<=1)
		return $('#'+boxId).remove(),{};
	this.nowPage = nowPage==null||nowPage==''?1:parseInt(nowPage);
	this.pageCount = pageCount==null?1:parseInt(pageCount);
	//if(this.count<=0)
		//return;
	if(this.pageCount<this.nowPage){
		this.nowPage = this.pageCount;		
	}
	this.boxId = boxId;
	this.point = '<div class="WM_page_point">&nbsp;&nbsp;...&nbsp;&nbsp;</div>';
	this.pageNum = pageNum||10;
	this.count = count||0;
	this.start = (this.pageNum*this.nowPage)-1;
	this.init(boxId);
}
WM.page.prototype.del = function(){
	this.start++;
	this.count--;
	if(this.addRow)
		this.addRow(this.start);
	this.pageCount = Math.ceil(this.count/this.pageNum);
	this.clear();
	this.reset();
}
WM.page.prototype.init = function(boxId){
	var html = '<div class="WM_page">';
	//html += '<div class="WM_changePage" type="prev">上一页</div>';
	//html += '<div class="WM_changePage" type="first">首页</div>';
	html += this.createPage();
	//html += '<div class="WM_changePage" type="end">尾页</div>';
	var name = 'WM_changePage';
	if(this.nowPage==this.pageCount)
		name = 'WM_noNext';
	html += '<a class="'+name+'" type="next">下一页</a>';
	html += '<div style="clear:both"></div></div>'
	$(html).appendTo($('#'+boxId));
	var self = this;
	$('#'+boxId).find('.WM_onePage').click(function(){
		if(!$(this).hasClass('WM_nowPage')){
			if(self.onChange){
				self.onChange(parseInt($(this).attr('index')));
			}
		}
	});
	
	$('#'+boxId).find('.WM_changePage').click(function(){
		if(self.nowPage==self.pageCount)											   			return;
		var num = self.nowPage;
		/*
		if($(this).attr('type')=='prev')
			num--;
		else if($(this).attr('type')=='next')
			num++;		
		else if($(this).attr('type')=='first')
			num = 1;		
		else if($(this).attr('type')=='end')
			num = self.count;
		*/
		num++;
		num = num<1?1:num;
		num = num>self.pageCount?self.pageCount:num;
		if(self.onChange){
			self.onChange(num);
		}
	});
}
WM.page.prototype.createPage = function(){
	var html = '';
	if(this.pageCount<=5){
		for(var i=1;i<=this.pageCount;i++){
			var name = 'WM_onePage';
			if(i==this.nowPage)
				name += ' WM_nowPage';
			html += '<a class="'+name+'" index="'+i+'">'+i+'</a>';
		}
	}else{
		for(var i=this.nowPage-2;i<=this.nowPage+2;i++){
			if(i>=1&&i<=this.pageCount){
				var name = 'WM_onePage';
				if(i==this.nowPage)
					name += ' WM_nowPage';
				html += '<a class="'+name+'" index="'+i+'">'+i+'</a>';	
			}
		}
		if(this.nowPage-2>1){
			var str = '<a class="WM_onePage" index="1">1</a>';
			if(this.nowPage-2>2)
				str += this.point;
			html = str + html;
		}
		if(this.nowPage+2<this.pageCount){
			var str = '<a class="WM_onePage" index="'+this.pageCount+'">'+this.pageCount+'</a>';
			if(this.nowPage+3<this.pageCount)
				str = this.point + str;
			html = html+str;
		}
	}
	return html;
}
WM.page.prototype.change = function(x){
	if(this.onChange)
		this.onChange(x);
}
WM.page.prototype.reset = function(){
	this.init(this.boxId);
}
WM.page.prototype.clear = function(){
	$('#'+this.boxId).html('');
}

WM.newTab = function(data){
	data.index = data.index==null?0:data.index;
	data.small = data.small==null?false:data.small;
	this.init(data);
	this.setFn(data);
	if(data.fire!=null&&data.fire!=''&&data.fire!='null')
		this.fire(data.fire);		
}
WM.newTab.prototype = {
	init:function(data){
		this.box = data.box;
		var border = data.hasBorder==null?false:data.hasBorder;
		this.id = WM.getId();
		var html = '<div class="WM_all WM_newTab" id="'+this.id+'">';
		if(data.weixin)
			html = '<div class="WM_all WM_newTab WX" id="'+this.id+'">';
		var name = 'WM_newTabOne';
		if(data.weixin){
			html += '<div class="WM_newTabBox WX">';
			name = 'WM_newTabOne WX';	
		}else{
			if(data.small)
				html += '<div class="WM_newTabBox hasBorder">',name = 'WM_newTabOne small';
			else
				html += '<div class="WM_newTabBox">';
		}
		for(var i=0;i<data.options.length;i++){
			if(i==data.options.length-1)
				if(data.small)
					html += '<a class="'+name+'">'+data.options[i].name+'</a>';
				else
					html += '<a class="'+name+'" style="margin-right:0; border-right:solid 0px #ddd">'+data.options[i].name+'</a>';			
			else	
				html += '<a class="'+name+'">'+data.options[i].name+'</a>';	
		}
		html += '</div>';
		var sw = data.width!=null?'width:'+data.width+'px':'';
		html += '<div class="WM_newTabDivBox" style="'+sw+'">';
		for(var i=0;i<data.options.length;i++){
			var w = data.options[i].width!=null?'width:'+data.options[i].width+'px':'';
			html += '<div class="WM_newTabDiv" style="display:none;'+w+'"></div>';
		}		
		html += '</div></div>';	
		$(html).appendTo('#'+this.box);
		if(!border)
			$('#'+this.id).find('.WM_newTabDiv').addClass('noborder');
		for(var i=0;i<data.options.length;i++){	
			if(data.options[i].id!=null){
				var e = document.getElementById(data.options[i].id);
				$($(e).html()).appendTo($($('#'+this.id).find('.WM_newTabDiv')[i]));
				$(e).remove();	
			}else if(data.options[i].innerHTML!=null)
				$(data.options[i].innerHTML).appendTo($($('#'+this.id).find('.WM_newTabDiv')[i]));
			else if(data.options[i].iframe){
				var id = WM.getId();
				$('<iframe frameborder="0" id="'+id+'" style="width:100%;" src="'+data.options[i].iframe+'"></iframe>').appendTo($($('#'+this.id).find('.WM_newTabDiv')[i]));
				WM.setIframe(id);
			}
		}	
		$($('#'+this.id).find('.WM_newTabOne')[data.index]).addClass('WM_newTabOne_select');
		$($('#'+this.id).find('.WM_newTabDiv')[data.index]).show();
		if(data.ready)
			data.ready.call(this);
	},
	setFn:function(data){
		var self = this;
		$('#'+this.id).find('.WM_newTabOne').click(function(){
			if($(this).hasClass('WM_newTabOne_select'))
				return;
			if(data.onChange)
				data.onChange($(this).index());
			$('#'+self.id).find('.WM_newTabOne').removeClass('WM_newTabOne_select');
			$(this).addClass('WM_newTabOne_select');
			$('#'+self.id).find('.WM_newTabDiv').hide();
			$($('#'+self.id).find('.WM_newTabDiv')[$(this).index()]).show();
		});
	},
	getIframe:function(){
		return 	$('#'+this.id).find('.WM_newTabDiv iframe')[0];
	},
	fire:function(index){
		$($('#'+this.id).find('.WM_newTabOne')[index]).click();
	},
	tab:function(x,src){
		$('#'+this.id).find('.WM_newTabOne').removeClass('WM_newTabOne_select');
		$(this).addClass('WM_newTabOne_select');
		if(src)
			$(this.getIframe()).attr({src:src});
		$($('#'+this.id).find('.WM_newTabOne')[x]).addClass('WM_newTabOne_select');	
	},
	getIndex:function(){
		return $('#'+this.id).find('.WM_newTabOne.WM_newTabOne_select').index();
	}
}

WM.tabIframe = function(data){
	data.index = data.index==null?0:data.index;
	data.small = data.small==null?false:data.small;
	this.init(data);
	this.setFn(data);
	if(data.tab!=null&&data.tab!=''&&data.tab!='null')
		this.tab(data.tab);	
}
WM.tabIframe.prototype.init = function(data){
	this.iframeList = [];
	this.box = data.box;
	var border = data.hasBorder==null?false:data.hasBorder;
	this.id = WM.getId();
	var html = '<div class="WM_all WM_newTab" id="'+this.id+'">';
	html += '<div class="WM_newTabBox">';
	var name = 'WM_newTabOne';
	for(var i=0;i<data.options.length;i++){
		this.iframeList.push(data.options[i].src);
		html += '<a class="'+name+'">'+data.options[i].name+'</a>';			
	}
	html += '</div>';
	if(this.iframeList.length==0)
		return;
	var sw = data.width!=null?'width:'+data.width+'px':'';
	html += '<div class="WM_newTabDivBox" style="'+sw+'">';

	html += '<div class="WM_newTabDiv" style="display:none;">';
	html += '<iframe style="width:100%;" frameborder="0" src="'+this.iframeList[data.index]+'"></iframe>';
	html += '</div>';
	
	html += '</div></div>';	
	$(html).appendTo('#'+this.box);
	if(!border)
		$('#'+this.id).find('.WM_newTabDiv').addClass('noborder');
	$('#'+this.id).find('.WM_newTabDiv').show();
	$($('#'+this.id).find('.WM_newTabOne')[data.index]).addClass('WM_newTabOne_select');		
	var iframe = this.getIframe();
	$(iframe).bind('load',function(){
		this.height = 0;
		try{
			window.top.resetHeight();
		}catch(ex){}	
	});	
}
WM.tabIframe.prototype.setFn = function(data){
	var self = this;
	$('#'+this.id).find('.WM_newTabOne').click(function(){
		if($(this).hasClass('WM_newTabOne_select'))
			return;
		if(data.onChange)
			data.onChange($(this).index());
		$('#'+self.id).find('.WM_newTabOne').removeClass('WM_newTabOne_select');
		$(this).addClass('WM_newTabOne_select');
		$('#'+self.id).find('.WM_newTabDiv iframe').attr({src:self.iframeList[$(this).index()]});
		//$($('#'+self.id).find('.WM_newTabDiv')[$(this).index()]).show();
	});	
}
WM.tabIframe.prototype.getIframe = function(){
	return 	$('#'+this.id).find('.WM_newTabDiv iframe')[0];
}
WM.tabIframe.prototype.fire = function(x){
	$($('#'+this.id).find('.WM_newTabOne')[x]).click();		
}
WM.tabIframe.prototype.tab = function(x,src){
	$('#'+this.id).find('.WM_newTabOne').removeClass('WM_newTabOne_select');
	$(this).addClass('WM_newTabOne_select');
	$('#'+this.id).find('.WM_newTabDiv iframe').attr({src:src||this.iframeList[x]});
	$($('#'+this.id).find('.WM_newTabOne')[x]).addClass('WM_newTabOne_select');	
}


WM.setVal = function(a,b,c){
	c = c!=null?c:null;
	return a!=c?a:b;	
}
WM.bindEnter = function(e,btn){
	if(e==null||btn==null)
		return;
	var arr = (e.length!=null&&e.length>0)?e:[e];
	for(var x=0;x<arr.length;x++){
		$(arr[x]).bind('keydown',function(ev){
			if(ev.keyCode==13){
				$(btn).click();
			}
		});		
	}	
}
//弹窗主函数
var box = function(data){
	WM.extend(this,{
		init:function(){
			this.canClose = true;
			this.click = WM.setVal(data.click,function(){});
			this.ready = WM.setVal(data.ready,function(){});
			this.onload = WM.setVal(data.onload,function(){});
			this.showType = WM.setVal(data.showType,'top');
			this.create(data);
			this.set();		
		},
		create:function(data){
			this.id = WM.getId();
			this.coverId = 'cover'+this.id;
			var cover = '<div class="WM_cover" id="'+this.coverId+'"></div>';
			var notH5 = 'border:solid 1px #bbbbbb;'
			if(window.applicationCache)
				notH5 = '';
			var html = '<div class="WM_all WM_box '+(data.className||'')+'" id="'+this.id+'" style="'+notH5+'">';
			if(data.headHide==null||!data.headHide){
				html += '<div class="WM_box_head">';
				html += '<span>'+(data.title||'WM')+'</span>';
				if(data.closeHide==null&&!data.closeHide)
					html += '<a class="WM_box_close" title="关闭">&times;</a>';
				html += '</div>';
			}	
			html += '<div class="WM_box_main" style="border-radius:10px;">';
			html += data.innerHTML;
			html += '</div>';
			if(data.btnHide==null||!data.btnHide){
				html += '<div class="WM_box_foot">';
				var bt = ['取消','确定'];
				if(data.btnText!=null)
					bt = data.btnText;
				html += '<a class="WM_button WM_button_n" style="margin-right:5px">'+bt[0]+'</a><a class="WM_button WM_button_y">'+bt[1]+'</a>';
				html += '</div>';
			}	
			html += '</div>';
			if(data.coverHide==null||!data.coverHide)
				$(cover).appendTo($('body'));
			$(html).appendTo($('body'));
			var self = this;
			setTimeout(function(){
				if(self.onCreate)
					self.onCreate();		
			},0);
			if(data.style)
				$('#'+this.id).css(data.style);
			WM.moveToCenter($('#'+this.id));
			this.ready();
			WM.show($('#'+this.id),this.showType,function(){
				self.onload();		
			});		
		},
		close:function(){
			if(!this.canClose)
				return;
			var self = this;
			if($('#'+self.id).length>0){
				WM.hide($('#'+this.id),this.showType,function(){
					$('#'+self.id).remove();
					$('#'+self.coverId).remove();		
				});	
			}	
		},
		set:function(){
			var self = this;
			if($('#'+this.id).find('.WM_box_foot .WM_button').length>0){
				$('#'+this.id).find('.WM_box_foot .WM_button')[0].onclick = function(){
					if(self.click)
						self.click(false,this);	
				}
				if($('#'+this.id).find('.WM_box_foot .WM_button')[1]!=null){
					$('#'+this.id).find('.WM_box_foot .WM_button')[1].onclick = function(){
						if(self.click)
							self.click(true,this);	
					}
				}
			}
			if($('#'+this.id).find('.WM_box_head .WM_box_close').length>0){
				$('#'+this.id).find('.WM_box_head .WM_box_close')[0].onclick = function(){
					if(self.click)
						self.click(false,this);		
				}
			}
			/*
			$('#'+this.id).find('.WM_box_foot .WM_button').click(function(e){
				var b = true;
				if($(e.target).hasClass('WM_button_n'))
					b = false;	
				if(self.click)
					self.click(b,e.target);		
			});
			$('#'+this.id).find('.WM_box_head .WM_box_close').click(function(e){
				if(self.click)
					self.click(false);		
			});
			*/
		},
		lock:function(b){
			this.canClose = !b;	
		},
		find:function(code){
			if(code)
				return $('#'+this.id).find('.WM_box_main').find(code);
			return $('#'+this.id).find('.WM_box_main');
		},
		getHead:function(code){
			if(code)
				return $('#'+this.id).find('.WM_box_head').find(code);
			return $('#'+this.id).find('.WM_box_head');
		},
		getFoot:function(code){
			if(code)
				return $('#'+this.id).find('.WM_box_foot').find(code);	
			return $('#'+this.id).find('.WM_box_foot');
		},
		getButton:function(){
			return $('#'+this.id).find('.WM_box_foot .WM_button');	
		},
		getBox:function(code){
			if(code)
				return $('#'+this.id).find(code);
			return $('#'+this.id);
		},
		refresh:function(){
			WM.moveToCenter($('#'+this.id));	
		}
	});
}

//弹窗
WM.window = function(data){
	box.call(this,data);
	this.init();		
}
//确认框
WM.confirm = function(data){
	var style = {'width':350};
	var html = '<div style="text-align:center; font-weight:;letter-spacing:1px; padding:20px 0">'+data.innerHTML+'</div>';
	WM.extend(style,data.style);
	WM.extend(data,{
		innerHTML:html,
		headHide:true,
		style:style
	});
	data.ready = function(){
		this.getFoot().css({background:'#ebe4e4','text-align':'center'});	
	}
	box.call(this,data);
	this.init();	
}

WM.alert = function(data){
	var style = {'width':350};
	var html = '<div style="text-align:center; font-weight:; letter-spacing:1px; padding:20px 0">'+data.innerHTML+'</div>';
	WM.extend(style,data.style);
	WM.extend(data,{
		innerHTML:html,
		headHide:true,
		style:style
	});
	data.ready = function(){
		this.getFoot().find('.WM_button_n').remove();
		this.getFoot().css({background:'#f6f6f6','text-align':'center'});	
	}
	box.call(this,data);
	this.init();	
}

//提示消息
WM.showInfo = function(data){
	if($('.WM_showInfo').length>0)
		$('.WM_showInfo').remove();
	var id = WM.getId();
	var html = '<div id="'+id+'" class="WM_showInfo"><div class="WM_showInfo_main">'+data.innerHTML+'</div><span class="WM_showInfo_close" title="关闭">&times;</span></div>';
	$(html).appendTo($('body'));
	WM.moveToCenter($('#'+id)[0]);
	$($('#'+id)[0]).css({top:0});
	this.close = function(){
		$('#'+id).animate({
			opacity:0	
		},200,function(){
			$('#'+id).remove();	
		});	
	}
	var self = this,timeout;
	$('#'+id).find('.WM_showInfo_close').bind('click',function(){
		try{
			clearTimeout(timeout);
			self.close();	
		}catch(ex){}
	})
	timeout = setTimeout(function(){
		self.close();
	},data.delay||3000);
}

//提示
WM.tips = function(data,bool){
	if(bool)
		this.init(data);
	else
		WM.tips.create(data);		
}
WM.extend(WM.tips,{
	all:[],
	create:function(data){
		var e = WM.tips.search(data);
		if(e!=null)
			return e;
		return new WM.tips(data,true);	
	},
	check:function(a,b){
		if(a!=b)
			return false;
		return true;		
	},
	search:function(data){
		for(var i=0;i<this.all.length;i++){
			var e = this.all[i];
			if(e.data.bindElement!=null&&data.bindElement!=null&&e.data.bindElement!=data.bindElement){
				return null;	
			}
			if(e.data.name!=null&&data.name!=null&&e.data.name!=data.name){
				return null;	
			}
			if(this.check(e.data.left,data.left)&&this.check(e.data.top,data.top)&&this.check(e.data.offsetX,data.offsetX)&&this.check(e.data.offsetY,data.offsetY)){
				return e;	
			}
		}
		return null;
	},
	findByName:function(name){
		for(var i=0;i<this.all.length;i++){
			if(name!=null&&this.all[i].data.name!=null&&this.all[i].bindElement==name)
				return this.all[i];
		}
		return null;
	},
	findByElement:function(element){
		for(var i=0;i<this.all.length;i++){
			if(element!=null&&this.all[i].data.bindElement!=null&&this.all[i].data.bindElement==element)
				return this.all[i];
		}
		return null;	
	},
	closeByName:function(name){
		for(var i=0;i<this.all.length;i++){	
			if(this.all[i].data.name==name){
				this.all[i].close();	
				if(i==0)
					this.all.shift();
				else
					this.all.splice(i,1);
				return;
			}	
		}
	},
	closeByElement:function(element){
		for(var i=0;i<this.all.length;i++){	
			if(this.all[i].data.bindElement==element){
				this.all[i].close();	
				if(i==0)
					this.all.shift();
				else
					this.all.splice(i,1);
				return;
			}	
		}	
	},
	close:function(data){
		if(data.name)
			this.closeByName(data.name);
		if(data.element)	
			this.closeByElement(data.element);
	},
	closeAll:function(){
		for(var i=0;i<this.all.length;i++){	
			this.all[i].close();
		}
		this.all = [];
	}
});
WM.tips.prototype = {
	initData:function(data){
		data.type = data.type||'right';
		this.time = data.time||null;
	},
	init:function(data){
		this.initData(data);
		this.id = WM.getId();
		var html = '<div class="WM_tips" id="'+this.id+'">';	
		html += '<div class="WM_tips_cover"></div>';
		html += '<div class="WM_tips_sanjiao WM_tips_sanjiao_'+data.type+'"></div>';
		html += '<div class="WM_tips_main">'+data.innerHTML+'<div>';
		html += '</div>';
		if(data.box)
			$(html).appendTo($(data.box));
		else
			$(html).appendTo($('body'));
		this.set(data);
		this.push(data);
		this.timeOut = null;
		if(data.time!=null&&data.hide==null||!data.hide){
			var self = this;
			this.timeOut = setTimeout(function(){
				self.hide();				
			},data.time);
		}
	},
	set:function(data){
		this.setStyle(data);
		this.bindElement(data);
		this.setPosition(data);
		this.setOffset(data);
		if(data.hide)
			this.hide();		
	},
	bindElement:function(data){
		if(data.bindElement==null)
			return;
		var w = $(data.bindElement).width()+5;
		var h = ($(data.bindElement).height()/2)-8;
		switch(data.type){
			case 'right':
				$('#'+this.id).css({left:$(data.bindElement).offset().left+w,top:$(data.bindElement).offset().top+(h)});
				break;
			case 'bottom':
				$('#'+this.id).css({
					left:$(data.bindElement).offset().left,
					top:$(data.bindElement).offset().top+$(data.bindElement).height()
				});
				break;	
			case 'top':
				$('#'+this.id).css({
					left:$(data.bindElement).offset().left,
					top:$(data.bindElement).offset().top-5-$('#'+this.id).height()
				});
				break;
		}	
	},
	setOffset:function(data){
		if(data.offsetX!=null)
			$('#'+this.id).css({left:$('#'+this.id).offset().left+data.offsetX})
		if(data.offsetY!=null)
			$('#'+this.id).css({top:$('#'+this.id).offset().top+data.offsetY})		
	},
	setPosition:function(data){
		if(data.left!=null)
			$('#'+this.id).css({left:data.left});	
		if(data.top!=null)
			$('#'+this.id).css({top:data.top});	
		if(data.position!=null&&data.position=='fixed'){
			$('#'+this.id).css({position:'fixed',top:$('#'+this.id).offset().top-$(window).scrollTop()});
		}
	},
	setStyle:function(data){
		if(data.style!=null)
			$('#'+this.id).css(data.style);		
	},
	push:function(data){
		this.data = {
			name:data.name,
			bindElement:data.bindElement||null,
			left:data.left,
			top:data.top,
			offsetX:data.offsetX,
			offsetY:data.offsetY
		}
		WM.tips.all.push(this);	
	},
	show:function(val){
		$('#'+this.id).show();
		if(val!=null)
			$('#'+this.id).find('.WM_tips_main').html(val);
		if(this.time!=null){
			clearTimeout(this.timeOut);
			var self = this;
			var d1 = new Date().getTime();
			this.timeOut = setTimeout(function(){
				self.hide();			
			},self.time);
		}		
	},
	hide:function(){
		$('#'+this.id).hide();
		clearTimeout(this.timeOut);	
	},
	close:function(){
		clearTimeout(this.timeOut);
		$('#'+this.id).remove();		
	}
}


WM.imageBox = function(data){
	var html = '<div class="WM_image_box" style="width:540px; height:300px;">';
	html += '<div class="WM_image_box_left" title="左移"><span class="WM_image_leftIcon disabled"></span></div>';
	html += '<div class="WM_image_box_center">';
	html += '<ul class="WM_image_ul" style="width:'+(data.images.length*450)+'px">';
	var imgStr = '';
	for(var x=0;x<data.images.length;x++){
		html += '<li><tt class="WM_image_load"></tt><img class="WM_image_hide" _src="'+data.images[x]+'" /></li>';		
	}
	html += '</ul></div>';
	var _d = data.images.length>1?'':'disabled';
	html += '<div class="WM_image_box_right" title="右移"><span class="WM_image_rightIcon '+_d+'"></span></div>';
	html += '</div>';
	html += '';
	data.innerHTML = html;

	data.title = '图片查看器<span class="WM_image_viewIndex" style="font-weight:normal; margin-left:10px"></span>';
	var style = {'width':600,height:385};
	WM.extend(style,data.style);
	WM.extend(data,{
		btnHide:true,
		style:style
	});
	var loadImage = function(imgList){
		var w = 450,h = 300;
		$(imgList).load(function(){
			if($(this).width()<=w&&$(this).height()<=h){
				$(this).css({marginTop:(h-$(this).height())/2});//$(this).css({marginLeft:(w-$(this).width())/2,marginTop:(h-$(this).height())/2});
			}else{
				if($(this).width()>$(this).height()){
					$(this).addClass('WM_image_aw');
					$(this).css({marginTop:(h-$(this).height())/2});
				}else{
					$(this).addClass('WM_image_ah');	
				}
			}
			
			$(this.parentNode).find('.WM_image_load').remove();
			$(this).removeClass('WM_image_hide');	

		});	
		for(var x=0;x<imgList.length;x++){
			(function(x){
				$(imgList[x]).attr({src:$(imgList[x]).attr('_src')});		
			})(x);	
		}
	}
	this.onCreate = function(){
		var index = 1;
		var imageList = this.find('.WM_image_box_center .WM_image_hide');
		this.getHead('.WM_image_viewIndex').html('1/'+imageList.length);
		loadImage(imageList);
		var self = this;
		var runing = false;
		this.find('.WM_image_box_left span').bind('click',function(){
			if($(this).hasClass('disabled')||runing)
				return;
			runing = true;
			index--;
			self.getHead('.WM_image_viewIndex').html(index+'/'+imageList.length);
			var left = self.find('.WM_image_ul')[0].offsetLeft;
			var len = self.find('.WM_image_ul')[0].offsetWidth;
			if(left==-450)
				$(this).addClass('disabled');
			self.find('.WM_image_box_right span').removeClass('disabled');
			self.find('.WM_image_ul').animate({left:left+450},function(){
				runing = false;	
			});	
		});
		this.find('.WM_image_box_right span').bind('click',function(){
			if($(this).hasClass('disabled')||runing)
				return;
			runing = true;
			index++;
			self.getHead('.WM_image_viewIndex').html(index+'/'+imageList.length);
			var left = self.find('.WM_image_ul')[0].offsetLeft;
			var len = self.find('.WM_image_ul')[0].offsetWidth;
			if(len+left==900)
				$(this).addClass('disabled');
			self.find('.WM_image_box_left span').removeClass('disabled');
			self.find('.WM_image_ul').animate({left:left-450},function(){
				runing = false;	
			});	
		});
	}
	box.call(this,data);
	this.init();	
}


WM.get = function(data){
	if(data.type==null)
		return alert('未指定弹窗类型!');
	switch(data.type){
		case 'tips':
			return WM.tips.create(data);
			break;
		case 'window':
			return new WM.window(data);
			break;
		case 'confirm':
			return new WM.confirm(data);
			break;
		case 'alert':
			return new WM.alert(data);
			break;
		case 'showInfo':
			return new WM.showInfo(data);
			break;
		case 'imageView':
			return new WM.imageBox(data);
	}
}

WM.checkTable = function(){
	if($('.table tr').length==1)
		$('.table').hide();
}
$(function(){
	WM.checkTable();	
});

/*
JS树 初始化数据格式
var dt = [
	{
		text:'华北地区',
		child:[
			{
				text:'四川',
				child:[
					{'text':'成都',attr:{'href':'http://www.baidu.com'}},
					{
						'text':'绵阳',
						child:[
							{text:'小绵羊',attr:{'href':'http://www.baidu.com'}},
							{text:'大绵羊',attr:{'href':'http://www.baidu.com'}}
						]
					},
					{'text':'攀枝花',attr:{'href':'http://www.baidu.com'}}
				]	
			}
		]
	},
	{
		text:'西南地区',
		child:[
			{'text':'成都',attr:{'href':'http://www.baidu.com'}}
		]
	},
	{
		text:'中原地区',
		attr:{'href':'http://www.baidu.com'}	
	}
]
*/

WM.tree = function(data){
	this.init(data);	
}

WM.tree.prototype = {
	init:function(data){
		this.id = WM.getId();
		var html = '<div id="'+this.id+'">';
		html += this.create(data.options,true);
		html += '</div>';
		$(html).appendTo($(data.box));
		this.setClass($('#'+this.id));
		this.setFn();		
	},
	create:function(options,bool){
		var html = '<ul class="WM_tree_box" style="'+(bool?'':'display:none')+'">';
		for(var x=0;x<options.length;x++){
			var hasChild = options[x].child!=null&&options[x].child instanceof Array&&options[x].child.length>0?true:false;
			if(hasChild){
				html += '<li class="WM_tree_row WM_tree_row_hide WM_tree_line">';
				html += '<dd class="WM_tree_row_head WM_tree_close"></dd>';
				html += '<div class="WM_tree_row_text">'+options[x].text+'</div>';	
				html += '<div style="clear:both"></div>';
				html += this.create(options[x].child);
			}
			else{
				html += '<li class="WM_tree_row WM_tree_row_noChild WM_tree_openLine">';
				var attr = '';
				if(options[x].attr!=null){
					for(var k in options[x].attr)
						attr += ' '+k+'='+options[x].attr[k];
				}
				html += '<div class="WM_tree_row_endText"><a '+attr+'>'+options[x].text+'</a></div>';		
			}
			html += '</li>';	
		}
		html += '</ul>';
		return html;
	},
	setFn:function(){
		$('.WM_tree_row').unbind('click');
		$('.WM_tree_row').bind('click',function(ev){
			ev.stopPropagation(); 
			if($(this).hasClass('WM_tree_row_noChild'))
				return;
			if($(this).hasClass('WM_tree_openLine')&&!$(this).hasClass('WM_tree_last'))
				$(this).removeClass('WM_tree_openLine').addClass('WM_tree_closeLine');
			else if($(this).hasClass('WM_tree_closeLine'))
				$(this).removeClass('WM_tree_closeLine').addClass('WM_tree_openLine');
			var e = $(this).find('>.WM_tree_row_head');
			if($(e).hasClass('WM_tree_close')){
				if($(e).hasClass('WM_tree_close3')){
					$(e).removeClass('WM_tree_close').removeClass('WM_tree_close3').addClass('WM_tree_open').addClass('WM_tree_open3');
				}else if($(e).hasClass('WM_tree_close2')){
					$(e).removeClass('WM_tree_close').removeClass('WM_tree_close2').addClass('WM_tree_open').addClass('WM_tree_open2');
				}
			}else if($(e).hasClass('WM_tree_open')){
				if($(e).hasClass('WM_tree_open3')){
					$(e).removeClass('WM_tree_open').removeClass('WM_tree_open3').addClass('WM_tree_close').addClass('WM_tree_close3');
				}else if($(e).hasClass('tree_open2')){
					$(e).removeClass('WM_tree_open').removeClass('WM_tree_open2').addClass('WM_tree_close').addClass('WM_tree_close2');
				}
			}
			if($(this).hasClass('WM_tree_row_hide')){
				$(this).find('>ul').show();	
				$(this).removeClass('WM_tree_row_hide').addClass('WM_tree_row_show');
			}else{
				$(this).find('>ul').hide();	
				$(this).removeClass('WM_tree_row_show').addClass('WM_tree_row_hide');	
			}
		});
	},
	showAll:function(){
		$('#'+this.id).find('ul').show();
		$('#'+this.id).find('.WM_tree_row_hide').removeClass('WM_tree_row_hide').addClass('WM_tree_row_show');
		$('#'+this.id).find('.WM_tree_close3').removeClass('WM_tree_close3').removeClass('WM_tree_close').addClass('WM_tree_open').addClass('WM_tree_open3');
		$('#'+this.id).find('.WM_tree_close2').removeClass('WM_tree_close2').removeClass('WM_tree_close').addClass('WM_tree_open').addClass('WM_tree_open2');
		var a = $('#'+this.id).find('.WM_tree_openLine');
		for(var x=0;x<a.length;x++){
			if(!$(a[x]).hasClass('WM_tree_last')&&!$(a[x]).hasClass('WM_tree_row_noChild'))	
				$(a[x]).removeClass('WM_tree_openLine').addClass('WM_tree_closeLine');
		}
	},
	closeAll:function(){
		$('#'+this.id).find('ul').hide();
		$('#'+this.id).find('>ul').show();
		$('#'+this.id).find('.WM_tree_row_show').addClass('WM_tree_row_hide').removeClass('WM_tree_row_show');
		$('#'+this.id).find('.WM_tree_open3').removeClass('WM_tree_open3').addClass('WM_tree_close').removeClass('WM_tree_open').addClass('WM_tree_close3');
		$('#'+this.id).find('.WM_tree_close2').removeClass('WM_tree_close2').addClass('WM_tree_close').removeClass('WM_tree_open').addClass('WM_tree_open2');
		$('#'+this.id).find('.WM_tree_closeLine').addClass('WM_tree_openLine').removeClass('WM_tree_closeLine');		
	},
	del:function(){
			
	},
	add:function(data){
		var e = $('#'+this.id);
		for(var i=0;i<data.pointLocation.length;i++){
			if(e.find('>ul>li')[data.pointLocation[i]]==null)
				return alert('添加位置错误');
			e = $(e.find('>ul>li')[data.pointLocation[i]]);	
		}
		var html = this.createOption(data.options);
		$(html).insertAfter(e);
		var t = this;

		this.setClass($('#'+this.id));	
		this.setFn();
	},
	getLocation:function(){
			
	},
	getType:function(obj){
		return Object.prototype.toString().call(obj).replace(']','').split(' ')[1].toLowerCase();
	},
	fn:function(dd,bool){
		if(dd.hasClass('WM_tree_close')){
			if(bool)
				dd.removeClass('WM_tree_close2').addClass('WM_tree_close3');
			else
				dd.removeClass('WM_tree_close3').addClass('WM_tree_close2');
		}else{
			if(bool)
				dd.removeClass('WM_tree_open2').addClass('WM_tree_open3');
			else
				dd.removeClass('WM_tree_open3').addClass('WM_tree_open2');
		}	
	},
	setClass:function(e){
		var list = $(e).find('>ul>li');
		var hasChild = list.length>0?true:false;
		if(!hasChild){
			for(var i=0;i<list.length;i++){
				if(i==list.length-1){
					$(list[i]).addClass('WM_tree_last');
				}else{
					$(list[i]).removeClass('WM_tree_last');
				}
			}
			return;
		}
		for(var i=0;i<list.length;i++){
			var child = $(list[i]).find('>ul>li');
			if(child.length>0){
				if(list.length>1){
					if(i!=list.length-1)
						$(list[i]).addClass('WM_tree_openLine').removeClass('WM_tree_last');
					else
						$(list[i]).addClass('WM_tree_openLine').addClass('WM_tree_last');
				}else
					$(list[i]).addClass('WM_tree_openLine').addClass('WM_tree_last');
				if(i==0||list.length==1){
					var dd = $(list[i]).find('>dd');
					
					this.fn(dd,true);
				}else{
					var dd = $(list[i]).find('>dd');
					this.fn(dd,false);
				}
				this.setClass(list[i]);					
			}else{
				if(i==list.length-1)
					$(list[i]).addClass('WM_tree_last');
				else
					$(list[i]).removeClass('WM_tree_last');
			}
		}
	},
	createOption:function(options){
		var html = '';
		for(var x=0;x<options.length;x++){
			html += '<li class="WM_tree_row WM_tree_row_hide WM_tree_line WM_tree_openLine">';
			if(options[x].child!=null&&options[x].child instanceof Array&&options[x].child.length>0){
				html += '<dd class="WM_tree_row_head WM_tree_close"></dd>';	
				html += '<div class="WM_tree_row_text">'+options[x].text+'</div>';	
				html += '<div style="clear:both"></div>';
				html += this.create(options[x].child);
			}
			else{
				var attr = '';
				if(options[x].attr!=null){
					for(var k in options[x].attr)
						attr += ' '+k+'='+options[x].attr[k];
				}
				html += '<div class="WM_tree_row_endText"><a '+attr+'>'+options[x].text+'</a></div>';	
			}
			html += '</li>';
		}	
		return html;
	}
}


window.showInfo = function(error){
	window.top.WM.get({
		type:'showInfo',
		innerHTML:error	
	});
}
WM.setModuleName = function(e){
	var val = $.trim($(e.parentNode).find('span').html());
	window.top.WM.get({
		type:'window',
		title:'设置功能名称',
		innerHTML:'功能名称&nbsp;<span>(不超过8个字符)</span>：<br /><input type="text" class="input" style="width:335px" maxlength="8" placeholder="功能名称(不超过8个字符)" value="'+val+'" />',
		ready:function(){
			var arr = this.find('.input');
			for(var i=0;i<arr.length;i++)
				WM.bindEnter(arr[i],this.getButton()[1]);
			$(arr[0]).focus();	
		},
		click:function(b){
			if(!b)
				return this.close();
			var val = $.trim(this.find('.input').val());
			if(val.length==0)
				return showInfo('功能名称不能为空');
			var self = this;
			WM.setButton(this.getButton()[1],false);
			var id = $(e).attr("id");
			WM.ajax_setModuleName(id,val,function(){
				self.close();
				showInfo('修改成功');	
				$(e.parentNode).find('span').html(val);	
			},function(errorMsg){
				WM.setButton(self.getButton()[1],true);
				showInfo(errorMsg||'修改失败');		
			});
		}
	})	
}

WM.ajax_setModuleName = function(id,val,fn1,fn2){
	$.post("/admin/updatemodulename",{id:id,name:val},function(data){
		if(data.isResultTrue){
			fn1();	
		}else{
			fn2(data.resultMsg);	
		}
	});
}

WM.selectAll = function(){
	var list = $('tr .icon_chose');
	for(var x=0;x<list.length;x++){
		if(!$(list[x]).hasClass('onChose'))	
			return $('.icon_chose').addClass('onChose');
	}
	$('.icon_chose').removeClass('onChose');
}

WM.getQueryString = function(name){
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if(r != null) 
		return decodeURIComponent(r[2]); 
	return null;	
}

WM.forEdit = function(e){
	var obj = $(e.parentNode).find('.WM_forEdit');
	if($(obj).css('display')=='none')
		$(obj).show(),$(e).html('隐藏');	
	else
		$(obj).hide(),$(e).html('编辑');
}

WM.setActive = function(e){
	var type = $(e).attr('type');
	var ActiveId = $(e).attr('ActiveId');
	window.top.WM.get({
		type:'confirm',
		innerHTML:type=='open'?'确定暂停功能?':'确定开启功能?',
		click:function(b){
			if(!b)
				return this.close();
			var t = this;
			WM.setButton(this.getButton()[1],false);
			WM.ajax_setActive(ActiveId,type=='open'?false:true,function(){
				$(e).attr({type:type=='open'?'close':'open'}).html(type=='open'?'开启':'暂停');
				$(e.parentNode).find('span').html(type=='open'?'已暂停':'未暂停').attr({'class':type=='open'?'textRed':'textGreen'});
				t.close();
				showInfo(type=='open'?'功能成功暂停':'功能成功开启');	
			},function(errorMsg){
				WM.setButton(t.getButton()[1],false);
				showInfo(errorMsg||'操作失败');	
			});	
		}
	})	
}

WM.ajax_setActive = function(ActiveId,type,fn1,fn2){
	if(type){
		$.post("/admin/openModule",{id:ActiveId},function (data){
			if(data.isResultTrue){
				fn1();
			}else{
				fn2(data.resultMsg);
			}
		});
	}else{
		$.post("/admin/closeModule",{id:ActiveId},function (data){
			if(data.isResultTrue){
				fn1();
			}else{
				fn2(data.resultMsg);
			}
		});
	}
		
}


WM.titleData = {
	init:function(json){
		var t = this;
		$('body').css({'padding-bottom':'495px'});
		$(json.obj).bind('mouseover',function(){
			var self = this;
			try{
				clearTimeout(this.timeout);	
			}catch(ex){}
			var tid = $(this.parentNode.parentNode).attr('tid');
			var data = json.data[tid];
			var _left = $(this).offset().left+json.left;
			var _top = $(this).offset().top+json.top;
			var dt = ['所在城市&emsp;'+data.city,'酒吧类型&emsp;'+data.type,'申请接入时间&emsp;'+data.sq,'VIP开通时间&emsp;'+data.open,'累计消费&emsp;￥'+data.pay,'VIP到期时间&emsp;'+data.end,'<p>访问总量&emsp;'+data.num+'</p>','<p class="WMtitleBox_row_pwd">密码&emsp;<tt style="display:none">'+data.pwd+'</tt><span style="float:right;cursor:pointer" onclick="WM.titleData.showPwd(this)">显示</span></p>','<p class="WMtitleBox_row_code"><img src="'+data.code+'" /></p>'];
			WM.titleData.show(this,tid,dt,_left,_top,json.sleft);	
		}).bind('mouseleave',function(){
			var tid = $(this.parentNode.parentNode).attr('tid');
			try{
				clearTimeout(this.timeout);	
			}catch(ex){}
			this.timeout = setTimeout(function(){
				WM.titleData.hide(tid);
			},100);
		});		
	},
	showPwd:function(e){
		$(e.parentNode).find('tt').show();
		$(e).hide();
	},
	show:function(e,tid,data,left,top,sleft){
		$('.WMtitleBox').hide();
		if($('.WMtitleBox[tid="'+tid+'"]').length>0){
			var obj = $('.WMtitleBox[tid="'+tid+'"]');
			if(obj.find('.WMtitleBox_row_pwd').length>0){
				var p = obj.find('.WMtitleBox_row_pwd');
				$(p).find('span').show();
				$(p).find('tt').hide();	
			}
			return $('.WMtitleBox[tid="'+tid+'"]').show();
		}
		var html = '<div class="WMtitleBox" tid="'+tid+'" style="left:'+left+'px;top:'+top+'px">';
		for(var x=0;x<data.length;x++){
			html += '<div class="WMtitleBox_row" style="'+(x==data.length-1?'border:0':'')+'">'+data[x]+'</div>';
		}
		html += '<div class="WMtitleBox_sanjiao" style="left:'+sleft+'px"></div>';

		html += '</div>';	
		$(html).appendTo($('body'));
		setTimeout(function(){
			$('.WMtitleBox[tid="'+tid+'"]').bind('mouseover',function(){
				try{
					clearTimeout(e.timeout);	
				}catch(ex){}		
			}).bind('mouseleave',function(){
				try{
					clearTimeout(e.timeout);	
				}catch(ex){}
				e.timeout = setTimeout(function(){
					WM.titleData.hide(tid);
				},100);		
			});	
		},10);	
	},
	hide:function(tid){
		$('.WMtitleBox[tid="'+tid+'"]').hide();	
	}
}

//表情转换
WM.changeFace = function(val,bool){
	if(bool){
		var div = document.createElement('div');
		div.style.display = 'none';
		div.innerHTML = val;
		document.body.appendChild(div);
		var imgs = $(div).find('img');
		for(var i=0;i<imgs.length;i++)
			imgs[i].outerHTML = face.array[parseInt($(imgs[i]).attr('code'))];
		var str = div.innerHTML;
		div.parentNode.removeChild(div);
		return str;
	}else{
		var str = val;
		for(var i=0;i<face.array.length;i++){
			while(str.indexOf(face.array[i])!=-1){
				str = str.replace(face.array[i],'<img src="'+(face.url+(i+1)+'.png')+'" code="'+i+'" />');		
			}
		}
		return str;	
	}	
}

WM.editable = {
	last:null,
	ready:false,
	setBr:function(obj){
		$(obj).bind('keydown',function(e){
			var ev = e || window.event;
			var key = ev.keyCode || ev.charCode;
			var sel, rang, br, fixbr, node, inner, tempRange, offset;
			if(key == 13) {
				if(ev.preventDefault) {
					ev.preventDefault();
				} else {
					ev.returnValue = false;
				}
				if(window.getSelection) {
					br = document.createElement('br');
					sel = window.getSelection();
					rang = sel.rangeCount > 0 ? sel.getRangeAt(0) : null;
					if (rang === null) {
						return false;
					}
					rang.deleteContents();
					node = sel.focusNode;
					inner = false;
					while(node.parentNode != document.documentElement) {//確定focusNode是否在編輯框內
						if(node === this) {
							inner = true;
							break;
						} else {
							node = node.parentNode;
						}
					}
					if (inner) {
						if(WM.Browser.chrome || WM.Browser.safari || WM.Browser.firefox) {//chrome、safari內，尾部換行時多添加一個<br type='_moz'>
							tempRange = rang.cloneRange();
							tempRange.selectNodeContents(this);
							tempRange.setEnd(rang.endContainer, rang.endOffset);
							offset = tempRange.toString().length;						
							if(offset == this.textContent.length && this.querySelectorAll("#edit-div br[type='_moz']").length == 0) {//在行尾且不存在<br type='_moz'>時
								fixbr = br.cloneNode();
								fixbr.setAttribute('type', '_moz');
								rang.insertNode(fixbr);
							}
						}				
						rang.insertNode(br);
					}
					if (document.implementation && document.implementation.hasFeature && document.implementation.hasFeature("Range", "2.0")) {
						tempRange = document.createRange();
						tempRange.selectNodeContents(this);
						tempRange.setStart(rang.endContainer, rang.endOffset);
						tempRange.setEnd(rang.endContainer, rang.endOffset);
						sel.removeAllRanges();
						sel.addRange(tempRange);
					}		
				} else {
					rang = document.selection.createRange();
					if (rang === null) {
						return false;
					}
					rang.collapse(false)
					rang.pasteHTML('<br>'); 
					rang.select();				
				}
			}		
		});
	},
	init:function(id){
		if(this.ready)
			return;
		this.obj = document.getElementById(id);
		$(this.obj).bind('keyup mouseup',function(ev){
			WM.editable.last = WM.editable.getRange();	
			ev = ev||event;
		});
		this.setBr(document.getElementById(id));
		$(this.obj).focus();
		WM.editable.last = WM.editable.getRange();
		this.ready = true;	
	},
	getRange:function(){
		if(WM.Browser.ie)
			return document.selection.createRange();
		else
			return window.getSelection().getRangeAt(0);	
	},
	getSelection:function(){
		if(WM.Browser.ie)
			return document.selection;
		else
			return window.getSelection();
	},
	reset:function(){
		var s = this.getSelection();
		var range = this.getRange();
		$(this.obj).focus();
		if(WM.Browser.ie){
			range.setEndPoint('EndToStart',this.last);
			range.collapse(false);
			range.setEndPoint('EndToEnd',this.last);
			range.select();	
		}else{
			s.removeAllRanges();
			s.addRange(this.last);	
		}	
	},
	insertHtml:function(html){
		this.reset();
		var range = this.getRange();
		if(WM.Browser.ie){
			this.last.pasteHTML(html);
			this.last.collapse(false);
			this.last.select();	
		}else{
			var fragment = range.createContextualFragment(html);
			var lastNode = fragment.lastChild;
			range.insertNode(fragment);
			//插入后把开始和结束位置都放到lastNode后面, 然后添加到selection
			range.setEndAfter(lastNode);
			range.setStartAfter(lastNode);
			var selection = this.getSelection();
			selection.removeAllRanges();
			selection.addRange(range);
			WM.editable.last = WM.editable.getRange();			
		}	
	}
}

WM.print = function(obj,type){
    var counter = 0;
    var modes = { iframe : "iframe", popup : "popup" };
    var defaults = { mode     : modes.iframe,
                     popHt    : 500,
                     popWd    : 400,
                     popX     : 200,
                     popY     : 200,
                     popTitle : '',
                     popClose : false };

    var settings = {};//global settings

    var init = function( options )
        {
            $.extend( settings, defaults, options );

            counter++;
            var idPrefix = "printArea_";
            $( "[id^=" + idPrefix + "]" ).remove();
            var ele = $(obj);

            settings.id = idPrefix + counter;

            var writeDoc;
            var printWindow;

            switch ( settings.mode )
            {
                case modes.iframe :
                    var f = new Iframe();
                    writeDoc = f.doc;
                    printWindow = f.contentWindow || f;
                    break;
                case modes.popup :
                    printWindow = new Popup();
                    writeDoc = printWindow.doc;
            }

            writeDoc.open();
			if(type==0)
				writeDoc.write("<html>" + getHead() + getTable(ele) + "</html>" );
			else
				writeDoc.write("<html>" + getHead() + getBody(ele) + "</html>" );	
            writeDoc.close();

            printWindow.focus();
            printWindow.print();

            if ( settings.mode == modes.popup && settings.popClose )
                printWindow.close();
        }

    function getHead()
    {
        var head = "<head><title>" + settings.popTitle + "</title>";
        $(document).find("link")
            .filter(function(){
                    return $(this).attr("rel").toLowerCase() == "stylesheet";
                })
            .filter(function(){ // this filter contributed by "mindinquiring"
                    var media = $(this).attr("media");
					try{
                    	return (media.toLowerCase() == "" || media.toLowerCase() == "print")
					}catch(ex){return true}
                })
            .each(function(){
                    head += '<link type="text/css" rel="stylesheet" href="' + $(this).attr("href") + '" >';
                });
        head += "</head>";
        return head;
    }

    function getBody( printElement )
    {
        var body = "<body>";
        body += '<div class="' + $(printElement).attr("class") + '">' + $(printElement).html() + '</div>';
        body += "</body>";
        return body;
    }
	var getTable = function(ele){
		var html = '<body>';
		html += '<div style="padding:5px 0">'+$(ele).find('td')[0].innerHTML+'</div>';
		html += $(ele).find('td')[1].innerHTML;	
		html += "</body>";
		return html;	
	}

    function Iframe()
    {
        var frameId = settings.id;

        var iframeStyle = 'border:0;position:absolute;width:0px;height:0px;left:0px;top:0px;';
        var iframe;
//Downloads By http://www.veryhuo.com
        try
        {
            iframe = document.createElement('iframe');
            document.body.appendChild(iframe);
            $(iframe).attr({ style: iframeStyle, id: frameId, src: "" });
            iframe.doc = null;
            iframe.doc = iframe.contentDocument ? iframe.contentDocument : ( iframe.contentWindow ? iframe.contentWindow.document : iframe.document);
        }
        catch( e ) { throw e + ". iframes may not be supported in this browser."; }

        if ( iframe.doc == null ) throw "Cannot find document.";

        return iframe;
    }

    function Popup()
    {
        var windowAttr = "location=yes,statusbar=no,directories=no,menubar=no,titlebar=no,toolbar=no,dependent=no";
        windowAttr += ",width=" + settings.popWd + ",height=" + settings.popHt;
        windowAttr += ",resizable=yes,screenX=" + settings.popX + ",screenY=" + settings.popY + ",personalbar=no,scrollbars=no";

        var newWin = window.open( "", "_blank",  windowAttr );

        newWin.doc = newWin.document;

        return newWin;
    }
	init();	
}

WM.encodeCode = function(val){
	val = val.replace(/"/g, "&quot;");
	val = val.replace(/'/g, "&apos;");
	return val;		
}

WM.decodeCode = function(val){
	val = val.replace(/&quot;/g, '"');
	val = val.replace(/&apos;/g, "'");	
	return val;	
}

WM.showImage = function(src){
	var id = WM.getId();
	var html = '<div class="WM_bigImage" id="'+id+'">';
	var box = '<div class="WM_bigImage_box"><div class="WM_bigImage_cover" id="cover'+id+'" onclick="javascript:$(this.parentNode.parentNode).remove()"></div><i class="WM_bigImage_load"></i><img class="WM_bigImage_show" src="'+src+'" onload="WM.showImage.load(this)" ><span class="WM_bigImage_txt">点击空白处关闭</span></div>';
	html += box + '</div>';
	$(html).appendTo($('body'));
	$('#'+id).fadeIn();
}
WM.showImage.load = function(e){
	$(e.parentNode).find('.WM_bigImage_load').remove();
	$(e).fadeIn();
}



/*
原生对象扩展
*/
Array.prototype.search = function(val){
	for(var i=0;i<this.length;i++){
		if(this[i]==val)
			return true;	
	}
	return false;
}
Array.prototype.add = function(val){
	for(var i=0;i<this.length;i++){
		if(this[i]==val)
			return;
	}
	this.push(val);
}
String.prototype.check = function(type){
	if(type=='phone'){
		return /^\d+$/.test(this);	
		//return /^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/.test(this);	
	}
	else if(type=='email'){
		return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(this);	
	}else if(type=='url'){
		return /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(this);	
	}else if(type=='date'){
		return !/Invalid|NaN/.test(new Date(this));	
	}else if(type=='number'){
		return /^\d+$/.test(this);	
	}
}


var warnedAbout = {};  
jQuery.migrateWarnings = [];  
if ( !jQuery.migrateMute && window.console && window.console.log ) {  
    //window.console.log("JQMIGRATE: Logging is active");  
}  
if ( jQuery.migrateTrace === undefined ) {  
    jQuery.migrateTrace = true;  
}  
jQuery.migrateReset = function() {  
    warnedAbout = {};  
    jQuery.migrateWarnings.length = 0;  
};  
function migrateWarn( msg) {  
    var console = window.console;  
    if ( !warnedAbout[ msg ] ) {  
        warnedAbout[ msg ] = true;  
        jQuery.migrateWarnings.push( msg );  
        if ( console && console.warn && !jQuery.migrateMute ) {  
            //console.warn( "JQMIGRATE: " + msg );  
            if ( jQuery.migrateTrace && console.trace ) {  
                //console.trace();  
            }  
        }  
    }  
}  
function migrateWarnProp( obj, prop, value, msg ) {  
    if ( Object.defineProperty ) {  
        try {  
            Object.defineProperty( obj, prop, {  
                configurable: true,  
                enumerable: true,  
                get: function() {  
                    //migrateWarn( msg );  
                    return value;  
                },  
                set: function( newValue ) {  
                    migrateWarn( msg );  
                    value = newValue;  
                }  
            });  
            return;  
        } catch( err ) {  
            // IE8 is a dope about Object.defineProperty, can't warn there  
        }  
    }  
    jQuery._definePropertyBroken = true;  
    obj[ prop ] = value;  
}  
  
if ( document.compatMode === "BackCompat" ) {  
    migrateWarn( "jQuery is not compatible with Quirks Mode" );  
}  
  
var oldFnData = jQuery.fn.data;  
jQuery.fn.data = function( name ) {  
    var ret, evt,  
        elem = this[0];  
    // Handles 1.7 which has this behavior and 1.8 which doesn't  
    if ( elem && name === "events" && arguments.length === 1 ) {  
        ret = jQuery.data( elem, name );  
        evt = jQuery._data( elem, name );  
        if ( ( ret === undefined || ret === evt ) && evt !== undefined ) {  
            migrateWarn("Use of jQuery.fn.data('events') is deprecated");  
            return evt;  
        }  
    }  
    return oldFnData.apply( this, arguments );  
}; 
})(jQuery);


