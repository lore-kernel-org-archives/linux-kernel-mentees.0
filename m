Return-Path: <SRS0=mJtO=BC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E09C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 06:58:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 691A920825
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 06:58:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="a24thipV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="C0r6xIXQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 691A920825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2B39189996;
	Thu, 23 Jul 2020 06:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EDFK9evxH5C8; Thu, 23 Jul 2020 06:58:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 56D1A888EA;
	Thu, 23 Jul 2020 06:58:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 491FBC004D;
	Thu, 23 Jul 2020 06:58:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A10F0C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 06:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8C86289069
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 06:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FClkCD8LA2M4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 06:58:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from esa4.microchip.iphmx.com (esa4.microchip.iphmx.com
 [68.232.154.123])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 316B689003
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 06:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595487533; x=1627023533;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DNOxSZZRtnNDy3jdfwoP6+oxPD4jvw7bVCrSrXSEY78=;
 b=a24thipVC9lelKgjUypZH2/ejD+pExVfoyJY9FBWCDMqFO0LIqYghvJ+
 d4Gomixu5CLJsDxFXXfGzWSpOPj4BEQrgxsqJbYnez8LySIhKxiruuH/0
 1dJcZS/RTwtdKNpyUEIeDdf/G+Bd62zKVGSZICRnUO+c7prUGPqbE9xWR
 8bWVKMB/Gv3ZfvFJVftIKJMrp3zAzUULoQ2vBQZmiouZ2xT1jPCPLeh3m
 gpcvL/ApK+tVDr8Gv64riaF5G76U16wtY6HmqwVRFY7KZAkb51CKC+mLG
 YZrG06MTzh6orXaMcou+FxuFxgw4dpx9UcJAZ+Kp7j3Mw6tmWrtI9ZB/C A==;
IronPort-SDR: Pp3J/uxg5UNuMsrr0PXt51amK6KC8RoIlwY03/78GLs+76IXY4n+aKY85x6jV9PGhzucluRBr7
 RXZIAcWBx6oJ8A81DF++mSYs6jfFeuOvUw/OxrlKgfUWTFT0BSfxkI5tHLZg5d5XTsnyt1TlZO
 mcgrjvblhcosrtwZ8Y6dynxfoJPI7vp3T+cMR2z08cC2frd6eag1VG70GoHMPKCICaajureHlb
 ucdRqk1idMO2SPa1FlWvpBJYkNF+dUXJiKP6HcywuYjBhwF950e9UQCWGkkspbepJRkt076dM/
 NHs=
X-IronPort-AV: E=Sophos;i="5.75,385,1589266800"; d="scan'208";a="81001661"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jul 2020 23:58:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 22 Jul 2020 23:58:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 22 Jul 2020 23:58:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dha9v1Mkhhx9cxjrJVoBpRcJf5FYO7HVn+UKZydPZryj0qP04+Hp0W48V1RV0AZeATph7x+qUsfW7tUMQYFkf7HKwnBXXo6miyjYM99Fax5eeaeqhWFwwm7X/dRYF4ZY41XrVQ7qdddW0DFZ4aej/DOuwXRONVAqwHxfli3Vf0U9DGV0vzgBpdo8RYJ1oSZUzVX/eBw4jop7k5RTrAEebazpKgU+95lR8UFzAfMOeV+lDoSM60Lbe2bXSlHVUXd8nV+Ro71QWR2K9LFnItCFKeF7o1xNpFuFachrh8wRDhOByORrsq620HwEBgVtrVOtE1smgjB3gbEk//rBlI2P/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7kIWOOWEpZMo4WWqlyJyCavySgsgn+ZFHgkUNspZDA=;
 b=BCLO4uSt5b1UMaeREZOvudDWVbnzxsxFxUrz2NU4RgMBfgb6/PkB6kaYFzZiuN78OwvzpDc3bKcywNlsn6ngSKQiDG8yL7uh0oShL36MAxGqkxu4Bg3RU52bPwjRikiv5MeTGV1Bzl2v4p9U/bx3OPqdd3j0fOhcncLIwX2MBj0Zpv79Rrk2ImuQT7qcy5UhRE11i6sLcgYnBAOYIOamIwYRbhZptMWuFhuCP1yM5shT76sSIrZskVQfG9CtGjcHNYHLytoLCitNgIjhDBmmaHkD+/yipW3rCP6a/wBIJET+dYd4QjZjzmLmADI9Tuq4KVSB1csGsgQp8r9611F1mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7kIWOOWEpZMo4WWqlyJyCavySgsgn+ZFHgkUNspZDA=;
 b=C0r6xIXQp0BRVcWD0Vs0Aet2vpqp7mVYGeEEjlw3ioxZgfvwSEiC5P/RnIfIJmiVWcXaAX+DruT+e4mEOQNKDvHyXM4cMfDjgODOzlFfxsef+xKaM9P6OnxJ8tOAZEvlP6M6wwuYqD4+0glykVhI18U81Lhj1sDzqtcmxVS1p1E=
