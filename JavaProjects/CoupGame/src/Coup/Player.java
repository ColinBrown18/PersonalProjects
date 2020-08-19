package Coup;

/*
    Player class has Player Identification, Player Name, coins, and results for the winner
*/
public class Player implements Comparable<Player> {
    public Player(int id) {
        this.playerID = id;
    }

    private int playerID;
    private String playerName;
    private int coins;
    private String result;

    public int getPlayerID() {
        return playerID;
    }

    public void setPlayerID(int playerID) {
        this.playerID = playerID;
    }

    public String getPlayerName() {
        return playerName;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public int getCoins() {
        return coins;
    }

    public void setCoins(int coins) {
        this.coins = coins;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + playerID;
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) 
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Player other = (Player) obj;
        if (playerID != other.playerID)
            return false;
        return true;
    }

    @Override
    public int compareTo(Player o) {
        if (this.getCoins() == o.getCoins()) {
            return 0;
        } else if (this.getCoins() > o.getCoins()) {
            return 1;
        } else {
            return -1;
        }
    }
}