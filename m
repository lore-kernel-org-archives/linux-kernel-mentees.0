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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A19C41604
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 21:45:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5338F206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 21:45:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t5vw0QXH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5338F206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D6B2F86224;
	Sat,  3 Oct 2020 21:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gUTVsZVnItnC; Sat,  3 Oct 2020 21:45:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 20D818616F;
	Sat,  3 Oct 2020 21:45:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0548EC0889;
	Sat,  3 Oct 2020 21:45:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8CBB2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 21:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7576D855CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 21:45:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2QmJQ5_H-7r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 21:45:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D0B7C855C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 21:45:35 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id o20so3920431pfp.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 14:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YkUAXQMPmvjUV9l+UJIlcFx5SdBT09naUQnGkHuj+B8=;
 b=t5vw0QXHPOchz1V8SraniNG+R+3YQuDdeEvq3g2ljZrqderQi+26wgYclnYhXJ3bXI
 KpES5mPif9CYTD6auU9HJR5Ip2Z4YDIA2iqq0wcS8YsEmk5DNaKp3mzWP2ViAeeRz1hB
 jFEnj5oBg0YCUPSSqDOk9nqEtz+rhAlZuaVWQwo8Th/T4pOaQcDhaEqZ9rAZOfwxHH1w
 ELEK1/CZP5C3Ai80dzQgEldxb6DlwNUXfjUDVYDWlRqiUOBxsMAIFsdfMC8M4wUD/6KM
 wzsPFkRU9i2hpuE1WzeL3VW3pS58H7unNDH2jtPj9v3/0d+8Hpw/RX35Z5KNj7B/0v9D
 uIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YkUAXQMPmvjUV9l+UJIlcFx5SdBT09naUQnGkHuj+B8=;
 b=HOwS5lLqM0lDj0ddh1BSno9162UVgGqRHN5zliYjUcxqTbQV26q6ng0THeyMvqBBJg
 VX0xV90iCPvkLmAj/7dLk2G3Ch+4ewBRSdHSFV/jAgp238DV/7HOZfgPfpbS51JzKvPb
 zgaXn0udeYO10FqolkgVUWqRjS1naPgud3DWdNW5tO2ajkFEAdxvMVUpW0NeL3lYQizM
 x6Yfk6nY99fyPLel+fnjxXnmlGTJuXwQPsy8yKIrPkX83xvz9PUhJNuHKJ707je7MVJ7
 sHAhYDsMpkwUsMlzAHK0R/RKCjCkUkGq6zUJf+vYrMyS/Hnhyc5Gvxk/LiNA+HhuLs/L
 6Jcw==
X-Gm-Message-State: AOAM532dqPcPitHkJ9zDemeJpATQK4QxOwltVU7smr2i+C9oZa3JZojA
 yme9DnoPGv5AL3Rx1y2HnT0=
X-Google-Smtp-Source: ABdhPJwYROoGkGZt6KQvqFerbMfc/dR6YQlgj1tfJoNfTb3oio7K82/Z9zxbSyNhIVaJ2ZsmrfecyQ==
X-Received: by 2002:a62:3812:0:b029:13e:d13d:a062 with SMTP id
 f18-20020a6238120000b029013ed13da062mr8718921pfa.40.1601761535153; 
 Sat, 03 Oct 2020 14:45:35 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.217.69])
 by smtp.gmail.com with ESMTPSA id y10sm6605367pfp.77.2020.10.03.14.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 14:45:34 -0700 (PDT)
To: Joe Perches <joe@perches.com>
References: <20201003211931.11544-1-anant.thazhemadam@gmail.com>
 <d44d8c784f9df6f55dcf494c9c21cd11b16338d4.camel@perches.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <ed510989-841c-8f2f-73f0-3885eef35a99@gmail.com>
Date: Sun, 4 Oct 2020 03:15:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d44d8c784f9df6f55dcf494c9c21cd11b16338d4.camel@perches.com>
Content-Language: en-US
Cc: Petko Manolov <petkan@nucleusys.com>,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] net: usb: rtl8150: set random
 MAC address when set_ethernet_addr() fails
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


On 04/10/20 3:05 am, Joe Perches wrote:
> On Sun, 2020-10-04 at 02:49 +0530, Anant Thazhemadam wrote:
>> When get_registers() fails, in set_ethernet_addr(),the uninitialized
>> value of node_id gets copied as the address. This can be considered as
>> set_ethernet_addr() itself failing.
> []
>> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> []
>> @@ -909,7 +914,10 @@ static int rtl8150_probe(struct usb_interface *intf,
>>  		goto out1;
>>  	}
>>  	fill_skb_pool(dev);
>> -	set_ethernet_addr(dev);
>> +	if (!set_ethernet_addr(dev)) {
>> +		dev_err(&intf->dev, "assigining a random MAC address\n");
>> +		eth_hw_addr_random(dev->netdev);
> 4 things:
> .
> o Typo for assigning
Oh no. I'm sorry about that.
> o Reverse the assignment and message to show the new random MAC
Ah, okay. That would be more informative.
> o This should use netdev_<level>
Understood.
> o Is this better as error or notification?
>
> 	if (!set_ethernet_addr(dev)) {
> 		eth_hw_addr_random(dev->netdev);
> 		netdev_notice(dev->netdev, "Assigned a random MAC: %pM\n",
> 			      dev->netdev->dev_addr);
> 	}
I thought it might be an error since set_ethernet_addr() did fail after
all.=A0 But making it info seems like a better idea, since technically spea=
king,
the device is still made accessible.

I'll wait for a day or two, to see if anybody else has any other comments,
and send in a v4 incorporating these changes.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
