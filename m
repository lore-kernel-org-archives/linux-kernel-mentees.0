Return-Path: <SRS0=jYeA=JZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E024C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Apr 2021 13:55:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5748613F7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Apr 2021 13:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5748613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D6F34036F;
	Wed, 28 Apr 2021 13:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlGq9TpmcBiC; Wed, 28 Apr 2021 13:55:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E2C3403A5;
	Wed, 28 Apr 2021 13:55:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 626DDC001C;
	Wed, 28 Apr 2021 13:55:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3863C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 13:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCB0B40EF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 13:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uh6kX_pbWqER
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 13:55:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D4D940F1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 13:55:10 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id h11so4149029pfn.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 06:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wKnfVtXVB1os6kOdLQqjjO+xiYB7bYlESDGmV9gDdZA=;
 b=m6ZS5sexXbm1PJxBUalOGEueg0J9idYG8RoHY9vRJp9JW34bUXur/EKIT6SRbv5Z9y
 XnMn10zN+CU7YUHOsW20jgXfb4k6bGlrJ2C4aaKGmkZSbMfg3XJjGog7HF5U7FWCHyd+
 vyUY2J/lAlqy+QeLl8bjRvn8f/5k5S5ypxWaF0jJv2UcvzAaYiUdEryvOYVeTAOqmWzu
 43n5XfACMEDCsFcWqWBJWfRxJRVJptyc/iCg4Iwh30uAxaYxwEJVu6IhPPPi4EKS9Jdl
 0D/bVxwkcoi52Yjp+ZzeJuGaWkKcmIsp2F1F5+KeklNoU91lSSRgCqGRqhvaxWSP9w5u
 ovMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wKnfVtXVB1os6kOdLQqjjO+xiYB7bYlESDGmV9gDdZA=;
 b=F7PrjOgtxt4lclEUQ+buLR6msCv2ALLhYwPz1yIJnfnJJArbiUeGKctPk/jKubPNLW
 d3to1iyW6+aJWdPbR142c8HKUpBkRKH/AP2xLQikNTrjjLqzYzv3umWLxWlFiQdPtSJv
 zMUuX/5A3kD4ucfmkgf+f6szyASYnRLr3/tMRngl9HhOCPIBz5zDYfqJo1qshQEit12X
 bmCcWHoLYdTWDx56XeQOjlp0ZBPITh9hOEoDKA2Ga8UwRikwjiY5KErnVYN9JBCoUWjS
 U1at9cKoseg25ZmCp/6HpJXMKTiy0GOIDASOAkDhvi//SIVn8S1nSl5ATaEdF4VnSoTQ
 I0gg==
X-Gm-Message-State: AOAM530adj+yPSomEopsft/v2RYZVbHcolsw1r5qWL9rqKIO7HPqzfKG
 3XCOW78gRmQ7XrcYqNhLrnM=
X-Google-Smtp-Source: ABdhPJzIkIJoKvai1SPqrnCaI5oWP6GbES6P5wEoiOFvUibAuzoem4QpCMAY80G1Gg1TIGktKw4KLQ==
X-Received: by 2002:a05:6a00:ccc:b029:276:93c:6a1d with SMTP id
 b12-20020a056a000cccb0290276093c6a1dmr16553173pfv.58.1619618109419; 
 Wed, 28 Apr 2021 06:55:09 -0700 (PDT)
Received: from [192.168.0.12] ([101.127.227.182])
 by smtp.gmail.com with ESMTPSA id s32sm5402092pfw.2.2021.04.28.06.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 06:55:08 -0700 (PDT)
