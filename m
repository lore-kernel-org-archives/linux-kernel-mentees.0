Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF118C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 13:41:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 114532076E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 13:41:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myis63Jh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 114532076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7E97A85A49;
	Mon, 12 Oct 2020 13:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ruscC7M1fYK; Mon, 12 Oct 2020 13:41:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F1ABB85955;
	Mon, 12 Oct 2020 13:41:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAAFEC0052;
	Mon, 12 Oct 2020 13:41:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86BF0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 13:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 757D985D4B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 13:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EdN47dKBxbSw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 13:41:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A06A285955
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 13:41:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h5so9173365wrv.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=IJUnRg3mPl7jkNIy9dsIVIo/IklmtiJHaWeguv2Wi6o=;
 b=myis63Jh6YDVFMzfEygbdF9hf05zpKmITCIrOSFpVhbl8MbqTQUpPKNrthRN4bO5yl
 wc79p3g9mtnnnjpkbqE9eiHSA37bYb5Kmu7yBK8xzdzMJOXHsoG7tGnSjVRrbpixUFJT
 cCHC/QGUeGslVcgZ2c/UJtWpO7GPQRjz2YD534IFFUaJ6vOn7yjSSksjjaniWJz+FB6q
 wNLNI25LsHqQwfxCir6BNSrnP+QPQ0QkBSL2sTZiQgUXIhHNyV1J4dAg1/EaMbkRsm+S
 RPv/tqbypnh6u5mng3PsfzcItpfboZQVu9V+MrAJZ+K3r9O2qPe8sKWtTE67WrbcR4ws
 jRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=IJUnRg3mPl7jkNIy9dsIVIo/IklmtiJHaWeguv2Wi6o=;
 b=G7Ji0vqJUmC3VagILwdfbQHC2J9TJIkfacYvfRSjCKDzT5tHYOMNpw2i/UIcG8Edon
 YeKMfFNmw6QUgJhkxeMVzbr2dvhgCamF+Imzw3FMIvth13ivPNsq5QKxgUSb+jZTXYD9
 34Pls3nTYkMNMvnxUljZ/utaMm/ZzanMnWUz8xYBejxvc1U3K85XZj4Kmg/impfrCaAu
 CuYWiSd7wzP/eSi3oZGccNwlbqMkjDQ9I+EZTjSgsOz1FPBZVfSTeoTBMmmWOZkR4Erh
 duu4nh77aKJEa6HbmaXf/abccfwk1o5dopY0RpY4CraRVMQg9yv2ukxYxEj8CyB2iT9m
 IaHA==
X-Gm-Message-State: AOAM5316FhB7gpyFsmM5AtjihNmc5lW76cJBAFEJ33ZAFAuP9hhkiW9I
 gs5TKOfuR58E1kiczYkJuSQ=
X-Google-Smtp-Source: ABdhPJxNacfJsPZ4yvtD3vkFSwscCrt+i4xkgGs8nl4/9iPQ2QPpRexcbXY0JT8irITMO0Ma8G6Vyg==
X-Received: by 2002:adf:e80f:: with SMTP id o15mr28721128wrm.308.1602510062848; 
 Mon, 12 Oct 2020 06:41:02 -0700 (PDT)
Received: from felia ([2001:16b8:2d57:fc00:8472:203c:3ecb:c442])
 by smtp.gmail.com with ESMTPSA id t5sm24754891wrb.21.2020.10.12.06.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 06:41:02 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 12 Oct 2020 15:40:54 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <2b00e566-112c-5657-c10f-7f210d3eae93@gmail.com>
Message-ID: <alpine.DEB.2.21.2010121537150.6487@felia>
References: <2b00e566-112c-5657-c10f-7f210d3eae93@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Michal Marek <michal.lkml@markovi.net>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
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



On Sat, 3 Oct 2020, Ujjwal Kumar wrote:

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
> 2. Again, adds specific interpreters to other parts of 
> kbuild system.
> 
> I could successfully perform the following make targets after 
> applying the PATCH 2/2:
> make headerdep
> make kselftest-merge
> make rpm-pkg
> make perf-tar-src-pkg
> make ARCH=ia64 defconfig
> ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make prepare
> 
> Following changes in PATCH 2/2 are not yet tested:
> arch/arm64/kernel/vdso32/Makefile
> arch/nds32/kernel/vdso/Makefile
> scripts/Makefile.build
> 
> Ujjwal Kumar (2):
>   kconfig: use interpreters to invoke scripts
>   kbuild: use interpreters to invoke scripts
>

Ujjwal, I suggest that you continue to wait if you get any feedback from 
Masahiro-san within the next two weeks (although the merge window) and if
not, try to rebase to the the next rc1 and resend this patchset with 
Nathan's feedback tags added.

The merge window is busy time for maintainers; in the meantime, you might
look into if the build target 'make tools/clean' works on the current 
release and if there are fixes getting merged that fix that.

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
