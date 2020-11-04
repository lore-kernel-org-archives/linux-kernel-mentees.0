Return-Path: <SRS0=I1jd=EK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AE9C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 18:09:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC8D206CB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 18:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Cs4G295Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="gTBiJToQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CC8D206CB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A6C2A8675F;
	Wed,  4 Nov 2020 18:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pO+kP8Cx4ijq; Wed,  4 Nov 2020 18:08:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A4C8686452;
	Wed,  4 Nov 2020 18:08:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EBAEC088B;
	Wed,  4 Nov 2020 18:08:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38A45C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 18:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2197F87272
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 18:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1xt751mhe-7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 18:08:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from esa5.microchip.iphmx.com (esa5.microchip.iphmx.com
 [216.71.150.166])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3489D87267
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 18:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1604513320; x=1636049320;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8K9VAYRCV74bPUGVi3GU9czGbhh9csmFG8Kk6On2++w=;
 b=Cs4G295QJICQVb57gKj/3YNQmHegi/u9TYdKwjhvgSe6/gTwwHXo1l2u
 DnPjzWlFhOF1a6tiFj3/vYluBc8CvT0g9iFc9dQAL7zFcJzpEUPh0kZI1
 qDO1LIj8ZlIxr/HlYGEKmXg8GojABgq6n1xVFYA2F31kv8/arIqOd5OLI
 obppa8zjAWDXzo25D50Uvk1RJ+MxeejwFI3rnOkaNXf7dPJBhozQ4R3oE
 pGt+MJqwfkRzB9uJKyhR0Zg6QdfMOi5vv+/PL0qmJvK8l9+wKfS++c/H2
 +6QgAoPz2XzKtoR6Lj5BE9ZZzzzDg73oAYUb/Kyf0pwyRYOYCNJu8wbnV w==;
IronPort-SDR: KLuBeqUd0VEUCG+VcYs3/JZdTci8m3yfsuBQt2313nFPVMGaM3/Maz/APJNTuftVP0teviVOfn
 JyLvPRCwcElY1vBcRMm9wyxRdlM05c2BvIkJ9/Yqr2SHyoBPj6Yx6MM8AAbhOo7ySOi5F4hK7+
 xhp9gok6hstJfGkKYLeynboSI1bdJsf/7f5HX9zoAVpYQO9mhS2jo6U0jsIX5zrGg9HKO3kVDd
 5iTQdiMuotmUev6/qzF+Snk5XAqmF8SIZRfoQyOzaUq1M44jBmTC8tgfJJ5xwtWSHcdhPR61p2
 cQ4=
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="97195687"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Nov 2020 11:08:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 4 Nov 2020 11:08:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 4 Nov 2020 11:08:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neLhvAAwSjyBp1YJlztBmlUlFWKm97qw2A9rY8oYZYyt5tTCdBnllRi/ejGwlLDdzqgbjUAj+2FujeQmg3SftzIs9qhdl+9GNTux15SVUbkYpm3836uXXqif/7vVxmmMC0GlxZA6QlCKShHoa1l/L790dad1TtTDj4ovWS6YCDN4PbGfXvOXVdPVuqyDNGxY9ksed37505bOU4hV+AsZpss1K29Mwd1MQTnkACoC9Mnq8gtAnAcNc9eQzKZoHsJKgVRwrKgx4GO0fy0PwB4cd20e9EFP9kgu8nYL2625jlSPhwMzP/uN5BVkwJMcky4TLFmX26xbpuua4Wl7b3Abwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUT+MNGQy7By6LupbiNtd9O2OBe60ODoNCIkEjpOrF8=;
 b=nEiahlruQeBZ2bTBfyOI8nZ0xrg5efRIWZmiXQgGaLT8ry+E2m2p/7CVcVYGfpGtDHFolCmb8x5+XPvdqDAVg9dlNdQ2dvgGJrCfZA+slziRHewRVUQ8HZQGAIxo/Yxhy4eZe1SQCKzGQdglvlyMsbS+ByOaQRndEbohg5MYjQgBYgN/UllEqNiy48qiF15U0Hh3j/2NtCu/6eXX+J93UI6aqIElZq0tzkLpUzsDNFxeZlvSgjn3UEXsV9Zy57wF3PA6gNAUx8EGzMIhYy2yOjKh3pw9dJxRmpx9H3L2yqVLIf/4Ga7qRdIm7EDDc9V+gxayF7RZt53/Qzbm2Dcczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUT+MNGQy7By6LupbiNtd9O2OBe60ODoNCIkEjpOrF8=;
 b=gTBiJToQwXXg1MexsI6WNMLTtED8zKQ+v4J8h3xabvvjWKaB4r9+DiShXaquWfjHpzJW7ZtqJXbhzIuBqcoTRYGBJiySd4VHLgHzwqNJTBvV+KW5F011nlSdHhotjjr+qNDLNFhN9dAEAEkhwBW5vMyjENjqBbxqoCF6EKOtMqg=
