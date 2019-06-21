From: joe at perches.com (Joe Perches)
Date: Fri, 21 Jun 2019 11:33:27 -0700
Subject: [Linux-kernel-mentees] [PATCH 0/3] net: ethernet: atheros:
 atlx: Use PCI generic definitions instead of private duplicates
In-Reply-To: <CAErSpo6iRVWU-yL5CRF_GEY7CWg5iV=Jw0BrdNV4h3Jvh5AuAw@mail.gmail.com>
References: <20190621163921.26188-1-puranjay12@gmail.com>
	<CAErSpo5TMPokae7BMY8ZcOXtW=GeGsWXX_bqS8SrZnh0pEQYxw@mail.gmail.com>
	<698d3e3614ae903ae9582547d64c6a9846629e57.camel@perches.com>
	<CAErSpo6iRVWU-yL5CRF_GEY7CWg5iV=Jw0BrdNV4h3Jvh5AuAw@mail.gmail.com>
Message-ID: <838b8e84523151418ab8cda4abdbb114ce24a497.camel@perches.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Fri, 2019-06-21 at 13:12 -0500, Bjorn Helgaas wrote:
> On Fri, Jun 21, 2019 at 12:27 PM Joe Perches <joe at perches.com> wrote:
[]
> > Subsystem specific local PCI #defines without generic
> > naming is poor style and makes treewide grep and
> > refactoring much more difficult.
> 
> Don't worry, we have the same objectives.  I totally agree that local
> #defines are a bad thing, which is why I proposed this project in the
> first place.

Hi again Bjorn.

I didn't know that was your idea.  Good idea.

> I'm just saying that this is a "first-patch" sort of learning project
> and I think it'll avoid some list spamming and discouragement if we
> can figure out the scope and shake out some of the teething problems
> ahead of time.  I don't want to end up with multiple versions of
> dozens of little 2-3 patch series posted every week or two.

Great, that's sensible.

> I'd rather be able to deal with a whole block of them at one time.

Also very sensible.

> > 2: Show that you compiled the object files and verified
> >    where possible that there are no object file changes.
> 
> Do you have any pointers for the best way to do this?  Is it as simple
> as comparing output of "objdump -d"?

Generically, yes.

I have a little script that does the equivalent of:

<git reset>
make <foo.o>
mv <foo.o> <foo.o>.old
patch -P1 < <foo_patch>
make <foo.o>
mv <foo.o> <foo.o>.new
diff -urN <(objdump -d <foo.o>.old) <(objdump -d <foo.o>.new)

But it's not foolproof as gcc does not guarantee
compilation repeatability.

And some subsystems Makefiles do not allow per-file
compilation.
