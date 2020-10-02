Return-Path: <SRS0=/4fU=DJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEC6C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 21:36:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5169206DC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 21:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bfd91RAL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5169206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6FECA2002E;
	Fri,  2 Oct 2020 21:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vOjVz6ZR7Cq5; Fri,  2 Oct 2020 21:36:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DDBF420394;
	Fri,  2 Oct 2020 21:36:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C329CC0889;
	Fri,  2 Oct 2020 21:36:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D8BCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 21:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 037738643B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 21:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHuJD16snszP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 21:36:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7257886190
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 21:36:28 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h6so995440pgk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 14:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WPtIb4b9HGZamYKXhh2KqdHdyBLc/qR1UQErEqHmd+s=;
 b=Bfd91RALMexBIwsSkFsGQqhzCITd+Zrzx3mxAw6VIiE3THghd0AcGA+ruryD1OGqiM
 bnQgCnYhwbBs+0yJ0fwB4pjAl0AOJW7reQXjboGulHWJA5smGGz7UzVCOX1Q29/DhvsC
 kDvhkDe4rbxUvSrKX35labth1y8jLKYav+Bg5I0IYy/Eihj29gD846PusXg5KrPNSRTx
 +uybVrQb/9RtXvVTTiUdE3JEb+oWkSav8TUqDYd2WZrVwdZhuA3GENFjKATrp2U6mZr3
 dLFPpao4NnKlehP7/YZld/Rs2cBLI6sImLMjsPMOl4ir5BcMnOCcdDVb1IuVNdIGCVtu
 xbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WPtIb4b9HGZamYKXhh2KqdHdyBLc/qR1UQErEqHmd+s=;
 b=bok9B9wncuXoMXmbxh1gjDr+1lFPSD/AInhbk/vIV95zLkc2D5RuRzkkWXcxFPirp2
 5Gf2bxMLQjZUjGUXgSL+wf83F4fiztFMEzrS8JOk2RmREL0xflx4KCGdW2LkofGTWWb/
 4dOhskeqZzojR2YPXMVaJC2limnGItUIl2UscqePuTIP4eDkHAEH44t1bBFAqDqGGrVm
 Y697SxD+dmQghRPXeun3p4p2u9jstGeMSbGBPKBVBnFsHgt+ONcCkzSpfTL4YoE8SVkL
 Yx1LtYwne+u07x6kKHpFoTgsijlubt42MZ/A7qicpfHJv+7178j7c5tq+Ho2xDQLh1f7
 TZYQ==
X-Gm-Message-State: AOAM533HsqMISnNRIRBUQS4kfgQlKZl6heqbwh+YQWCLBKLCZoTsuC6S
 tuCKPEB8lp65GI33KNkTaEnQ/UgKKmbIvP6j
X-Google-Smtp-Source: ABdhPJyfmvNMPNiv4U7VNcZDxPCc5Z92OshYuT4hmVneIQ6yyo+5Ops++w0XY4tlOyYAXLYOwryHIg==
X-Received: by 2002:a62:54:0:b029:152:3212:f622 with SMTP id
 81-20020a6200540000b02901523212f622mr437504pfa.46.1601674587530; 
 Fri, 02 Oct 2020 14:36:27 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id b7sm5910263pjq.1.2020.10.02.14.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 14:36:26 -0700 (PDT)
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <06b25639-0d7d-e635-706c-19b950c5ff2e@gmail.com>
Message-ID: <0226bf70-611d-c12b-cbf2-2c2b70bbb2d9@gmail.com>
Date: Sat, 3 Oct 2020 03:06:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <06b25639-0d7d-e635-706c-19b950c5ff2e@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On 02/10/20 4:08 pm, Ujjwal Kumar wrote:
> This patch series aims at removing the dependency on execute 
> bit of the scripts in the kbuild system.
> 
> If not working with fresh clone of linux-next, clean the srctree:
> make distclean
> make tools/clean
> 
> To test the dependency on execute bits, I tried building the 
> kernel after removing x-bits for all files in the repository.
> Removing execute bits:
> for i in $(find -executable -type f); do chmod -x $i; done
> 
> Any attempts to configure (or build) the kernel fail because of 
> 'Permission denied' on scripts with the following error:
> $ make allmodconfig
> sh: ./scripts/gcc-version.sh: Permission denied
> init/Kconfig:34: syntax error
> init/Kconfig:33: invalid statement
> init/Kconfig:34: invalid statement
> sh: ./scripts/ld-version.sh: Permission denied
> init/Kconfig:39: syntax error
> init/Kconfig:38: invalid statement
> sh: ./scripts/clang-version.sh: Permission denied
> init/Kconfig:49: syntax error
> init/Kconfig:48: invalid statement
> make[1]: *** [scripts/kconfig/Makefile:71: allmodconfig] Error 1
> make: *** [Makefile:606: allmodconfig] Error 2
> 
> Changes:
> 1. Adds specific interpreters (in Kconfig) to invoke 
> scripts.
> 
> After this patch I could successfully do a kernel build 
> without any errors.
> 
> 2. Again adds specific interpreters to other parts of 
> kbuild system.
> 
> I could successfully perform the following make targets after 
> applying the second patch:
> make headerdep
> make kselftest-merge

I could further test the changes as follows-
scripts/Makefile.package:
make rpm-pkg
make perf-tar-src-pkg

arch/ia64/Makefile:
make ARCH=ia64 defconfig

arch/arm64/kernel/vdso/Makefile:
ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make prepare

> 
> Following changes in the patch 2/2 are not yet tested:
> arch/*
> scripts/*
> 
> Ujjwal Kumar (2):
>   kconfig: use interpreters to invoke scripts
>   kbuild: use interpreters to invoke scripts
> 
>  Makefile                          |  4 ++--
>  arch/arm64/kernel/vdso/Makefile   |  2 +-
>  arch/arm64/kernel/vdso32/Makefile |  2 +-
>  arch/ia64/Makefile                |  4 ++--
>  arch/nds32/kernel/vdso/Makefile   |  2 +-
>  init/Kconfig                      | 16 ++++++++--------
>  scripts/Makefile.build            |  2 +-
>  scripts/Makefile.package          |  4 ++--
>  8 files changed, 18 insertions(+), 18 deletions(-)
> 

Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
