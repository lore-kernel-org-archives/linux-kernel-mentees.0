Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E616C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 10:54:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8508E2464E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 10:54:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBgtMyM7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8508E2464E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2E0528709B;
	Tue, 17 Nov 2020 10:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zNbwRH0IZQr8; Tue, 17 Nov 2020 10:54:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B639787098;
	Tue, 17 Nov 2020 10:54:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E1CAC0891;
	Tue, 17 Nov 2020 10:54:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 332C6C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2186D8709B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvbbyJepHv6y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:54:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8A16F87098
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:54:54 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id q28so5358873pgk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 02:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sm8n6UYqLjDm8/GBzKE/gX4i+7HfB6mILkhsvWxWLqg=;
 b=WBgtMyM7CFOtzC8nJ/CIHW8uxmrJ8plkQhu0ARjiEDQmxbWteTqZrbkLvND4oyhtrH
 IADsrma/PToPGL1ka/L7bT/AdTGiL1SE/egg6+37vMJTK5zqp+nP7VO+6LZm9SbEGQMR
 XdyqtQcdu6ADZILekb/BeJqT3wBxPbvJcAawdYK17rW0kmQ3I1wNmHI2YRlDzsQxv7mV
 t+e4h9TZHSuy4wpeHIhP1AgpTHGUTQtPhms4d9PuIDxxURdqJ0ADwGn2bSjBLu5SZbae
 LKqG+v1lpWUz1bVMp9KLQCEsm9J3RwqEAGV4VLgli8RPuV69AvsFZx2p/dYYOvaiCOt0
 eY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sm8n6UYqLjDm8/GBzKE/gX4i+7HfB6mILkhsvWxWLqg=;
 b=J5EOrlyYo/mQvm3xkRM7feMmwGwHYwWtohw1aFmGHJHpabFg9n82PW5jZaIfglX2G+
 WGCdu3YRyJ+PlO0HOZbPiQWLMse3hClnTMFiOuS7tIQGc3MccPHd5UnfI1Zqpez7FMlA
 Ov+EYMchzdJ2UdsUp7UIFdOXtAUAW51Zd8Z5nVmFn4cGpujg2kuvCfUgGd1ULCT/BtS1
 O+32//9ynqmzRhqC+jhfHIyYKutKKGzAz66JCzqmFhv703jfKjdBfEn8nr46eQCoXclP
 I+yD52wAfFDQd21bsOsc2FYEpkIfln5sz4TwclMSNpbg81zF09wGtcDW4D3sy4Zy99Gl
 ZHKg==
X-Gm-Message-State: AOAM5313zz35Ip/iZspgWio3QydC5M11Cnf0JhL1IgauVE/YLP17UFMM
 /obDY/SLC97QMqLoawRwzlw=
X-Google-Smtp-Source: ABdhPJxTYI2atV+F/z+ssLv6UCtAIPcR3CHHHGLuEuUBD6kPWx1vMXmTjDpJ+AjkCxcS3z44F811Aw==
X-Received: by 2002:a62:790f:0:b029:18a:ae57:353f with SMTP id
 u15-20020a62790f0000b029018aae57353fmr18013533pfc.78.1605610493977; 
 Tue, 17 Nov 2020 02:54:53 -0800 (PST)
Received: from ?IPv6:2402:3a80:425:6282:bc1b:1de0:7718:e8a1?
 ([2402:3a80:425:6282:bc1b:1de0:7718:e8a1])
 by smtp.gmail.com with ESMTPSA id n10sm8828366pgb.45.2020.11.17.02.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 02:54:53 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>
References: <20201117040501.21914-1-yashsri421@gmail.com>
 <1b9c5353c6318cc7a4e013886012739e6627d82d.camel@perches.com>
 <791b3213aaabd5ecccc9d3f6dd0e8ee420611dbd.camel@perches.com>
 <CAKXUXMxGbL8myAJwobCNEimxmwKTyF41WUNkLU45HTqSKKAPRw@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <a9e4543f-3020-8626-ac42-8c912b28a21d@gmail.com>
Date: Tue, 17 Nov 2020 16:24:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMxGbL8myAJwobCNEimxmwKTyF41WUNkLU45HTqSKKAPRw@mail.gmail.com>
Content-Language: en-US
Cc: Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix option
	for MAINTAINERS_STYLE
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

On 17/11/20 3:51 pm, Lukas Bulwahn wrote:
> On Tue, Nov 17, 2020 at 5:29 AM Joe Perches <joe@perches.com> wrote:
>>
>> On Mon, 2020-11-16 at 20:26 -0800, Joe Perches wrote:
>>> On Tue, 2020-11-17 at 09:35 +0530, Aditya Srivastava wrote:
>>>> Checkpatch expects entries in MAINTAINERS file in a specific order and
>>>> warns if the changes made do not follow the specified order.
>>>>
>>>> E.g., running checkpatch on commit b33bc2b878e0 ("nexthop: Add entry to
>>>> MAINTAINERS") reports this warning:
>>>>
>>>> WARNING: Misordered MAINTAINERS entry - list file patterns in
>>>> alphabetic order
>>>> +F: include/uapi/linux/nexthop.h
>>>> +F: include/net/netns/nexthop.h
>>>>
>>>> Provide a simple fix by swapping the unordered lines, if both the lines
>>>> are additions (start with '+')
>>>
>>> On second thought, nak.
>>>
>>> This fails when there are 3 consecutive misordered lines.
>>>
>>> SECTION
>>> F:    c
>>> F:    b
>>> F:    a
>>>
>>
>> btw:
>>
>> scripts/parse-maintainers.pl already does this reordering properly so
>> this particular --fix addition isn't all that useful.
>>
> 
> I think the real fix is to provide some more documentation on
> scripts/parse-maintainers.pl that explains how to run this script when
> an author hits the warning type in checkpatch.pl.
> 
> I see these follow-up patches:
> 
>   - some documentation on scripts/parse-maintainers.pl
>   - a patch to checkpatch.pl that points out this documentation when
> this warning occurs.
>   - maybe: improve of scripts/parse-maintainers.pl to handle exactly
> this use case of a patch author (assuming that the patch was just
> created with git format-patch -1) and how to get the corrected diff
> for this patch.
>   - maybe: a patch to checkpatch.pl that can create the command for
> scripts/parse-maintainers.pl for a specific patch and which then can
> be added with git commit --amend or git commit && git rebase and
> squashing that in.
> 
> I think once that is done and better understood, you can much better
> judge if there is really a need for a fix in checkpatch.pl.
> 

Okay thanks. Will check these out.

Thanks
Aditya

> Lukas
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
