var isExtended = 0;
var height = 300;
var width = 150;
var slideDuration = 1000;
var opacityDuration = 1500;

function extendContract(){
	if(isExtended == 0){		
		sideBarSlide(0, height, 0, width);		
		sideBarOpacity(0, 1);	
		isExtended = 1;		
		$('sideBarTab').childNodes[0].src = $('sideBarTab').childNodes[0].src.replace(/(\.[^.]+)$/, '-active$1');		
	}
	else{		
		sideBarSlide(height, 0, width, 0);		
		sideBarOpacity(1, 0);		
		isExtended = 0;				
		$('sideBarTab').childNodes[0].src = $('sideBarTab').childNodes[0].src.replace(/-active(\.[^.]+)$/, '$1');
	}
}
function sideBarSlide(fromHeight, toHeight, fromWidth, toWidth){   //设置边栏菜单高度和宽度的变化范围
		var myEffects = new Fx.Styles('sideBarContents', {duration: slideDuration, transition: Fx.Transitions.linear});
		myEffects.custom({
			 'height': [fromHeight, toHeight],
			 'width': [fromWidth, toWidth]
		});
}
function sideBarOpacity(from, to){   //设置边栏菜单的移动范围
		var myEffects = new Fx.Styles('sideBarContents', {duration: opacityDuration, transition: Fx.Transitions.linear});
		myEffects.custom({
			 'opacity': [from, to]
		});
}
function init(){
	$('sideBarTab').addEvent('click', function(){extendContract()});   //为onclick事件绑定一个方法
}
window.addEvent('load', function(){init()});   //为onload事件绑定一个方法