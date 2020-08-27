Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF936C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 07:58:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E44E20786
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 07:58:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdpN9e9+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E44E20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7B86888398;
	Thu, 27 Aug 2020 07:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RQNqm1I06sf6; Thu, 27 Aug 2020 07:58:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0E20088367;
	Thu, 27 Aug 2020 07:58:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 091BEC016F;
	Thu, 27 Aug 2020 07:58:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CFADC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 07:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2B35D203E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 07:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbOt4FwEXd0g
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 07:58:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 39FB620397
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 07:58:09 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v12so5340063ljc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 00:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lEBPqYLj1Sfpoe7PvHoeVpAVjO6ud5dnyjMuhp7FHVU=;
 b=UdpN9e9+xHs/VTWHW2V0XUZN9Egd4mwnCmlizNY/AIPcvPFUdBqRvFNQU8vo2kolFY
 7y2T/O/r2Ov/tzGqMTcdLnb7fmAI3MyewZNKhgF/msyQT7ep+SBJ9MJYrVL3ZFSf8/lg
 fgpStsnUu58uIXrIb6sZBB73as3h9JlklSIHZwdaI5fVlpeBSVoP3GSxdwAKRIuGJ0G3
 uheR2DVPPCDmJOgNe4rZtOHN3FRLjX6JrxavbkinDgK7QGTDkzOPEKPBJSpozg1JeTNn
 SVy2dKblpo1tKuycek1vObQRq14/QN8FwJFtMEbbj5T1J/lC/ZObD/EoVv5j9sc/krMV
 mzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lEBPqYLj1Sfpoe7PvHoeVpAVjO6ud5dnyjMuhp7FHVU=;
 b=ZOTCkI6RpSuFpdBZd0F3TCWsq/92UsH/LnnomPUdhythT0Ghp+vAQ51cgp1Zp84adu
 J7E7KMUHsArqcNI85nvCsXr8oKG6CcsMWwDrlWBSM3CDjAuIByoayavS7rTGSf3Wh5LY
 xQ6fskW15aa9LEt1YdWS4EpJkAf0BjmbLuzInxcx+rhqSK6PBR9etUHbpCLkT6NXty15
 30jEFUQnIOq/iJNFYMZSdB0WS78DHJy5w6RXSbNP/lcT9Sfz/kcFGAQaancnxMI6QPRu
 HPgy2EO1CdXzK9N7r2GzNLC3eK7KcYDNhrwLBuKgqqdujbDLugOpvDo0lbtPqCGDDTFH
 HhMQ==
X-Gm-Message-State: AOAM5333nWnUJFGWMCLQR2Lx1nTvehlTCHe+13KTRdTJHmNWAfPLvqq1
 XOOxsuWMVkzSFH8k0DD4W1g=
X-Google-Smtp-Source: ABdhPJwUG34ZG5RWvvEl84Os0y3M8D8sLpjg17s0tEPZza0pvwK+RE1G6cGDx9RKlYZrA7Z7NkQMOQ==
X-Received: by 2002:a2e:a370:: with SMTP id i16mr9544469ljn.22.1598515087168; 
 Thu, 27 Aug 2020 00:58:07 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4853:a15:71d2:9e85:be1:5e21?
 ([2a00:1fa0:4853:a15:71d2:9e85:be1:5e21])
 by smtp.gmail.com with ESMTPSA id j6sm297282lja.23.2020.08.27.00.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 00:58:06 -0700 (PDT)
To: Himadri Pandya <himadrispandya@gmail.com>, davem@davemloft.net,
 kuba@kernel.org
References: <20200827065355.15177-1-himadrispandya@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <5dd266df-33cf-f351-7253-33a7f589cd56@gmail.com>
Date: Thu, 27 Aug 2020 10:57:56 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827065355.15177-1-himadrispandya@gmail.com>
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: Fix uninit-was-stored
 issue in asix_read_phy_addr()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hello!

On 27.08.2020 9:53, Himadri Pandya wrote:

> The buffer size is 2 Bytes and we expect to receive the same amount of
> data. But sometimes we receive less data and run into uninit-was-stored
> issue upon read. Hence modify the error check on the return value to match
> with the buffer size as a prevention.
> 
> Reported-and-tested by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>   drivers/net/usb/asix_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
> index e39f41efda3e..7bc6e8f856fe 100644
> --- a/drivers/net/usb/asix_common.c
> +++ b/drivers/net/usb/asix_common.c
> @@ -296,7 +296,7 @@ int asix_read_phy_addr(struct usbnet *dev, int internal)
>   
>   	netdev_dbg(dev->net, "asix_get_phy_addr()\n");
>   
> -	if (ret < 0) {
> +	if (ret < 2) {
>   		netdev_err(dev->net, "Error reading PHYID register: %02x\n", ret);

    Hm... printing possibly negative values as hex?

[...]

MBR, Sergei
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
