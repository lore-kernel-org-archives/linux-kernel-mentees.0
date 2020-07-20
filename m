Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E690BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:02:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0748207FC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 13:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="igdCRlT3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Mslx0ZmY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0748207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 65A1E87D6E;
	Mon, 20 Jul 2020 13:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QmsipX1uD6pn; Mon, 20 Jul 2020 13:02:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5343487D65;
	Mon, 20 Jul 2020 13:02:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EABAC0894;
	Mon, 20 Jul 2020 13:02:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0A77C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 862882049F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCuKLdXiduaC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:02:18 +0000 (UTC)
X-Greylist: delayed 00:10:02 by SQLgrey-1.7.6
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 86DB12042B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 13:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595250162; x=1626786162;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=D47ZWtuYp+ltbQojuMH+iHGB5jbrwXJ47spBJNYF4A8=;
 b=igdCRlT3dE3hOfrq/4o+sf6Mu3NzLfYc/J7fLeBW9chkPRdy2wKFwCM2
 imV3ye12creeumoC+r/2KL7Io7dzSbxm151rOFs7StlQRUJV9NgbV5nye
 A+8U6aXVu86NF9hUZ4fUv1LPI/IFIuHgilwuwo7HFfLeuqZyZfLgwF+wJ
 LSvu/w/XyIZ4s9DtWaSTiUaXTDUBZqmlI9YwHZgTkw91gE6gHuleWcBwm
 VtqufvPtV1at5u5VWj6yPb8BPl+GlJzu4yaHwY8mQWPWKneW46inhuRIO
 jZeqTEF5yFWGrpbuUTz1gM34wCr2ms+lRM3tzAoBPQ0m/y9ywxgvhoUtn g==;
IronPort-SDR: RkJkO0T171DVzCEbxJMLTt/Sq9E/vLMI3L4e9lgtL3FqZbJAl5kgJVRech5JK4c3QXdSPbsMhj
 fDirVRkpxt84BM92lVZAVk3pwR8wWGLveHnQJYMbgti8kL1i+rUjrxIDlxSIQkw7B4kIGRruAw
 2k7VEa+jMOYoZ7Fwf8THP7u3EHc1cSLNOOmqC9gAjBpjU3omQhT3wP0aRrGs3hf8EBWRGs9AXg
 Ae/n01b2bCM15XZ7o4rIpsxVke0ze1yE6qHHnd68OrzvS6ko9+K1Rimm+yCiOwdQOSHb0qTp8q
 cxI=
