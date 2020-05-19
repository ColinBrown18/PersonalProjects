import os
import discord
from dotenv import load_dotenv

load_dotenv()
TOEKN = os.getenv('DISCORD_TOKEN')

Client = discord.Client()

@Client.event
async def on_ready():
    print(f' {client.user} has connected to Discord!')

    client.run(TOEKN)