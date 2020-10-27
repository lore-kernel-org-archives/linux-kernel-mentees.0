Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416E2C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 16:17:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63704208B8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 16:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vNTXjJwY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="WmapINtf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63704208B8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D9E4284FDE;
	Tue, 27 Oct 2020 16:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ArtnvgoIrehL; Tue, 27 Oct 2020 16:17:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 43C8B84FC9;
	Tue, 27 Oct 2020 16:17:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27284C088B;
	Tue, 27 Oct 2020 16:17:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84130C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 16:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 727058444F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 16:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-qnyGyrng0t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 16:17:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from esa3.microchip.iphmx.com (esa3.microchip.iphmx.com
 [68.232.153.233])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2814C84FC9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 16:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1603815420; x=1635351420;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nfRimo1mT64N1RN/x9yiCH5n5Df6FWrG4IetxrEZmL4=;
 b=vNTXjJwYtY5CO5aikoLHILNISEx1xRTEPBzmkrHxtFJYMcWblhdIi4rv
 dYp0vp0Y5bFdseqOCfE4AHt3QvBMCMf6UBF+rFR7bk4n4bdG4GD1s4zo7
 gydLIBgyI5RHqyWMFArI9BaJSYCC4IGgdbp1Z1qzmqGXcd/AIVcrJIlFI
 i+fc+Ryc4lhOkQHaIqvOc2lQI+x+cC34YGM6btadqPfWQALDFsaaQFtEO
 3pwmF5KO6uveO2TNLHFr9kSWrksEnvKozsGDfPA81tjWPOstFIqzFv3Ym
 2F4BaoNb8fmBhIDH7z+VLJ2lO/UXo8agRtTlPnXQAl8M6Y997LkhDGuUE w==;
IronPort-SDR: /u1cBLoHDALoUUd13o9NfBw5GTeiam8QWDQS0QeZCID5T1HqrGg+jVXIiU/Mr8TY8UJLIIvtK7
 zTA/tH3aw4ns5yaX+qztlUkI4PlqlNutmPLJBVk/LnTVawzxJpJj0oXutTV60hhPQ55ygw+scG
 1yPBGH56SZgzU/YPOQHAOUzT5Qlge6vZ1l+TBbmSfjKe1Vcxuj0PHqUZhfUihlr0GFqKpEF6Nd
 yt4gx3lYt5DRtOMU9Mw9lyOEQIqembIaSb6SqxF5h8Ryg9O73TS7XuzHD7F0TTvCUZS5elFfQ9
 1Bw=
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="96790331"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Oct 2020 09:16:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 27 Oct 2020 09:16:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 27 Oct 2020 09:16:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfcNdG3yt6KQVNkaxW2gZRsytyuCrTRKE2SwbjBWti5QJZUcJQhNYO4sCEXOlspPsb0ufUqg/+ncnrGiCpUQmXL+n4CXRP+fiZpONpmSRcsARE0YgMRNbucEDNJF2ffxnkADShDbotZ8I02ZI9vTMEDXSV5XSOKVZaX1PqGScJN4LUwW6/LY88qNSbrfI/ToYmI7DIGH8bC+/HJ0yJiyleu9QXidkIjAzpyGJTOyXcXtTWnTrCZtPfyzAcrp927hMKQAsDR3nSefeOGhAfPKB6tUhS1RIFEbDBU+990UBaXjTCnXPytL49pqjDYoQ/H0MFvl29AZzHrDIAgYEuH28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgPBS65dMYPvBlt7rM3WI9Pfl88tllHGJG1mWim032s=;
 b=aZsX2lA2BP3cBHpBdk7gosgnCWqJtmrPuKxGkX872TZqGDgED7JhlUCXGvUkPWl76l3dAme3mlKq8YpnvwWhStOn7GimmWTzm2/pfaITyvjjkhTqDrSTeMkoTVyBz+Tpxvz7SohktbKN53EiHoyWKnaE1IH+PUGzPDfHzkYdolSp8iMsjWuMGWpKvgUzKlsAouPjsTtOqeIi0SrDsNRIqlYfLYdMRon9iVJ957regIzhtk5duTzT9RmmJtosrzZNnmWIt6hlk3+obAo5fnhbVhkE7AqGCeUmgeGVtfrkIDtoysts6x3ohcxjpnIZFZ8Pqg/j285hQYL5Zncbru8fAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgPBS65dMYPvBlt7rM3WI9Pfl88tllHGJG1mWim032s=;
 b=WmapINtfKWLFnj6pBtHnWuFvR844xQJeMR9PaUfTLZzTwMm26yLZsS/zHUYlTKXnbGpHhQ/3RraekInSkWP15g79MPqMSM+2G6AhWoIVUq3NyFxnr1Nd5caGKQudA/6l2PiLAbHyPqxMorpOkg49G1C95U45iMdiceqfFEPCmIQ=
