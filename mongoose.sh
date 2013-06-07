#! /bin/dash
#
# -----------------------------------------------------------------------------
# mongoose.sh
#
# Gets the Mongoose source, extracts with tar, builds it, and copies the result to $HOME/bin
# -----------------------------------------------------------------------------
# Check if we already have a mongoose executable, abort if we have it
 
[ -x $HOME/bin/mongoose ] && exit
 
# -----------------------------------------------------------------------------
# Check if we already have built a mongoose executable, copy if we have it
 
if [ -x $HOME/tmp/mongoose/mongoose ]; then
    cp  $HOME/tmp/mongoose/mongoose /usr/local/bin/
    exit
fi
 
# -----------------------------------------------------------------------------
# Now set up a mongoose build
#
# Create a directory (no error if it already exists)
 
mkdir -p $HOME/tmp
cd       $HOME/tmp
 
# Check to see if we already have the file, if not, download it
 
[ -f mongoose-3.7.tgz ] || wget http://mongoose.googlecode.com/files/mongoose-3.7.tgz
 
# Extract it...
 
tar xvzf  mongoose-3.7.tgz
 
# Jump down into the source directory and build it...
 
cd $HOME/tmp/mongoose
make linux
 
# Copy the result to $HOME/bin
 
cp  mongoose /usr/local/bin/
chmod 755 /usr/local/bin/mongoose
