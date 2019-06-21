From: bhelgaas@google.com (Bjorn Helgaas)
Date: Fri, 21 Jun 2019 13:12:58 -0500
Subject: [Linux-kernel-mentees] [PATCH 0/3] net: ethernet: atheros:
 atlx: Use PCI generic definitions instead of private duplicates
In-Reply-To: <698d3e3614ae903ae9582547d64c6a9846629e57.camel@perches.com>
References: <20190621163921.26188-1-puranjay12@gmail.com>
	<CAErSpo5TMPokae7BMY8ZcOXtW=GeGsWXX_bqS8SrZnh0pEQYxw@mail.gmail.com>
	<698d3e3614ae903ae9582547d64c6a9846629e57.camel@perches.com>
Message-ID:
 <CAErSpo6iRVWU-yL5CRF_GEY7CWg5iV=Jw0BrdNV4h3Jvh5AuAw@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190621181258.aVKXcbTXx0sNOk10wSkT2YBSmyIpVoajyzcPlc-_Oqs@z>

On Fri, Jun 21, 2019 at 12:27 PM Joe Perches <joe at perches.com> wrote:
>
> (adding the atlx maintainers to cc)
>
> On Fri, 2019-06-21 at 12:11 -0500, Bjorn Helgaas wrote:
> > On Fri, Jun 21, 2019 at 11:39 AM Puranjay Mohan <puranjay12 at gmail.com> wrote:
> > > This patch series removes the private duplicates of PCI definitions in
> > > favour of generic definitions defined in pci_regs.h.
> > >
> > > Puranjay Mohan (3):
> > >   net: ethernet: atheros: atlx: Rename local PCI defines to generic
> > >     names
> > >   net: ethernet: atheros: atlx: Include generic PCI definitions
> > >   net: ethernet: atheros: atlx: Remove unused and private PCI
> > >     definitions
> > >
> > >  drivers/net/ethernet/atheros/atlx/atl2.c | 5 +++--
> > >  drivers/net/ethernet/atheros/atlx/atl2.h | 2 --
> > >  drivers/net/ethernet/atheros/atlx/atlx.h | 1 -
> > >  3 files changed, 3 insertions(+), 5 deletions(-)
> >
> > Let's slow this down a little bit; I'm afraid we're going to overwhelm folks.
>
> I generally disagree.
>
> Consolidation of these sorts of changes are generally
> better done treewide all at once, posted as a series to
> a list and maintainers allowing time (weeks to months)
> for the specific maintainers to accept them and then
> whatever remainder exists reposted and possibly applied
> by an overall maintainer (e.g.: Dave M)
>
> > Before posting more to LKML/netdev, how about we first complete a
> > sweep of all the drivers to see what we're getting into.  It could be
> > that this will end up being more churn than it's worth.
>
> Also doubtful.
>
> Subsystem specific local PCI #defines without generic
> naming is poor style and makes treewide grep and
> refactoring much more difficult.

Don't worry, we have the same objectives.  I totally agree that local
#defines are a bad thing, which is why I proposed this project in the
first place.

I'm just saying that this is a "first-patch" sort of learning project
and I think it'll avoid some list spamming and discouragement if we
can figure out the scope and shake out some of the teething problems
ahead of time.  I don't want to end up with multiple versions of
dozens of little 2-3 patch series posted every week or two.  I'd
rather be able to deal with a whole block of them at one time.

> The atlx maintainers should definitely have been cc'd
> on these patches.
>
> Jay Cliburn <jcliburn at gmail.com> (maintainer:ATLX ETHERNET DRIVERS)
> Chris Snook <chris.snook at gmail.com> (maintainer:ATLX ETHERNET DRIVERS)
>
> Puranjay, can you please do a few things more here:
>
> 1: Make sure you use scripts/get_maintainer.pl to cc the
>    appropriate people.
>
> 2: Show that you compiled the object files and verified
>    where possible that there are no object file changes.

Do you have any pointers for the best way to do this?  Is it as simple
as comparing output of "objdump -d"?

> 3: State that there are no object changes in the proposed
>    commit log.

Thanks for the additional tips.

Bjorn
