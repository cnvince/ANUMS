function trim(str)   // ��������ʽ��ǰ��ո�        
{      
     
    // �ÿ��ַ��������      
    var t = str.replace(/(^\s*)|(\s*$)/g, "");    
    return t.replace(/(^��*)|(��*$)/g, "");    
} 


function  bytelength(szString)//��ȡ�ַ�������
{
	return szString.replace(new RegExp("[^\x00-\xff]", "g"), "  ").length;
}

function checkPassword(e)//�ж��û�����
{
	var ok = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM_.-";
	for(var i=0; i<e.length; i++)
	{
		if (ok.indexOf(e.charAt(i))<0) 
		{
			return false;
		}
	}
	return true;
}
function   verifyAddress(obj)    
  ����������{    
  ������������var   email=obj;    
  ������������var   pattern=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;    
  ������������flag=pattern.test(email);    
  ������������if(flag)    
  ������������{    
  ��������������return   true;    
  ������������}    
  ������������else    
  ��������������{    
  ����������������return   false;    
  ��������������   }    
  ����������   }     



function CheckPhone85(obj)
{

var MobileStr =obj;
var i,j,strTemp;
strTemp="0123456789";

if(MobileStr.substring(0,2)!="13"&&MobileStr.substring(0,1)!="0")
 {
  alert ('���󣺲�����Ч���ֻ�/С��ͨ/�̶��绰���룡');
  return false;
 }

if (MobileStr.length<11)
 {
  alert ('�����ֻ�/С��ͨ/�̶��绰���볤�Ȳ���С��11��');
  return false;
 }

for (i=0;i<11;i++)
 {
  j=strTemp.indexOf(MobileStr.substring(i, i+1));
  if (j==-1)
   {
    alert ('�����ֻ����벻�ܺ����ַ���');
    return false;
   }
 }
return true;
}
