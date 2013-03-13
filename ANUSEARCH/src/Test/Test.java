package Test;
interface File
{
	void process();
	}
class FileOne implements File{  //文件类型1 
	 @Override
	 public void process() {
	  System.out.println("FileOne文件处理中..."); 
	 }
	}
	class FileTwo implements File{  //文件类型2 
	 @Override
	 public void process() {
	  System.out.println("FileTwo文件处理中..."); 
	 }
	}
	class FileThree implements File{  //文件类型3 
	 @Override
	 public void process() {
	  System.out.println("FileThree文件处理中..."); 
	 }
	}
	class FileAdapter implements File{
		 private File f=null  ;
		 public  FileAdapter(File f){
		  this.f=f ;
		 }
		 @Override
		 public void process() {   
		  f.process() ;
		 } 
		}
	public class Test {
		 public static void process(FileAdapter adapter){
		  adapter.process() ;
		 }
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 Test.process(new FileAdapter(new FileOne()));  //适配器+代理
		  Test.process(new FileAdapter(new FileTwo()));  //适配器+代理
		  Test.process(new FileAdapter(new FileThree()));  //适配器+代理

	}

}
