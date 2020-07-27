Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B64C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 02:14:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB8B32070A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 02:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HziuURKy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="OWQw1Ztz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB8B32070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A539987E3B;
	Mon, 27 Jul 2020 02:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgbYOhig5qsI; Mon, 27 Jul 2020 02:14:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1C0BE87D8E;
	Mon, 27 Jul 2020 02:14:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10FFCC0050;
	Mon, 27 Jul 2020 02:14:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8187AC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 02:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7D99987E3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 02:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hRre2fOtutFN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 02:14:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9685B87D8E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 02:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595816075; x=1627352075;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=ZufIzXS4E8ERM383NzUjMbVgXGhGBDbrqqolzmjp2Q4=;
 b=HziuURKyEnErGLL5m1IjQbG3nnnONioR9gtWg7O/fAaimlpPmng56vIC
 yjcIpsN92MGEuG9NUi5/pRS1ByBdyxKfngYJbnqnfQSR9og8TWEFWDPxP
 InTmSwBu0dw4DdYGVtvswtBQgYXpj0bkgdfdINaxtBwaCgLs7FEs5sF5S
 eaLNRtjbaRPEFTluRjaiY1Li76POUOZb6FXxHuzpUt/3x185KBRkywiUo
 uNa+RRQOd63Dftz6/gFexvMsLyjRDTZ2/lKNDsJVTYq81S0iuPypkccHB
 HJSQXIR//fv0DKL53iAKi+JeUt0yyFRp+n4hPsbxtu/7ws5jL2V8XkqyM A==;
IronPort-SDR: v7EEVgJVrji/FkIBcTjk2aZAJ1+iWj+oO38ea+9Yf/JnGx+IwVIQW4ZkchWxnp6CZrv8EM5tYI
 BbkCxDWcwC0lTWUKi9LLlrJzxIur22IJvwTyDa21k3+KPuO16a9mrIJf19r1CVZ1EtPGRmnuY9
 WoG6DHdag0YYsR87uy1wshrsdUdOKI/DnH7pvhj8Dv/Sg8PmGvFlhaoPC3xsvz174uSLV1CxEH
 zyVXDVe0l6qMz4UFX1Uoq5G1hz1A3zAXa9Lmt5EDmkOVUXgMA25LX7Ck9uDcrv6/MNKBQzHeHv
 YY4=
X-IronPort-AV: E=Sophos;i="5.75,400,1589212800"; d="scan'208";a="144688694"
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jul 2020 10:14:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTvNOw6aMWNXEjmZkyOY8bTp09YZFihxTHc32POjOuGCja4ZWghv4u932ZIDK7EOsooc0GRcr97cgGzLtFuf6RbwmpM8VxeKdq3xmcSpFV13gUp18AR6kmgZke31vNVySF0LqLXDl5114DG8jAxbYxtc02ndEIYJfm/7LqahBe/VSZ/HHseTnXTUWu96+JUE3FyaDbT81ni12T92/SyS8p6WCO6rhtkoNZKsGnTDd8hx9HRWLxEWA8Xw5GvJVFE/1S7XAh4991LvOtu/BtrctbTF9aGtwbXfU3jqFByh//XjegkFqoYmT2MdF3BMUYX9UCmEfBZucKHUZL2leIazog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhhvfF/JomX6LZ5y9YLTQw8KevQktfJmmQ3vXmpq6As=;
 b=Kx6JEfERuU0QrLSQKbM7r+avvbiMp1FmBd1FqYLhvl75ruVGWLBIgyS+UygDC4Dlptgy9LkHvVaL1ILUjzTQVEqAPZ4kZ2Ekxb3V+jzaUVOY5XwKFsCMUZ1gb7m5jRM5kLeshgyO+EaB/sEtMJIS3S0jOBdPMJD0/yyh5kndTKVb/FXjySc9PBh6WaFB4M7BQZ7jlLktYhX3I4RJ2n4pHf3N1iCcrlCGzsSYR6a+oZ6wTBvJGnioBRTrRCu7yZNC8PTtC2dhzlqZ2zD36lGE8Ea0peUqElBG7x74Shws6DKsoS+uT2iExpm0zDI7viRJXIr6rTxTK4F3sJVHrKJm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhhvfF/JomX6LZ5y9YLTQw8KevQktfJmmQ3vXmpq6As=;
 b=OWQw1ZtzFaVH1YMTS8Y4SqF7LHOYJOVQpux50VPWMgB4+oi0qYD+dO1WLoZX4uzS0uVYmzJAYiapfnbcHJPSiz5N8DDKnVmmSLk7Vgp1oTkVEKH+jOwV7ZWkuKDxN+SSwBAmaPgi1CyX83bhzLBCsWhJEH232Kc2ASRoHD9SO3Q=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR0401MB3585.namprd04.prod.outlook.com (2603:10b6:910:8a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Mon, 27 Jul
 2020 02:14:32 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3216.026; Mon, 27 Jul 2020
 02:14:31 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas
 <bjorn@helgaas.com>, Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe
 <axboe@kernel.dk>, Joshua Morris <josh.h.morris@us.ibm.com>, Philip Kelleher
 <pjk1939@linux.ibm.com>
Thread-Topic: [PATCH v3 3/3] skd: use generic power management
Thread-Index: AQHWYAMLHus2S/WLN0GIM31Ogd6sQg==
Date: Mon, 27 Jul 2020 02:14:31 +0000
Message-ID: <CY4PR04MB3751AADFD4D34B8BD64A3A8EE7720@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <ea5881cdfd4d612193feed646ce89f253a36db69.camel@wdc.com>
 <20200722083335.50068-1-vaibhavgupta40@gmail.com>
 <20200722083335.50068-4-vaibhavgupta40@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 25b597bf-4a7a-4dc1-276b-08d831d2ccaf
x-ms-traffictypediagnostic: CY4PR0401MB3585:
x-microsoft-antispam-prvs: <CY4PR0401MB35854BFBF8068F283B090835E7720@CY4PR0401MB3585.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PaPTa53dQqZMObWTUDi3yjOtklFgPOYmKhc8Hc+cymG3FgD8D2Wfn2DMa92DoCHvyha+zK5UezepSEQpstcpgaFNxHMqwKiTibf1gSaPtoBKoiyZg8zhAofWvx5YlUdXGC11N476ur6riPKyP9u9V7jIA8gfbmghARCJMr6911QlF5TA2zeqDgrWWkhzb4zpRA4OUYwCsTLyexrKJtH5b6gGTiFy0LF0XCrlDlr3ULl8OThfUDdoceZLIte99dxtRdUcCFfV99Q3VKzR31sNxAh8StywgK+9e9sweZ9umcGXp3oSxwNoApa+0IU55Pq4Dtx1G0yM0I77NlKxcDEi919q+TjwWgir0RN+fvWzcMVLdSK9811zGEIyiW/70/ld
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(54906003)(86362001)(33656002)(83380400001)(7416002)(76116006)(186003)(8936002)(9686003)(110136005)(52536014)(91956017)(5660300002)(26005)(7696005)(53546011)(55016002)(6506007)(316002)(478600001)(8676002)(2906002)(66446008)(66476007)(64756008)(66556008)(71200400001)(4326008)(66946007)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: tJRAUZsb2XmkVXuYJYSyIaLKlo6uG72OVMIMzxQT2mezpQ9T8TpL3i6yEu5n0nyEb60QvB9E/KxMCtn7+tWclFTznu9ZI9lwhb6YgNuOPvH2f4GpE9eRpR2+kQKuLyFo6eTi6YHmm/3Rj06vxYoq7+ArxggnQuh6ZodflmnKEsxj7dhRavjzVvMplkbOC7SEbqIRDFpe4wnuhb9RxLoNJ2PVWMgY1KpekEF1vS3KeFQR2Fk5cE/7Eo2A0ERMSLFXz5p2EzDPibPgQXbZJkL79vCvL2cxc9n1p1+kiDmzzRLnh9thMnlkg3rSZF6tpxIrxKQpFpM0wBlO7VIt5rVs/X46HeS6KxgrPFPkEOWeFcLTJsp/UfGHzx1Ud5EoStDqVLjmupeNqDmaF8sQsP7+v9ItTPlBOZzNILEpePcSJTgl+9x6Bj736MqDBkraqLNdHTw7DaymFQN3iQT5IpdSpBeMmjpHjono8T/MAxhtHI2P+HojYa1hzpHMI42GfEBh
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b597bf-4a7a-4dc1-276b-08d831d2ccaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 02:14:31.8779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3O+b+efqYWivSkcguXiF2qyJhtekp+5Si4J1UKU2iXzkGeze6ix0eOiAnFIUNGqW5MpyZB4LIicA94T5dRWa/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0401MB3585
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3 3/3] skd: use generic power
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

