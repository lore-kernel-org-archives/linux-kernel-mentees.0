From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Mon, 15 Jul 2019 14:19:44 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] PCI: Remove functions not
 called in include/linux/pci.h
In-Reply-To: <alpine.DEB.2.21.1907152138120.2564@felia>
References: <20190715175658.29605-1-skunberg.kelsey@gmail.com>
	<20190715181312.31403-1-skunberg.kelsey@gmail.com>
	<alpine.DEB.2.21.1907152138120.2564@felia>
Message-ID: <20190715201944.GA36316@JATN>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Mon, Jul 15, 2019 at 09:42:47PM +0200, Lukas Bulwahn wrote:
> 
> 
> On Mon, 15 Jul 2019, Kelsey Skunberg wrote:
> 
> > Remove the following uncalled functions from include/linux/pci.h:
> > 
> >         pci_block_cfg_access()
> >         pci_block_cfg_access_in_atomic()
> >         pci_unblock_cfg_access()
> > 
> > Functions were added in patch fb51ccbf217c "PCI: Rework config space
> > blocking services", though no callers were added. Code continues to be
> > unused and should be removed.
> > 
> > Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> > ---
> > 
> 
> Nice finding. How did you discover this issue? Did you use a tool to find 
> this ununsed code or stumble over it during your code review?
>
Stumbled upon it while reviewing include/linux/pci.h to see what
could be moved to drivers/pci/pci.h.
 
> Also note that commits are referred to with this format:
> 
> commit <12-character sha prefix> ("<commit message>")
>
> So, you need to change patch to commit and include brackets around your
> quoted commit message.
> 
> Lukas

Thank you for letting me know and reviewing! I will update this now.

-Kelsey

> 
> > Changes since v1:
> >   - Fixed Signed-off-by line to show full name
> > 
> >  include/linux/pci.h | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index cf380544c700..3c9ba6133bea 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -1656,11 +1656,6 @@ static inline void pci_release_regions(struct pci_dev *dev) { }
> >  
> >  static inline unsigned long pci_address_to_pio(phys_addr_t addr) { return -1; }
> >  
> > -static inline void pci_block_cfg_access(struct pci_dev *dev) { }
> > -static inline int pci_block_cfg_access_in_atomic(struct pci_dev *dev)
> > -{ return 0; }
> > -static inline void pci_unblock_cfg_access(struct pci_dev *dev) { }
> > -
> >  static inline struct pci_bus *pci_find_next_bus(const struct pci_bus *from)
> >  { return NULL; }
> >  static inline struct pci_dev *pci_get_slot(struct pci_bus *bus,
> > -- 
> > 2.20.1
> > 
> > _______________________________________________
> > Linux-kernel-mentees mailing list
> > Linux-kernel-mentees at lists.linuxfoundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
> > 
