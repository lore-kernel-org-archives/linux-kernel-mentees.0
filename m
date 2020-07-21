Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DACAC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 02:57:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 232A320773
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 02:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="EcyqdDMU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="z+M+uiQg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 232A320773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E09362202C;
	Tue, 21 Jul 2020 02:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HdphhaRob459; Tue, 21 Jul 2020 02:57:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A81AC204E4;
	Tue, 21 Jul 2020 02:57:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E522C0894;
	Tue, 21 Jul 2020 02:57:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A5C8C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 02:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 48DB02201C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 02:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aVWZz45YAJwg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 02:57:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by silver.osuosl.org (Postfix) with ESMTPS id 42FE0204E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 02:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595300252; x=1626836252;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=6dwiQs45B6OKigGHznMegoKAJD6GCG00C6oGMeF19sU=;
 b=EcyqdDMUWk6zM0aVh+1dHf3fCTdCJuaYDXLFuyf0ZDt8c83l/7cr7lEc
 zKIhqJV9m0PRLl8DDuN7BXd789IUZzKFxrDD5db8yh7eMhfBN7G/tkYlZ
 WoDSSGqJ9V4b1GKtjr8jgt6a9tzrCe+Tclil1TQifyTHDYAqQbAqtntaL
 YoYXi9iVXowqdn197zmtBePDJqnJZfYFKPYDq5Ye/3mGDdOu9RH4Re2a7
 USa1g+p7DMuzawZrxvFBJmDYj1Lx2Knqpi7lwxrqD3oCFhuJpc8ytb+k1
 Pk4Z2z6mSLKVlKpxrrBKXfgJwxKedBhGQrxhsWJ5jEg4SZ5wGHS056/Cd g==;
