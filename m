From: helgaas@kernel.org (Bjorn Helgaas)
Date: Thu, 20 Jun 2019 16:37:55 -0500
Subject: [Linux-kernel-mentees] [PATCH v2 2/3] net: fddi: skfp: Include
	generic PCI definitions
In-Reply-To: <20190620180754.15413-3-puranjay12@gmail.com>
References: <20190620180754.15413-1-puranjay12@gmail.com>
	<20190620180754.15413-3-puranjay12@gmail.com>
Message-ID: <20190620213755.GE110859@google.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190620213755.e2E86p6WMKcECSDODbv2EUd32btdxOQoHfpPnxBUUFI@z>

On Thu, Jun 20, 2019 at 11:37:53PM +0530, Puranjay Mohan wrote:
> Include the uapi/linux/pci_regs.h header file which contains the generic
> PCI defines.
> 
> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> ---
>  drivers/net/fddi/skfp/drvfbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/fddi/skfp/drvfbi.c b/drivers/net/fddi/skfp/drvfbi.c
> index b324c1acf195..e8245cb281f8 100644
> --- a/drivers/net/fddi/skfp/drvfbi.c
> +++ b/drivers/net/fddi/skfp/drvfbi.c
> @@ -20,7 +20,7 @@
>  #include "h/supern_2.h"
>  #include "h/skfbiinc.h"
>  #include <linux/bitrev.h>
> -
> +#include <linux/pci_regs.h>

You removed the blank line between the list of include files and the
SCCS ID (now there's an anachronism) below.  That blank line is part
of typical Linux style and you should keep it.

>  #ifndef	lint
>  static const char ID_sccs[] = "@(#)drvfbi.c	1.63 99/02/11 (C) SK " ;
>  #endif
> -- 
> 2.21.0
> 