X-IronPort-AV: E=Sophos;i="5.75,375,1589212800"; d="scan'208";a="245953116"
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jul 2020 20:52:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzFZF/lfpe4a9REIXGgQEetIebXFkM92i567Y4KBL3yOY2hePY8C/hU7cD+wmaKg9YWk9eAA2jrknzbthLDDj8PNTJWbmq3DK9R/yaLBtY/Xc4iDX+2XaANRb5BCuvg1B11zTjez7fm5PcH2EMAt9GwETDYpZEjMUQF6bjhhhiFG1VGsLxPQtOaOk+Py7vkJX8QqUBaEcV+KBfhkjLfevl9dcTpJN9AmC6OcFqI380GNmMgoqkinh57CzhvxnH4nWiF36PkNpjpy+nYtFqIRVCODt1aOCbLdILff1jdfH4BZsI3WqP8Gc5EGVU9A/6nai2BFbk6rxgHmDqeifdebJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6hcO4I+d+qxoKtx0AcJauw0wfpphPYyjnWIrZ8b+IU=;
 b=RoLBWuZ8RbAUzd8bIubl6j804+JRAAsI1zj7gTrtSdthOM6J9eRidRK0jdY6xbCkVpxpaZ5fgoFwYtxJUG/wJZSjA1LQrQtA8Zpf+yBR65XhxLVJIk8RPDBp5+FEaorcfMrEHaoo3fvjhB7uJVCquV8cyhVdFhfaurmGrVtm5NoDN2hNCkWSGJP/OHV9u+XDZmQ0g/ACRraYTcI3yEPIFkpFXKvEm7SlNvJQrml+/G3panRszIMcJBEWmr0bmGBkd30XpdHY59eH8RmL6eANhtUOKALHEpOEu5xVnWNeybc9R2OiHdh0e35817BBcnSUD49pbpDmaxoB8dK5MYUgTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6hcO4I+d+qxoKtx0AcJauw0wfpphPYyjnWIrZ8b+IU=;
 b=Mslx0ZmYycTG0AQBLO6F6rUlAGyMO8WLbRkthDJ+HocK+AdU3heWKZ7cmPE7UbNMCA6udHf7RrTD/GOvveuyHcl+R0f7heobftr5VRPXDin9VOVO2EshjN1I1LivrN4jilVoumhQmR9ncj7vJtZs5QAt2+QUc9FLrpZML6K4wSA=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB1256.namprd04.prod.outlook.com (2603:10b6:910:52::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Mon, 20 Jul
 2020 12:52:14 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 12:52:14 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas
 <bjorn@helgaas.com>, Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe
 <axboe@kernel.dk>, Joshua Morris <josh.h.morris@us.ibm.com>, Philip Kelleher
 <pjk1939@linux.ibm.com>
Thread-Topic: [PATCH v1 3/3] skd: use generic power management
Thread-Index: AQHWXBHK3yyvSpv7dkelMB844h700w==
Date: Mon, 20 Jul 2020 12:52:14 +0000
Message-ID: <CY4PR04MB37516C5544A7DCAD84921937E77B0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200717080910.342741-1-vaibhavgupta40@gmail.com>
 <20200717080910.342741-4-vaibhavgupta40@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 57e251df-62e9-4c4d-0d15-08d82cabb9d5
x-ms-traffictypediagnostic: CY4PR04MB1256:
x-microsoft-antispam-prvs: <CY4PR04MB125644EB7B2087FB0C42CDC4E77B0@CY4PR04MB1256.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:785;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +dggwR7RAp1pcTWBtyMk3UE9GKBsdev7CRHA7uFpseFgVocA0WELXQB1S3TIBHKjoQckmicl2aidXkDNPuiJkqhTut19trHMCDVlerKOkbo90QDl6UtOhv9pDcV/W31/dDoO6JYhSUS7boEc4Q+DU4Yer6NszJVO7wxEnQdm59yPnv5avltGxy9aFAC5w5ZECX8KtafULNRAdQLxRFpOrW5IQZVIBeMr8xKMpk1JnKPfke0rv3Rsz79ibdv+Xc/qOjeZ/jzbXL7wPlE9GAfX8pdM6LONCRFY3z67uQri+tqSDFoVxtn+i61pPSAcEndROJ/jFdNMN8gPXwNTTMG2O8ORtKhLhTeqBhACPGx5/EVhu0cTrAYuX3KBWa9Q4sr3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(8936002)(110136005)(71200400001)(54906003)(64756008)(8676002)(2906002)(52536014)(478600001)(66946007)(91956017)(66556008)(66476007)(76116006)(66446008)(5660300002)(7416002)(86362001)(316002)(7696005)(9686003)(26005)(186003)(33656002)(4326008)(53546011)(6506007)(55016002)(83380400001)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Eqja+DbiWCvHFUS2ySq+9svMHn+1LT1FTxg9vt3kvGtOQjeG3xHDPz7GNKVNJPwi0YfiLWI5rgP4YsMHj4bE8gm7I2lF1OJCCemLmtfCGd5+tNuSwidBiP+SER+PHuAaaVQNN/Taxg8TCyiZlP4uuLg1OyFOGE+IemT7gAfAQub4EHmiX+vG85S5fLYukIvFFNbI9DhqArutX2uhHYpfBpRauktXQTcVZGm5Yl0eZt6pxqXtY5fklyZcM+YNQ21Qe1HarUWZv7hjf1XkeTTnJR5TYGpfDQIEZ5VG395j7xTJt4m2OUBIDEgc0nbldV/J2gdoCoc45ao6GitBJnWBKYpNKIzavnL7PkOKKg/TGFZ5OtYQgLI7OEF5dNx9i+3Y/Bbe7KQJWDA/IYwZkwXexzMNzWqsGIwA3ZCFQ6vpPrm+DxHHg+LAWqOPU/wttnW8BAEYZ3pWb9Fm/h2bm9+F3UUBOERj34FJldhtG5Rkoauv44TM2bEpiZiOzo7yZazx
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e251df-62e9-4c4d-0d15-08d82cabb9d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 12:52:14.0662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ugbjO/jMHvBQFVf05F8UOFw8dG8lJ0hO6+99qLTWF6gNHzJ0P7MpP0aicUO/9Go3kPhhe72a82fu8aitFW/Wrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1256
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 3/3] skd: use generic power
	management
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 2020/07/17 17:10, Vaibhav Gupta wrote:
> Drivers using legacy PM have to manage PCI states and device's PM states
> themselves. They also need to take care of configuration registers.
> 
> With improved and powerful support of generic PM, PCI Core takes care of
> above mentioned, device-independent, jobs.
> 
> This driver makes use of PCI helper functions like
> pci_save/restore_state(), pci_enable/disable_device(),
> pci_request/release_regions(), pci_set_power_state() and
> pci_set_master() to do required operations. In generic mode, they are no
> longer needed.
> 
> Change function parameter in both .suspend() and .resume() to
> "struct device*" type. Use to_pci_dev() to get "struct pci_dev*" variable.
> 
> Compile-tested only.

