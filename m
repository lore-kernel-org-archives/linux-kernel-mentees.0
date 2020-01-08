Return-Path: <SRS0=o+/b=25=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F846C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jan 2020 13:08:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B75205F4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Jan 2020 13:08:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="G4RYgzQp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38B75205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0E5F18792F;
	Wed,  8 Jan 2020 13:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EUQJHopOYbbH; Wed,  8 Jan 2020 13:08:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8791387924;
	Wed,  8 Jan 2020 13:08:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CA37C1796;
	Wed,  8 Jan 2020 13:08:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9EDAC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9ED978792F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qT8Boemccass
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 13:08:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7CCF987924
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Jan 2020 13:08:30 +0000 (UTC)
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Nicolas.Ferre@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Nicolas.Ferre@microchip.com";
 x-sender="Nicolas.Ferre@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Nicolas.Ferre@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Nicolas.Ferre@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Hsha1AOKpq3LMQmmzHdi6HELAfMONFnyMiRFaawM4LkVPIzjzVZbrtNseAbtT6a2oEVfNHDLzZ
 YP3NobFOcucEWIFiijb+lQVTFHnsA/QaHt/T02z/lXoW0RorbV3ZsdxHPViN6Q7soRgZ2Rraqi
 wWXUsvLniUnD0DIoJuoSXxA4VAdeJVj9aIqfTsT9EJOgr4ltZUMjqpWvcL1K42ukcaxc6VdtR4
 DfuxfmKxtp2UhGbgnB75WfymwO/D318XR8aVEaRtbaoAK0bxSxt5p5sDl0iOnTYYq+ChuvQjyb
 H2w=
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="64016366"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Jan 2020 06:08:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 8 Jan 2020 06:08:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 8 Jan 2020 06:08:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6YlOYXdUWzEps+d1XD1sLHhLkvEzhWuhfzjDazQPulkdVReNiMZomdZdMBrGFSj6fF9oXqvGKRU2c4+OjhAfmGVsILZPDY12pAyJ5Yql1BaINjtzWTI3mecITFQnUcDQWplPHTO6D7AavVHOGv8zZsvSLj3Na+7R7MZt5eSsUdR8/Z0A4Pdl+DSkF/pqlgOF+bQbkE5rT+SyIX64yKpUHBLB8MVgRwPiuBHlz80q6Gyt9e6ZH7ZPorpQPIOBy3So8lFP00xfudQpJQqXuhcLCvviB17dlIK9RWpKdlTl2hNrwtxusnUclGka65iFsFDm8Mv5QWeYHu5fbXv6JYOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idiAqKjL0ygFkvFhOtVHskz56JaBh81Z1NmwNUJ7xJs=;
 b=XkTIlCQhfSxNpygvfrkRX2IESr/KvzqsYBVOfOCXXJlbFYh1SxNP1d8RQsAnogVEjMdMbx7OwQnWMuqcv0HMoSGYIcm025o5a5gwy9/ZK79Tfvz/nYtHP0QTQ5o9ydg6KBbYM4cupsz15VJ3tNuVJFfPphSs56GVELPQBQVbuOC5hXH+jwcJtAViBUp2vqGZAZoh693ZkSKU+Kog1USyKe9arh/JBnHBgWqq0jKWfsHwiKCHSRjCxjzc33r8i3lmvx/TVoo0gZKGvn8bW/ZFh8oA8xuI+26YX/Lill6aqPH58iIsg02bkeF4DWAOpdMq0wpfLIlYKnRP7q/1S409+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idiAqKjL0ygFkvFhOtVHskz56JaBh81Z1NmwNUJ7xJs=;
 b=G4RYgzQpv9qH8ylC3t0XqaDGA0NSJkx7Upmee+bxsZiXO2irR2V1hIWZ7iDxX54iJv5HnKXXDZqE/52VJYrFxwTValhJUylYfV0SNB3BsCHCu+71JhtJCX404rf27KV+1me3+b4ZZb199q9Oundpg8QrplW8aoBNtTZU21HLrRE=
