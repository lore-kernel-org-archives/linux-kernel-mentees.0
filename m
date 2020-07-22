Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A9AC433F1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 06:29:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57C3D20792
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 06:29:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="PYNuXaz8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="GrI+NA4M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57C3D20792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1D79A86AE6;
	Wed, 22 Jul 2020 06:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6bBad2Sw_GO; Wed, 22 Jul 2020 06:29:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3B5D286A3D;
	Wed, 22 Jul 2020 06:29:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EBF2C089F;
	Wed, 22 Jul 2020 06:29:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C51BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 06:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7126F8848A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 06:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndjr9TA-U-b9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 06:29:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DCC928846E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 06:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595399344; x=1626935344;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=n1uE35Q3PKQg9W1h2yhcyvw3k0uo71070NYMrdf3W1g=;
 b=PYNuXaz8pdNMsrGVEBz8ZHyTn27TCcSbJGskg+F1jcsrVdseHsCo+UmL
 IX1YBE4WS5J0TctIIXqQUuFo1sJ5OnTtHi3nhmHcEOr92rG+6TFPNC3MT
 PgYyjuT/mRKXcfNT6R3ppkStPpLhQVvtPOx0xOPUx5o6qVMBg5YB7aNCd
 F7ftUJL3B5FILHlcuafVTlfxDtKP7U2BMyume9NsmVRzka2BzNOVx5dzQ
 ABArEdD46OGxaekeCJRpa5FOQ3/jIZQAM1GD8JaKFTcvTbZKLvan6BJIb
 wY/njWuFyyFqJo8DeuOyggtbT06XM45cYoCzKM0zE8SzjJD9R8LAzIfjW A==;
