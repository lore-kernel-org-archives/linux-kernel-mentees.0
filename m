From: helgaas@kernel.org (Bjorn Helgaas)
Date: Thu, 20 Jun 2019 16:37:21 -0500
Subject: [Linux-kernel-mentees] [PATCH v2 3/3] net: fddi: skfp: Remove
 unused private PCI definitions
In-Reply-To: <20190620180754.15413-4-puranjay12@gmail.com>
References: <20190620180754.15413-1-puranjay12@gmail.com>
	<20190620180754.15413-4-puranjay12@gmail.com>
Message-ID: <20190620213721.GD110859@google.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190620213721.jYyytvOh8EUfS2B_RK-aDuC2EymaHy_OUHZbvb_peKQ@z>

On Thu, Jun 20, 2019 at 11:37:54PM +0530, Puranjay Mohan wrote:
> Remove unused and private PCI definitions from skfbi.h because generic PCI
> symbols are already included from pci_regs.h.
> 
> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
> ---
>  drivers/net/fddi/skfp/h/skfbi.h | 207 +-------------------------------
>  1 file changed, 1 insertion(+), 206 deletions(-)
> 
> diff --git a/drivers/net/fddi/skfp/h/skfbi.h b/drivers/net/fddi/skfp/h/skfbi.h
> index a05ce16171be..a8af80148022 100644
> --- a/drivers/net/fddi/skfp/h/skfbi.h
> +++ b/drivers/net/fddi/skfp/h/skfbi.h
> @@ -27,46 +27,6 @@
>  /*
>   * Configuration Space header
>   */

This comment should be removed because it goes along with the
definitions below (the ones from PCI_VENDOR_ID to PCI_MAX_LAT).

> -#define	PCI_VENDOR_ID	0x00	/* 16 bit	Vendor ID */
> -#define	PCI_DEVICE_ID	0x02	/* 16 bit	Device ID */

> @@ -74,179 +34,14 @@
>   * Note: The temperature and voltage sensors are relocated on a different
>   *	 I2C bus.
>   */
> -#define I2C_ADDR_VPD	0xA0	/* I2C address for the VPD EEPROM */ 
> +#define I2C_ADDR_VPD	0xA0	/* I2C address for the VPD EEPROM */

You removed the space at the end of the I2C_ADDR_VPD line.  That space
*is* a whitespace error, but generally you should avoid fixing random
unrelated issues in the middle of your patch.  Those random fixes make
it harder because the reviewer is expecting to see unused PCI-related
things removed and seeing an I2C diff is surprising and forces him/her
to do some investigation.

> -/*	PCI_STATUS	16 bit	Status */
>  #define	PCI_PERR	0x8000	/* Bit 15:	Parity Error */
>  #define	PCI_SERR	0x4000	/* Bit 14:	Signaled SERR */
>  #define	PCI_RMABORT	0x2000	/* Bit 13:	Received Master Abort */

These should be replaced by PCI_STATUS_DETECTED_PARITY and similar
generic definitions.  You could do this in your 1/1 patch along with
PCI_REVISION_ID.

> -#define	PCI_RTABORT	0x1000	/* Bit 12:	Received Target Abort */
>  #define	PCI_STABORT	0x0800	/* Bit 11:	Sent Target Abort */
> -#define	PCI_DEVSEL	0x0600	/* Bit 10..9:	DEVSEL Timing */
> -#define	PCI_DEV_FAST	(0<<9)	/*		fast */
> -#define	PCI_DEV_MEDIUM	(1<<9)	/*		medium */
> -#define	PCI_DEV_SLOW	(2<<9)	/*		slow */
>  #define	PCI_DATAPERR	0x0100	/* Bit 8:	DATA Parity error detected */
> -#define	PCI_FB2BCAP	0x0080	/* Bit 7:	Fast Back-to-Back Capability */
> -#define	PCI_UDF		0x0040	/* Bit 6:	User Defined Features */
> -#define PCI_66MHZCAP	0x0020	/* Bit 5:	66 MHz PCI bus clock capable */
> -#define PCI_NEWCAP	0x0010	/* Bit 4:	New cap. list implemented */
> -
>  #define PCI_ERRBITS	(PCI_PERR|PCI_SERR|PCI_RMABORT|PCI_STABORT|PCI_DATAPERR)
