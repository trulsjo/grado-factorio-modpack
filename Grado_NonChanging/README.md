# Grado Non-Changing: quality of life

A modpack of quality-of-life mods for Factorio 2.0. **It adds no content:** no new items,
buildings or recipes. The mods tune how the game looks and handles, remember some data of their own
in your save, and change your factory only when you ask them to.

It is the base of the Grado modpacks. Every other Grado pack includes it.

## Requirements

- Factorio **2.0**, version 2.0.67 or later.
- Space Age is not required. The pack has loaded cleanly both with and without it on 2.0.77.

## What is in it

**Planning and information**

- **Helmod** (`helmod`): factory planner that works out machines, modules, beacons and power for a
  production target.
- **FNEI** (`FNEI`): recipe browser - what makes an item and what it is used for.
- **Rate Calculator** (`RateCalculator`): select an area and see its production and consumption
  rates.
- **Factory Search** (`FactorySearch`): find items, fluids, buildings and signals anywhere in the
  factory.
- **YARM - Resource Monitor** (`YARM`): tracks mining sites, how much is left and when they run out.
- **Solar Calculator** (`solar-calc`): solar panels and accumulators needed for a given power
  demand.
- **Tapeline** (`Tapeline`): measures distances, and can leave measurements on the map.
- **Todo List** (`Todo-List`): an in-game todo list, shared in multiplayer.
- **Pipe Visualizer 2.0** (`PipeVisualizer-Updated`): shows fluid networks as an overlay.
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
- **Speed Control** (`SpeedControl`): keys and buttons to change game speed.
- **ixuAutoSave** (`ixuAutoSave`): choose how often the game autosaves and what the saves are
  called.
- **Where Is My Body** (`WhereIsMyBody`): a line to your corpse after you die.

**Looks**

- **Automatic Train Painter** (`Automatic_Train_Painter`): colours trains by their cargo.
- **Automatic Station Painter** (`automatic-station-painter`): colours stations to match their
  trains.
- **Fluid Wagon Color Mask** (`FluidWagonColorMask`): fluid wagons can be tinted like other rolling
  stock.
- **Disco Science** (`DiscoScience`): labs light up in the colours of the science they are using.
- **Brighter Lamps** (`Brighter-Lamps`): lamps light a wider area.
- **Clean Floor** (`CleanFloor`): placing floor tiles removes the decoratives under them.

The pack also installs the libraries these mods need.

## Known issues

- **`Alt+Y` is taken by two mods.** YARM's selector and Pipe Visualizer's mouse-over toggle both
  use it by default, and Pipe Visualizer wins. The game's own discharge-defense remote key is
  `Alt+Y` too. To use YARM's selector, rebind it under
  *Settings → Controls → Mods*.
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

- **Speed Control's keys are `-` and `=` on a US keyboard.** Factorio names keys by their US
  position, so on other layouts they are whichever keys sit there - on a Norwegian keyboard, `+`
  and `\`.
