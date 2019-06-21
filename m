From: bhelgaas at google.com (Bjorn Helgaas)
Date: Fri, 21 Jun 2019 12:11:52 -0500
Subject: [Linux-kernel-mentees] [PATCH 0/3] net: ethernet: atheros:
 atlx: Use PCI generic definitions instead of private duplicates
In-Reply-To: <20190621163921.26188-1-puranjay12@gmail.com>
References: <20190621163921.26188-1-puranjay12@gmail.com>
Message-ID: <CAErSpo5TMPokae7BMY8ZcOXtW=GeGsWXX_bqS8SrZnh0pEQYxw@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Fri, Jun 21, 2019 at 11:39 AM Puranjay Mohan <puranjay12 at gmail.com> wrote:
>
> This patch series removes the private duplicates of PCI definitions in
> favour of generic definitions defined in pci_regs.h.
>
> Puranjay Mohan (3):
>   net: ethernet: atheros: atlx: Rename local PCI defines to generic
>     names
>   net: ethernet: atheros: atlx: Include generic PCI definitions
>   net: ethernet: atheros: atlx: Remove unused and private PCI
>     definitions
>
>  drivers/net/ethernet/atheros/atlx/atl2.c | 5 +++--
>  drivers/net/ethernet/atheros/atlx/atl2.h | 2 --
>  drivers/net/ethernet/atheros/atlx/atlx.h | 1 -
>  3 files changed, 3 insertions(+), 5 deletions(-)

Let's slow this down a little bit; I'm afraid we're going to overwhelm folks.

Before posting more to LKML/netdev, how about we first complete a
sweep of all the drivers to see what we're getting into.  It could be
that this will end up being more churn than it's worth.  You could
send the result to linux-kernel-mentees, Shuah, me (but not LKML and
netdev), and then we can talk about whether it should be posted all at
once, as several series, etc.
