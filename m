Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1ABC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 16:36:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4598220838
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 16:36:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7q3poQl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4598220838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 975B02151E;
	Mon, 12 Oct 2020 16:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGQmbjhi+Mq8; Mon, 12 Oct 2020 16:36:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7B255204FB;
	Mon, 12 Oct 2020 16:36:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57CA2C0052;
	Mon, 12 Oct 2020 16:36:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76138C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 16:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5CA43874FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 16:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7MRz0gV40eVW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 16:36:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B8A0E874FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 16:36:18 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id d6so8871885plo.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gd86cnVMEv6nUkqocEH/guphnmHfom7rwvxSoLZ1nQI=;
 b=k7q3poQliNKrMvFe1BHWGlTNslk5tloXi5A3aKJecrv11W7LeZbZ8+46JBcbyW4WFj
 oG0T+Oq8U5Uh9y4fT7Ye1kBl7fJJSMZeFPBOuUI8pWi5nRyBgk02EQIDi1FmhO4ZgiZy
 nszISfAfxb3Q3AEySwTSq5nv2RLPMK78fsKIFeF5fmbx1AdnkWbphY8cD5aGxRNPBEDx
 pcki268j1GbJ9vNuYYoiqJTqDamy6sU9s1yXq0Se2YsOjgBJ67Srp2H2Br4P5LUv1V6m
 HmQwSqdAasoEgG9uJfOjBi1b55fLxuzOpaWpk6I4L8vmap+gy6lk4PNLLeupWaXE2dgz
 FWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gd86cnVMEv6nUkqocEH/guphnmHfom7rwvxSoLZ1nQI=;
 b=nfuuYS4lH9D3FnnAXLMcn2n8T5rajkgacLrrvOA/d+zgm8eIR8KR5egv62z1nXEAVc
 8DVse2Nx+w+aj73xMt/9O5qz6Z2B8CUaUokTGmFDqiP7lwPpp/UZtG58BBhU80b51OdL
 Yu/Kn7woNHz6ICv9Jf5h8rpjxn3KEroWYJPHhYOofIRnI6RwdidbJmrG+AEw/esxV1Br
 vLSS5sWGs/e+tD20k9u7aJQ1z/nxPkEcnQxRob6TqdjDtNG5zWqjWSpwKZQc4/HJZPO5
 wIAz4IsvuRI+0N/r3ncPBLuZZ3NV44nfEGZ0J2lDvkaCXGg+tr9LwDime0lIT8js6CjY
 raAw==
X-Gm-Message-State: AOAM531NjTm6OWsnmlE/yodITADp3qIjg6ybSgYsl01e5kapYzkIHsIx
 j3j+kkojK731k2PNd8B9r3wWycV6tmemwHm0
X-Google-Smtp-Source: ABdhPJz8AZdqfnri4o1DwdFFnh8hMt0zGwqgg9ejf3blzSfx/a97v/U3yLzd4m7LH8J9Ei3f+RmI2A==
X-Received: by 2002:a17:902:a715:b029:d3:c2b4:bcee with SMTP id
 w21-20020a170902a715b02900d3c2b4bceemr25272756plq.22.1602520577791; 
 Mon, 12 Oct 2020 09:36:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id q24sm23427124pfn.72.2020.10.12.09.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 09:36:16 -0700 (PDT)
To: Masahiro Yamada <masahiroy@kernel.org>
References: <2b00e566-112c-5657-c10f-7f210d3eae93@gmail.com>
 <CAK7LNAQwib66YwnMuN9qGQBs8dqqVaufOr9BqYMKfYUqiXu6jg@mail.gmail.com>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <0dfaf697-1f69-74c4-ffc1-30b77026db68@gmail.com>
Date: Mon, 12 Oct 2020 22:06:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQwib66YwnMuN9qGQBs8dqqVaufOr9BqYMKfYUqiXu6jg@mail.gmail.com>
Content-Language: en-US
Cc: Michal Marek <michal.lkml@markovi.net>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 0/2] use interpreters to
	invoke scripts
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

