import discord
from discord.ext import commands

bot = commands.Bot(command_prefix='.')

@bot.event
async def on_ready():
    print('bot is ready')

bot.run('NzI3OTI5OTY0MjE2NzEzMzA3.Xvy_tQ.le85jQCe6YYDGAotphthKsQujNs')