IronPort-SDR: ZqfQKBX5YhqSUHxJ/ml+/CsK5HQEfJjeB1/LliKhbJKT1ptDaWoliXX6bkX1/pFyu4Xnnl76sU
 1lLf1PiiRh44nwkX+vnKrULz1EGG+8Pg47FykQLcX5f3i2nXWArTR3DMT/u5wQujYkiVbR1hps
 ts6KNchizgQyX97FXa+WPHaWd8/5ci0Zr2m7Mr8FX6iRp2WwKccqCUamApyl1+cb1Oei0/NrDc
 31nmR+ZgXRCslPdtGJkEXnnBo/EN1wsG4YFCZFn9sMECoGpDR5Dtz+CP7HnoJnL3rgqw4Kue7T
 PT4=
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="246131873"
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 14:29:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvpM+g14W7TNPgtXcEYgsVs82QwI/gqsp164HtFesaHaOL34psVxePRSeDEp76dfL8471w2nyjkOc3m8VDlVFb2cfnrtCIG4KjwjeIYGxLPYA3ehantRduxJ0agJH7EN6CakxsDR43hpDG5nKxd5LAhbj/m9WRK/beEebvJDtj7Olqe1fwZNLQW1teLq9XIdsVrEgtisAU83a4+As/fSpqfoviKSuqgi+sH9FiVF7ZZ1CwzDQGtxonx9IQPBF5o8MBk1ieqgBytqEMvueOwFR/afP7zD+nT7uTG0w2losIw1+gsGaLF8mFuA4W8Lu60+FgqpBzMpus5RTJRJZsFf1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1uE35Q3PKQg9W1h2yhcyvw3k0uo71070NYMrdf3W1g=;
 b=dm6pkZWTGfp9RgGt86MdwYaNz/NB7RTWLoOLEOSzhKHVGGhXVgBnHp1K2Fg2r0vARsuAlAfRm+/KqlsSMEvTP+tsH4ft3XTSBVwSJ7QTnPA7uvSsuDaNVbvkHYicCdcPEvnB6JVZbWH4jLF8dKFcCO8Tfcuq4TRgCVjVyCPKXgNRqWAvA6oBw2EiE158AvqhHxaLt/ltrBNo0Mfc9fGVx50NaZLRrvZN8ab/3xa0lZLx85iUBgPMtxNyMzdzdMH7m1pEOcdjvnKvh4N9D4SRxZBo8/UfZI/2Cav/f2lafU2/B37P8IlLHPQzNLuQNZS8PwGMJboN3FJcG6WjoKpBbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1uE35Q3PKQg9W1h2yhcyvw3k0uo71070NYMrdf3W1g=;
 b=GrI+NA4MEnCXdhKoQg2s6F17J6x4vUsPwgIa+3UhY5AMsS599cBUqY+MmWqqNGNz3ThvbaqASY8jtA8iBXbZvKidxKZXwMjuvKFvWQOcQn45lbdBMdCUM7Tp2/jIxCC08tNqPDl5z42C6h1sqSJycFXES83DT6DUus71z3q1Dy4=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB0729.namprd04.prod.outlook.com (2603:10b6:903:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 22 Jul
 2020 06:28:59 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3195.025; Wed, 22 Jul 2020
 06:28:58 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "vaibhavgupta40@gmail.com" <vaibhavgupta40@gmail.com>
Thread-Topic: [PATCH v2 3/3] skd: use generic power management
Thread-Index: AQHWXpopAyN24hyhnE6CLtHPJKt76qkRnpeAgAGG84A=
Date: Wed, 22 Jul 2020 06:28:58 +0000
Message-ID: <ea5881cdfd4d612193feed646ce89f253a36db69.camel@wdc.com>
References: <CY4PR04MB37516C5544A7DCAD84921937E77B0@CY4PR04MB3751.namprd04.prod.outlook.com>
 <20200720133002.448809-1-vaibhavgupta40@gmail.com>
 <20200720133002.448809-4-vaibhavgupta40@gmail.com>
 <CY4PR04MB375176CACBFC3C2BEBE6D0AAE7780@CY4PR04MB3751.namprd04.prod.outlook.com>
 <20200721070939.GB51743@gmail.com>
In-Reply-To: <20200721070939.GB51743@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 (3.36.3-1.fc32) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:62d1:16e6:ecb1:d604]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b5490ea5-f938-4b18-b90e-08d82e088476
x-ms-traffictypediagnostic: CY4PR04MB0729:
x-microsoft-antispam-prvs: <CY4PR04MB0729EA862786F02C9F90BED8E7790@CY4PR04MB0729.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mS5/i/Drx/G6dm2P6afzRVdWS48l3aO+gQwEJ4K4VCdX22OQpeoTaqV6ZyDomp6P2v+wIzDFpzB7sxdjx0MlQO8Ns9/HpRkvsEG7sQT+3p4R83j72WAFNdQaSnsTUV7AqM8wDIJKzm4lcdGH7HMETYiwLDrb5Umo9q80gQ7bSplb+apOBFOXO8R+0m5GM/MsEXhHmGTKcEcuz/xwtD2lhcPQX6QS595t+3bocs4i5L2Z5KA0dJ/PXArjNML/ce906aFP55+3aq5pLfMOPLvO56efjTCQgF++gExgmmptLU92q4BrEtp1dHMxG1f+gI0TeJgPZRQMHyZbd/T2T1ojC77LOc+zKNCI4xVnHUVMgpYS05WPmSWtjmEuA7+MRTR+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(6486002)(8936002)(6916009)(478600001)(36756003)(2906002)(6512007)(66946007)(91956017)(86362001)(30864003)(66556008)(66446008)(76116006)(6506007)(64756008)(66476007)(5660300002)(53546011)(54906003)(186003)(83380400001)(4326008)(7416002)(316002)(71200400001)(2616005)(8676002)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 077GW5TkQ3O+/Z/8m68LE7h34dlG/7W1wreqtgG9rmw32uWHE6rBvb1KvYhrbbLk7ZGNsHp2/A2psGXtPcO8FaaJFRtxaKGw9ktFR0m9PwEB7EawybEV/L6JXatLGFB5F9FUFBDdsVkOCppPaG1G5uihEuHAOyVn3d2DNEGUmTFb2WX2Cu42GYALQFf3dtQ5+a5wmzC6woLoNEDtS8t83ZyhOtpOHE5EBoybgJ84+bl4lxQA7bbFmYj0rPjieJmX0L3iNhaQpMLC1Pz71UJ0B47iBDMjPAyceERolYqGesQlNfwxVig8ue459Qtuc3JtD8FZI7iMde2qpNf7D2IzhQpQajpxNLLDZ9xdW8jWh6yaOF3P2KjTRg8j21RPTIQQpY2Kly5nDuhrnfd6nHgirKF2X8QIW9vzpnNmpFEO3e13bYsxuPW5uM69bssF2VNKYB4liD69iVay7KPoHdUx8Dvi/uOFbPbqYOqDS/FaAB+gOP7o/AmkBRpoY6shti+SeKnoaTzYddg5Qxd+ODPsnjosMIukPLXLi4cAB7R92bonsMGDpu7KBbrpLVXOyJNI
x-ms-exchange-transport-forked: True
Content-ID: <71322A951D55FD45B5F093813081DF4D@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5490ea5-f938-4b18-b90e-08d82e088476
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 06:28:58.7985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c9n3q3WQyzfXhp3B94aY2kQdg/DPaACzmQlTz8hOly07OD5fFxE6gaUD7KbKrDzuhbcx+tfbFLcRm4e4erAlBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0729
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "helgaas@kernel.org" <helgaas@kernel.org>,
 "pjk1939@linux.ibm.com" <pjk1939@linux.ibm.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "josh.h.morris@us.ibm.com" <josh.h.morris@us.ibm.com>
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

