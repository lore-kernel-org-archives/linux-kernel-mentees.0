Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF63DC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 21:48:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 289722076D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 21:48:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTRLFCNL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 289722076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BE6B927422;
	Mon, 12 Oct 2020 21:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YSluxmx9XM-S; Mon, 12 Oct 2020 21:48:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 728D827404;
	Mon, 12 Oct 2020 21:48:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B707C07FF;
	Mon, 12 Oct 2020 21:48:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88D48C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 21:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 77F9186E2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 21:48:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gRYyiUPpsEzQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 21:48:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DF9D086E26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 21:48:49 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id r10so15701849pgb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 14:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5hpUBhYkynzWSO/MyOJOUvzRQxBbeKodFS5ENFGt1Cw=;
 b=LTRLFCNLVioFU/DVKBPzF3b0xS54PVoSo7PO4zXv9Ign+qVU4TULsnKmBdI4qvOy/K
 pwBGlElzg1R9+sWqnbQQXfVzpsrckEDujiqzp3mQtlJNPNMvZlN9zNpsLq3lxuKdfNa7
 OARt4MdYOUqz02g0z/Esn5buWbAaAR/qSjB56C4pdvnmM29FFMFHiYPGDVD9hg8rGplG
 YUJwD5EpvWwwHXwyvcTvLC8+n0zr8llmK02cgWznQ13JMUcw1SzhTnkjQxz1YaQklGHk
 Nl95KEpncg+Ojoov5rNEx1o0L1HxPARbL9XvxVFhmLTI1ISROf0Fpys5Kua7ZrpF3ZRW
 ax0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5hpUBhYkynzWSO/MyOJOUvzRQxBbeKodFS5ENFGt1Cw=;
 b=cU7MiBxddy2qeI7C7eoeKGOR8Fv5pyrLkd3DQ534/NIxSZ05MqL00Uq3kNX2PILCme
 ReO5EZG310gMvqj0BwCuCXZgPFVyg5b9eYqYedJoorE7aKRS8eDZ1UMCd9887zjJENSh
 a/lHs9tZc6+eju7EdlGTBhmnNmwyrrCaYy9JHVR4wVcX6qjPvc/twUcv/ElunBBr1CPC
 PPYufBAMtm8Pf5/V8uJ5Pi71XdTC1OQdfxnHjglJ9ywHfSm2QyTme0JwkNQQdkEvl3tu
 cmRy7SWjPTl2P3njYlwxC3VZJeypWIBTOYYLKA+cQiDGQAAzyjq3AWctfFUT12qAeIpq
 l7Ow==
X-Gm-Message-State: AOAM533vVyk7yVTN5rFS0YQx3ZiNx605ZC0XkAsw+HNx6Qqv39sGirt5
 rtC2hW4aOZNuLziRhbnI65amjNkxOWhVxbLoR/E=
X-Google-Smtp-Source: ABdhPJz5Lp2adF9xI3yV5LRvSTjct73bdnYZ9/vx/AS1+EGaAwshFUhsI9eDn+I6rbF84Pp9iczIxw==
X-Received: by 2002:a17:90a:ec13:: with SMTP id
 l19mr22866654pjy.51.1602539328974; 
 Mon, 12 Oct 2020 14:48:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id y80sm16836402pfb.144.2020.10.12.14.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 14:48:48 -0700 (PDT)
To: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
References: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com>
 <20201012170631.1241502-3-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010122019410.17866@felia>
 <b4fdc7c5-8edf-3895-69fc-1bcf9efb5d4a@gmail.com>
 <53b7257e-b192-07da-9dd3-06497ce826f0@petrovitsch.priv.at>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <4969477f-8833-9b5e-6756-0d72fe59ef4d@gmail.com>
Date: Tue, 13 Oct 2020 03:18:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <53b7257e-b192-07da-9dd3-06497ce826f0@petrovitsch.priv.at>
Content-Language: en-US
Cc: Michal Marek <michal.lkml@markovi.net>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/2] kbuild: use interpreters
	to invoke scripts
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

On 13/10/20 12:24 am, Bernd Petrovitsch wrote:
> Hi all!
> 
>>>> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
>>>> index 703b1c4f6d12..86d42a2d09cb 100644
>>>> --- a/arch/ia64/Makefile
>>>> +++ b/arch/ia64/Makefile
>>>> @@ -27,8 +27,8 @@ cflags-y	:= -pipe $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
>>>>  		   -falign-functions=32 -frename-registers -fno-optimize-sibling-calls
>>>>  KBUILD_CFLAGS_KERNEL := -mconstant-gp
>>>>
>>>> -GAS_STATUS	= $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>>>> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>>>> +GAS_STATUS	= $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>>>> +KBUILD_CPPFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>>>
>>> Here is an instance of what Masahiro-san pointed out being wrong.
>>>
>>> Ujjwal, will you send a v3?
>>
>> Following is the quoted text from the reply mail from Masahiro
>>
>>>> -GAS_STATUS     = $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>>>> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>>>> +GAS_STATUS     = $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>>>> +KBUILD_CPPFLAGS += $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>>>
>>>
>>>
>>> These changes look wrong to me.
>>>
>>> $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)
>>>
>>
>> From the above text, I understand as follows:
> 
> Did you actually *test* that (expecially) these lines work
> afterwards as good as before?

Yes, I did check my changes. TBH, I spent a considerable
amount of time in doing so (given that I'm new to the
community). And I explicitly mentioned the ones I couldn't
test in the cover letter.

But I'm afraid this particular change that Masahiro pointed
must have been overlooked by me (and possibly by others
involved in the process). Being the author of the patch I
accept my mistake.

Because this construct was new to me I read about it
thoroughly in the docs.
As soon as it was pointed out to me, I at once realised
that the change proposed by me was wrong (i didn't
have to look at the docs).

> 
>> That my proposed change:
>> $(shell $(src...)    ->  $($(CONFIG_SHELL) $(src...)
>>
>> is WRONG
> 
> Yup, as it's in a Makefile and that's a Makefile construct> 
>> and in the next line he suggested the required correction.
>> That being:
>> $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)
> 
> Such stuff should generally not be needed as the to-be-used
> shell can be set in Makefiles via a "SHELL = " assignment

It's not about setting shell but rather using it at required
place. The 'shell function' is meant to execute provided 
commands in an environment outside of make; and executing
commands in that environment is somewhat similar to running
commands on a terminal.
Invoking a script file without setting the x bits will give
a permission denied error.
Similar thing happens when 'shell function' tries to invoke
the provided script. So the task was simply to prepend the
$CONFIG_SHELL (or $SHELL whichever is configured; simple sh
would also suffice) with the script file in 'shell function'.

> (defaulting to /bin/sh - what else;-).
> Flags for the shell can BTW set with ".SHELLFLAGS = ".

setting flags might not be the solution either.

> 
> So please
> -) learn basic "Makefile" + "make" before brainlessly patching
>    a Makefile.
> -) actually testy your changes to make sure the patch didn't
>    broke anything
> -) and - last but not least - check if there isn't a shell
>    already set (and which).

btw, I do agree with your points.

> 
> MfG,
> 	Bernd
> 

If I said anything incorrect please correct me.


Thanks
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
