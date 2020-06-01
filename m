Return-Path: <SRS0=1nBW=7O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20ED5C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Jun 2020 17:16:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD69520734
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Jun 2020 17:16:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="dngL0sHO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD69520734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E4FC86DE7;
	Mon,  1 Jun 2020 17:16:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJtEHwlzrxXC; Mon,  1 Jun 2020 17:16:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9865A86DB3;
	Mon,  1 Jun 2020 17:16:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FC78C088C;
	Mon,  1 Jun 2020 17:16:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C9E7C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Jun 2020 17:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7667320406
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Jun 2020 17:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8bnwOpxf0OK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Jun 2020 17:15:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 6DCFA203B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Jun 2020 17:15:57 +0000 (UTC)
IronPort-SDR: NXgB1yCvt0VgOpJRX3RZnRmmJucxC4xAan82Y7t/GH2TRS5+GjDxSJxIMIq7BPfJEhyXrgAyEZ
 enB2Nj/6+HAQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 10:15:57 -0700
IronPort-SDR: Ol31ksGljC2T45LbXWx0HqwUAuzGNF73ka9vg2eGVT/+kdJYbhPYisQEfAPM3Z/LC37h/qQQYf
 kHmxGq2PZMJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,461,1583222400"; d="scan'208";a="377471369"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2020 10:15:57 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 1 Jun 2020 10:15:56 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 1 Jun 2020 10:15:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 1 Jun 2020 10:15:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hs85d6/2GgdO9aceq+ZWnzXvFiL9YuQA44qD1ZZNYh6gornDbuKZ7WKDhl+nI3DYwnG/FEE6sZPA7bgvrnyf84j8w6uxzvueXzFXH/K7IhtY6EQLXAw5iCLB21xgy4WZv9Q/AdwYSV07LtD4ETUStGwGm5945bPWLUme5oHsXY+6i36Jqzzz+2LlZ/cTFsmmOsE9hplETIPcnSQLQoenxjM+kBF+hd6q9I8LwH1EqlQQDqOFGW7ZPjOeXromiENbtTRJaeRB0vwlruyPw+FSzeYdj2P+uvUXbQBk1QfiYZeyZCTQiScEfzkzQ6R3MdhxhD6qaJ71uCY4WSi8KPn9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOg4SW89id6jfB2TpQaEEBvs3U5YdDKUsRaYvMnT3zI=;
 b=f6seQKywK/TVwoJyKcRoT/Zy8aN1H7Op9zgT8wmYPdurog0aYI9Obprxd9yjkGI9OKNukIqCM5SKisEuImzOii/XV6vCOJ+W1qJcnCkqfHl4eODJaSrUbFRLIHSRk82gqaEnhmOOcN/MX6tMq80Zpk0CmAEBc1Z+47VGoocFFalwesSTUoD2QUpggRHvEIfFlI+rpweW7zPlNcls/BdXyt7/gg9Q1qC9mWZPGUuoVzvxEVlIYpUjMCWpl2wao0N1qaIODntww0VgbDYQjbHE9T4CSFudD43YScxyhFFJWEBunxlnqVAQJuTecKNwhYNgyD0mq5XcIPuSqr3i0woDrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOg4SW89id6jfB2TpQaEEBvs3U5YdDKUsRaYvMnT3zI=;
 b=dngL0sHOFyLi+DsQ2zS3noCm4dL6qoTGndUBJdZKDG/GQsKP3XYAX2+Qt5fK3TzBWA9Cj+ZPUQeZdC/acV4Pw1ss8udZGlw3oe21LvwiRgi+iaTUvg7LO0GchcRsyEvIfzfAEwQUpGG10bMe65YQV9e1tNDQzURyYs+qaKXKKiY=
