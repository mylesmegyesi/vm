This is the VM that I use for development. It uses [Vagrant](http://vagrantup.com) and [Veewee](https://github.com/jedi4ever/veewee). Much of the terminology in this readme comes from these projects.

## Installation

### The short version

```bash
git clone git@github.com:mylesmegyesi/vm.git
cd vm
ssh-add ~/.ssh/id_rsa
cp definitions/development-vm/definition.rb.example definitions/development-vm/definition.rb
bundle install
rake install
```

### The details

#### Clone the repo

```bash
git clone git@github.com:mylesmegyesi/vm.git
cd vm
```

#### Add your ssh keys

```bash
ssh-add ~/.ssh/id_rsa
```

#### Define your Base Box

```bash
cp definitions/development-vm/definition.rb.example definitions/development-vm/definition.rb
```

#### Customize the Base Box

All the settings for the Base Box are found in `definitions/development-vm/definition.rb`. These are the defaults:

  * Memory: 8gb - _If you do not have more than 8gb of RAM, decrease this number._
  * Hard Drive: 20gb
  * CPU Count: 4 - _If you do not have 4 cores, decrease this number._

Modify the settings to suit your needs.

#### Install Vagrant

```bash
bundle install
```

#### Install the VM

```bash
rake install
```

## Usage

Every command is a rake task. To see them all, type `rake -T` or checkout the `Rakefile`.

  * `install`: Installs the Base Box and VM for the first time.
  * `reset`: Resets the Base Box and VM.
  * `vm:down`: Gracefully shuts down the VM
  * `vm:kill`: If the VM will not gracefully shutdown for some reason, this will kill it.
  * `vm:open`: Start the VM and SSH into it.

## Gotchas

If your host machine has lost internet and subsequently reconnected, you will have to manually tell you VM to reconnect.

Run this inside the VM.

```bash
sudo dhclient
```
