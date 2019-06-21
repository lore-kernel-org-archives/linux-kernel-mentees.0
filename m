From: lkp at intel.com (kbuild test robot)
Date: Fri, 21 Jun 2019 11:51:14 +0800
Subject: [Linux-kernel-mentees] [PATCH] net: fddi: skfp: remove generic
	PCI defines from skfbi.h
In-Reply-To: <20190619174643.21456-1-puranjay12@gmail.com>
References: <20190619174643.21456-1-puranjay12@gmail.com>
Message-ID: <201906211128.eLm29xBq%lkp@intel.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hi Puranjay,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net/master]
[also build test ERROR on v5.2-rc5 next-20190620]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Puranjay-Mohan/net-fddi-skfp-remove-generic-PCI-defines-from-skfbi-h/20190621-081729
config: x86_64-randconfig-s4-06211045 (attached as .config)
compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp at intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/net/fddi/skfp/drvfbi.c:17:0:
   drivers/net/fddi/skfp/drvfbi.c: In function 'card_start':
>> drivers/net/fddi/skfp/drvfbi.c:130:21: error: 'PCI_REV_ID' undeclared (first use in this function); did you mean 'PCI_DEV_ID0'?
     rev_id = inp(PCI_C(PCI_REV_ID)) ;
                        ^
   drivers/net/fddi/skfp/h/types.h:28:25: note: in definition of macro 'inp'
    #define inp(p)  ioread8(p)
                            ^
   drivers/net/fddi/skfp/h/skfbi.h:916:18: note: in expansion of macro 'ADDR'
    #define PCI_C(a) ADDR(B3_CFG_SPC + (a)) /* PCI Config Space */
                     ^~~~
   drivers/net/fddi/skfp/drvfbi.c:130:15: note: in expansion of macro 'PCI_C'
     rev_id = inp(PCI_C(PCI_REV_ID)) ;
                  ^~~~~
   drivers/net/fddi/skfp/drvfbi.c:130:21: note: each undeclared identifier is reported only once for each function it appears in
     rev_id = inp(PCI_C(PCI_REV_ID)) ;
                        ^
   drivers/net/fddi/skfp/h/types.h:28:25: note: in definition of macro 'inp'
    #define inp(p)  ioread8(p)
                            ^
   drivers/net/fddi/skfp/h/skfbi.h:916:18: note: in expansion of macro 'ADDR'
    #define PCI_C(a) ADDR(B3_CFG_SPC + (a)) /* PCI Config Space */
                     ^~~~
   drivers/net/fddi/skfp/drvfbi.c:130:15: note: in expansion of macro 'PCI_C'
     rev_id = inp(PCI_C(PCI_REV_ID)) ;
                  ^~~~~

vim +130 drivers/net/fddi/skfp/drvfbi.c