Received: from SN6PR11MB2848.namprd11.prod.outlook.com (2603:10b6:805:5d::20)
 by SA2PR11MB5195.namprd11.prod.outlook.com (2603:10b6:806:11a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 27 Oct
 2020 16:16:55 +0000
Received: from SN6PR11MB2848.namprd11.prod.outlook.com
 ([fe80::cc4c:c230:c557:d721]) by SN6PR11MB2848.namprd11.prod.outlook.com
 ([fe80::cc4c:c230:c557:d721%7]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 16:16:55 +0000
To: <vaibhavgupta40@gmail.com>, <helgaas@kernel.org>, <bhelgaas@google.com>,
 <bjorn@helgaas.com>, <vaibhav.varodek@gmail.com>, <aradford@gmail.com>,
 <jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <aacraid@microsemi.com>,
 <hare@suse.com>, <linuxdrivers@attotech.com>, <john.garry@huawei.com>,
 <don.brace@microsemi.com>, <james.smart@broadcom.com>,
 <dick.kennedy@broadcom.com>, <kashyap.desai@broadcom.com>,
 <sumit.saxena@broadcom.com>, <shivasharan.srikanteshwara@broadcom.com>,
 <sathya.prakash@broadcom.com>, <sreekanth.reddy@broadcom.com>,
 <suganath-prabu.subramani@broadcom.com>, <jinpu.wang@cloud.ionos.com>
Thread-Topic: [PATCH v3 19/28] scsi: hpsa: use generic power management
Thread-Index: AQHWl+7UxHWuBPldh0y5y/6Bgs5jF6mryROw
Date: Tue, 27 Oct 2020 16:16:55 +0000
Message-ID: <SN6PR11MB2848B4C4D2899B8DC71E049CE1160@SN6PR11MB2848.namprd11.prod.outlook.com>
References: <20201001122511.1075420-1-vaibhavgupta40@gmail.com>
 <20201001122511.1075420-20-vaibhavgupta40@gmail.com>
In-Reply-To: <20201001122511.1075420-20-vaibhavgupta40@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [76.30.208.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec952c40-c81b-42c8-7598-08d87a93b8d0
x-ms-traffictypediagnostic: SA2PR11MB5195:
x-microsoft-antispam-prvs: <SA2PR11MB5195D3BE5DF5B4B5F62232EEE1160@SA2PR11MB5195.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:254;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GBmf3pjz/8O9kHurSLY+ziS53Bz/YWtGuD5jLBpLsSQqZi/1KOQ+u8XrIG+So1V7+e6V3Zl+mXfB3rqARK4bA8/25oWJ05NBOwDU11WcWJJxo1c1fUnk/xCZ3mEg8QJRcypxeyF6jD9yrtXc8KEK1FGbAj/T7ho6QhhWKC5trquQf7PEMX9/BHWH294dKNDuZC9r8uCj/wSZW64Gdweqvqut9SqitpSLvBq2rPkCXOHw6KTH0/Q8gQmQZbZjQkJ6SA5kDFFjZsMLmVvHYLSn/oJDowpMaW4Ezsfy+JOSbd2NX5Ap0ndYxLApNaXmNAqF3NpQjM+BEP/sYGCm1ulX4t5RVJJEsBGZG/81bz64XJ1fhJ9w0TbKjB3KBswST5WjuSJasiHhSG+BalkEk2i+GQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2848.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(376002)(346002)(396003)(366004)(8676002)(2906002)(8936002)(83380400001)(9686003)(55016002)(4326008)(478600001)(26005)(186003)(53546011)(7696005)(54906003)(110136005)(316002)(64756008)(86362001)(66476007)(66946007)(66446008)(66556008)(6506007)(76116006)(71200400001)(33656002)(7416002)(52536014)(5660300002)(41533002)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: XUgS+0mwiIDiaXL0JhWo03glDuYNU8VZDRkXWjERYAzei4NkfkmxpOR8JLH/aG1z2LRYmTX7qJPgFKoHgSOukDt6MYvMpNNJ+jjXgO/lDttss1fiu2nChzsJazQBaG2jeXyoOaRkQ28b/7yUgXiRD/cy6+CPhOqa6A3a3wpE7+5KCi1OqqiAnDi6L3y2FZAX1uoVsjNfQHX1PW9pLlViJIM0+AN/4IlGktZgv4hvb7w5IQcgiq2AYhH/R0t4So+qZ85yptwWKpx4JTo3AwnkEbP3gPeexXKsRzUpyBIv82BG6narEh6u+yRG3cZNL7kFmhaPOT2H0U9u1InF5tY0GxYSZ3mwLmbnj9wgL5vUvhJdoqBIkNcOJIl2UxeUWaK7KinTjcsAjl7waUJPlMQZpvkNxGVQ62CzBYTBCWCTMioGl0OKSuCQqYxn9LYH88W54Q5FIqUHKKXzqTfJkRR9zJKkQ+/CvlfcCdvfr6G5xLnW10sbE+kucpUfs21wXHL4Qv9HhL0yZhbAIpQISEeHjevYtB0k7fJJCoT34++6DmgPWclSiVYNC7GMAHO0UvgLroYYAeaXPqNIePD21scp6MG4ErtgFJ8S6kfgv03o/h+ux/J8Ma/6B4/0ycpKNpT0moVI+RGZXddEZQM9+rQRsQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2848.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec952c40-c81b-42c8-7598-08d87a93b8d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 16:16:55.0606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JKCgb99XiU5psJc+kL3XnVIpBwgUnAQ9MXpFI27yCCcjoYrkGY3CLX3BDO1YfW4r0Bp326BCtXGHd7y7H1jBlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5195
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v3 19/28] scsi: hpsa: use generic
	power management
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
From: "Don.Brace--- via Linux-kernel-mentees"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Don.Brace@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

-----Original Message-----
From: Vaibhav Gupta [mailto:vaibhavgupta40@gmail.com] 
Sent: Thursday, October 1, 2020 7:25 AM
To: Bjorn Helgaas <helgaas@kernel.org>; Bjorn Helgaas <bhelgaas@google.com>; Bjorn Helgaas <bjorn@helgaas.com>; Vaibhav Gupta <vaibhav.varodek@gmail.com>; Adam Radford <aradford@gmail.com>; James E.J. Bottomley <jejb@linux.ibm.com>; Martin K. Petersen <martin.petersen@oracle.com>; Adaptec OEM Raid Solutions <aacraid@microsemi.com>; Hannes Reinecke <hare@suse.com>; Bradley Grove <linuxdrivers@attotech.com>; John Garry <john.garry@huawei.com>; Don Brace <don.brace@microsemi.com>; James Smart <james.smart@broadcom.com>; Dick Kennedy <dick.kennedy@broadcom.com>; Kashyap Desai <kashyap.desai@broadcom.com>; Sumit Saxena <sumit.saxena@broadcom.com>; Shivasharan S <shivasharan.srikanteshwara@broadcom.com>; Sathya Prakash <sathya.prakash@broadcom.com>; Sreekanth Reddy <sreekanth.reddy@broadcom.com>; Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>; Jack Wang <jinpu.wang@cloud.ionos.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>; Shuah Khan <skhan@linuxfoundation.org>; linux-kernel@vger.kernel.org; linux-kernel-mentees@lists.linuxfoundation.org; linux-scsi@vger.kernel.org; esc.storagedev@microsemi.com; megaraidlinux.pdl@broadcom.com; MPT-FusionLinux.pdl@broadcom.com
Subject: [PATCH v3 19/28] scsi: hpsa: use generic power management

EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe

Drivers should do only device-specific jobs. But in general, drivers using legacy PCI PM framework for .suspend()/.resume() have to manage many PCI PM-related tasks themselves which can be done by PCI Core itself. This brings extra load on the driver and it directly calls PCI helper functions to handle them.

Switch to the new generic framework by updating function signatures and define a "struct dev_pm_ops" variable to bind PM callbacks. Also, remove unnecessary calls to the PCI Helper functions along with the legacy .suspend & .resume bindings.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Acked-by: Don Brace <don.brace@microchip.com>

---
 drivers/scsi/hpsa.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/hpsa.c b/drivers/scsi/hpsa.c index 81d0414e2117..70bdd6fe91ee 100644
--- a/drivers/scsi/hpsa.c
+++ b/drivers/scsi/hpsa.c
@@ -9070,25 +9070,27 @@ static void hpsa_remove_one(struct pci_dev *pdev)
        hpda_free_ctlr_info(h);                         /* init_one 1 */
 }

-static int hpsa_suspend(__attribute__((unused)) struct pci_dev *pdev,
-       __attribute__((unused)) pm_message_t state)
+static int __maybe_unused hpsa_suspend(
+       __attribute__((unused)) struct device *dev)
 {
        return -ENOSYS;
 }

-static int hpsa_resume(__attribute__((unused)) struct pci_dev *pdev)
+static int __maybe_unused hpsa_resume
+       (__attribute__((unused)) struct device *dev)
 {
        return -ENOSYS;
 }

+static SIMPLE_DEV_PM_OPS(hpsa_pm_ops, hpsa_suspend, hpsa_resume);
+
 static struct pci_driver hpsa_pci_driver = {
        .name = HPSA,
        .probe = hpsa_init_one,
        .remove = hpsa_remove_one,
        .id_table = hpsa_pci_device_id, /* id_table */
        .shutdown = hpsa_shutdown,
-       .suspend = hpsa_suspend,
-       .resume = hpsa_resume,
+       .driver.pm = &hpsa_pm_ops,
 };

 /* Fill in bucket_map[], given nsgs (the max number of
--
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