Received: from BYAPR11MB3831.namprd11.prod.outlook.com (2603:10b6:a03:b0::22)
 by BYAPR11MB2888.namprd11.prod.outlook.com (2603:10b6:a03:8c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Thu, 23 Jul
 2020 06:58:49 +0000
Received: from BYAPR11MB3831.namprd11.prod.outlook.com
 ([fe80::c09:4207:4014:460]) by BYAPR11MB3831.namprd11.prod.outlook.com
 ([fe80::c09:4207:4014:460%6]) with mapi id 15.20.3216.023; Thu, 23 Jul 2020
 06:58:49 +0000
To: <vaibhavgupta40@gmail.com>, <helgaas@kernel.org>, <bhelgaas@google.com>,
 <bjorn@helgaas.com>, <vaibhav.varodek@gmail.com>, <aradford@gmail.com>,
 <jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <aacraid@microsemi.com>,
 <hare@suse.com>, <linuxdrivers@attotech.com>, <john.garry@huawei.com>,
 <don.brace@microsemi.com>, <james.smart@broadcom.com>,
 <dick.kennedy@broadcom.com>, <kashyap.desai@broadcom.com>,
 <sumit.saxena@broadcom.com>, <shivasharan.srikanteshwara@broadcom.com>,
 <sathya.prakash@broadcom.com>, <sreekanth.reddy@broadcom.com>,
 <suganath-prabu.subramani@broadcom.com>, <jinpu.wang@cloud.ionos.com>
Thread-Topic: [PATCH v2 02/15] scsi: aacraid: use generic power management
Thread-Index: AQHWXprxQI1rPwfQfU2tcqKwgKJ7OakUv7Yw
Date: Thu, 23 Jul 2020 06:58:49 +0000
Message-ID: <BYAPR11MB3831E110B65E8807544B98B8F3760@BYAPR11MB3831.namprd11.prod.outlook.com>
References: <20200720133427.454400-1-vaibhavgupta40@gmail.com>
 <20200720133427.454400-3-vaibhavgupta40@gmail.com>
In-Reply-To: <20200720133427.454400-3-vaibhavgupta40@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [122.181.32.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18226541-1307-4fd4-6a25-08d82ed5da44
x-ms-traffictypediagnostic: BYAPR11MB2888:
x-microsoft-antispam-prvs: <BYAPR11MB288836DD00BCCFF8BD3B6BBBF3760@BYAPR11MB2888.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sk+Nuw69MEt8le1h+CdILr8Z3CMWWYpxFewg9GqOIRzrtC5x7DERZHQAE+KfSohIxs2cvqvlbmNFsKAZOl9bKdru1F6DRr2Ud3bs/z6nKcYyZM/9KY9FH1SBRK17ffrgF9/mhHWDfmRf9Zfwj7/nXg+1i0pOKvYXlVU+6dXNrX4d2c/42dyeS3F0W1ZdM+5fx3FhyBMR+ytO5//I1dABS1VmYYqb8mqmzKAj5OmvqG7L9mWMN10LtMUMvZHahQlJdiJtbFKobzJX/zF7DQlGGH1DhSyxe4VVHoHP2CYrF1NocXNKsM59eTbUysT7RF8ka10/pS2Rwb2wvLv2uu4mhOTGW4hIIHIDA3c+KcZ98ZhPAAxxPuv9Wwv6E2cAeW8/2/mEUcMUWj/AI7XuRrVjsA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3831.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(39860400002)(346002)(376002)(136003)(366004)(26005)(55016002)(186003)(110136005)(54906003)(76116006)(52536014)(53546011)(66946007)(83380400001)(9686003)(71200400001)(7696005)(4326008)(316002)(478600001)(6506007)(8676002)(66556008)(66476007)(33656002)(86362001)(7416002)(2906002)(8936002)(66446008)(5660300002)(64756008)(41533002)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Eo5fykVtUWioYLqz1aMELqdQop6vY67Qrq958Mp51xHVzPdLZlc6IqQ6Rd718Z8xbPq41L2xNjdxcO9S5mmNf0i6bGTUacjS4QYfhkKHQ2RRewMvsTm2OSVlNgox+6VISKCpcDuvWnLUT+ATgOE8AkwPADe+WQeZEego2G/UoA3Vk+dWLtgdaLO47F6JGFRY6I2nOMnhbpluuPjHaazoTZ/Y/L3z9LdZP3OyKN+yycFXvZvP+PbFQjc/1qAT/Vi+1nfn5BXy6uzTO1uBCFAI8FLQ3JHG4OKQWuA6KpNQbXHc2UMcg6edFEw7yzGewyqSlaXKu2LTvv3+FuhVC1gzhjWWMhkdCD0PHY85mggLb+M6AwCfgv0KzU+qhGR0cytSzxqz7mC5NP+6hFdB6i3Gy7Z3HZOk3cyA1vQyspaWJs0t5aWUi8ZUTJpu+j1iGtrWNpM3CTMS73qFWjx05SJ8y4c8ZK7+QrzwVtTpYpvTOd7ixgCHqz86Nzack3r7bOUG
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3831.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18226541-1307-4fd4-6a25-08d82ed5da44
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2020 06:58:49.4495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HTHEV8hYNwW3cTmYmvqx/QwZkWwje1jjMUYJ8dL8vscDj9CQKln451M/w179o1YxK/hQsdlK7ZuXfq/3aiZbhKLPGbtNpcaMULLj+WvdA8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2888
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2 02/15] scsi: aacraid: use
	generic power management
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
From: "Balsundar.P--- via Linux-kernel-mentees"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Balsundar.P@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Acked-by: Balsundar P < balsundar.p@microchip.com>

-----Original Message-----
From: Vaibhav Gupta <vaibhavgupta40@gmail.com> 
Sent: Monday, July 20, 2020 19:04
To: Bjorn Helgaas <helgaas@kernel.org>; Bjorn Helgaas <bhelgaas@google.com>; Bjorn Helgaas <bjorn@helgaas.com>; Vaibhav Gupta <vaibhav.varodek@gmail.com>; Adam Radford <aradford@gmail.com>; James E.J. Bottomley <jejb@linux.ibm.com>; Martin K. Petersen <martin.petersen@oracle.com>; Adaptec OEM Raid Solutions <aacraid@microsemi.com>; Hannes Reinecke <hare@suse.com>; Bradley Grove <linuxdrivers@attotech.com>; John Garry <john.garry@huawei.com>; Don Brace <don.brace@microsemi.com>; James Smart <james.smart@broadcom.com>; Dick Kennedy <dick.kennedy@broadcom.com>; Kashyap Desai <kashyap.desai@broadcom.com>; Sumit Saxena <sumit.saxena@broadcom.com>; Shivasharan S <shivasharan.srikanteshwara@broadcom.com>; Sathya Prakash <sathya.prakash@broadcom.com>; Sreekanth Reddy <sreekanth.reddy@broadcom.com>; Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>; Jack Wang <jinpu.wang@cloud.ionos.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>; Shuah Khan <skhan@linuxfoundation.org>; linux-kernel@vger.kernel.org; linux-kernel-mentees@lists.linuxfoundation.org; linux-scsi@vger.kernel.org; esc.storagedev@microsemi.com; megaraidlinux.pdl@broadcom.com; MPT-FusionLinux.pdl@broadcom.com
Subject: [PATCH v2 02/15] scsi: aacraid: use generic power management

EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe

With legacy PM hooks, it was the responsibility of a driver to manage PCI states and also the device's power state. The generic approach is to let the PCI core handle the work.

PCI core passes "struct device*" as an argument to the .suspend() and
.resume() callbacks.

Driver was using PCI helper functions like pci_save/restore_state(), pci_disable/enable_device(), pci_set_power_state() and pci_enable_wake().
They should not be invoked by the driver.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/scsi/aacraid/linit.c | 34 ++++++++--------------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/scsi/aacraid/linit.c b/drivers/scsi/aacraid/linit.c index a308e86a97f1..1e44868ee953 100644
--- a/drivers/scsi/aacraid/linit.c
+++ b/drivers/scsi/aacraid/linit.c
@@ -1910,11 +1910,9 @@ static int aac_acquire_resources(struct aac_dev *dev)

 }

