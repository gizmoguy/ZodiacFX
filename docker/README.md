# ZodiacFX Docker Build Environment

## Usage

### Building

From the `docker/` directory run the following command to build the Docker
container for building ZodiacFX from source.

```bash
docker build -t zodiacfx/builder .
```

### Running

Once the zodiacfx/builder Docker is built, running it is simple. From the
top-level directory of a checked out copy of the ZodiacFX git repo run this
command:

```bash
docker run --rm -v `pwd`:/dbuilder/sources zodiacfx/builder
```

You will be left with a `build/` directory containing the `ZodiacFX.bin` file
that can then be flashed to the device with OpenOCD or SAM-BA.
