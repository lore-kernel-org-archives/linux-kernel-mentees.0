Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE3BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 02:56:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E5EC2065F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 02:56:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="FLzNncNX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="t4Z9ZF6B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E5EC2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2583B2201C;
	Tue, 21 Jul 2020 02:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sroqmFOOdIQn; Tue, 21 Jul 2020 02:56:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7683D204E4;
	Tue, 21 Jul 2020 02:56:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A402C0894;
	Tue, 21 Jul 2020 02:56:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 231C9C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 02:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 122F4862B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 02:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Md0lKncQpuzT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 02:56:15 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.7.6
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D483086166
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 02:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595300175; x=1626836175;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=cyslQVh3F0gfd/VjsO3hDxS14+xeKMHg/tLtqjLH5ug=;
 b=FLzNncNXAmCtZPo16oZ78LwnXiXug4iKHfx3zuDeSEv7VqDUec/qmt5g
 xFK8SnYUfBUZJAyA/iBIsD7ZpiiCD/I92qt2uADLWj2yuac1PcRMH0Qqr
 Abv5c1U2bXdcNfna4zX+TxiRjh6lu+FWuGY7BircXYgnXN56oy93HNhkc
 RQBBQBLpSuBg/XECOzDrBbkeuuYZew9oaUAPMPqsgYVfDifdvbn0qYnO1
 K0rQW/FCS7OZK+LBd27roVdboijNMPEvFQm5PDZ1Qu7CLbX6W1SXrIeL2
 q4pqTrFPaVrHVU3mYRb0Gbn5xS1zt2+k9TTYGAmfg5+0wedwsNpIfYPK4 g==;
IronPort-SDR: z14ogrvk6FHSNFtjKhzkvK5FT1joKetHqxpSN/YoVdnb1FrIx6X/GJU/a2v42KK2gm3R51kXEl
 OTA8uxbjqNZzusWOvSxjOBxFITHViznwaiKf7V7hy1PJ9GkGnqapAuluXXBNBjS/MHRd8Q38cs
 MoKQ31nd7FFthDZ6Bshkm547+bBKe8va3km/0V7elgdGKDb5xeA0mdvFEZDYVrcFCEpPJBYk/h
 BIrx0UTE8sp5TEvN8qR3++i9QU+mhoUST5l9PgjBWGkPrwVeqn5V8YiSruQlgMzWC3F0Wyud2n
 e34=