IronPort-SDR: umm+ut04vCVaux05dcM0ABFIgI5uf/tRsSJI5u90yUiMCEacDKEML1wMG4oxRSXOwWdlvTlkrB
 u0pCNx/cnHnYbUI/jjk/pECYU4YFA/Zn3C2y55K1373rYuXVX1uOLniQd1k5WpUHNUNVB9FzUS
 +guPiS86FOjkh2k8mNJ4M3w99OirmahtwgMc3MZDD8j6cKN9sUaP3uvc1sp9fsM+7gw5bVt0Fa
 HGI0itsgDPIzMzg4fgKXlepBpNypD0dqkJ/ldItDiD5Jha5IxmK78MoWnVeUvWNljf4Td4ohZy
 f6s=
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; d="scan'208";a="142975021"
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jul 2020 10:57:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMmE91IOzgRGuWiElirlsibAYAnt8cKG62yw4wYIogaTnS3wJ1YyjRBs3VgbuIqCqlY716XuS43gjo2lR69lYxNNGWOWZCdJm5y5DBgrEvnCw29q0wDlSE6VvWVL9plCBBwV85GePjZI7BQMG0qL7VtMZqCmUVYZtLGsUBJ6kr2U+ey0+auizY89Lzj0upObns6wfdtzZbMKxoTitX+rdGVwnjtc53L7rOiWoxPZ9LEcq5RwfpADkgP5g3O/3GWu60bt15Ez/bKwAu6H3izQ+2un55gjiv4ORcow134yhTHXkVSbpQeOxqK/Ueu6QrYnR2TGlKK8H/MYJtPAvFquKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaCWxcgFE7qyvNZ9arWf47/7Mn2ZTVyGDagG6Q2tiQw=;
 b=cyXY6yQsoHT7O06bUHnoc/PWworfZ6ESHbDtbmUyFhEKZdUmHbj6/WvqKUwFmviIM2PoiQQywgLUkoElQHVP43jiQ2mtVgrBQXnpgHbYUuPDbhMLLSJneeEEhiLmggt7/YWni/o0HZBWBlaRoRNrxTAvjuq2PIocXYVUgXu5VP3d00roZwwZ+PTvBgGQ2hmmRGJFdFadlDK8h/epe82PoSnnDMhVZWZwHiUxdm34v/K5kRA2fGlT9WrXUNQYewa6dAAYZE0zzoy0WQxZLFUTQeSipftEr2sr0ouy5HM3mzdD/9gg2xi8nhO1FROOwvAQe/P5b9cbXxE5boimfxGz4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaCWxcgFE7qyvNZ9arWf47/7Mn2ZTVyGDagG6Q2tiQw=;
 b=z+M+uiQgssRmd/8T6WkJlCPbgPllml+HrUZ0DwdBjH1y0BDDyuonD53h3U2m1VfjvTLxa+cAgm76mP6bnuldR65ZFLo1yBKIZ9/i0l3h+dsQeaDuMMfMZ7ZqAN14A8OZekB8k5cGgB+u8qVpvXrl3nOODE9acHm7u1WoOBFZa48=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY1PR04MB2220.namprd04.prod.outlook.com (2a01:111:e400:c60e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Tue, 21 Jul
 2020 02:57:28 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3195.025; Tue, 21 Jul 2020
 02:57:28 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas
 <bjorn@helgaas.com>, Vaibhav Gupta <vaibhav.varodek@gmail.com>, Jens Axboe
 <axboe@kernel.dk>, Joshua Morris <josh.h.morris@us.ibm.com>, Philip Kelleher
 <pjk1939@linux.ibm.com>
Thread-Topic: [PATCH v2 3/3] skd: use generic power management
Thread-Index: AQHWXpopAyN24hyhnE6CLtHPJKt76g==
Date: Tue, 21 Jul 2020 02:57:28 +0000
Message-ID: <CY4PR04MB375176CACBFC3C2BEBE6D0AAE7780@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <CY4PR04MB37516C5544A7DCAD84921937E77B0@CY4PR04MB3751.namprd04.prod.outlook.com>
 <20200720133002.448809-1-vaibhavgupta40@gmail.com>
 <20200720133002.448809-4-vaibhavgupta40@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 785ddce8-c2d6-4f4d-b5f2-08d82d21ce20
x-ms-traffictypediagnostic: CY1PR04MB2220:
x-microsoft-antispam-prvs: <CY1PR04MB222032FF248DE60B3652E026E7780@CY1PR04MB2220.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:381;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kdqbM1SzoD9EXKDjZ5KVWWWftIXURU5sIAy/fjMNE0niQA9bIqRbtcKrxcnBkiXrKVk5evPHSy4XIl3Rg1XE/CwxcAfre2cgkxW9nO9YiaMwAwtwSIvE7yhvVWCrX54B7GFP5ib5sfSTDoismKb4x2eM9gUmUwosJsJ/RJajZGq9/7g1qSh5XGct6NGkavj8qkEEJMdgNAwLriKP3YUMzbDGBeJje2Pyp1B/s05J9dqwwJ4fZfr1xWKa/b7tdtt0P2+hBWQSCaKC5VLSptq/tGkYuHOf9rnqpwJmNur8TAeg8KzJNemqfWZXZ0tOpt1xk3V6qlD/tp0b6U6Ml/MCdcKszpOLLzh8MxzkYjzryaJiU9LQG9l2gGifimySp5/W
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(8676002)(7696005)(71200400001)(83380400001)(66946007)(2906002)(7416002)(66476007)(8936002)(53546011)(6506007)(186003)(86362001)(5660300002)(52536014)(66446008)(64756008)(66556008)(4326008)(26005)(110136005)(33656002)(9686003)(316002)(55016002)(478600001)(91956017)(54906003)(76116006)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: yTta3G3mLxH+Gz/DtOexdCxFIo+9pcqtci2t4qvKTflro7T9ZX6HX496CCJfYMtaI3NTNmi0ZAvHHP3LDENPVPDR/3NZSxgjmQw/oLEFZZVu9smoijucVl4Qtph+aV8XKioebOW3EdlAgm6m01g8+4xhuz9RVXyziEoE0jiomuWsIG1iQwYpF/jSnJSg35xOhSD6KLu77PV1iQutfDIB7KTr84rsazkrbgtWYzKZwKx/yXi4qzv2orXADeusU+zafsTI+BCZri9l6kfuit/foaFVj5D13rVVScL1tPFgeWhVKA1uXcc4BorqNBPnYROQwnhQ3+81mlhjjc6ma2M/DPrI+CILmN4pu3iTeMOl96AU07dQlDXvJuAGCDfjT/7SBFnG7o+1876RsdSLOYgBwbmoGL27xX31oHDyo0VH69xijZErlXuPNafDVKD+CRdi+uhAOw1kylSi+V/Z6EYoLCZe/LZWXC0vgj8IFa8TzJtWJOW2DzhmKl3wGVHIjcXH
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785ddce8-c2d6-4f4d-b5f2-08d82d21ce20
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 02:57:28.7406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cShcuLkp+O7/emY8a3qjkL52SLtWPZoQrMSweFGf7gYD+MeJCEjrBikNzpVu7t/fd2OfkhLsdql/mjLaZwuaGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2220
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 3/3] skd: use generic power
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

On 2020/07/20 22:32, Vaibhav Gupta wrote:
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

This commit message is rather vague, and the last sentence actually does not
describe correctly the change. What about something very simple, yet clear, like
this:

skd: use generic power management

Switch from the legacy .suspend()/.resume() power management interface to the
generic power management interface using the single .driver.pm() method. This
avoids the need for the driver to directly call most of the PCI helper functions
and device power state control functions as the generic power management
interface takes care of the necessary operations.

> 
> Compile-tested only.
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

Apart from the commit message, this looks OK to me.
I will give this a spin today on the hardware to check.


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
