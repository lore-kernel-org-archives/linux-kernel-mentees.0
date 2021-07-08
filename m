Return-Path: <SRS0=J1f0=MA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B173C07E9B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Jul 2021 01:52:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E5C61CB0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Jul 2021 01:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38E5C61CB0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F33F3400EF;
	Thu,  8 Jul 2021 01:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zVWK7zr3s4L; Thu,  8 Jul 2021 01:52:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1812F401FB;
	Thu,  8 Jul 2021 01:52:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5F04C001A;
	Thu,  8 Jul 2021 01:52:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEC3FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 01:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B871983640
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 01:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gesmSHOEgN69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 01:52:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0945F83294
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Jul 2021 01:52:23 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso2796881pjp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 07 Jul 2021 18:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LpL7qx90kO/NgJfcn2pzZvgiawADIWqcEOHPJQejQw0=;
 b=ED2uT3QB1HhsWxq1L45xwQou5AP4Y9WzFSN7zd9p3D1IF3z4fKaxHBfgzMtKaGl8kB
 wYCq5bstM1hSbqb0JUlCcIjSpFgugdwjJQ/YJFt5+lgApZCzYWAjkaryJTGM6w27n0uN
 TxT2ow0e00/iPygqFBfSESLftaH0KoyCj8Y+7AeANXFXHxwZfgiDqP1kr9kbV8z4AUEn
 dWOEIcoxRjuVj2KZ7PVn9BxSvF4gdsa7bSypTxCkLCrxGxG94neeAg6KE4XYWvkg6IdN
 6CFjTqkgCQnmbCm4IaJ3CuX3wp6rjMGtvpz3Tmk+Rk/cu4dORuidAIcGq6lZ59eqHAWD
 KGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LpL7qx90kO/NgJfcn2pzZvgiawADIWqcEOHPJQejQw0=;
 b=t/kMH1cgSKP5zc5qQ2yQDctGkwclTs/uxZ9Zqie1BxHfkfb+QsNHEEZXcsz6JE1paI
 lrMI85DKwXXLVdUYsH0ukb38Ot15c4+qbmK1wYZLYCjs/nlzwpTc+qOw1nP2TMy9qhaF
 hEC0Z0PnN2PQT4L5/AOtilLjSOoCw2jsxzlc9pMVd+xz++vx0xqn/KU8z+ShiujA/CI7
 euzKPUpX57rNAB3ymI/MCdq7sv6lG77JpvfiY+YIqhiGUPVWiLDcJFUOZj8NJJNTdw/u
 KJ44S8BWrv1/OjWBuC+BfXzEJsk4MYeCcKObJqhuatetLZqAZv8c7XTOyiv3YCoV71mI
 PO2A==
X-Gm-Message-State: AOAM532SOhwbm5Hix09zSicEGbNJuNOtwQgzZNvUFoK0NVv0kqMkLKvl
 mvqMtKubrYrOe/1LtmKeSefKmdMnQHIBwC/xUqU=
X-Google-Smtp-Source: ABdhPJyCISuCbgDROL/gqJ0JBv5xppQzbfXoTRY1Of4YmEnuf7J/NnVqeEWvz0Q6P6hvE1E01bB4JA==
X-Received: by 2002:a17:90b:4b52:: with SMTP id
 mi18mr12177096pjb.37.1625709143189; 
 Wed, 07 Jul 2021 18:52:23 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id f2sm491957pfe.23.2021.07.07.18.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 18:52:22 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] fcntl: fix potential deadlocks
To: Jeff Layton <jlayton@kernel.org>, bfields@fieldses.org,
 viro@zeniv.linux.org.uk
References: <20210707074401.447952-1-desmondcheongzx@gmail.com>
 <15fbc55a3b983c4962e9ad2d96eeebd77aad3be6.camel@kernel.org>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <12c41697-e9ea-3326-b906-bf15a0a4dece@gmail.com>
Date: Thu, 8 Jul 2021 09:52:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <15fbc55a3b983c4962e9ad2d96eeebd77aad3be6.camel@kernel.org>
Content-Language: en-US
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On 8/7/21 1:06 am, Jeff Layton wrote:
> On Wed, 2021-07-07 at 15:43 +0800, Desmond Cheong Zhi Xi wrote:
>> Hi,
>>
>> Sorry for the delay between v1 and v2, there was an unrelated issue with Syzbot testing.
>>
>> Syzbot reports a possible irq lock inversion dependency:
>> https://syzkaller.appspot.com/bug?id=923cfc6c6348963f99886a0176ef11dcc429547b
>>
>> While investigating this error, I discovered that multiple similar lock inversion scenarios can occur. Hence, this series addresses potential deadlocks for two classes of locks, one in each patch:
>>
>> 1. Fix potential deadlocks for &fown_struct.lock
>>
>> 2. Fix potential deadlock for &fasync_struct.fa_lock
>>
>> v2 -> v3:
>> - Removed WARN_ON_ONCE, keeping elaboration for why read_lock_irq is safe to use in the commit message. As suggested by Greg KH.
>>
>> v1 -> v2:
>> - Added WARN_ON_ONCE(irqs_disabled()) before calls to read_lock_irq, and added elaboration in the commit message. As suggested by Jeff Layton.
>>
>> Best wishes,
>> Desmond
>>
>> Desmond Cheong Zhi Xi (2):
>>    fcntl: fix potential deadlocks for &fown_struct.lock
>>    fcntl: fix potential deadlock for &fasync_struct.fa_lock
>>
>>   fs/fcntl.c | 18 ++++++++++--------
>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>
> 
> Looks like these patches are identical to the v1 set, so I'm just going
> to leave those in place since linux-next already has them. Let me know
> if I've missed something though.
> 
> Thanks!
> 

Yep, there's no change outside of the commit message. But I think after 
the discussion and with config DEBUG_IRQFLAGS, that is fine.

Thanks again, Jeff!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