Received: from SN6PR11MB2848.namprd11.prod.outlook.com (2603:10b6:805:5d::20)
 by SN6PR11MB2670.namprd11.prod.outlook.com (2603:10b6:805:61::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Wed, 4 Nov
 2020 18:08:32 +0000
Received: from SN6PR11MB2848.namprd11.prod.outlook.com
 ([fe80::70c8:cff5:dcd6:a6ee]) by SN6PR11MB2848.namprd11.prod.outlook.com
 ([fe80::70c8:cff5:dcd6:a6ee%5]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 18:08:32 +0000
To: <vaibhavgupta40@gmail.com>, <helgaas@kernel.org>, <bhelgaas@google.com>,
 <bjorn@helgaas.com>, <vaibhav.varodek@gmail.com>, <aradford@gmail.com>,
 <jejb@linux.ibm.com>, <martin.petersen@oracle.com>, <aacraid@microsemi.com>,
 <hare@suse.com>, <linuxdrivers@attotech.com>, <john.garry@huawei.com>,
 <don.brace@microsemi.com>, <chenxiang66@hisilicon.com>,
 <james.smart@broadcom.com>, <dick.kennedy@broadcom.com>,
 <kashyap.desai@broadcom.com>, <sumit.saxena@broadcom.com>,
 <shivasharan.srikanteshwara@broadcom.com>, <sathya.prakash@broadcom.com>,
 <sreekanth.reddy@broadcom.com>, <suganath-prabu.subramani@broadcom.com>,
 <jinpu.wang@cloud.ionos.com>, <Balsundar.P@microchip.com>
Thread-Topic: [PATCH v4 20/29] scsi: hpsa: use generic power management
Thread-Index: AQHWsTjVwLXwOHpJT0aY4JSKgEt8Wqm4Rl5Q
Date: Wed, 4 Nov 2020 18:08:32 +0000
Message-ID: <SN6PR11MB2848C3B4E382639D354B7613E1EF0@SN6PR11MB2848.namprd11.prod.outlook.com>
References: <20201102164730.324035-1-vaibhavgupta40@gmail.com>
 <20201102164730.324035-21-vaibhavgupta40@gmail.com>
In-Reply-To: <20201102164730.324035-21-vaibhavgupta40@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [76.30.208.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d25e8b7a-d8d9-4d63-2450-08d880eca3d5
x-ms-traffictypediagnostic: SN6PR11MB2670:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB267066AE58E172B6D17185BEE1EF0@SN6PR11MB2670.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: abyZgXYb1VG0O7dpQgx7aJcaxe71wG6817mrf8pBCAce1CFgMIYaL/BRdhR6qy6akJoS7Aj8YeHL6je/hWC+ZEyxrxOTT1y6zc5+6qTZ4ezDQFhKCF2P7B9ZX+66K9fDD9qu3T8/QJ+w0t/AvvX6NdyOpzyjtcij9y2pj6JgYmLFetzDBPn40nGX4B2DoyAWj5lJf/LroP5zyNOQfBLKrNKnSh5L/TCAWVUvfUOHTTEAy49dDJLra0GOrXptN+ovgJr5pVGEKxEg5ohal0vInC2PP91VSzdIQ/aDxTn0UBlRJZmN0HA0N0JB8+vLS9YaXk0jsNukZXrSF7IR6dogc7E/T8A/np41FNCBuEEzDp5/GDAtpltP6f++bRkcw9aLbwG1+OgXOupSijBLjZOQGQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2848.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(366004)(396003)(39860400002)(316002)(33656002)(7406005)(7416002)(186003)(2906002)(86362001)(5660300002)(110136005)(83380400001)(54906003)(66556008)(64756008)(66946007)(66476007)(66446008)(76116006)(8936002)(6636002)(52536014)(478600001)(8676002)(71200400001)(7696005)(26005)(4326008)(6506007)(55016002)(9686003)(41533002)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 6hXheAQuHmxIv6upQTvWJpBYsskvuPJV1svH0+BD8i1raPex8n56HjZKKgStH2PhqI0kWwVrvEm5Ssl4i6c6ahs76pMGl6G7UyrtL+tfWKXTI0YmWnmCqo+sLpi/e4F4YxTf6m1w1clsIRSFf+7PcEoJGINYKZFylAs/xZOpKEBBpcl2dOfuBZJZE4ZIfCMC0IM7nvCa529FRkK6yZp6Seh2sJ74lJ85D1HYtVCfxTw6Tm2Uf4Eu51Ro7B0GPEJc4YxoG7IeNR5xOtmFpIEwsQ4CJd/rKQeZLhsgPynawEG4V+u+pKCOIsBFiZKrh1r4NPLknPw1cR1pkARF0G/LVFXi84mtDP679ZxB0vNUUB8kSKTO6oNuP+ALhQnKQi0josJlyjAm5nycW46h0wvhimIKBmdaQqx1M6mXV9C0p1TxGYafPgkn/iEdVGqZmOOaXKM0rGpqJxx/19Xx6Fjt1v0SJpdAXOHlXcYyguk4dPOHSWbkcD2DCjXN/497FhcA8DK3Vm5CEEhxIR+nGOo+pjp65JPj7UnGUnl87wghDM8fRe5+zeeJQTwmzRsB9hgHD4SDE162Vzum3KzrZMGAW9Y9o8Vmm7kyUnPzK00WDBES4+/+N+ZI4wnFX33we9/1BFphk/zhYe2Zfwn/chn1dw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2848.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d25e8b7a-d8d9-4d63-2450-08d880eca3d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2020 18:08:32.0577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PFCq1f52A3noDG9AnzLi/jxesarApd47tf+Q33w4OLwKn4aBlxR3s9pfkktNgpwOLhulRn4rxdUFGD4n7bL9oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2670
Cc: linux-scsi@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH v4 20/29] scsi: hpsa: use generic
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

Switch to the new generic framework by updating function signatures and define a "struct dev_pm_ops" variable to bind PM callbacks. Also, remove unnecessary calls to the PCI Helper functions along with the legacy .suspend & .resume bindings.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Acked-by: Don Brace <don.brace@microchip.com>

I thought that I had given my Acked-by on 10/27, but it must have been lost.

Thanks for your attention to hpsa,
Don
---
 drivers/scsi/hpsa.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/hpsa.c b/drivers/scsi/hpsa.c index 83ce4f11a589..e53364141fa3 100644
--- a/drivers/scsi/hpsa.c
+++ b/drivers/scsi/hpsa.c
@@ -9090,25 +9090,27 @@ static void hpsa_remove_one(struct pci_dev *pdev)
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