On 2020/07/22 17:35, Vaibhav Gupta wrote:
> Drivers using legacy power management .suspen()/.resume() callbacks
> have to manage PCI states and device's PM states themselves. They also
> need to take care of standard configuration registers.
> 
> Switch to generic power management framework using a single
> "struct dev_pm_ops" variable to take the unnecessary load from the driver.
> This also avoids the need for the driver to directly call most of the PCI
> helper functions and device power state control functions, as through
> the generic framework PCI Core takes care of the necessary operations,
> and drivers are required to do only device-specific jobs.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/block/skd_main.c | 30 ++++++++----------------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
> index 51569c199a6c..7f2d42900b38 100644
> --- a/drivers/block/skd_main.c
> +++ b/drivers/block/skd_main.c
> @@ -3315,10 +3315,11 @@ static void skd_pci_remove(struct pci_dev *pdev)
>  	return;
>  }
>  
> -static int skd_pci_suspend(struct pci_dev *pdev, pm_message_t state)
> +static int __maybe_unused skd_pci_suspend(struct device *dev)
>  {
>  	int i;
>  	struct skd_device *skdev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  
>  	skdev = pci_get_drvdata(pdev);
>  	if (!skdev) {
> @@ -3337,18 +3338,15 @@ static int skd_pci_suspend(struct pci_dev *pdev, pm_message_t state)
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
>  	struct skd_device *skdev;
> +	struct pci_dev *pdev = to_pci_dev(dev);
>  
>  	skdev = pci_get_drvdata(pdev);
>  	if (!skdev) {
> @@ -3356,16 +3354,8 @@ static int skd_pci_resume(struct pci_dev *pdev)
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
> @@ -3374,7 +3364,6 @@ static int skd_pci_resume(struct pci_dev *pdev)
>  		goto err_out_regions;
>  	}
>  
> -	pci_set_master(pdev);
>  	rc = pci_enable_pcie_error_reporting(pdev);
>  	if (rc) {
>  		dev_err(&pdev->dev,
> @@ -3427,10 +3416,6 @@ static int skd_pci_resume(struct pci_dev *pdev)
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
> @@ -3450,13 +3435,14 @@ static void skd_pci_shutdown(struct pci_dev *pdev)
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

Tested-by: Damien Le Moal <damien.lemoal@wdc.com>
Acked-by: Damien Le Moal <damien.lemoal@wdc.com>


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
