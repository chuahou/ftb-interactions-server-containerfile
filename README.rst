#####################################
FTB Interactions Server Containerfile
#####################################

A contrived Containerfile for use with podman
to host a FTB Interactions server.

Due to wanting to expose the entire contents of
the server folder in the volume, this uses the rather
annoying workaround of creating the installation in the
``/install`` folder, and copying the entire contents
to the ``/minecraft`` volume upon start.

Note that it also directly accepts the EULA in
``eula.txt``without prompting.

Building
========

::

	# cd /path/to/this/repo
	# podman build -t ftb-interactions-server-containerfile .

Running
=======

Firstly, create a user (if desired) to run the server
and own the files. ::

	# useradd minecraft

Create the data directory and fix its permissions and
SELinux type. ::

	# mkdir -p /home/minecraft/data
	# chown -R minecraft:minecraft /home/minecraft/data
	# chcon -Rt svirt_sandbox_file_t /home/minecraft/data
	
Lastly, run the built image as a container, changing parameters
as desired. ::

	# podman run -d -it -v /home/minecraft/data:/minecraft:z \
		-e MAX_RAM=8G -e UID=$(id -u minecraft) -e GID=$(id -g minecraft) \
		-p 12345:25565 --name ftbserver -m=8G --cpus=4 \
		localhost/ftb-interactions-server-containerfile