^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  @17  #include "h/types.h"
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   18  #include "h/fddi.h"
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   19  #include "h/smc.h"
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   20  #include "h/supern_2.h"
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   21  #include "h/skfbiinc.h"
bc63eb9c drivers/net/skfp/drvfbi.c Akinobu Mita   2006-12-19   22  #include <linux/bitrev.h>
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   23  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   24  #ifndef	lint
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   25  static const char ID_sccs[] = "@(#)drvfbi.c	1.63 99/02/11 (C) SK " ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   26  #endif
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   27  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   28  /*
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   29   * PCM active state
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   30   */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   31  #define PC8_ACTIVE	8
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   32  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   33  #define	LED_Y_ON	0x11	/* Used for ring up/down indication */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   34  #define	LED_Y_OFF	0x10
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   35  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   36  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   37  #define MS2BCLK(x)	((x)*12500L)
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   38  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   39  /*
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   40   * valid configuration values are:
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   41   */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   42  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   43  /*
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   44   *	xPOS_ID:xxxx
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   45   *	|	\  /
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   46   *	|	 \/
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   47   *	|	  --------------------- the patched POS_ID of the Adapter
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   48   *	|				xxxx = (Vendor ID low byte,
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   49   *	|					Vendor ID high byte,
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   50   *	|					Device ID low byte,
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   51   *	|					Device ID high byte)
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   52   *	+------------------------------ the patched oem_id must be
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   53   *					'S' for SK or 'I' for IBM
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   54   *					this is a short id for the driver.
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   55   */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   56  #ifndef MULT_OEM
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   57  #ifndef	OEM_CONCEPT
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   58  const u_char oem_id[] = "xPOS_ID:xxxx" ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   59  #else	/* OEM_CONCEPT */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   60  const u_char oem_id[] = OEM_ID ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   61  #endif	/* OEM_CONCEPT */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   62  #define	ID_BYTE0	8
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   63  #define	OEMID(smc,i)	oem_id[ID_BYTE0 + i]
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   64  #else	/* MULT_OEM */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   65  const struct s_oem_ids oem_ids[] = {
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   66  #include "oemids.h"
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   67  {0}
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   68  };
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   69  #define	OEMID(smc,i)	smc->hw.oem_id->oi_id[i]
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   70  #endif	/* MULT_OEM */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   71  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   72  /* Prototypes of external functions */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   73  #ifdef AIX
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   74  extern int AIX_vpdReadByte() ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   75  #endif
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   76  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   77  
7aa55fce drivers/net/skfp/drvfbi.c Adrian Bunk    2005-06-21   78  /* Prototype of a local function. */
7aa55fce drivers/net/skfp/drvfbi.c Adrian Bunk    2005-06-21   79  static void smt_stop_watchdog(struct s_smc *smc);
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   80  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   81  /*
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   82   * FDDI card reset
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   83   */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   84  static void card_start(struct s_smc *smc)
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   85  {
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   86  	int i ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   87  #ifdef	PCI
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   88  	u_char	rev_id ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   89  	u_short word;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   90  #endif
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   91  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   92  	smt_stop_watchdog(smc) ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   93  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   94  #ifdef	PCI
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   95  	/*
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   96  	 * make sure no transfer activity is pending
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   97  	 */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   98  	outpw(FM_A(FM_MDREG1),FM_MINIT) ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16   99  	outp(ADDR(B0_CTRL), CTRL_HPI_SET) ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  100  	hwt_wait_time(smc,hwt_quick_read(smc),MS2BCLK(10)) ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  101  	/*
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  102  	 * now reset everything
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  103  	 */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  104  	outp(ADDR(B0_CTRL),CTRL_RST_SET) ;	/* reset for all chips */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  105  	i = (int) inp(ADDR(B0_CTRL)) ;		/* do dummy read */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  106  	SK_UNUSED(i) ;				/* Make LINT happy. */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  107  	outp(ADDR(B0_CTRL), CTRL_RST_CLR) ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  108  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  109  	/*
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  110  	 * Reset all bits in the PCI STATUS register
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  111  	 */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  112  	outp(ADDR(B0_TST_CTRL), TST_CFG_WRITE_ON) ;	/* enable for writes */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  113  	word = inpw(PCI_C(PCI_STATUS)) ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  114  	outpw(PCI_C(PCI_STATUS), word | PCI_ERRBITS) ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  115  	outp(ADDR(B0_TST_CTRL), TST_CFG_WRITE_OFF) ;	/* disable writes */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  116  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  117  	/*
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  118  	 * Release the reset of all the State machines
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  119  	 * Release Master_Reset
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  120  	 * Release HPI_SM_Reset
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  121  	 */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  122  	outp(ADDR(B0_CTRL), CTRL_MRST_CLR|CTRL_HPI_CLR) ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  123  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  124  	/*
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  125  	 * determine the adapter type
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  126  	 * Note: Do it here, because some drivers may call card_start() once
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  127  	 *	 at very first before any other initialization functions is
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  128  	 *	 executed.
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  129  	 */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16 @130  	rev_id = inp(PCI_C(PCI_REV_ID)) ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  131  	if ((rev_id & 0xf0) == SK_ML_ID_1 || (rev_id & 0xf0) == SK_ML_ID_2) {
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  132  		smc->hw.hw_is_64bit = TRUE ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  133  	} else {
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  134  		smc->hw.hw_is_64bit = FALSE ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  135  	}
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  136  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  137  	/*
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  138  	 * Watermark initialization
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  139  	 */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  140  	if (!smc->hw.hw_is_64bit) {
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  141  		outpd(ADDR(B4_R1_F), RX_WATERMARK) ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  142  		outpd(ADDR(B5_XA_F), TX_WATERMARK) ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  143  		outpd(ADDR(B5_XS_F), TX_WATERMARK) ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  144  	}
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  145  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  146  	outp(ADDR(B0_CTRL),CTRL_RST_CLR) ;	/* clear the reset chips */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  147  	outp(ADDR(B0_LED),LED_GA_OFF|LED_MY_ON|LED_GB_OFF) ; /* ye LED on */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  148  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  149  	/* init the timer value for the watch dog 2,5 minutes */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  150  	outpd(ADDR(B2_WDOG_INI),0x6FC23AC0) ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  151  
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  152  	/* initialize the ISR mask */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  153  	smc->hw.is_imask = ISR_MASK ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  154  	smc->hw.hw_state = STOPPED ;
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  155  #endif
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  156  	GET_PAGE(0) ;		/* necessary for BOOT */
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  157  }
^1da177e drivers/net/skfp/drvfbi.c Linus Torvalds 2005-04-16  158  

:::::: The code at line 130 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds at ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds at ppc970.osdl.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 34851 bytes
Desc: not available
URL: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/attachments/20190621/72adb576/attachment-0001.bin>
