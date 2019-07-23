From: helgaas@kernel.org (Bjorn Helgaas)
Date: Tue, 23 Jul 2019 18:36:51 -0500
Subject: [Linux-kernel-mentees] [PATCH] PCI: Remove unused
 EXPORT_SYMBOL()s from drivers/pci/bus.c
In-Reply-To: <20190717182353.45557-1-skunberg.kelsey@gmail.com>
References: <20190717182353.45557-1-skunberg.kelsey@gmail.com>
Message-ID: <20190723233651.GD47047@google.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190723233651.H4MQVJLHUQsVsUg4MvdhTvXPbtsamU9WZGPL8MHmov0@z>

[+cc Greg]

On Wed, Jul 17, 2019 at 12:23:53PM -0600, Kelsey Skunberg wrote:
> pci_bus_get() and pci_bus_put() are not used by a loadable kernel module
> and do not need to be exported. Remove lines exporting pci_bus_get() and
> pci_bus_put().
> 
> Functions were exported in commit fe830ef62ac6 ("PCI: Introduce
> pci_bus_{get|put}() to manage PCI bus reference count"). No found history
> of functions being used by a loadable kernel module.
> 
> Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>

Applied with Greg's ack to pci/hide for v5.4, thanks!

> ---
>  drivers/pci/bus.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
> index 495059d923f7..8e40b3e6da77 100644
> --- a/drivers/pci/bus.c
> +++ b/drivers/pci/bus.c
> @@ -417,11 +417,9 @@ struct pci_bus *pci_bus_get(struct pci_bus *bus)
>  		get_device(&bus->dev);
>  	return bus;
>  }
> -EXPORT_SYMBOL(pci_bus_get);
>  
>  void pci_bus_put(struct pci_bus *bus)
>  {
>  	if (bus)
>  		put_device(&bus->dev);
>  }
> -EXPORT_SYMBOL(pci_bus_put);
> -- 
> 2.20.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees at lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
