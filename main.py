import discord
from discord.ext import commands
from dotenv import dotenv_values
# Replace 'Discord_Bot_Token' with your bot's token
TOKEN = dotenv_values(".env")["Discord_Bot_Token"]

# Intents setup
intents = discord.Intents.default()
intents.message_content = True  # Ensure message content intent is enabled
intents.guilds = True
intents.guild_messages = True

# Create bot instance
bot = commands.Bot(command_prefix="!", intents=intents)

@bot.event
async def on_ready():
    print(f'Logged in as {bot.user}!')

@bot.event
async def on_message(message):
    # Check if the bot was mentioned in the message
    if bot.user in message.mentions:
        await message.reply("Fuck You.")
    
    # Process commands if any
    await bot.process_commands(message)

# Run the bot
bot.run(TOKEN)
