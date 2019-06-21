From: bhelgaas at google.com (Bjorn Helgaas)
Date: Fri, 21 Jun 2019 12:13:34 -0500
Subject: [Linux-kernel-mentees] [PATCH 3/3] net: ethernet: atheros:
 atlx: Remove unused and private PCI definitions
In-Reply-To: <20190621163921.26188-4-puranjay12@gmail.com>
References: <20190621163921.26188-1-puranjay12@gmail.com>
	<20190621163921.26188-4-puranjay12@gmail.com>
Message-ID: <CAErSpo4BBczS7hdwmXF=07LqUtT1-3e1Q1Z2r0+J6N=rVhXb7g@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Fri, Jun 21, 2019 at 11:40 AM Puranjay Mohan <puranjay12 at gmail.com> wrote:
>
> Remove unused private PCI definitions from skfbi.h because generic PCI
> symbols are already included from pci_regs.h.
>
> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> ---
>  drivers/net/ethernet/atheros/atlx/atl2.h | 2 --
>  drivers/net/ethernet/atheros/atlx/atlx.h | 1 -
>  2 files changed, 3 deletions(-)
>
> diff --git a/drivers/net/ethernet/atheros/atlx/atl2.h b/drivers/net/ethernet/atheros/atlx/atl2.h
> index c53b810a831d..1b25d6d747de 100644
> --- a/drivers/net/ethernet/atheros/atlx/atl2.h
> +++ b/drivers/net/ethernet/atheros/atlx/atl2.h
> @@ -32,7 +32,6 @@
>  int ethtool_ioctl(struct ifreq *ifr);
>  #endif
>
> -#define PCI_COMMAND_REGISTER   PCI_COMMAND
>  #define CMD_MEM_WRT_INVALIDATE PCI_COMMAND_INVALIDATE
>
>  #define ATL2_WRITE_REG(a, reg, value) (iowrite32((value), \
> @@ -202,7 +201,6 @@ static void atl2_force_ps(struct atl2_hw *hw);
>  #define MII_DBG_DATA   0x1E
>
>  /* PCI Command Register Bit Definitions */
> -#define PCI_COMMAND            0x04
>  #define CMD_IO_SPACE           0x0001
>  #define CMD_MEMORY_SPACE       0x0002
>  #define CMD_BUS_MASTER         0x0004

These bit definitions (CMD_IO_SPACE, CMD_MEMORY_SPACE, etc) are also
generic PCI things that should be replaced with PCI_COMMAND_IO,
PCI_COMMAND_MEMORY, etc.  I haven't looked at the file, but there are
likely more.