I do not think this belongs into the commit message. This was mentioned in the
cover letter.

> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/block/skd_main.c | 36 ++++++++++--------------------------
>  1 file changed, 10 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
> index 51569c199a6c..d8d1042e7338 100644
> --- a/drivers/block/skd_main.c
> +++ b/drivers/block/skd_main.c
> @@ -3315,12 +3315,12 @@ static void skd_pci_remove(struct pci_dev *pdev)
>  	return;
>  }
>  
> -static int skd_pci_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused skd_pci_suspend(struct device *dev)
>  {
>  	int i;
> -	struct skd_device *skdev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct skd_device *skdev = pci_get_drvdata(pdev);

You can just add the pdev declaration here. The other 2 changes are not needed.

>  
> -	skdev = pci_get_drvdata(pdev);

You can keep this as is.

>  	if (!skdev) {
>  		dev_err(&pdev->dev, "no device data for PCI\n");
>  		return -EIO;
> @@ -3337,35 +3337,23 @@ static int skd_pci_suspend(struct pci_dev *pdev, pm_message_t state)
>  	if (skdev->pcie_error_reporting_is_enabled)
>  		pci_disable_pcie_error_reporting(pdev);
>  
> -	pci_release_regions(pdev);
> -	pci_save_state(pdev);
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
>  	return 0;
>  }
>  
> -static int skd_pci_resume(struct pci_dev *pdev)
> +static int __maybe_unused skd_pci_resume(struct device *dev)
>  {
>  	int i;
>  	int rc = 0;
> -	struct skd_device *skdev;
>  
> -	skdev = pci_get_drvdata(pdev);

Same comment as above. Keep these as is and add only pdev declaration.

> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct skd_device *skdev = pci_get_drvdata(pdev);
>  	if (!skdev) {
>  		dev_err(&pdev->dev, "no device data for PCI\n");
>  		return -1;
>  	}
>  
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_enable_wake(pdev, PCI_D0, 0);
> -	pci_restore_state(pdev);
> +	device_wakeup_disable(dev);
>  
> -	rc = pci_enable_device(pdev);
> -	if (rc)
> -		return rc;
> -	rc = pci_request_regions(pdev, DRV_NAME);
> -	if (rc)
> -		goto err_out;
>  	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>  	if (rc)
>  		rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> @@ -3374,7 +3362,6 @@ static int skd_pci_resume(struct pci_dev *pdev)
>  		goto err_out_regions;
>  	}
>  
> -	pci_set_master(pdev);
>  	rc = pci_enable_pcie_error_reporting(pdev);
>  	if (rc) {
>  		dev_err(&pdev->dev,
> @@ -3427,10 +3414,6 @@ static int skd_pci_resume(struct pci_dev *pdev)
>  		pci_disable_pcie_error_reporting(pdev);
>  
>  err_out_regions:
> -	pci_release_regions(pdev);
> -
> -err_out:
> -	pci_disable_device(pdev);
>  	return rc;
>  }
>  
> @@ -3450,13 +3433,14 @@ static void skd_pci_shutdown(struct pci_dev *pdev)
>  	skd_stop_device(skdev);
>  }
>  
> +static SIMPLE_DEV_PM_OPS(skd_pci_pm_ops, skd_pci_suspend, skd_pci_resume);
> +
>  static struct pci_driver skd_driver = {
>  	.name		= DRV_NAME,
>  	.id_table	= skd_pci_tbl,
>  	.probe		= skd_pci_probe,
>  	.remove		= skd_pci_remove,
> -	.suspend	= skd_pci_suspend,
> -	.resume		= skd_pci_resume,
> +	.driver.pm	= &skd_pci_pm_ops,
>  	.shutdown	= skd_pci_shutdown,
>  };
>  
> 


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
