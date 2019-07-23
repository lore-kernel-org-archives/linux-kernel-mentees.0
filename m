From: helgaas@kernel.org (Bjorn Helgaas)
Date: Tue, 23 Jul 2019 18:37:13 -0500
Subject: [Linux-kernel-mentees] [PATCH] PCI: Stop exporting pci_bus_sem
In-Reply-To: <20190718032951.40188-1-skunberg.kelsey@gmail.com>
References: <20190718032951.40188-1-skunberg.kelsey@gmail.com>
Message-ID: <20190723233713.GE47047@google.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190723233713.ozovQw7GPxMboX0YiMK0v9npNLSbJGclqhqLQmxIbMU@z>

On Wed, Jul 17, 2019 at 09:29:52PM -0600, Kelsey Skunberg wrote:
> pci_bus_sem is not used by a loadable kernel module and does not need to
> be exported. Remove line exporting pci_bus_sem.
> 
> Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>

Applied to pci/hide for v5.4, thanks!

> ---
>  drivers/pci/search.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/search.c b/drivers/pci/search.c
> index 7f4e65872b8d..bade14002fd8 100644
> --- a/drivers/pci/search.c
> +++ b/drivers/pci/search.c
> @@ -15,7 +15,6 @@
>  #include "pci.h"
>  
>  DECLARE_RWSEM(pci_bus_sem);
> -EXPORT_SYMBOL_GPL(pci_bus_sem);
>  
>  /*
>   * pci_for_each_dma_alias - Iterate over DMA aliases for a device
> -- 
> 2.20.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees at lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
