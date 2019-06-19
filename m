From: bhelgaas at google.com (Bjorn Helgaas)
Date: Wed, 19 Jun 2019 14:10:22 -0500
Subject: [Linux-kernel-mentees] [PATCH] net: fddi: skfp: remove generic
	PCI defines from skfbi.h
In-Reply-To: <20190619174643.21456-1-puranjay12@gmail.com>
References: <20190619174643.21456-1-puranjay12@gmail.com>
Message-ID: <CAErSpo7-AjCAc8pGpTftd7U-W2kjp1jfbPzk3SOa=Bg5-d6W5w@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Wed, Jun 19, 2019 at 12:48 PM Puranjay Mohan <puranjay12 at gmail.com> wrote:
>
> skfbi.h defines its own copies of PCI_COMMAND, PCI_STATUS, etc.
> remove them in favor of the generic definitions in
> include/uapi/linux/pci_regs.h

1) Since you're sending several related patches, send them as a
"series" with a cover letter, e.g.,

  [PATCH v2 0/2] Use PCI generic definitions instead of private duplicates
  [PATCH v2 1/2] Include generic PCI definitions
  [PATCH v2 2/2] Remove unused private PCI definitions

Patches 1/2 and 2/2 should be replies to the 0/2 cover letter.  "git
send-email" will do this for you if you figure out the right options.

2) Make sure all your subject lines match.  One started with "Include"
and the other with "remove".  They should both be capitalized.

3) Start sentences with a capital letter, i.e., "Remove them" above.

4) This commit log needs to explicitly say that you're removing
*unused* symbols.  Since they're unused, you don't even need to refer
to pci_regs.h.

5) "git grep PCI_ drivers/net/fddi/skfp" says there are many more
unused PCI symbols than just the ones below.  I would just remove them
all at once.

6) Obviously you should compile this to make sure it builds.  It must
build cleanly after every patch, not just at the end.  I assume you've
done this already.

7) Please cc: linux-pci at vger.kernel.org since you're making PCI-related changes.

> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> ---
>  drivers/net/fddi/skfp/h/skfbi.h | 23 -----------------------
>  1 file changed, 23 deletions(-)
>
> diff --git a/drivers/net/fddi/skfp/h/skfbi.h b/drivers/net/fddi/skfp/h/skfbi.h
> index 89557457b352..ed144a8e78d1 100644
> --- a/drivers/net/fddi/skfp/h/skfbi.h
> +++ b/drivers/net/fddi/skfp/h/skfbi.h
> @@ -27,29 +27,6 @@
>  /*
>   * Configuration Space header
>   */
> -#define        PCI_VENDOR_ID   0x00    /* 16 bit       Vendor ID */
> -#define        PCI_DEVICE_ID   0x02    /* 16 bit       Device ID */
> -#define        PCI_COMMAND     0x04    /* 16 bit       Command */
> -#define        PCI_STATUS      0x06    /* 16 bit       Status */
> -#define        PCI_REV_ID      0x08    /*  8 bit       Revision ID */
> -#define        PCI_CLASS_CODE  0x09    /* 24 bit       Class Code */
> -#define        PCI_CACHE_LSZ   0x0c    /*  8 bit       Cache Line Size */
> -#define        PCI_LAT_TIM     0x0d    /*  8 bit       Latency Timer */
> -#define        PCI_HEADER_T    0x0e    /*  8 bit       Header Type */
> -#define        PCI_BIST        0x0f    /*  8 bit       Built-in selftest */
> -#define        PCI_BASE_1ST    0x10    /* 32 bit       1st Base address */
> -#define        PCI_BASE_2ND    0x14    /* 32 bit       2nd Base address */
> -/* Byte 18..2b:        Reserved */
> -#define        PCI_SUB_VID     0x2c    /* 16 bit       Subsystem Vendor ID */
> -#define        PCI_SUB_ID      0x2e    /* 16 bit       Subsystem ID */
> -#define        PCI_BASE_ROM    0x30    /* 32 bit       Expansion ROM Base Address */
> -/* Byte 34..33:        Reserved */
> -#define PCI_CAP_PTR    0x34    /*  8 bit (ML)  Capabilities Ptr */
> -/* Byte 35..3b:        Reserved */
> -#define        PCI_IRQ_LINE    0x3c    /*  8 bit       Interrupt Line */
> -#define        PCI_IRQ_PIN     0x3d    /*  8 bit       Interrupt Pin */
> -#define        PCI_MIN_GNT     0x3e    /*  8 bit       Min_Gnt */
> -#define        PCI_MAX_LAT     0x3f    /*  8 bit       Max_Lat */
>  /* Device Dependent Region */
>  #define        PCI_OUR_REG     0x40    /* 32 bit (DV)  Our Register */
>  #define        PCI_OUR_REG_1   0x40    /* 32 bit (ML)  Our Register 1 */
> --
> 2.21.0
>
