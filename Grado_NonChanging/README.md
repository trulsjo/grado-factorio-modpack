# Grado Non-Changing: quality of life

A modpack <!-- deliberate: modpack --> of quality-of-life mods for Factorio 2.1. **It adds no
content:** no new items, buildings or recipes. The mods tune how the game looks and handles,
remember some data of their own in your save, and change your factory only when you ask them to.

It is the base of the Grado modpacks. Every other Grado pack includes it.

## Requirements

- Factorio **2.1**, version 2.1.22 or later.
- Space Age is not required.

## What is in it

**Planning and information**

- **Helmod** (`helmod`): factory planner that works out machines, modules, beacons and power for a
  production target.
- **FNEI** (`FNEI`): recipe browser - what makes an item and what it is used for.
- **Rate Calculator** (`RateCalculator`): select an area and see its production and consumption
  rates.
- **Factory Search** (`FactorySearch`): find items, fluids, buildings and signals anywhere in the
  factory.
- **Resource Monitor** (`dqol-resource-monitor`): finds ore patches as you explore, and tracks how
  much each mined site has left.
- **Tapeline** (`Tapeline`): measures distances, and can leave measurements on the map.
- **Todo List** (`Todo-List`): an in-game todo list, shared in multiplayer.
- **Pipe Visualizer 2.1 Support** (`PipeVisualizer-2-1-Support`): shows fluid networks as an
  overlay.
- **Bottleneck Lite** (`BottleneckLite`): a small status light on each machine, so starved or
  blocked ones stand out.

**Handling**

- **Picker Extended Reborn** (`kry-picker-extended`): the Picker toolkit - planner menu, belt
  reverser, ghost reviver, inventory sort and more.
- **Even Pickier Dollies** (`even-pickier-dollies`): move and rotate buildings in place.
- **Even Distribution** (`even-distribution`): Ctrl-click-drag spreads items evenly across machines.
- **Fill4Me** (`Fill4Me`): fuels and arms buildings from your inventory as you place them.
- **Copy Paste Modules** (`CopyPasteModules`): copy-pasting machine settings brings the modules
  too.
- **Blueprint Tools** (`BlueprintTools`): swap wire colours, set tiles and more on blueprints.
- **VehicleSnap** (`VehicleSnap`): snaps car and tank steering for straight driving.
- **Game Speed Control** (`game-speed-control`): keys to step the game speed up and down. In
  multiplayer only an admin can change it.
- **ixuAutoSave** (`ixuAutoSave`): choose how often the game autosaves and what the saves are
  called.
- **Where Is My Body** (`m_WhereIsMyBody`): lines to your corpses after you die; `Alt` shows or
  hides them.

**Looks**

- **Automatic Train Painter** (`Automatic_Train_Painter`): colours trains by their cargo.
- **Automatic Station Painter** (`automatic-station-painter`): colours stations to match their
  trains.
- **Fluid Wagon Color Mask** (`FluidWagonColorMask`): fluid wagons can be tinted like other rolling
  stock.
- **Disco Science** (`DiscoScience`): labs light up in the colours of the science they are using.
- **Brighter Lamps** (`Brighter-Lamps`): lamps light a wider area.

The pack also installs the libraries these mods need.

## Known issues

- **Some other keys are shared by default.** Most only act in one situation - with a blueprint in
  hand, in a vehicle, with a chest under the cursor - so they may never get in each other's way. If
  a key does not do what you expect, check *Settings → Controls → Mods* for these:

  | Key | Used by |
  |---|---|
  | `Shift+C` | Even Distribution (inventory cleanup), Blueprint Tools (swap wire colours), Picker Extended (copy chest) |
  | `Shift+V` | VehicleSnap (toggle), Picker Extended (paste chest) |
  | `Shift+G` | Blueprint Tools (quick grid), Picker Extended (ghost reviver) |
  | `Shift+T` | Todo List (open), Blueprint Tools (set tiles) |
  | `Ctrl+R` | Fill4Me (reload), Picker Extended (reverse belts) |
  | `Y` | Helmod (recipe explorer), Pipe Visualizer (visualise selected) |

- **Game Speed Control's keys are `Ctrl+-` and `Ctrl+=` on a US keyboard.** Factorio names keys by
  their US position, so on other layouts they are whichever keys sit there - on a Norwegian
  keyboard, `Ctrl` with `+` and `\`.
