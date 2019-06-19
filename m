From: bhelgaas at google.com (Bjorn Helgaas)
Date: Wed, 19 Jun 2019 14:18:49 -0500
Subject: [Linux-kernel-mentees] [PATCH] net: fddi: skfp: Include generic
	PCI definitions from pci_regs.h
In-Reply-To: <20190619174556.21194-1-puranjay12@gmail.com>
References: <20190619174556.21194-1-puranjay12@gmail.com>
Message-ID: <CAErSpo6SnVVufzTeChiM+k7YcNebPcmabKS5EQR-mP-HYz1aGw@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Wed, Jun 19, 2019 at 12:46 PM Puranjay Mohan <puranjay12 at gmail.com> wrote:
>
> Include the generic PCI definitions from include/uapi/linux/pci_regs.h
> change PCI_REV_ID to PCI_REVISION_ID to make it compatible with the
> generic define.
> This driver uses only one generic PCI define.

1) Start every sentence with a capital letter.

2) Use a period at the end of every sentence.

3) Use a blank line between paragraphs.  A short line (like "generic
define" above) *suggests* a new paragraph, but it's ambiguous, which
makes it hard to read.

4) This patch must build correctly by itself.  I didn't try it, but
I'm a little suspicious that including pci_regs.h will cause
redefinition of PCI_STATUS and other #defines that are the same
between pci_regs.h and skfbi.h.  You could either combine the two
patches, or make the first patch simply rename PCI_REV_ID to
PCI_REVISION_ID in skfbi.h and drvfbi.c  Then the second patch could
add the #include of pci_regs.h and remove the corresponding #defines
from skfbi.h.  Maybe a third patch would remove all the other unused
PCI_* definitions.  Arguably the second and third could be combined.
But it's much easier for a maintainer to squash patches together than
to split them apart, so err on the side of splitting them up.

> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> ---
>  drivers/net/fddi/skfp/drvfbi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/fddi/skfp/drvfbi.c b/drivers/net/fddi/skfp/drvfbi.c
> index bdd5700e71fa..38f6d943385d 100644
> --- a/drivers/net/fddi/skfp/drvfbi.c
> +++ b/drivers/net/fddi/skfp/drvfbi.c
> @@ -20,6 +20,7 @@
>  #include "h/supern_2.h"
>  #include "h/skfbiinc.h"
>  #include <linux/bitrev.h>
> +#include <uapi/linux/pci_regs.h>
>
>  #ifndef        lint
>  static const char ID_sccs[] = "@(#)drvfbi.c    1.63 99/02/11 (C) SK " ;
> @@ -127,7 +128,7 @@ static void card_start(struct s_smc *smc)
>          *       at very first before any other initialization functions is
>          *       executed.
>          */
> -       rev_id = inp(PCI_C(PCI_REV_ID)) ;
> +       rev_id = inp(PCI_C(PCI_REVISION_ID)) ;
>         if ((rev_id & 0xf0) == SK_ML_ID_1 || (rev_id & 0xf0) == SK_ML_ID_2) {
>                 smc->hw.hw_is_64bit = TRUE ;
>         } else {
> --
> 2.21.0
>
