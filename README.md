# ESX Pet System

A comprehensive pet system for FiveM servers using the ESX framework. This resource allows players to own, interact with, and manage various pets in the game.

## Features

- Multiple pet types including:
  - Husky
  - Rottweiler
  - Retriever
  - Shepherd
  - Pug
  - Cat
- Pet animations and interactions
- Pet management system
- Item-based pet access
- Customizable pet behaviors
- Support for pet tricks and animations

## Dependencies

- ESX Framework

## Installation

1. Ensure you have the required dependencies installed
2. Place the `esx_petsystem` folder in your server's resources directory
3. Add `ensure esx_petsystem` to your server.cfg
4. Add the relevant items to your database
5. Configure the `config.lua` file to your preferences
6. Restart your server

## Configuration

The system is highly configurable through the `config.lua` file. You can customize:

- Available pet types and their models
- Pet items and their corresponding pets
- Animation sets for different pet types
- Pet behaviors and interactions
- And more!

## Exports

### Client Exports

- `GetPetState(petName)` - Get the current state of a pet
- `GetPetList()` - Get a list of all available pets
- `SpawnPet(petName)` - Spawn a pet
- `DismissPet(petName)` - Dismiss a spawned pet
- `AttackPlayer(petName, targetPlayerId)` - Command pet to attack a player
- `PetSit(petName)` - Command pet to sit
- `PetFollow(petName)` - Command pet to follow

### Pet Items

Players can use pet items to gain access to pets:
- `pet_husky`
- `pet_rottweiler`
- `pet_retriever`
- `pet_shepherd`
- `pet_pug`
- `pet_cat`