On 12/10/20 9:48 pm, Masahiro Yamada wrote:
> On Sun, Oct 4, 2020 at 12:19 AM Ujjwal Kumar <ujjwalkumar0501@gmail.com> wrote:
>>
>> This patch series aims at removing the dependency on execute
>> bit of the scripts in the kbuild system.
>>
>> If not working with fresh clone of linux-next, clean the srctree:
>> make distclean
>> make tools/clean
>>
>> To test the dependency on execute bits, I tried building the
>> kernel after removing x-bits for all files in the repository.
>> Removing execute bits:
>> for i in $(find -executable -type f); do chmod -x $i; done
>>
>> Any attempts to configure (or build) the kernel fail because of
>> 'Permission denied' on scripts with the following error:
>> $ make allmodconfig
>> sh: ./scripts/gcc-version.sh: Permission denied
>> init/Kconfig:34: syntax error
>> init/Kconfig:33: invalid statement
>> init/Kconfig:34: invalid statement
>> sh: ./scripts/ld-version.sh: Permission denied
>> init/Kconfig:39: syntax error
>> init/Kconfig:38: invalid statement
>> sh: ./scripts/clang-version.sh: Permission denied
>> init/Kconfig:49: syntax error
>> init/Kconfig:48: invalid statement
>> make[1]: *** [scripts/kconfig/Makefile:71: allmodconfig] Error 1
>> make: *** [Makefile:606: allmodconfig] Error 2
>>
>> Changes:
>> 1. Adds specific interpreters (in Kconfig) to invoke
>> scripts.
>>
>> After this patch I could successfully do a kernel build
>> without any errors.
>>
>> 2. Again, adds specific interpreters to other parts of
>> kbuild system.
>>
>> I could successfully perform the following make targets after
>> applying the PATCH 2/2:
>> make headerdep
>> make kselftest-merge
>> make rpm-pkg
>> make perf-tar-src-pkg
>> make ARCH=ia64 defconfig
>> ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make prepare
>>
>> Following changes in PATCH 2/2 are not yet tested:
>> arch/arm64/kernel/vdso32/Makefile
>> arch/nds32/kernel/vdso/Makefile
>> scripts/Makefile.build
>>
>> Ujjwal Kumar (2):
>>   kconfig: use interpreters to invoke scripts
>>   kbuild: use interpreters to invoke scripts
>>
>>  Makefile                          |  4 ++--
>>  arch/arm64/kernel/vdso/Makefile   |  2 +-
>>  arch/arm64/kernel/vdso32/Makefile |  2 +-
>>  arch/ia64/Makefile                |  4 ++--
>>  arch/nds32/kernel/vdso/Makefile   |  2 +-
>>  init/Kconfig                      | 16 ++++++++--------
>>  scripts/Makefile.build            |  2 +-
>>  scripts/Makefile.package          |  4 ++--
>>  8 files changed, 18 insertions(+), 18 deletions(-)
>>
>> --
>> 2.26.2
>>
> 
> 
> Andrew Morton suggested and applied the doc patch
> (commit e9aae7af4601688386 in linux-next),
> but did not pick up this series.
> 
> It is difficult to predict which patch he would
> pick up, and which he would not.
> 
> 
> I can apply this series
> together with Lukas' base patch.
> 
> 
> I pointed out possible mistakes in 2/2.
> I can locally fix them up if you agree.

I agree with the changes you pointed out. I was in the process
of sending a V2 patch series (almost done). But if you prefer 
on locally fixing them, that is completely fine.

> 
> 
> BTW, Kees Cook suggested dropping the x bit
> from all scripts, but I did not agree with that part.

IIRC, in the discussion Kees Cook suggestion was not to drop
x bit but rather he meant to use that as a trick to catch
any existing dependency on x bit.

> 
> 
> In the doc change, Lukas mentioned
> "further clean-up patches", but I hope
> it does not mean dropping the x bits.

IMO, he did not mean to drop the x bits.
But rather I have many more small changes similar to these.
He must be referring to these two patches and any future
patches around this issue.

> 
> 
> --
> Best Regards
> 
> Masahiro Yamada
> 

Thanks
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
