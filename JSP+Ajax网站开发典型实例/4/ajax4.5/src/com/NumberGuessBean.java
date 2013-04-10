package com;
import java.util.*;

public class NumberGuessBean 
{
  private int answer;

  public NumberGuessBean() 
  {
	  reset();
  }
 
  public int getAnswer() 
  {
	  return answer;
  }

  public void setAnswer(int answer) 
  {
	  this.answer = answer;
  }

public String setGuess(String guess) 
{
    int g;
    String value="";
    try {
      g = Integer.parseInt(guess);
    }
    catch (NumberFormatException e) {
      g = -1;
    }
    	
    if (g == answer) 
    {
    	value= new String("你猜对了，数字就是"+this.getAnswer());
    }
    else if (g == -1) 
    {
    	value= new String("请重新输入！");
    }
    else if (g < answer) 
    {
    	value= new String("你猜的数字小了！");
    }
    else if (g > answer) {
    	value= new String("你猜的数字大了！");
    }
    return value;
  }
  
  public void reset() 
  {
     answer = Math.abs(new Random().nextInt() % 100) + 1;
  }
}
