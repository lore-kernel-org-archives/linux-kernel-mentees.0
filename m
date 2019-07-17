From: gregkh at linuxfoundation.org (Greg KH)
Date: Thu, 18 Jul 2019 05:48:53 +0900
Subject: [Linux-kernel-mentees] [PATCH] PCI: Remove unused
 EXPORT_SYMBOL()s from drivers/pci/bus.c
In-Reply-To: <20190717182353.45557-1-skunberg.kelsey@gmail.com>
References: <20190717182353.45557-1-skunberg.kelsey@gmail.com>
Message-ID: <20190717204853.GD12367@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

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

Acked-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
