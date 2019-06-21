From: joe at perches.com (Joe Perches)
Date: Fri, 21 Jun 2019 10:27:41 -0700
Subject: [Linux-kernel-mentees] [PATCH 0/3] net: ethernet: atheros:
 atlx: Use PCI generic definitions instead of private duplicates
In-Reply-To: <CAErSpo5TMPokae7BMY8ZcOXtW=GeGsWXX_bqS8SrZnh0pEQYxw@mail.gmail.com>
References: <20190621163921.26188-1-puranjay12@gmail.com>
	<CAErSpo5TMPokae7BMY8ZcOXtW=GeGsWXX_bqS8SrZnh0pEQYxw@mail.gmail.com>
Message-ID: <698d3e3614ae903ae9582547d64c6a9846629e57.camel@perches.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

(adding the atlx maintainers to cc)

On Fri, 2019-06-21 at 12:11 -0500, Bjorn Helgaas wrote:
> On Fri, Jun 21, 2019 at 11:39 AM Puranjay Mohan <puranjay12 at gmail.com> wrote:
> > This patch series removes the private duplicates of PCI definitions in
> > favour of generic definitions defined in pci_regs.h.
> > 
> > Puranjay Mohan (3):
> >   net: ethernet: atheros: atlx: Rename local PCI defines to generic
> >     names
> >   net: ethernet: atheros: atlx: Include generic PCI definitions
> >   net: ethernet: atheros: atlx: Remove unused and private PCI
> >     definitions
> > 
> >  drivers/net/ethernet/atheros/atlx/atl2.c | 5 +++--
> >  drivers/net/ethernet/atheros/atlx/atl2.h | 2 --
> >  drivers/net/ethernet/atheros/atlx/atlx.h | 1 -
> >  3 files changed, 3 insertions(+), 5 deletions(-)
> 
> Let's slow this down a little bit; I'm afraid we're going to overwhelm folks.

I generally disagree.

Consolidation of these sorts of changes are generally
better done treewide all at once, posted as a series to
a list and maintainers allowing time (weeks to months)
for the specific maintainers to accept them and then
whatever remainder exists reposted and possibly applied
by an overall maintainer (e.g.: Dave M)

> Before posting more to LKML/netdev, how about we first complete a
> sweep of all the drivers to see what we're getting into.  It could be
> that this will end up being more churn than it's worth.

Also doubtful.

Subsystem specific local PCI #defines without generic
naming is poor style and makes treewide grep and
refactoring much more difficult.

The atlx maintainers should definitely have been cc'd
on these patches.

Jay Cliburn <jcliburn at gmail.com> (maintainer:ATLX ETHERNET DRIVERS)
Chris Snook <chris.snook at gmail.com> (maintainer:ATLX ETHERNET DRIVERS)

Puranjay, can you please do a few things more here:

1: Make sure you use scripts/get_maintainer.pl to cc the
   appropriate people.

2: Show that you compiled the object files and verified
   where possible that there are no object file changes.

3: State that there are no object changes in the proposed
   commit log.

thanks.