-#if (defined(CONFIG_PM))
-static int aac_suspend(struct pci_dev *pdev, pm_message_t state)
+static int __maybe_unused aac_suspend(struct device *dev)
 {
-
-       struct Scsi_Host *shost = pci_get_drvdata(pdev);
+       struct Scsi_Host *shost = dev_get_drvdata(dev);
        struct aac_dev *aac = (struct aac_dev *)shost->hostdata;

        scsi_host_block(shost);
@@ -1923,29 +1921,16 @@ static int aac_suspend(struct pci_dev *pdev, pm_message_t state)

        aac_release_resources(aac);

-       pci_set_drvdata(pdev, shost);
-       pci_save_state(pdev);
-       pci_disable_device(pdev);
-       pci_set_power_state(pdev, pci_choose_state(pdev, state));
-
        return 0;
 }

-static int aac_resume(struct pci_dev *pdev)
+static int __maybe_unused aac_resume(struct device *dev)
 {
-       struct Scsi_Host *shost = pci_get_drvdata(pdev);
+       struct Scsi_Host *shost = dev_get_drvdata(dev);
        struct aac_dev *aac = (struct aac_dev *)shost->hostdata;
-       int r;

-       pci_set_power_state(pdev, PCI_D0);
-       pci_enable_wake(pdev, PCI_D0, 0);
-       pci_restore_state(pdev);
-       r = pci_enable_device(pdev);
+       device_wakeup_disable(dev);

-       if (r)
-               goto fail_device;
-
-       pci_set_master(pdev);
        if (aac_acquire_resources(aac))
                goto fail_device;
        /*
@@ -1960,10 +1945,8 @@ static int aac_resume(struct pci_dev *pdev)
 fail_device:
        printk(KERN_INFO "%s%d: resume failed.\n", aac->name, aac->id);
        scsi_host_put(shost);
-       pci_disable_device(pdev);
        return -ENODEV;
 }
-#endif

 static void aac_shutdown(struct pci_dev *dev)  { @@ -2108,15 +2091,14 @@ static struct pci_error_handlers aac_pci_err_handler = {
        .resume                 = aac_pci_resume,
 };

+static SIMPLE_DEV_PM_OPS(aac_pm_ops, aac_suspend, aac_resume);
+
 static struct pci_driver aac_pci_driver = {
        .name           = AAC_DRIVERNAME,
        .id_table       = aac_pci_tbl,
        .probe          = aac_probe_one,
        .remove         = aac_remove_one,
-#if (defined(CONFIG_PM))
-       .suspend        = aac_suspend,
-       .resume         = aac_resume,
-#endif
+       .driver.pm      = &aac_pm_ops,
        .shutdown       = aac_shutdown,
        .err_handler    = &aac_pci_err_handler,
 };
--
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
