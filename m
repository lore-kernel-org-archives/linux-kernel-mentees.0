From: davem at davemloft.net (David Miller)
Date: Wed, 19 Jun 2019 17:12:41 -0400 (EDT)
Subject: [Linux-kernel-mentees] [PATCH] net: fddi: skfp: Include generic
 PCI definitions from pci_regs.h
In-Reply-To: <20190619174556.21194-1-puranjay12@gmail.com>
References: <20190619174556.21194-1-puranjay12@gmail.com>
Message-ID: <20190619.171241.1736506463260822121.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Puranjay Mohan <puranjay12 at gmail.com>
Date: Wed, 19 Jun 2019 23:15:56 +0530

> Include the generic PCI definitions from include/uapi/linux/pci_regs.h
> change PCI_REV_ID to PCI_REVISION_ID to make it compatible with the
> generic define.
> This driver uses only one generic PCI define.
> 
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

You never need to use "uapi/" in header includes from the kernel source,
please just use "linux/pci_regs.h"

Thank you.
