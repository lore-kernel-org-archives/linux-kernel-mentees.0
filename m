Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9659CC4727D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 05:51:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19956206CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 05:51:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDbrYQ1/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19956206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B91BF8665F;
	Sat,  3 Oct 2020 05:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oTGveuKSYlsy; Sat,  3 Oct 2020 05:51:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 479D0864C4;
	Sat,  3 Oct 2020 05:51:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35A91C0889;
	Sat,  3 Oct 2020 05:51:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94461C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 05:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8FF6086C75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 05:51:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ufZEDb1X-Eqp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 05:51:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 062F586C66
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 05:51:18 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id f18so2920522pfa.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 22:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=U+/EF2NGSw6neafVxjjcMYfRuR3DJX5CJ+tBNvZuiek=;
 b=eDbrYQ1/6M4Lf6dtXjKmLkb9Mpk8YOQkWgLQJl7Oybb05dEBctkf1oZygTp3ea4U8f
 b3yZcFTPBznd6uF9FFO/lpuyPcWr2iurLrwLPyBknKv8/VyV2/sbbpO6bP90/BInq29w
 VQljsPxkIwjV9HjOZMB2tV+Xz6bWfJ0eafxtyOQm97yO09RiL3AIfjft1VcCc+NU+XSH
 WESdAhGBYBMYW2F3voe9glrz/Jsquhvm5ZFpUJUK2ppJGPNnItFyRCV8o8AObWEw7kdq
 bzBk18xgA7yASU/6crkWS18fPEYV4QFgB10WUxn1uxLu0qGV3DuRE2dCby+taRQe7wD0
 E+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=U+/EF2NGSw6neafVxjjcMYfRuR3DJX5CJ+tBNvZuiek=;
 b=SqXY6Xrc5As0hroTMopOhsbBqL2u7oz21sVS2uTbUjyPueiAuSVO+UiNHSsweNq395
 hAe7DH2FpRRNvJq8eSWJGs5UifLtLI8Bny7bUXZyEQ5pL0IdGzGUyGPncTTlDTp4MB+m
 a5hmymzbEZX+SSQfxQV3sMTZAJsyMAQId2DMCB39zv/b71BU86vjpe0kGq9sQj19SmZq
 NeVu4AasTQcBG6X6pxycAlbZSotrZzASFT6yv6sDRXaD4Sdpq93tzcsxeEe8zuUKsM1U
 ArwwN1xq6Ncjh9xQYa4wlsEe5qUywxyO+6dvbqNr1ydiei3qbdQoxWyDAvQ2kPmdXxML
 2Bpg==
X-Gm-Message-State: AOAM530XNrudo9nDOVx50uZyyZirD3SxsFEGfQ2UO+QqtSAirgMOdgK6
 rBWGlbyo11gq+N2p+eMeTMQ=
X-Google-Smtp-Source: ABdhPJziRclfzdzIVFLhkgcO4yRti4HLZ85RSEV/uXYO2t1/x37D1oe8GpDX/yrv1LkEUj6D6VYeNQ==
X-Received: by 2002:a63:f807:: with SMTP id n7mr5433763pgh.311.1601704277432; 
 Fri, 02 Oct 2020 22:51:17 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.217.69])
 by smtp.gmail.com with ESMTPSA id d17sm4215270pfq.157.2020.10.02.22.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 22:51:16 -0700 (PDT)
To: Greg KH <greg@kroah.com>, David Miller <davem@davemloft.net>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com, kuba@kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20201001073221.239618-1-anant.thazhemadam@gmail.com>
 <20201001.191522.1749084221364678705.davem@davemloft.net>
 <83804e93-8f59-4d35-ec61-e9b5e6f00323@gmail.com>
 <20201002115453.GA3338729@kroah.com>
 <a19aa514-14a9-8c92-d41a-0b9e17daa8e3@gmail.com>
 <20201002142901.GA3901@carbon>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <dbd92308-2443-0c1d-92f1-f506339e0a5e@gmail.com>
Date: Sat, 3 Oct 2020 11:21:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201002142901.GA3901@carbon>
Content-Language: en-US
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


On 02-10-2020 19:59, Petko Manolov wrote:
> On 20-10-02 17:35:25, Anant Thazhemadam wrote:
>> Yes, this clears things up for me. I'll see to it that this gets done in a v3.
> If set_ethernet_addr() fail, don't return error, but use eth_hw_addr_random() 
> instead to set random MAC address and continue with the probing.
>
> You can take a look here:
> https://lore.kernel.org/netdev/20201002075604.44335-1-petko.manolov@konsulko.com/
>
>
> cheers,
> Petko
Thank you for this reference. :)

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
