package Snake;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Point;

import javax.swing.JPanel;


@SuppressWarnings("serial")
public class Board extends JPanel {

    public static Color blue = new Color(255);
    
    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        g.setColor(blue);
        g.fillRect(0, 0, 800, 700);
        
        Snake snake = Snake.snake;

        g.setColor(Color.RED);
        // For loop is iterating through an array
        for (Point point : snake.snakeBody) {
            g.fillRect(point.x * snake.SCALE, point.y * snake.SCALE, snake.SCALE, snake.SCALE);
        }
        g.fillRect(snake.head.x * snake.SCALE, snake.head.y * snake.SCALE, snake.SCALE, snake.SCALE);
    }
}

