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
