package Snake;

import java.util.ArrayList;
import java.util.Random;

import java.awt.Toolkit;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.Point;

import javax.swing.JFrame;
import javax.swing.Timer;

public class Snake implements ActionListener{
    public static Snake snake;
    public JFrame jframe;
    public RenderPanel renderPanel;

    public Timer timer = new Timer(20, this);

    // Snake construction
    public ArrayList<Point> snakeBody = new ArrayList<Point>();
    public static final int UP = 0, DOWN = 1, LEFT = 2, RIGHT = 3, SCALE = 10;
    public int ticks = 0, direction = DOWN;
    public Point head, cherry;

    public Random rand;

    public static void main(final String[] args) {
        snake = new Snake();
    }

    // This creates the dimensions of the program
    public Snake() {
        Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
        jframe = new JFrame("Snake");
        jframe.setVisible(true);
        jframe.setSize(800, 700);
        jframe.setLocation(dim.width / 2 - jframe.getWidth() / 2, dim.width 
            / 2 - jframe.getHeight() / 2);
        jframe.add(renderPanel = new RenderPanel());
        jframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        head = new Point(0, 0);
        rand = new Random();
        cherry = new Point(dim.width / SCALE, 0);

        timer.start();
    }

    @Override
    public void actionPerformed(ActionEvent arg0) {
        renderPanel.repaint();
        ticks++;

         
        if (ticks % 10 == 0) {
            if (direction == UP) {
                snakeBody.add(new Point(head.x, head.y - 1));
            } else if (direction == DOWN) {
                snakeBody.add(new Point(head.x, head.y + 1));
            } else if (direction == LEFT) {
                snakeBody.add(new Point(head.x - 1, head.y));
            } else if (direction == RIGHT) {
                snakeBody.add(new Point(head.x + 1, head.y));
            }
            if (cherry != null) {
                if (head.equals(cherry)) {
                    score++;
                    cherry.setLocation(dim.width / SCALE, dim.height / SCALE);
                }
            }
        }
        
    }
}