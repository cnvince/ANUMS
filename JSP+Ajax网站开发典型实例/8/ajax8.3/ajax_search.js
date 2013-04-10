function createAjaxObj(){
  var httprequest=false;
  if (window.XMLHttpRequest)           //为非IE浏览器生成XmlHttpRequest对象
  { 
    httprequest=new XMLHttpRequest()
    if (httprequest.overrideMimeType)
      httprequest.overrideMimeType('text/xml')
   }
   else if (window.ActiveXObject)      //为IE浏览器生成XmlHttpRequest对象
   { 
     try {
       httprequest=new ActiveXObject("Msxml2.XMLHTTP");
     }
     catch (e){
       try{
          httprequest=new ActiveXObject("Microsoft.XMLHTTP");
       }
       catch (e){}
     }
   }
   return httprequest
}
var searchReq = createAjaxObj();
function searchSuggest() {
	if (searchReq.readyState == 4 || searchReq.readyState == 0) {
		var str = escape(document.getElementById('txtSearch').value);
		searchReq.open("GET", 'search?search=' + str, true);//向服务器端发送请求
		searchReq.onreadystatechange = handleSearchSuggest; //设置回调函数
		searchReq.send(null);
	}		
}
function handleSearchSuggest() {  //这是回调函数，处理从服务器端返回的信息
	if (searchReq.readyState == 4) {
		var ss = document.getElementById('search_suggest')
		ss.innerHTML = '';
		var str = searchReq.responseText.split("\n");
		for(i=0; i < str.length - 1; i++) {
			var suggest = '<div onmouseover="javascript:suggestOver(this);" ';
			suggest += 'onmouseout="javascript:suggestOut(this);" ';
			suggest += 'onclick="javascript:setSearch(this.innerHTML);" ';
			suggest += 'class="suggest_link">' + str[i] + '</div>';
			ss.innerHTML += suggest;
			ss.style.display="block";
		}
	}
}
function suggestOver(div_value) {
	div_value.className = 'suggest_link_over';
}
function suggestOut(div_value) {
	div_value.className = 'suggest_link';
}
function setSearch(value) {
	document.getElementById('txtSearch').value = value;
	document.getElementById('search_suggest').innerHTML = '';
	document.getElementById('search_suggest').style.display="none";
}