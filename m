Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F1CC4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 06:24:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A888B2068E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 06:24:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0sS7xGw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A888B2068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5091A8682C;
	Sat,  3 Oct 2020 06:24:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lAb+0KtIoQQ7; Sat,  3 Oct 2020 06:24:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B5D0786816;
	Sat,  3 Oct 2020 06:24:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8CDAC016F;
	Sat,  3 Oct 2020 06:24:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6232C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 06:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AE36A86276
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 06:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8d0v7NyEnqTa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 06:24:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CC1C08626B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 06:24:54 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id j2so4037328eds.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 23:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=9vUz/c0tPU+FVXb/evPIZqKIq9cPWuBBejugj0m25JM=;
 b=r0sS7xGwDQqClwEC67nsV+67ELmlA6oqhBi2gX9jQqbjIcDanh/ObU5yajeC2Uw+WQ
 +8/6fFUIRCfHGRLe1cmLmQcZj5w4ivFJp2nkOKpbveHXVQ3eHk9IF0qNv0pO8BCEEbFT
 xk9cRAn+CEUrh8BIQTwBDwBGD669s57qu+wiACZgu5kh0amNzG1LHwFQ/3mYkFgPyQNg
 vLIyODPpLLfcU+L1y6ewzdG733daq6YwTsAS2DaiXgsh6dyeIeJKzfRxnd/JvsBltb9S
 IWX4EVoyylD395Cw7dDEw4uvg6Wz+gUCq/YWEyuJTN34aPYB+n/JjE4vl0DWuOI8L953
 Vppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=9vUz/c0tPU+FVXb/evPIZqKIq9cPWuBBejugj0m25JM=;
 b=k43rii+cM9bWUuaSf0JjYun5kmhOoIJg1Y0W1yY+KqEraDPF1kk7cXWPZkEFkPc81R
 RqwKvpxUVEov+3ZeU1TtF9zV7bwN2kQed9jxr/ObfK0yApBWqHtY1tUAOCRid/0r196L
 vEjNpyVVf3TUBw+h3ICsLbZ1cfByEQD9PO1kyfV6084d7lUe3xfKwedQApMa/SWKuTmc
 ZcwuWp3Y/hIcOabGrQU/9h7wFl9saHMBbMheuedb5nJPm5GkvnUcsBDRVpwAhmGodDAp
 nT9dKasK1CcRmpZiId5BXdp5r7nzO+76xlCCadF2N14Nq9E6HMgoZg1pq/gXGwQEbNJh
 AcBA==
X-Gm-Message-State: AOAM532bKpT4VvRYe4RoJR9ieCDjhH+D5TJfg2RhHme/wGeuQea8xjAP
 MFbag4f14k73xqGA0WSl5/0=
X-Google-Smtp-Source: ABdhPJzamWq0pZICPzJ2UZ+Z1SFm6KwxkLXbO6p6g198i/yEgaRXzqbUwGPgtmnmZ5RjpA5UY7p5Xg==
X-Received: by 2002:a05:6402:b68:: with SMTP id
 cb8mr6802093edb.350.1601706293362; 
 Fri, 02 Oct 2020 23:24:53 -0700 (PDT)
Received: from felia ([2001:16b8:2d0f:200:5c8a:6672:a0e2:bacb])
 by smtp.gmail.com with ESMTPSA id q3sm1222568edv.17.2020.10.02.23.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 23:24:52 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 3 Oct 2020 08:24:51 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <06b25639-0d7d-e635-706c-19b950c5ff2e@gmail.com>
Message-ID: <alpine.DEB.2.21.2010030819040.7503@felia>
References: <06b25639-0d7d-e635-706c-19b950c5ff2e@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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



On Fri, 2 Oct 2020, Ujjwal Kumar wrote:

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
> 
> Following changes in the patch 2/2 are not yet tested:
> arch/*
> scripts/*
> 
> Ujjwal Kumar (2):
>   kconfig: use interpreters to invoke scripts
>   kbuild: use interpreters to invoke scripts
>

Cover letter sounds good. Patches look good.

I suggest you send this out to the recipients you mentioned.

I will try to reproduce your setup and test the patches in the meantime.

Lukas

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
> -- 
> 2.26.2
> 
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