Received: from SN6PR11MB2830.namprd11.prod.outlook.com (52.135.91.21) by
 SN6PR11MB2749.namprd11.prod.outlook.com (52.135.95.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12; Wed, 8 Jan 2020 13:08:26 +0000
Received: from SN6PR11MB2830.namprd11.prod.outlook.com
 ([fe80::9439:53a6:d896:d176]) by SN6PR11MB2830.namprd11.prod.outlook.com
 ([fe80::9439:53a6:d896:d176%7]) with mapi id 15.20.2623.008; Wed, 8 Jan 2020
 13:08:26 +0000
From: <Nicolas.Ferre@microchip.com>
To: <shobhitkukreti@gmail.com>, <b.zolnierkie@samsung.com>, <sam@ravnborg.org>
Thread-Topic: [PATCH v3] video: atmel_lcdc: Fix Shifting signed 32 bit value
 by 31 bits problem
Thread-Index: AQHVxiS2RMJ2utz8m0KsUCgqPI99OQ==
Date: Wed, 8 Jan 2020 13:08:26 +0000
Message-ID: <16eb49b4-6035-1b52-4dce-faec2c0fbf9f@microchip.com>
References: <9c98fd20-5bc8-48a6-96ed-889a18d1a0c0@samsung.com>
 <1563756160-29702-1-git-send-email-shobhitkukreti@gmail.com>
In-Reply-To: <1563756160-29702-1-git-send-email-shobhitkukreti@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [90.8.3.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3981f930-dac9-4371-bd1f-08d7943bd950
x-ms-traffictypediagnostic: SN6PR11MB2749:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2749C91F328950E49E700330E03E0@SN6PR11MB2749.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:78;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(396003)(346002)(39860400002)(136003)(189003)(199004)(86362001)(5660300002)(31696002)(36756003)(186003)(53546011)(54906003)(6506007)(110136005)(66476007)(66946007)(66446008)(26005)(64756008)(66556008)(2616005)(2906002)(31686004)(316002)(81166006)(81156014)(6512007)(8676002)(8936002)(478600001)(71200400001)(76116006)(4326008)(91956017)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR11MB2749;
 H:SN6PR11MB2830.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OTNqz+qY1r1PO8+f1s9fLsEhvkYgovjh7T4UPIDDn4XgQ48VTDzEISG5V1X49PbaagqqnfvOcz2jo3tBIeFBLsgz4Y/TUBRaWs/P13PdAiEW21ygO8jfIEWc17V2R2ytNyaYXTy3L5o2hnKZ1rHaq6GiOBkYaYIZpHN31ORbX6mZu1c7PztP9C6Xs75no1mEGa5OR2P3nJSnKePSasOqbFxpDbCbGSdjgLU6nvjS42a5wT8XCZcoIXxhWgPXC+WpEZuZ5RqsuVcd2Sji+1qPunVZzmkdVvBAdvikLyM6wF/+dSnn+2DfCm7DsRnbfI7fJY2Ivk5jCa5ekyF9fr408Ed+wRokX4nQ/IFSLnnroA6WLWeTTvBkDwrNCbJdNqRq/G/adINjblvbBQNC0f0KyOukqdtNIKXhpv+9RJYPDs1d4L+1MEYAMfT9DvocRkvX
Content-ID: <95FF98E054E90749B1FADFBCBBE6B2DB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3981f930-dac9-4371-bd1f-08d7943bd950
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 13:08:26.4683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1vMojdgtCVf0OXD4iMoVOudTSn0zc8kBGOuC10PireQrQoCNDqlgHYG+NU4hiCXBcmyNSbzdp6F/2TbdrI2gzo76GMfaLZju2hsc3FNHFsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2749
Cc: alexandre.belloni@bootlin.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Ludovic.Desroches@microchip.com
Subject: Re: [Linux-kernel-mentees] [PATCH v3] video: atmel_lcdc: Fix
 Shifting signed 32 bit value by 31 bits problem
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

On 22/07/2019 at 02:42, Shobhit Kukreti wrote:
> Fix ATMEL_LCDC_MEMOR and ATMEL_LCDC_MEMOR_LITTLE defines to use "U"
> cast to avoid shifting signed 32 bit values by 31 bit problem. This
> problem. This is not a problem for gcc built kernel.

Chuck of a sentence remaining.

> However, this may be a problem since the header is part of pbulic API

Typo
+
no, this header is not part of public API.

> which could be included for builds using compilers which do not handle
> this condition safely resulting in undefined behavior
> 
> Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>

No strong opinion, but once typo and commit message is fixed, you can 
add my:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Regards,
    Nicolas

> ---
> Changes in v3:
> 	Replace Bit Shift Operations with BIT() macros
> 
> Changes in v2:
>         Fixed spelling typo
> 
>   include/video/atmel_lcdc.h | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/include/video/atmel_lcdc.h b/include/video/atmel_lcdc.h
> index 43e497c..985e2d6 100644
> --- a/include/video/atmel_lcdc.h
> +++ b/include/video/atmel_lcdc.h
> @@ -85,27 +85,27 @@ struct atmel_lcdfb_pdata {
>   #define		ATMEL_LCDC_PIXELSIZE_16		(4 << 5)
>   #define		ATMEL_LCDC_PIXELSIZE_24		(5 << 5)
>   #define		ATMEL_LCDC_PIXELSIZE_32		(6 << 5)
> -#define	ATMEL_LCDC_INVVD	(1 << 8)
> +#define	ATMEL_LCDC_INVVD	BIT(8)
>   #define		ATMEL_LCDC_INVVD_NORMAL		(0 << 8)
> -#define		ATMEL_LCDC_INVVD_INVERTED	(1 << 8)
> -#define	ATMEL_LCDC_INVFRAME	(1 << 9 )
> +#define		ATMEL_LCDC_INVVD_INVERTED	BIT(8)
> +#define	ATMEL_LCDC_INVFRAME	BIT(9)
>   #define		ATMEL_LCDC_INVFRAME_NORMAL	(0 << 9)
> -#define		ATMEL_LCDC_INVFRAME_INVERTED	(1 << 9)
> -#define	ATMEL_LCDC_INVLINE	(1 << 10)
> +#define		ATMEL_LCDC_INVFRAME_INVERTED	BIT(9)
> +#define	ATMEL_LCDC_INVLINE	BIT(10)
>   #define		ATMEL_LCDC_INVLINE_NORMAL	(0 << 10)
> -#define		ATMEL_LCDC_INVLINE_INVERTED	(1 << 10)
> -#define	ATMEL_LCDC_INVCLK	(1 << 11)
> +#define		ATMEL_LCDC_INVLINE_INVERTED	BIT(10)
> +#define	ATMEL_LCDC_INVCLK	BIT(11)
>   #define		ATMEL_LCDC_INVCLK_NORMAL	(0 << 11)
> -#define		ATMEL_LCDC_INVCLK_INVERTED	(1 << 11)
> -#define	ATMEL_LCDC_INVDVAL	(1 << 12)
> +#define		ATMEL_LCDC_INVCLK_INVERTED	BIT(11)
> +#define	ATMEL_LCDC_INVDVAL	BIT(12)
>   #define		ATMEL_LCDC_INVDVAL_NORMAL	(0 << 12)
> -#define		ATMEL_LCDC_INVDVAL_INVERTED	(1 << 12)
> -#define	ATMEL_LCDC_CLKMOD	(1 << 15)
> +#define		ATMEL_LCDC_INVDVAL_INVERTED	BIT(12)
> +#define	ATMEL_LCDC_CLKMOD	BIT(15)
>   #define		ATMEL_LCDC_CLKMOD_ACTIVEDISPLAY	(0 << 15)
> -#define		ATMEL_LCDC_CLKMOD_ALWAYSACTIVE	(1 << 15)
> -#define	ATMEL_LCDC_MEMOR	(1 << 31)
> +#define		ATMEL_LCDC_CLKMOD_ALWAYSACTIVE	BIT(15)
> +#define	ATMEL_LCDC_MEMOR	BIT(31)
>   #define		ATMEL_LCDC_MEMOR_BIG		(0 << 31)
> -#define		ATMEL_LCDC_MEMOR_LITTLE		(1 << 31)
> +#define		ATMEL_LCDC_MEMOR_LITTLE		BIT(31)
>   
>   #define ATMEL_LCDC_TIM1		0x0808
>   #define	ATMEL_LCDC_VFP		(0xffU <<  0)
> 


-- 
Nicolas Ferre
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
