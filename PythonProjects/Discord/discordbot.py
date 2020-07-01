import discord
from discord.ext import commands

bot = commands.Bot(command_prefix='.')

@bot.event
async def on_ready():
    print('bot is ready')

# token must be insterted and removed before commiting to gihub
# if submitted to github, discord will know and change the token
bot.run('')