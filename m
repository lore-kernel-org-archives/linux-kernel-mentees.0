From: lkp at intel.com (kbuild test robot)
Date: Mon, 22 Jul 2019 19:05:08 +0800
Subject: [Linux-kernel-mentees] [PATCH] drivers: net: xgene: Remove
	acpi_has_method() calls
In-Reply-To: <20190722030401.69563-1-skunberg.kelsey@gmail.com>
References: <20190722030401.69563-1-skunberg.kelsey@gmail.com>
Message-ID: <201907221843.iX1OFrAo%lkp@intel.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hi Kelsey,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to v5.3-rc1 next-20190722]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Kelsey-Skunberg/drivers-net-xgene-Remove-acpi_has_method-calls/20190722-132405
config: x86_64-allyesconfig (attached as .config)
compiler: gcc-7 (Debian 7.4.0-10) 7.4.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp at intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c: In function 'xgene_enet_reset':
>> drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:480:13: error: invalid storage class for function 'xgene_enet_cle_bypass'
    static void xgene_enet_cle_bypass(struct xgene_enet_pdata *p,
                ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:480:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    static void xgene_enet_cle_bypass(struct xgene_enet_pdata *p,
    ^~~~~~
>> drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:506:13: error: invalid storage class for function 'xgene_enet_clear'
    static void xgene_enet_clear(struct xgene_enet_pdata *pdata,
                ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:522:13: error: invalid storage class for function 'xgene_enet_shutdown'
    static void xgene_enet_shutdown(struct xgene_enet_pdata *p)
                ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:532:13: error: invalid storage class for function 'xgene_enet_link_state'
    static void xgene_enet_link_state(struct work_struct *work)
                ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:563:13: error: invalid storage class for function 'xgene_sgmac_enable_tx_pause'
    static void xgene_sgmac_enable_tx_pause(struct xgene_enet_pdata *p, bool enable)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:604:1: error: expected declaration or statement at end of input
    };
    ^
   drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:599:29: warning: unused variable 'xgene_sgport_ops' [-Wunused-variable]
    const struct xgene_port_ops xgene_sgport_ops = {
                                ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:582:28: warning: unused variable 'xgene_sgmac_ops' [-Wunused-variable]
    const struct xgene_mac_ops xgene_sgmac_ops = {
                               ^~~~~~~~~~~~~~~
   At top level:
   drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:437:12: warning: 'xgene_enet_reset' defined but not used [-Wunused-function]
    static int xgene_enet_reset(struct xgene_enet_pdata *p)
               ^~~~~~~~~~~~~~~~

vim +/xgene_enet_cle_bypass +480 drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c

32f784b50e14c65 Iyappan Subramanian 2014-10-13  479  
32f784b50e14c65 Iyappan Subramanian 2014-10-13 @480  static void xgene_enet_cle_bypass(struct xgene_enet_pdata *p,
d6d489694fda7af Iyappan Subramanian 2016-12-01  481  				  u32 dst_ring_num, u16 bufpool_id,
d6d489694fda7af Iyappan Subramanian 2016-12-01  482  				  u16 nxtbufpool_id)
32f784b50e14c65 Iyappan Subramanian 2014-10-13  483  {
561fea6deacf72b Iyappan Subramanian 2015-04-28  484  	u32 cle_bypass_reg0, cle_bypass_reg1;
ca6264545a9ffa8 Keyur Chudgar       2015-03-17  485  	u32 offset = p->port_id * MAC_OFFSET;
d6d489694fda7af Iyappan Subramanian 2016-12-01  486  	u32 data, fpsel, nxtfpsel;
32f784b50e14c65 Iyappan Subramanian 2014-10-13  487  
561fea6deacf72b Iyappan Subramanian 2015-04-28  488  	if (p->enet_id == XGENE_ENET1) {
561fea6deacf72b Iyappan Subramanian 2015-04-28  489  		cle_bypass_reg0 = CLE_BYPASS_REG0_0_ADDR;
561fea6deacf72b Iyappan Subramanian 2015-04-28  490  		cle_bypass_reg1 = CLE_BYPASS_REG1_0_ADDR;
561fea6deacf72b Iyappan Subramanian 2015-04-28  491  	} else {
561fea6deacf72b Iyappan Subramanian 2015-04-28  492  		cle_bypass_reg0 = XCLE_BYPASS_REG0_ADDR;
561fea6deacf72b Iyappan Subramanian 2015-04-28  493  		cle_bypass_reg1 = XCLE_BYPASS_REG1_ADDR;
561fea6deacf72b Iyappan Subramanian 2015-04-28  494  	}
561fea6deacf72b Iyappan Subramanian 2015-04-28  495  
32f784b50e14c65 Iyappan Subramanian 2014-10-13  496  	data = CFG_CLE_BYPASS_EN0;
561fea6deacf72b Iyappan Subramanian 2015-04-28  497  	xgene_enet_wr_csr(p, cle_bypass_reg0 + offset, data);
32f784b50e14c65 Iyappan Subramanian 2014-10-13  498  
2c839337520b222 Iyappan Subramanian 2016-12-01  499  	fpsel = xgene_enet_get_fpsel(bufpool_id);
d6d489694fda7af Iyappan Subramanian 2016-12-01  500  	nxtfpsel = xgene_enet_get_fpsel(nxtbufpool_id);
d6d489694fda7af Iyappan Subramanian 2016-12-01  501  	data = CFG_CLE_DSTQID0(dst_ring_num) | CFG_CLE_FPSEL0(fpsel) |
d6d489694fda7af Iyappan Subramanian 2016-12-01  502  	       CFG_CLE_NXTFPSEL0(nxtfpsel);
561fea6deacf72b Iyappan Subramanian 2015-04-28  503  	xgene_enet_wr_csr(p, cle_bypass_reg1 + offset, data);
32f784b50e14c65 Iyappan Subramanian 2014-10-13  504  }
32f784b50e14c65 Iyappan Subramanian 2014-10-13  505  
cb11c062f9052c6 Iyappan Subramanian 2016-07-25 @506  static void xgene_enet_clear(struct xgene_enet_pdata *pdata,
cb11c062f9052c6 Iyappan Subramanian 2016-07-25  507  			     struct xgene_enet_desc_ring *ring)
cb11c062f9052c6 Iyappan Subramanian 2016-07-25  508  {
2c839337520b222 Iyappan Subramanian 2016-12-01  509  	u32 addr, data;
cb11c062f9052c6 Iyappan Subramanian 2016-07-25  510  
cb11c062f9052c6 Iyappan Subramanian 2016-07-25  511  	if (xgene_enet_is_bufpool(ring->id)) {
cb11c062f9052c6 Iyappan Subramanian 2016-07-25  512  		addr = ENET_CFGSSQMIFPRESET_ADDR;
2c839337520b222 Iyappan Subramanian 2016-12-01  513  		data = BIT(xgene_enet_get_fpsel(ring->id));
cb11c062f9052c6 Iyappan Subramanian 2016-07-25  514  	} else {
cb11c062f9052c6 Iyappan Subramanian 2016-07-25  515  		addr = ENET_CFGSSQMIWQRESET_ADDR;
2c839337520b222 Iyappan Subramanian 2016-12-01  516  		data = BIT(xgene_enet_ring_bufnum(ring->id));
cb11c062f9052c6 Iyappan Subramanian 2016-07-25  517  	}
cb11c062f9052c6 Iyappan Subramanian 2016-07-25  518  
cb11c062f9052c6 Iyappan Subramanian 2016-07-25  519  	xgene_enet_wr_ring_if(pdata, addr, data);
cb11c062f9052c6 Iyappan Subramanian 2016-07-25  520  }
cb11c062f9052c6 Iyappan Subramanian 2016-07-25  521  
32f784b50e14c65 Iyappan Subramanian 2014-10-13 @522  static void xgene_enet_shutdown(struct xgene_enet_pdata *p)
32f784b50e14c65 Iyappan Subramanian 2014-10-13  523  {
bc61167ac816621 Iyappan Subramanian 2016-07-25  524  	struct device *dev = &p->pdev->dev;
bc61167ac816621 Iyappan Subramanian 2016-07-25  525  
bc61167ac816621 Iyappan Subramanian 2016-07-25  526  	if (dev->of_node) {
bc61167ac816621 Iyappan Subramanian 2016-07-25  527  		if (!IS_ERR(p->clk))
bc61167ac816621 Iyappan Subramanian 2016-07-25  528  			clk_disable_unprepare(p->clk);
bc61167ac816621 Iyappan Subramanian 2016-07-25  529  	}
32f784b50e14c65 Iyappan Subramanian 2014-10-13  530  }
32f784b50e14c65 Iyappan Subramanian 2014-10-13  531  
32f784b50e14c65 Iyappan Subramanian 2014-10-13 @532  static void xgene_enet_link_state(struct work_struct *work)
32f784b50e14c65 Iyappan Subramanian 2014-10-13  533  {
32f784b50e14c65 Iyappan Subramanian 2014-10-13  534  	struct xgene_enet_pdata *p = container_of(to_delayed_work(work),
32f784b50e14c65 Iyappan Subramanian 2014-10-13  535  				     struct xgene_enet_pdata, link_work);
32f784b50e14c65 Iyappan Subramanian 2014-10-13  536  	struct net_device *ndev = p->ndev;
32f784b50e14c65 Iyappan Subramanian 2014-10-13  537  	u32 link, poll_interval;
32f784b50e14c65 Iyappan Subramanian 2014-10-13  538  
32f784b50e14c65 Iyappan Subramanian 2014-10-13  539  	link = xgene_enet_link_status(p);
32f784b50e14c65 Iyappan Subramanian 2014-10-13  540  	if (link) {
32f784b50e14c65 Iyappan Subramanian 2014-10-13  541  		if (!netif_carrier_ok(ndev)) {
32f784b50e14c65 Iyappan Subramanian 2014-10-13  542  			netif_carrier_on(ndev);
9a8c5ddedd9805c Iyappan Subramanian 2016-07-25  543  			xgene_sgmac_set_speed(p);
32f784b50e14c65 Iyappan Subramanian 2014-10-13  544  			xgene_sgmac_rx_enable(p);
32f784b50e14c65 Iyappan Subramanian 2014-10-13  545  			xgene_sgmac_tx_enable(p);
9a8c5ddedd9805c Iyappan Subramanian 2016-07-25  546  			netdev_info(ndev, "Link is Up - %dMbps\n",
9a8c5ddedd9805c Iyappan Subramanian 2016-07-25  547  				    p->phy_speed);
32f784b50e14c65 Iyappan Subramanian 2014-10-13  548  		}
32f784b50e14c65 Iyappan Subramanian 2014-10-13  549  		poll_interval = PHY_POLL_LINK_ON;
32f784b50e14c65 Iyappan Subramanian 2014-10-13  550  	} else {
32f784b50e14c65 Iyappan Subramanian 2014-10-13  551  		if (netif_carrier_ok(ndev)) {
32f784b50e14c65 Iyappan Subramanian 2014-10-13  552  			xgene_sgmac_rx_disable(p);
32f784b50e14c65 Iyappan Subramanian 2014-10-13  553  			xgene_sgmac_tx_disable(p);
32f784b50e14c65 Iyappan Subramanian 2014-10-13  554  			netif_carrier_off(ndev);
32f784b50e14c65 Iyappan Subramanian 2014-10-13  555  			netdev_info(ndev, "Link is Down\n");
32f784b50e14c65 Iyappan Subramanian 2014-10-13  556  		}
32f784b50e14c65 Iyappan Subramanian 2014-10-13  557  		poll_interval = PHY_POLL_LINK_OFF;
32f784b50e14c65 Iyappan Subramanian 2014-10-13  558  	}
32f784b50e14c65 Iyappan Subramanian 2014-10-13  559  
32f784b50e14c65 Iyappan Subramanian 2014-10-13  560  	schedule_delayed_work(&p->link_work, poll_interval);
32f784b50e14c65 Iyappan Subramanian 2014-10-13  561  }
32f784b50e14c65 Iyappan Subramanian 2014-10-13  562  
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01 @563  static void xgene_sgmac_enable_tx_pause(struct xgene_enet_pdata *p, bool enable)
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  564  {
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  565  	u32 data, ecm_cfg_addr;
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  566  
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  567  	if (p->enet_id == XGENE_ENET1) {
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  568  		ecm_cfg_addr = (!(p->port_id % 2)) ? CSR_ECM_CFG_0_ADDR :
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  569  				CSR_ECM_CFG_1_ADDR;
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  570  	} else {
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  571  		ecm_cfg_addr = XG_MCX_ECM_CFG_0_ADDR;
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  572  	}
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  573  
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  574  	data = xgene_enet_rd_mcx_csr(p, ecm_cfg_addr);
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  575  	if (enable)
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  576  		data |= MULTI_DPF_AUTOCTRL | PAUSE_XON_EN;
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  577  	else
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  578  		data &= ~(MULTI_DPF_AUTOCTRL | PAUSE_XON_EN);
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  579  	xgene_enet_wr_mcx_csr(p, ecm_cfg_addr, data);
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  580  }
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  581  
3cdb73091767649 Julia Lawall        2015-12-08  582  const struct xgene_mac_ops xgene_sgmac_ops = {
32f784b50e14c65 Iyappan Subramanian 2014-10-13  583  	.init		= xgene_sgmac_init,
32f784b50e14c65 Iyappan Subramanian 2014-10-13  584  	.reset		= xgene_sgmac_reset,
32f784b50e14c65 Iyappan Subramanian 2014-10-13  585  	.rx_enable	= xgene_sgmac_rx_enable,
32f784b50e14c65 Iyappan Subramanian 2014-10-13  586  	.tx_enable	= xgene_sgmac_tx_enable,
32f784b50e14c65 Iyappan Subramanian 2014-10-13  587  	.rx_disable	= xgene_sgmac_rx_disable,
32f784b50e14c65 Iyappan Subramanian 2014-10-13  588  	.tx_disable	= xgene_sgmac_tx_disable,
ca6d550c5dbe66e Iyappan Subramanian 2017-05-10  589  	.get_drop_cnt   = xgene_sgmac_get_drop_cnt,
9a8c5ddedd9805c Iyappan Subramanian 2016-07-25  590  	.set_speed	= xgene_sgmac_set_speed,
32f784b50e14c65 Iyappan Subramanian 2014-10-13  591  	.set_mac_addr	= xgene_sgmac_set_mac_addr,
350b4e33b89378c Iyappan Subramanian 2016-12-01  592  	.set_framesize  = xgene_sgmac_set_frame_size,
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  593  	.link_state	= xgene_enet_link_state,
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  594  	.enable_tx_pause = xgene_sgmac_enable_tx_pause,
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  595  	.flowctl_tx     = xgene_sgmac_flowctl_tx,
bb64fa09ac1b225 Iyappan Subramanian 2016-12-01  596  	.flowctl_rx     = xgene_sgmac_flowctl_rx
32f784b50e14c65 Iyappan Subramanian 2014-10-13  597  };
32f784b50e14c65 Iyappan Subramanian 2014-10-13  598  
3cdb73091767649 Julia Lawall        2015-12-08  599  const struct xgene_port_ops xgene_sgport_ops = {
32f784b50e14c65 Iyappan Subramanian 2014-10-13  600  	.reset		= xgene_enet_reset,
cb11c062f9052c6 Iyappan Subramanian 2016-07-25  601  	.clear		= xgene_enet_clear,
32f784b50e14c65 Iyappan Subramanian 2014-10-13  602  	.cle_bypass	= xgene_enet_cle_bypass,
32f784b50e14c65 Iyappan Subramanian 2014-10-13  603  	.shutdown	= xgene_enet_shutdown
32f784b50e14c65 Iyappan Subramanian 2014-10-13 @604  };

:::::: The code at line 480 was first introduced by commit
:::::: 32f784b50e14c653ad0f010fbd5921a5f8caf846 drivers: net: xgene: Add SGMII based 1GbE support

:::::: TO: Iyappan Subramanian <isubramanian at apm.com>
:::::: CC: David S. Miller <davem at davemloft.net>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 69531 bytes
Desc: not available
URL: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/attachments/20190722/bdb09a35/attachment-0001.bin>