X-IronPort-AV: E=Sophos;i="5.75,377,1589212800"; d="scan'208";a="142974495"
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jul 2020 10:49:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZDBUe0bnc74bx+o4fg+JJEBXF6pdDnf9ACoEcuFJcrVSweA+6xpQ4IMD1r1Gx6pnveHsdorSt3EPKLsasJBTedOxTEbIgTAlKjldJuam0gduYFk4y6SN/qHruFDJxogFRpYXqTN6qG28T4S6++GkWVBdU0G3ik6h+jEKrqikujqot1+jj8jv9pv+mmly/VQC217DCzVqy6S6V5koyexi0ovDRbYSH3rM4qU100oZfSVQM4u4aPyCewYHGfjBRcFbh3xyA8Lb4XF9qYbyyLjto13pRQMJNwGD1agFoQNBpKpkPDzbDhotYCJFFRLTgc32Jsdx80fJhLzCGt4gmO34w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8u9+32+uyALLdlURmFJSOACrp68yps216cmy3wADEfo=;
 b=Clgl7U7NxiibXIYgHyYk8DsQPD1hnypsUuWLI5BNSykq3OgAJb4cMPzvJtKr8Tpj5i7PNas9pbVbUvPM1Pl1fIFqiGS79ynPa9cJNJc9jSSmhOB8WKD5g0KoZBhiDYYDglzQq0e+T8P0ODsDi9/bEyz+Za39r0REhXUAprQBhLv2bGlc+f+tFGSFf+hWWcVG7RYz0cGBk47/hdGBgrydB8/lkZ48mrp7PZBRO++VdxFqb32o5els5Lmb/0mt8ez9GsUBj57wlEnFvBbE5M2guwPWt73om2Vo0abFNuKN93G9qLKTN2MESa9dtmpEVYF5jrNuXTxpMhVr/c2n+sSHzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8u9+32+uyALLdlURmFJSOACrp68yps216cmy3wADEfo=;
 b=t4Z9ZF6BRuU6fTalWHghxO5CVykVSkGxNRQHfOdMrRDSWDdIVUXXLJ8kA15BJsDAQN1V5omBn6I1ffCYQa6tdNrtVPwgzc2oIwktPJ56eMXVh19QevrwCWY3yr5hAephAcsJ5TY8QEmeeBp6UhUkp61TEXRfReTWpEVw9R0k1vY=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB0342.namprd04.prod.outlook.com (2603:10b6:903:3f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Tue, 21 Jul
 2020 02:49:06 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3195.025; Tue, 21 Jul 2020
 02:49:06 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Thread-Topic: [PATCH v1 3/3] skd: use generic power management
Thread-Index: AQHWXBHK3yyvSpv7dkelMB844h700w==
Date: Tue, 21 Jul 2020 02:49:06 +0000
Message-ID: <CY4PR04MB3751EB3DA357A6856B3337D0E7780@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200717080910.342741-1-vaibhavgupta40@gmail.com>
 <20200717080910.342741-4-vaibhavgupta40@gmail.com>
 <CY4PR04MB37516C5544A7DCAD84921937E77B0@CY4PR04MB3751.namprd04.prod.outlook.com>
 <20200720131627.GA447599@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0984d12f-e396-4b19-a57c-08d82d20a2d2
x-ms-traffictypediagnostic: CY4PR04MB0342:
x-microsoft-antispam-prvs: <CY4PR04MB0342EDFA4294E07F17152C1FE7780@CY4PR04MB0342.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ghh4PKc1uZkAOPKfZgtFULuQnS123rcjNUbQw9CSuLBoZEsg2VKQsNb1onzcmrgZ0+1tKgHNJmOgUVRC7y0xV8C1nr37H4AqRUXT0fMmiKzgGrhf8PTL2VmrYuf/mhzgWlep3r1PZHsI3/VH2eQGnZZ7lqJZjBHg5DlrrpTnkOLbWNO74yPF/pgTDtUeVOOcn4iXKVe+vIe+OlFv4TCqhhUvXv8xxlhMboLlkZtj8ZrV0HYlfahDtfJaAMMmYoNC/QFB36X2BWJzbFJmRwNbmnyXd69cb8rNsjb0gMT7sZxrqT0mmrTKTB5zgRg9ajeMh2pEVqOLDaP12GM/qrHxNtH6vIclOO8IFqX/5OT1jB6vXpsh/4ArcxQ9dIq7WwcV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(55016002)(9686003)(6916009)(8936002)(76116006)(7696005)(91956017)(26005)(64756008)(66476007)(66556008)(7416002)(66946007)(186003)(66446008)(6506007)(53546011)(33656002)(2906002)(478600001)(5660300002)(71200400001)(316002)(54906003)(86362001)(8676002)(52536014)(4326008)(83380400001)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pxty9KAp35cLYu6plltLF022SNnQ6M2PzOAw0tA5WldLoAt5b4U6IqnMJGUVEn0tE/4pDnQSibCLwVW9oob0MZJY9eRIg8gCTePYzkTsaX7NgkIdeKYPMHsn978KC0oeS+E1vqjPWpQyFl4JtkGmMQnE/IIPhNDskb/XKN/gCsQjr+8hFwEbnu5pwTL4VA42xyaa+IaISJxS0/7v7G/rqUZLJTYARTWC4bbw0kEo21gdyVmGKD4xFx3yaDXtFyUHzfVZaUKT4SV0+vTOQlrzNV5LbLJ++qIXLdhoS4qx9GYeumIFjtdZW8aSZLF2ChdmMUNuB1ov7KWkD2+1Bou2lNyvos3H/CsZjmtqI2b4NX4azy7bdy5y7I/bkn0tIQoWaglZFJF08HZmRMQITC4v3vfSFGpRvvv7T8BCrkpeGaKKE/KLRs6yxVRM3EbHSiId5sW3chzO1trndzkzY4ZNbVIhY060qfkMWgNgMxl1JNdzerFK3qf8mU1i2Swt8Nog
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0984d12f-e396-4b19-a57c-08d82d20a2d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 02:49:06.5273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UVn5SmPm/6LZftXXOmhdjdfbGImgqvSReTmabn1kw/sJcjaOtIynOIdfDhQQD99Lx25XgVmZdtSgXmMrknnxYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0342
Cc: Jens Axboe <axboe@kernel.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Joshua Morris <josh.h.morris@us.ibm.com>
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

On 2020/07/20 22:18, Vaibhav Gupta wrote:
> On Mon, Jul 20, 2020 at 12:52:14PM +0000, Damien Le Moal wrote:
>> On 2020/07/17 17:10, Vaibhav Gupta wrote:
>>> Drivers using legacy PM have to manage PCI states and device's PM states
>>> themselves. They also need to take care of configuration registers.
>>>
>>> With improved and powerful support of generic PM, PCI Core takes care of
>>> above mentioned, device-independent, jobs.
>>>
>>> This driver makes use of PCI helper functions like
>>> pci_save/restore_state(), pci_enable/disable_device(),
>>> pci_request/release_regions(), pci_set_power_state() and
>>> pci_set_master() to do required operations. In generic mode, they are no
>>> longer needed.
>>>
>>> Change function parameter in both .suspend() and .resume() to
>>> "struct device*" type. Use to_pci_dev() to get "struct pci_dev*" variable.
>>>
>>> Compile-tested only.
>>
>> I do not think this belongs into the commit message. This was mentioned in the
>> cover letter.
>>
> The messages in cover letter and commit message are bit similar. But the commit
> message has patch specific changes mentioned in it.

My point was about the "compile-tested only" mention in the commit message. That
should be mentioned in the cover letter only. The goal of the patch review
process is also to get these patches tested by others if you do not have access
to the hardware. That is fine, and I can test for the skd driver. But a patch
mentioning that it is untested cannot be applied, for obvious reasons :)