Subject: Re: Starting a Wiki for Syzkaller Bug Fixing Resources
To: Kurt Manucredo <fuzzybritches0@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, syzkaller@googlegroups.com
References: <5705-18963-curtm@phaethon>
From: Esme Xuan Lim <esmethedev@gmail.com>
Autocrypt: addr=esmethedev@gmail.com; keydata=
 mQENBF80GGEBCACx2XC87vwwQ50OMDHkUyTq7GBG6hcDMfqplONHcUowFicsI8H02WFmJWJh
 nwT+lCimt2s4+zGsAOnJInQsHJwqU0rnYgt/MLuTbv3N3bmMHwx/lGrhP97DukVwKLItaIFI
 PO6kN0/amfT/O1nmTlcg+OvTU4duiBJCdDQHkxUkxU9WJaWjLhIcPAUhpKMoT1CGoxWyzOQC
 cwA8dCaHtNGDi5ko9HvF5A4X4t6gEc7qthW4nW5+pZTmqU2C11lh3CRAxLPTZb4unlSQUeLO
 ZgVo4qcU+hKYeRF9rchgt3qc8ZdN3VDwzwS7nnzj7Jfnw9Zi2L0idw626Vi5YJKpxKyJABEB
 AAG0N0VzbWUgWHVhbiBMaW0gKFVidW50dSBMYXVuY2hwYWQpIDxlc21ldGhlZGV2QGdtYWls
 LmNvbT6JAU4EEwEKADgWIQSSVkpJyy7emC6Yxf1P5w0EpsndNwUCXzQYYQIbAwULCQgHAgYV
 CgkICwIEFgIDAQIeAQIXgAAKCRBP5w0EpsndN70PB/47m+NJ6XFOkCb4zFo/8+C3T7ZbbNX8
 /W/h8Z3Zm/zyPra9kYm3JaWCKrJfFDbp6iuw80C+dX2n665L22xgvxLQlZ0i+APa/LXuNzoh
 OJ9VWiXquCUCdkX6KzeTM/aDIHlgUH71/8c6nTSkbfn5xRdEdD7tcj+WNCBIIfWvg4BGrt5L
 HVeZ6wg0SydhQIhHrTxQjYeJrU0SVH2c9ic4lKx/KnPVDUYsxDpue9a+nLz6UUNZIYkR84LQ
 9KlxvLBWZM5Nst5MW4ti2LeUjilTgZSuv1ybAW30FGCds+/pctQhNW7Ns/wV53OR6LI8gyyI
 SMePqKIPdeG5bAk0YitlMpTBuQENBF80GGEBCADF7iD1ito1ssFWaljnA33ODkTjYbMxPblS
 zH4s3qxj40GpK+DVs2p+deYkl2sMGFypHVCA2OyiBbB3y7d3PJBGbqaAYERUGBam66DXiyLm
 Mf96LdsxGA1YuBYAWni1ZSC4OjKu2KMUu3GYN/Ad8WSgUx9CVspgh0WAn8FJR3xm0HIBn178
 VQTC3fbCzpHT+yGx8wwG8SZ1apWq4EG6Gh1pdXJSOEuYf+wROjQ01/2f0JFaD2WcArfvOrUO
 ejnoYDlnHkjdPdFp6RX5PHM10Sv7qBw7riSBugSAhlna4wTvTbNrYtnD4dki7gMz3OmrLVsN
 yNqD7nZsUN32biOEzh3VABEBAAGJATYEGAEKACAWIQSSVkpJyy7emC6Yxf1P5w0EpsndNwUC
 XzQYYQIbDAAKCRBP5w0EpsndNwCxCACTMYmmIhy195/BNIDuUtNuPN7EQaSFaZcHaatfNTVR
 VsnyW7rHtzKde8/HPrsFaiaZEz6BbUxa3Nb45QJtwX7ZhZHhdlY7YLYTd7Ztbl5pdItaBg3U
 E5d1/eoQaC4mtWV4t2Pg3tqYT5ZT4MKTL7j9hAqQ1RjwutKEYKBqMaINdYfVOuSygX81GwK5
 cUsYQFKHSFufwwxEjim39AMAaZLdGDRY0SL6QSnMhHfjMe0FvT0XDdr+tY6g1VVhqsHpXKpC
 cstEFgKQBahJlSCWRJDGZ31U6iVPy4lFARt8gfLFxo9iV2VU0XZ8uVnMPJBekTmCuskdpBG7
 C3sYFlv6BVYL
Message-ID: <9e7e0cda-a078-d550-c4d5-bb5ca8702bd4@gmail.com>
Date: Wed, 28 Apr 2021 21:55:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5705-18963-curtm@phaethon>
Content-Language: en-US
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

On 28/04/2021 21:13, Kurt Manucredo wrote:
> On  Wed, 28 Apr 2021 04:50:18 +0800  Esme Xuan Lim <esmethedev@gmail.com> wrote:
>> Hi there,
>>
>> Having been on the bug fixing mentorship, I've been collating a bunch of
>> resources that helped me as I was going. I've been thinking that there
>> might be a big gap in resources in where interns might be looking and
>> was keen on trying to put one together. Given the current conversation
>> Greg has brought up about syzkaller bugs needing more attention, I
>> figured this could help fix it if interns are the only ones available
>> for this task.
>>
>> I think it'd help the kernel mentees current and future sink their teeth
>> quicker into fixing bugs, and less into helping themselves learn what is
>> needed. This appears to be a big gap that would really help if it were
>> filled. Resources are heavily abundant for the Linux kernel, but a good
>> level of curation and maintained resources could help with bug fixing.
>> Resources look old, but are incredibly insightful. I would have skipped
>> looking at these resources given my experience with more modern
>> frameworks and toolkits (which is that it would be best to avoid
>> outdated ones as APIs change very quickly - but this is not the case
>> with the kernel)
>>
>> I've got links and things but I've been wondering if it made sense to
>> build on the Kernel Mentees or to build a wiki (and host it) on
>> something more modern like github.
>>
>> I'd love to hear suggestions for how best to go about this, and if
>> anyone would like to contribute to it too.
>>
> I would love to contribute. I've started my blog on:
>
> https://fuzzybritches0.github.io/
>
> If any of these entries I made are helpful, I'd love to help you
> incorporate them into your wiki. I'd also love to get feedback on these
> entries. Count me in.
>
> thanks and kind regards
>
> Kurt Manucredo
>
(Resent to the mailing list; first email went only to Kurt - that was a mistake)

Hey Kurt,

If you join the discord, I guess we're having a fairly casual
conversation of how things should go. I'm writing up the structure of
the wiki at the moment and I'll have it up for pull requests in a bit:)

Thanks

Esme

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
