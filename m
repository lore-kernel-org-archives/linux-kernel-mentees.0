Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD14AC47095
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 20:58:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 358D5206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 20:58:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tXSRk41d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 358D5206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BDD2282FF1;
	Sat,  3 Oct 2020 20:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9d2kLUYRE6m; Sat,  3 Oct 2020 20:58:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 30FB182507;
	Sat,  3 Oct 2020 20:58:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17FABC016F;
	Sat,  3 Oct 2020 20:58:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 506C7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 20:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3F97B82FF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 20:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAM1ZxYWcwhK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 20:58:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8D04182507
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 20:58:22 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id nl2so973092pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 13:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=AZZnFmMC17E9yGBAkNVOXQNqt+M2aS94kheendbZAAI=;
 b=tXSRk41dOnyVQFHFQteEMOA9RHgmNiqaQmvOeiMspL+XX3vSKCFh+mgDwfo4rsGAZB
 wOI1k7m1YwWeVtEP8ElhegJKyHIEeltLd6mHm4nAIPaR9XYXtGJ+IEK6BZptgeXOQJZm
 nEb9ULgDKPSWi8vMQnrBY3+R37DAjwQycwnfbPx4N3tgWwAc4KFd2HgsmSmYx/eAHjPm
 nEf+UnInjpBuiWNL2+vdY7pNR85TxkqSUeteVJSyzaupPDu8j53qCk9yFNLDUOj2n+sJ
 1Tyg0tjq9qgi81jgGL8q5skGli/aCuWVypJTOuo36KM06igQxOTtGqlTOox5QF2bBf3+
 sVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=AZZnFmMC17E9yGBAkNVOXQNqt+M2aS94kheendbZAAI=;
 b=YLeyhMoDVyawJHojKlramG3bZMyQ1jch73UByDVEjGZd3K2FaBM3/21WwTHSgDAXpb
 FxrrOvxskJ4PxBGYXAUh28MSX2WuGNNa3DT+WwlU4rIMlb6uTqfxKRmyWI/o8fUWW6de
 vMO8XwDKsEpUl6IXmk4eb1lLRrr6A/aSxkOCWo7xNlssEWL/p9T77jKYRRhK1+drq859
 L95/ZsF0QM/VT18aUudninTQQpsFZUiFjUnhf17BAG0hPArxPm7JrgPZTq9HK7h0GZXF
 Z4GNtH6f0nbN05rWhxc373OPsb5u6v0sCnT8xf1Aqv3LblE9XsYWyk3mq6nDugW9CBwq
 VaWw==
X-Gm-Message-State: AOAM532w2ABzEJSdbi04bCkVvKMeIksBn/SpmVOm9r9H/vSxB+HSChVS
 sS/jDCqTrM9u/XPekFtRt/4=
X-Google-Smtp-Source: ABdhPJxiKPUGZnuM6OqUtXhszbDMEqmHhXppikt/00huy7eOAH4bexu9KtNZH7gq0ez9wPuyLS+vUQ==
X-Received: by 2002:a17:90a:ea0a:: with SMTP id
 w10mr8792531pjy.165.1601758701945; 
 Sat, 03 Oct 2020 13:58:21 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.217.69])
 by smtp.gmail.com with ESMTPSA id i17sm6640460pfa.29.2020.10.03.13.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 13:58:21 -0700 (PDT)
To: Joe Perches <joe@perches.com>
References: <20201001073221.239618-1-anant.thazhemadam@gmail.com>
 <dbe67fce55c6bbe569cefdc1a01708a0d01b140a.camel@perches.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <81a5d8b6-5258-1f2e-15da-4324579799df@gmail.com>
Date: Sun, 4 Oct 2020 02:28:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dbe67fce55c6bbe569cefdc1a01708a0d01b140a.camel@perches.com>
Content-Language: en-US
Cc: Petko Manolov <petkan@nucleusys.com>,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: usb: rtl8150: prevent
 set_ethernet_addr from setting uninit address
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


On 04/10/20 1:08 am, Joe Perches wrote:
> On Thu, 2020-10-01 at 13:02 +0530, Anant Thazhemadam wrote:
>> When get_registers() fails (which happens when usb_control_msg() fails)
>> in set_ethernet_addr(), the uninitialized value of node_id gets copied
>> as the address.
> unrelated trivia:
>
>> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> []
>> @@ -274,12 +274,17 @@ static int write_mii_word(rtl8150_t * dev, u8 phy, __u8 indx, u16 reg)
>>  		return 1;
>>  }
>>  
>> -static inline void set_ethernet_addr(rtl8150_t * dev)
>> +static bool set_ethernet_addr(rtl8150_t *dev)
>>  {
>>  	u8 node_id[6];
> This might be better as:
>
> 	u8 node_id[ETH_ALEN];
>
>> +	int ret;
>>  
>> -	get_registers(dev, IDR, sizeof(node_id), node_id);
>> -	memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));
>> +	ret = get_registers(dev, IDR, sizeof(node_id), node_id);
>> +	if (ret == sizeof(node_id)) {
>> +		memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));
> and
> 		ether_addr_copy(dev->netdev->dev_addr, node_id);
>
>
I will include this change as well, in the v3.
Thank you for pointing that out.

Thanks,
Anant

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
