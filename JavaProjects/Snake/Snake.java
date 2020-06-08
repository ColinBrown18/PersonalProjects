package snake;
public class Snake {

    public JFrame jframe;

    public Snake() {
        jframe = new JFrame("Snake");
        jframe.setVisible(true);
        jframe.setSize(800, 800);
    }

    public static void main(String[] args) {
        
    }

    class Coordinate {
        int x, y;
    
        Coordinate(int x, int y) {
            this.x = x;
            this.y = y;
        }
    }
}