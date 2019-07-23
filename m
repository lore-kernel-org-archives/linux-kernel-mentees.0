From: davem@davemloft.net (David Miller)
Date: Tue, 23 Jul 2019 14:07:39 -0700 (PDT)
Subject: [Linux-kernel-mentees] [PATCH v2] drivers: net: xgene: Remove
	acpi_has_method() calls
In-Reply-To: <20190723.140646.505566792140054611.davem@davemloft.net>
References: <20190722030401.69563-1-skunberg.kelsey@gmail.com>
	<20190723185811.8548-1-skunberg.kelsey@gmail.com>
	<20190723.140646.505566792140054611.davem@davemloft.net>
Message-ID: <20190723.140739.379654507424022463.davem@davemloft.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190723210739.PfxfjZQ_TtTG8jaZjbNKcX5ukMNcPt7VPX9XiONEgYs@z>

From: David Miller <davem@davemloft.net>
Date: Tue, 23 Jul 2019 14:06:46 -0700 (PDT)

> From: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> Date: Tue, 23 Jul 2019 12:58:11 -0600
> 
>> acpi_evaluate_object will already return an error if the needed method
>> does not exist. Remove unnecessary acpi_has_method() calls and check the
>> returned acpi_status for failure instead.
>> 
>> Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
>> ---
>> Changes in v2:
>> 	- Fixed white space warnings and errors
> 
> Applied to net-next.

Wow did you even build test this?   Reverted...

drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c: In function ?xgene_enet_reset?:
drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:480:13: error: invalid storage class for function ?xgene_enet_cle_bypass?
 static void xgene_enet_cle_bypass(struct xgene_enet_pdata *p,
             ^~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:480:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
 static void xgene_enet_cle_bypass(struct xgene_enet_pdata *p,
 ^~~~~~
drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:506:13: error: invalid storage class for function ?xgene_enet_clear?
 static void xgene_enet_clear(struct xgene_enet_pdata *pdata,
             ^~~~~~~~~~~~~~~~
drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:522:13: error: invalid storage class for function ?xgene_enet_shutdown?
 static void xgene_enet_shutdown(struct xgene_enet_pdata *p)
             ^~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:532:13: error: invalid storage class for function ?xgene_enet_link_state?
 static void xgene_enet_link_state(struct work_struct *work)
             ^~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:563:13: error: invalid storage class for function ?xgene_sgmac_enable_tx_pause?
 static void xgene_sgmac_enable_tx_pause(struct xgene_enet_pdata *p, bool enable)
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:604:1: error: expected declaration or statement at end of input
 };
 ^
drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:599:29: warning: unused variable ?xgene_sgport_ops? [-Wunused-variable]
 const struct xgene_port_ops xgene_sgport_ops = {
                             ^~~~~~~~~~~~~~~~
drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:582:28: warning: unused variable ?xgene_sgmac_ops? [-Wunused-variable]
 const struct xgene_mac_ops xgene_sgmac_ops = {
                            ^~~~~~~~~~~~~~~
At top level:
drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c:437:12: warning: ?xgene_enet_reset? defined but not used [-Wunused-function]
 static int xgene_enet_reset(struct xgene_enet_pdata *p)
            ^~~~~~~~~~~~~~~~
