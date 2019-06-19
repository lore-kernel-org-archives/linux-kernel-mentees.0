From: puranjay12 at gmail.com (Puranjay Mohan)
Date: Thu, 20 Jun 2019 00:01:46 +0530
Subject: [Linux-kernel-mentees] Fwd: [PATCH] net: fddi: skfp: Include
	generic PCI definitions from pci_regs.h
In-Reply-To: <20190619182122.GA4827@arch>
References: <20190619174556.21194-1-puranjay12@gmail.com>
	<e49daf89-1bf0-77e8-c71f-ec0802f25f6c@linuxfoundation.org>
	<20190619182122.GA4827@arch>
Message-ID: <CANk7y0h8gC6JR=FWXQC=vYWrPxFT2KFwi6zQaThjhzAMwG9gGw@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Wed, Jun 19, 2019 at 12:04:19PM -0600, Shuah Khan wrote:
> On 6/19/19 11:45 AM, Puranjay Mohan wrote:
> > Include the generic PCI definitions from include/uapi/linux/pci_regs.h
> > change PCI_REV_ID to PCI_REVISION_ID to make it compatible with the
> > generic define.
> > This driver uses only one generic PCI define.
> >
> > Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> > ---
> >   drivers/net/fddi/skfp/drvfbi.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/fddi/skfp/drvfbi.c b/drivers/net/fddi/skfp/drvfbi.c
> > index bdd5700e71fa..38f6d943385d 100644
> > --- a/drivers/net/fddi/skfp/drvfbi.c
> > +++ b/drivers/net/fddi/skfp/drvfbi.c
> > @@ -20,6 +20,7 @@
> >   #include "h/supern_2.h"
> >   #include "h/skfbiinc.h"
> >   #include <linux/bitrev.h>
> > +#include <uapi/linux/pci_regs.h>
> >   #ifndef   lint
> >   static const char ID_sccs[] = "@(#)drvfbi.c       1.63 99/02/11 (C) SK " ;
> > @@ -127,7 +128,7 @@ static void card_start(struct s_smc *smc)
> >      *       at very first before any other initialization functions is
> >      *       executed.
> >      */
> > -   rev_id = inp(PCI_C(PCI_REV_ID)) ;
> > +   rev_id = inp(PCI_C(PCI_REVISION_ID)) ;
> >     if ((rev_id & 0xf0) == SK_ML_ID_1 || (rev_id & 0xf0) == SK_ML_ID_2) {
> >             smc->hw.hw_is_64bit = TRUE ;
> >     } else {
> >
>
> Why not delete the PCI_REV_ID define in:
>
> drivers/net/fddi/skfp/h/skfbi.h
>
I have removed all generic  PCI definitions from skfbi.h in the next
patch which I have sent, I wanted to keep it organised by sending two
patches

> It looks like this header has duplicate PCI config space header defines,
> not just this one. Some of them are slightly different names:
>
> e.g:
>
> #define PCI_CACHE_LSZ   0x0c    /*  8 bit       Cache Line Size */
>
> Looks like it defines the standard PCI config space instead of
> including and using the standard defines from uapi/linux/pci_regs.h
>
It defines many duplicate definitions in skfbi.h, but only uses one of
them, hence they are removed in the next patch as told by bjorn.
It uses only one generic PCI define in driver code, i.e. PCI_REV_ID, it
has been replaced by PCI_REVISION_ID to make it work with the define
included with uapi/linux/pci_regs.h
> Something to look into.
>
> thanks,
> -- Shuah
>
>
>
>
>


-- 
Thanks and Regards

Yours Truly,

Puranjay Mohan