Received: from DM6PR11MB2890.namprd11.prod.outlook.com (2603:10b6:5:63::20) by
 DM6PR11MB2665.namprd11.prod.outlook.com (2603:10b6:5:c3::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.21; Mon, 1 Jun 2020 17:15:54 +0000
Received: from DM6PR11MB2890.namprd11.prod.outlook.com
 ([fe80::40b:5b49:b17d:d875]) by DM6PR11MB2890.namprd11.prod.outlook.com
 ([fe80::40b:5b49:b17d:d875%7]) with mapi id 15.20.3045.022; Mon, 1 Jun 2020
 17:15:54 +0000
From: "Brown, Aaron F" <aaron.f.brown@intel.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>, Vaibhav Gupta
 <vaibhav.varodek@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "bjorn@helgaas.com" <bjorn@helgaas.com>,
 "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>, "David S. Miller"
 <davem@davemloft.net>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>
Thread-Topic: [PATCH v2] e1000: use generic power management
Thread-Index: AQHWMpACfuNJXM4xZEOoI3KQroDhiajEC3yA
Date: Mon, 1 Jun 2020 17:15:54 +0000
Message-ID: <DM6PR11MB2890EDBB6B1BE7705DF2AB3CBC8A0@DM6PR11MB2890.namprd11.prod.outlook.com>
References: <20200525122710.25064-1-vaibhavgupta40@gmail.com>
In-Reply-To: <20200525122710.25064-1-vaibhavgupta40@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.136.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e473eea9-2cd4-44e8-3ba3-08d8064f7170
x-ms-traffictypediagnostic: DM6PR11MB2665:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB26652521079B868D90C35147BC8A0@DM6PR11MB2665.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y7Ps0vss2q3Ak6+a5IvfWyGG4xQfUsYCM5DnMPfNpGWD4SO+j5qkO38PSTp5jjKEUGbFzMo/7DQb8l/RdXQZkOdXdp0Nq7pDinpjZN/EOFgvu3SZq55pDvbTwJ8I0nf4MvBd/RNlZtlAh+A9KP3w6/r/hU97uGtLh3pzn3UGm8KjRGxxp7EdFA4dAgHhZX5FsT2gCslZeAbEE9OB0MgK0vSAAj1ZfeZf6gsg10LxUKBK+pxuAsqTVQf1Oj3q3+kp2+9C8hdQLXnLKW484XbnqFlgoxxIf56vd1eq3ZUvclMUnCElPoWAEi1bs8TG8s/GmuBQk+eLvkZEmaCWfaQ1bgBRQT72/oyijfzo3k4J+jwMSYoAPBlpsvK/ArPHMShp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2890.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(396003)(136003)(366004)(39860400002)(8676002)(8936002)(110136005)(54906003)(52536014)(316002)(66476007)(66556008)(66946007)(76116006)(66446008)(86362001)(2906002)(4326008)(64756008)(55016002)(83380400001)(5660300002)(71200400001)(7696005)(26005)(7416002)(186003)(33656002)(478600001)(9686003)(53546011)(6506007)(41533002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: CbXUKrY2tn+6foegBe3eoldyTTVeqwg79t2RhwWF6VzOYrDr8UMg2sAcmsIoeWwieZKk1o7QmF/iMoGy/1U1faIhV49kqjvlij4g/aZZXPF/UH8nR2YVQjf2PchOyvW4MWHFpJvAn81K80jOBHzfu1+oNqXvVWrZ2S1lNgs8vdo8k1bBlN2ISKLUTxjcMvB53stmdtBz6/DFGMqeMD3Q5Xr2Su7OulJQNtzsTojUbpp/Wsj82zMcWwIno/EhwhDw7BfE2Q9rXLVMCTeC88LL5MIqJ2q8L+zdApuYcxqMENl/cgWFNLQzl+3SNzYNRx0DAPfcv8RqD961kEFDOvlMeIyLd27fGsBzO4Ao3TJzbdDwaEYCsGXRtKVcnl4uJTZ5ANfjgSjIkGnvK1d7f3YWYoKAI1IxiGZWfbPYFxa/5WVHRhH56Ss9zSK/xjO9YUCK7ywwupLpXu5VV88S4y+HZW/W7FuxX5va1gYvDCx7BEZwbs+g3tWloVlgkZWD0HN4
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e473eea9-2cd4-44e8-3ba3-08d8064f7170
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 17:15:54.7469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /hsdyx7jfr0DW2g6pN7/DWAp0CGnJK+n45y3jrIsaX8cTaHqbW8gckAFQuSmXy1KlhX0zHv8YuqAnfG10c8/oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2665
X-OriginatorOrg: intel.com
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Brandeburg,
 Jesse" <jesse.brandeburg@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] e1000: use generic power
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

> From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> Sent: Monday, May 25, 2020 5:27 AM
> To: Vaibhav Gupta <vaibhav.varodek@gmail.com>; Bjorn Helgaas
> <helgaas@kernel.org>; Bjorn Helgaas <bhelgaas@google.com>;
> bjorn@helgaas.com; Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; David S.
> Miller <davem@davemloft.net>; rjw@rjwysocki.net
> Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>; Brandeburg, Jesse
> <jesse.brandeburg@intel.com>; intel-wired-lan@lists.osuosl.org;
> netdev@vger.kernel.org; linux-kernel@vger.kernel.org; linux-kernel-
> mentees@lists.linuxfoundation.org; skhan@linuxfoundation.org
> Subject: [PATCH v2] e1000: use generic power management
> 
> compile-tested only
> 
> With legacy PM hooks, it was the responsibility of a driver to manage PCI
> states and also the device's power state. The generic approach is to let PCI
> core handle the work.
> 
> e1000_suspend() calls __e1000_shutdown() to perform intermediate tasks.
> __e1000_shutdown() modifies the value of "wake" (device should be wakeup
> enabled or not), responsible for controlling the flow of legacy PM.
> 
> Since, PCI core has no idea about the value of "wake", new code for generic
> PM may produce unexpected results. Thus, use "device_set_wakeup_enable()"
> to wakeup-enable the device accordingly.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/net/ethernet/intel/e1000/e1000_main.c | 49 +++++--------------
>  1 file changed, 13 insertions(+), 36 deletions(-)

I don't have many old PCI systems that handle power management properly before adding this patch.  However, the few ones that do continue to do so with the older e1000 parts I still have around.  So a small sample, but at least confirmed on _some_ real hardware
Tested-by: Aaron Brown <aaron.f.brown@intel.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
