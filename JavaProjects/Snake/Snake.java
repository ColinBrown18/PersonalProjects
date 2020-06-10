package Snake;

import java.util.ArrayList;
import java.util.Random;

import java.awt.Toolkit;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.Point;
import java.awt.event.KeyListener;
import java.awt.event.KeyEvent;

import javax.swing.JFrame;
import javax.swing.Timer;

public class Snake implements ActionListener, KeyListener {
    public static Snake snake;
    public JFrame jframe;
    public Board board;

    public Timer timer = new Timer(20, this);

    // Snake construction
    public ArrayList<Point> snakeBody = new ArrayList<Point>();
    public static final int UP = 0, DOWN = 1, LEFT = 2, RIGHT = 3, SCALE = 10;
    public int ticks = 0, direction = DOWN, score, tailLength = 10;
    public Point head, cherry;

    public Random rand;

    public boolean over = false;

    Dimension dim;

  

    // This creates the dimensions of the program
    public Snake() {
        dim = Toolkit.getDefaultToolkit().getScreenSize();
        jframe = new JFrame("Snake");
        jframe.setVisible(true);
        jframe.setSize(800, 700);
        jframe.setLocation(dim.width / 2 - jframe.getWidth() / 2, dim.width 
            / 2 - jframe.getHeight() / 2);
        jframe.add(board = new Board());
        jframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        head = new Point(0, 0);
        rand = new Random();
        cherry = new Point(dim.width / SCALE, 0);

        timer.start();

        for (int i = 0; i < tailLength; i++) {
            snakeBody.remove(i);
        }
    }

    @Override
    public void actionPerformed(ActionEvent arg0) {
        board.repaint();
        ticks++;

         
        if (ticks % 10 == 0 && head != null && over != true) {
            // 
            snakeBody.add(new Point(head.x, head.y));
            if (direction == UP) {
                if (head.y - 1 > 0) {
                    head = new Point(head.x, head.y - 1);
                } else {
                    over = true;
                }
            } if (direction == DOWN) {
                if (head.y + 1 < dim.height / SCALE) {
                    head = new Point(head.x, head.y + 1);
                } else {
                    over = true;
                }
            } if (direction == LEFT) {
                if (head.x - 1 > 0) {
                    head = new Point(head.x - 1, head.y);
                } else {
                    over = true;
                }
            } if (direction == RIGHT) {
                if (head.x + 1 < dim.width / SCALE) {
                    head = new Point(head.x + 1, head.y);
                } else {
                    over = true;
                }
            }

            // This removes the snake body from the position it was previously in after it was put in the next position
            // This creates the visual of it moving accross the board.
            for (int i = 0; -i < tailLength; i++) {
                snakeBody.remove(i);
            }
            
            
            if (cherry != null) {
                if (head.equals(cherry)) {
                    score+=10;
                    tailLength++;
                    cherry.setLocation(dim.width / SCALE, dim.height / SCALE);
                }
            }
        }
        
    }
    public static void main(final String[] args) {
        snake = new Snake();
    }

    @Override
    public void keyPressed(KeyEvent e) {
        int i = e.getKeyCode();
        if (i == KeyEvent.VK_A && direction != RIGHT) {
            direction = LEFT;
        }
        if (i == KeyEvent.VK_D && direction != LEFT) {
            direction = RIGHT;
        }
        if (i == KeyEvent.VK_W && direction != DOWN) {
            direction = UP;
        }
        if (i == KeyEvent.VK_S && direction != UP) {
            direction = DOWN;
        }
    }

    @Override
    public void keyReleased(KeyEvent e) {

    }

    @Override
    public void keyTyped(KeyEvent e) {

    }
}