So I only requested that you remove the "compiled tested only" note. The commit
message could be simpler too, see followup comment.

>>>
>>> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
>>> ---
>>>  drivers/block/skd_main.c | 36 ++++++++++--------------------------
>>>  1 file changed, 10 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
>>> index 51569c199a6c..d8d1042e7338 100644
>>> --- a/drivers/block/skd_main.c
>>> +++ b/drivers/block/skd_main.c
>>> @@ -3315,12 +3315,12 @@ static void skd_pci_remove(struct pci_dev *pdev)
>>>  	return;
>>>  }
>>>  
>>> -static int skd_pci_suspend(struct pci_dev *pdev, pm_message_t state)
>>> +static int __maybe_unused skd_pci_suspend(struct device *dev)
>>>  {
>>>  	int i;
>>> -	struct skd_device *skdev;
>>> +	struct pci_dev *pdev = to_pci_dev(dev);
>>> +	struct skd_device *skdev = pci_get_drvdata(pdev);
>>
>> You can just add the pdev declaration here. The other 2 changes are not needed.
>>
> Okay.
>>>  
>>> -	skdev = pci_get_drvdata(pdev);
>>
>> You can keep this as is.
>>
>>>  	if (!skdev) {
>>>  		dev_err(&pdev->dev, "no device data for PCI\n");
>>>  		return -EIO;
>>> @@ -3337,35 +3337,23 @@ static int skd_pci_suspend(struct pci_dev *pdev, pm_message_t state)
>>>  	if (skdev->pcie_error_reporting_is_enabled)
>>>  		pci_disable_pcie_error_reporting(pdev);
>>>  
>>> -	pci_release_regions(pdev);
>>> -	pci_save_state(pdev);
>>> -	pci_disable_device(pdev);
>>> -	pci_set_power_state(pdev, pci_choose_state(pdev, state));
>>>  	return 0;
>>>  }
>>>  
>>> -static int skd_pci_resume(struct pci_dev *pdev)
>>> +static int __maybe_unused skd_pci_resume(struct device *dev)
>>>  {
>>>  	int i;
>>>  	int rc = 0;
>>> -	struct skd_device *skdev;
>>>  
>>> -	skdev = pci_get_drvdata(pdev);
>>
>> Same comment as above. Keep these as is and add only pdev declaration.
>>
> Okay.
> Sending v2 with suggested changes.
> 
> --Vaibhav Gupta
>>> +	struct pci_dev *pdev = to_pci_dev(dev);
>>> +	struct skd_device *skdev = pci_get_drvdata(pdev);
>>>  	if (!skdev) {
>>>  		dev_err(&pdev->dev, "no device data for PCI\n");
>>>  		return -1;
>>>  	}
>>>  
>>> -	pci_set_power_state(pdev, PCI_D0);
>>> -	pci_enable_wake(pdev, PCI_D0, 0);
>>> -	pci_restore_state(pdev);
>>> +	device_wakeup_disable(dev);
>>>  
>>> -	rc = pci_enable_device(pdev);
>>> -	if (rc)
>>> -		return rc;
>>> -	rc = pci_request_regions(pdev, DRV_NAME);
>>> -	if (rc)
>>> -		goto err_out;
>>>  	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>>>  	if (rc)
>>>  		rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>>> @@ -3374,7 +3362,6 @@ static int skd_pci_resume(struct pci_dev *pdev)
>>>  		goto err_out_regions;
>>>  	}
>>>  
>>> -	pci_set_master(pdev);
>>>  	rc = pci_enable_pcie_error_reporting(pdev);
>>>  	if (rc) {
>>>  		dev_err(&pdev->dev,
>>> @@ -3427,10 +3414,6 @@ static int skd_pci_resume(struct pci_dev *pdev)
>>>  		pci_disable_pcie_error_reporting(pdev);
>>>  
>>>  err_out_regions:
>>> -	pci_release_regions(pdev);
>>> -
>>> -err_out:
>>> -	pci_disable_device(pdev);
>>>  	return rc;
>>>  }
>>>  
>>> @@ -3450,13 +3433,14 @@ static void skd_pci_shutdown(struct pci_dev *pdev)
>>>  	skd_stop_device(skdev);
>>>  }
>>>  
>>> +static SIMPLE_DEV_PM_OPS(skd_pci_pm_ops, skd_pci_suspend, skd_pci_resume);
>>> +
>>>  static struct pci_driver skd_driver = {
>>>  	.name		= DRV_NAME,
>>>  	.id_table	= skd_pci_tbl,
>>>  	.probe		= skd_pci_probe,
>>>  	.remove		= skd_pci_remove,
>>> -	.suspend	= skd_pci_suspend,
>>> -	.resume		= skd_pci_resume,
>>> +	.driver.pm	= &skd_pci_pm_ops,
>>>  	.shutdown	= skd_pci_shutdown,
>>>  };
>>>  
>>>
>>
>>
>> -- 
>> Damien Le Moal
>> Western Digital Research
> 


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
