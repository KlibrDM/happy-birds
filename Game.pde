public static class Game{
  public static int lives = 3;
  public static int hits = 0;
  public static boolean controlsLocked = false;
  
  public static void reset(){
    lives = 3;
    hits = 0;
    controlsLocked = false;
  }
}