On Tue, 2020-07-21 at 12:39 +0530, Vaibhav Gupta wrote:
> On Tue, Jul 21, 2020 at 02:57:28AM +0000, Damien Le Moal wrote:
> > On 2020/07/20 22:32, Vaibhav Gupta wrote:
> > > Drivers using legacy PM have to manage PCI states and device's PM states
> > > themselves. They also need to take care of configuration registers.
> > > 
> > > With improved and powerful support of generic PM, PCI Core takes care of
> > > above mentioned, device-independent, jobs.
> > > 
> > > This driver makes use of PCI helper functions like
> > > pci_save/restore_state(), pci_enable/disable_device(),
> > > pci_request/release_regions(), pci_set_power_state() and
> > > pci_set_master() to do required operations. In generic mode, they are no
> > > longer needed.
> > > 
> > > Change function parameter in both .suspend() and .resume() to
> > > "struct device*" type. Use to_pci_dev() to get "struct pci_dev*" variable.
> > 
> > This commit message is rather vague, and the last sentence actually does not
> > describe correctly the change. What about something very simple, yet clear, like
> > this:
> > 
> > skd: use generic power management
> > 
> > Switch from the legacy .suspend()/.resume() power management interface to the
> > generic power management interface using the single .driver.pm() method. This
> > avoids the need for the driver to directly call most of the PCI helper functions
> > and device power state control functions as the generic power management
> > interface takes care of the necessary operations.
> > 
> Okay. I will improve on it. Just inform me after testing that if any other
> changes are required. I guess [PATCH 1/3] and [PATCH 2/3] are okay, so I will
> only send v3 of [PATCH 3/3] after suggested changes.
> > > Compile-tested only.
> > > 
> > > Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> > > ---
> > >  drivers/block/skd_main.c | 30 ++++++++----------------------
> > >  1 file changed, 8 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
> > > index 51569c199a6c..7f2d42900b38 100644
> > > --- a/drivers/block/skd_main.c
> > > +++ b/drivers/block/skd_main.c
> > > @@ -3315,10 +3315,11 @@ static void skd_pci_remove(struct pci_dev *pdev)
> > >  	return;
> > >  }
> > >  
> > > -static int skd_pci_suspend(struct pci_dev *pdev, pm_message_t state)
> > > +static int __maybe_unused skd_pci_suspend(struct device *dev)
> > >  {
> > >  	int i;
> > >  	struct skd_device *skdev;
> > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > >  
> > >  	skdev = pci_get_drvdata(pdev);
> > >  	if (!skdev) {
> > > @@ -3337,18 +3338,15 @@ static int skd_pci_suspend(struct pci_dev *pdev, pm_message_t state)
> > >  	if (skdev->pcie_error_reporting_is_enabled)
> > >  		pci_disable_pcie_error_reporting(pdev);
> > >  
> > > -	pci_release_regions(pdev);
> > > -	pci_save_state(pdev);
> > > -	pci_disable_device(pdev);
> > > -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
> > >  	return 0;
> > >  }
> > >  
> > > -static int skd_pci_resume(struct pci_dev *pdev)
> > > +static int __maybe_unused skd_pci_resume(struct device *dev)
> > >  {
> > >  	int i;
> > >  	int rc = 0;
> > >  	struct skd_device *skdev;
> > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > >  
> > >  	skdev = pci_get_drvdata(pdev);
> > >  	if (!skdev) {
> > > @@ -3356,16 +3354,8 @@ static int skd_pci_resume(struct pci_dev *pdev)
> > >  		return -1;
> > >  	}
> > >  
> > > -	pci_set_power_state(pdev, PCI_D0);
> > > -	pci_enable_wake(pdev, PCI_D0, 0);
> > > -	pci_restore_state(pdev);
> > > +	device_wakeup_disable(dev);
> > >  
> > > -	rc = pci_enable_device(pdev);
> > > -	if (rc)
> > > -		return rc;
> > > -	rc = pci_request_regions(pdev, DRV_NAME);
> > > -	if (rc)
> > > -		goto err_out;
> > >  	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
> > >  	if (rc)
> > >  		rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> > > @@ -3374,7 +3364,6 @@ static int skd_pci_resume(struct pci_dev *pdev)
> > >  		goto err_out_regions;
> > >  	}
> > >  
> > > -	pci_set_master(pdev);
> > >  	rc = pci_enable_pcie_error_reporting(pdev);
> > >  	if (rc) {
> > >  		dev_err(&pdev->dev,
> > > @@ -3427,10 +3416,6 @@ static int skd_pci_resume(struct pci_dev *pdev)
> > >  		pci_disable_pcie_error_reporting(pdev);
> > >  
> > >  err_out_regions:
> > > -	pci_release_regions(pdev);
> > > -
> > > -err_out:
> > > -	pci_disable_device(pdev);
> > >  	return rc;
> > >  }
> > >  
> > > @@ -3450,13 +3435,14 @@ static void skd_pci_shutdown(struct pci_dev *pdev)
> > >  	skd_stop_device(skdev);
> > >  }
> > >  
> > > +static SIMPLE_DEV_PM_OPS(skd_pci_pm_ops, skd_pci_suspend, skd_pci_resume);
> > > +
> > >  static struct pci_driver skd_driver = {
> > >  	.name		= DRV_NAME,
> > >  	.id_table	= skd_pci_tbl,
> > >  	.probe		= skd_pci_probe,
> > >  	.remove		= skd_pci_remove,
> > > -	.suspend	= skd_pci_suspend,
> > > -	.resume		= skd_pci_resume,
> > > +	.driver.pm	= &skd_pci_pm_ops,
> > >  	.shutdown	= skd_pci_shutdown,
> > >  };
> > >  
> > > 
> > 
> > Apart from the commit message, this looks OK to me.
> > I will give this a spin today on the hardware to check.
> > 
> Thanks!

Tested this and it seems OK.

Of note, after having removed the device (echo 1 >
/sys/block/skd0/device/remove) and rescaning its PCI slot, I got a
lockdep splat:

[ 4449.098757] ======================================================
[ 4449.104945] WARNING: possible circular locking dependency detected
[ 4449.111136] 5.8.0-rc6+ #846 Not tainted
[ 4449.114980] ------------------------------------------------------
[ 4449.121168] tcsh/1550 is trying to acquire lock:
[ 4449.125798] ffffffffa85c3748 (pci_rescan_remove_lock){+.+.}-{3:3},
at: dev_rescan_store+0x38/0x60
[ 4449.134686] 
[ 4449.134686] but task is already holding lock:
[ 4449.140522] ffff8f6cd352ed28 (kn->active#294){++++}-{0:0}, at:
kernfs_fop_write+0xad/0x1c0
[ 4449.148795] 
[ 4449.148795] which lock already depends on the new lock.
[ 4449.148795] 
[ 4449.156979] 
[ 4449.156979] the existing dependency chain (in reverse order) is:
[ 4449.164464] 
[ 4449.164464] -> #1 (kn->active#294){++++}-{0:0}:
[ 4449.170486]        __kernfs_remove+0x276/0x2f0
[ 4449.174939]        kernfs_remove_by_name_ns+0x41/0x80
[ 4449.180001]        remove_files+0x2b/0x60
[ 4449.184018]        sysfs_remove_group+0x38/0x80
[ 4449.188560]        sysfs_remove_groups+0x29/0x40
[ 4449.193190]        device_remove_attrs+0x4b/0x70
[ 4449.197818]        device_del+0x167/0x3f0
[ 4449.201843]        pci_remove_bus_device+0x70/0x110
[ 4449.206728]        pci_stop_and_remove_bus_device_locked+0x1e/0x30
[ 4449.212915]        remove_store+0x55/0x60
[ 4449.216939]        kernfs_fop_write+0xd9/0x1c0
[ 4449.221398]        vfs_write+0xc7/0x1f0
[ 4449.225239]        ksys_write+0x58/0xd0
[ 4449.229089]        do_syscall_64+0x4f/0x2c0
[ 4449.233284]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 4449.238863] 
[ 4449.238863] -> #0 (pci_rescan_remove_lock){+.+.}-{3:3}:
[ 4449.245575]        __lock_acquire+0x1194/0x1fd0
[ 4449.250113]        lock_acquire+0x97/0x390
[ 4449.254221]        __mutex_lock+0x58/0x820
[ 4449.258330]        dev_rescan_store+0x38/0x60
[ 4449.262697]        kernfs_fop_write+0xd9/0x1c0
[ 4449.267154]        vfs_write+0xc7/0x1f0
[ 4449.270999]        ksys_write+0x58/0xd0
[ 4449.274846]        do_syscall_64+0x4f/0x2c0
[ 4449.279041]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 4449.284620] 
[ 4449.284620] other info that might help us debug this:
[ 4449.284620] 
[ 4449.292628]  Possible unsafe locking scenario:
[ 4449.292628] 
[ 4449.298555]        CPU0                    CPU1
[ 4449.303090]        ----                    ----
[ 4449.307630]   lock(kn->active#294);
[
4449.311131]                                lock(pci_rescan_remove_lock
);
[ 4449.317838]                                lock(kn->active#294);
[ 4449.323855]   lock(pci_rescan_remove_lock);
[ 4449.328048] 
[ 4449.328048]  *** DEADLOCK ***
[ 4449.328048] 
[ 4449.333977] 3 locks held by tcsh/1550:
[ 4449.337731]  #0: ffff8f6f18b7d448 (sb_writers#4){.+.+}-{0:0}, at:
vfs_write+0x174/0x1f0
[ 4449.345747]  #1: ffff8f6e74d09a88 (&of->mutex){+.+.}-{3:3}, at:
kernfs_fop_write+0xa5/0x1c0
[ 4449.354111]  #2: ffff8f6cd352ed28 (kn->active#294){++++}-{0:0}, at:
kernfs_fop_write+0xad/0x1c0
[ 4449.362821] 
[ 4449.362821] stack backtrace:
[ 4449.367192] CPU: 15 PID: 1550 Comm: tcsh Not tainted 5.8.0-rc6+ #846
[ 4449.373548] Hardware name: Supermicro Super Server/X11DPL-i, BIOS
3.1 05/21/2019
[ 4449.380953] Call Trace:
[ 4449.383419]  dump_stack+0x78/0xa0
[ 4449.386744]  check_noncircular+0x12d/0x150
[ 4449.390853]  __lock_acquire+0x1194/0x1fd0
[ 4449.394875]  lock_acquire+0x97/0x390
[ 4449.398462]  ? dev_rescan_store+0x38/0x60
[ 4449.402486]  __mutex_lock+0x58/0x820
[ 4449.406067]  ? dev_rescan_store+0x38/0x60
[ 4449.410090]  ? dev_rescan_store+0x38/0x60
[ 4449.414113]  ? lock_acquire+0x97/0x390
[ 4449.417876]  ? kernfs_fop_write+0xad/0x1c0
[ 4449.421983]  dev_rescan_store+0x38/0x60
[ 4449.425831]  kernfs_fop_write+0xd9/0x1c0
[ 4449.429768]  vfs_write+0xc7/0x1f0
[ 4449.433092]  ksys_write+0x58/0xd0
[ 4449.436421]  do_syscall_64+0x4f/0x2c0
[ 4449.440094]  ? prepare_exit_to_usermode+0xa/0x40
[ 4449.444725]  ? rcu_read_lock_sched_held+0x3f/0x50
[ 4449.449436]  ? asm_exc_page_fault+0x8/0x30
[ 4449.453546]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 4449.458608] RIP: 0033:0x7fcce58f45e7
[ 4449.462191] Code: Bad RIP value.
[ 4449.465426] RSP: 002b:00007fff2592c898 EFLAGS: 00000246 ORIG_RAX:
0000000000000001
[ 4449.473000] RAX: ffffffffffffffda RBX: 0000000000000002 RCX:
00007fcce58f45e7
[ 4449.480141] RDX: 0000000000000002 RSI: 0000556d30b96100 RDI:
0000000000000001
[ 4449.487283] RBP: 0000556d30b96100 R08: 0000000000000000 R09:
00007fff2592c7f0
[ 4449.494425] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000001
[ 4449.501567] R13: 0000556d31fc4fb8 R14: 0000556d31fc37c0 R15:
0000556d31fc4fb4
[ 4449.520721] pci 0000:d8:00.0: [1b39:0001] type 00 class 0x018000
[ 4449.526802] pci 0000:d8:00.0: reg 0x10: [mem 0xfbe00000-0xfbe0ffff]
[ 4449.533121] pci 0000:d8:00.0: reg 0x14: [mem 0xfbe10000-0xfbe10fff]
[ 4449.539474] pci 0000:d8:00.0: reg 0x30: [mem 0xfbd00000-0xfbdfffff
pref]
[ 4449.546327] pci 0000:d8:00.0: supports D1 D2
[ 4449.550936] pci 0000:d8:00.0: BAR 6: assigned [mem 0xfbd00000-
0xfbdfffff pref]
[ 4449.559804] pci 0000:d8:00.0: BAR 0: assigned [mem 0xfbe00000-
0xfbe0ffff]
[ 4449.568849] pci 0000:d8:00.0: BAR 1: assigned [mem 0xfbe10000-
0xfbe10fff]
[ 4449.577178] skd 0000:d8:00.0: PCIe (5.0GT/s 4X) 64bit
[ 4449.582272] skd 0000:d8:00.0: bad enable of PCIe error reporting
rc=-5
[ 4449.589764] skd 0000:d8:00.0: s1120 state INIT(1)=>SOFT_RESET(8)
[ 4449.595788] skd 0000:d8:00.0: Driver state STARTING(3)=>STARTING(3)
[ 4449.829900] skd 0000:d8:00.0: s1120 state SOFT_RESET(8)=>INIT(1)
[ 4449.835929] skd 0000:d8:00.0: Driver state STARTING(3)=>STARTING(3)
[ 4450.076148] skd 0000:d8:00.0: Time sync driver=0x5f17d872
device=0x162bdfe9
[ 4450.083139] skd 0000:d8:00.0: s1120 state INIT(1)=>ONLINE(3)
[ 4450.088822] skd 0000:d8:00.0: Queue depth limit=64 dev=255 lowat=43
[ 4450.095101] skd 0000:d8:00.0: Driver state STARTING(3)=>STARTING(3)
[ 4450.101539] skd 0000:d8:00.0: Driver state STARTING(3)=>ONLINE(4)
[ 4450.107653] skd 0000:d8:00.0: STEC s1120 ONLINE
[ 4450.120422]  skd1: p1

But that looks completely unrelated to your patch. Will have a look at
this.

-- 
Damien Le Moal
Western Digital Research
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
