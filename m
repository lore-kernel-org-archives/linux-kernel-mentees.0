Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57299C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 16:19:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FA512080A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 16:19:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="qNwNh7mR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FA512080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4FEDA86992;
	Mon, 12 Oct 2020 16:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AjkgtyIzGDQW; Mon, 12 Oct 2020 16:19:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D317786951;
	Mon, 12 Oct 2020 16:19:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1CC9C0052;
	Mon, 12 Oct 2020 16:19:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CF65C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 16:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 66A848695F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 16:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFitqTVA8+8G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 16:19:24 +0000 (UTC)
X-Greylist: delayed 00:46:02 by SQLgrey-1.7.6
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5E09986951
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 16:19:24 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 09CGJBXI003346
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 01:19:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 09CGJBXI003346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1602519552;
 bh=HSVjCaHtsc2dmRdoJJRl8nIVTZkEJZ3ZKN4IOKEiAz0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qNwNh7mRnCz6XCKrCTUait4q+4+oQXzlRXXLX6DKNwvlMSdKNT8Ve4P6Pkl0rmITX
 HY4sE0RwIrcNNBKM063zq/jRI7s3rWdgs5VKJ/xRxa4hCbdrdmPcCjLTo3zHwXzzhm
 +5R3WLyy6RkglKVLKaum2IJaZw0GEYmgLeeROtLr0qM2rY4u4Fh4KMlOUySMxXzu4S
 93uzhnXobNao2ZfiKUDcPEtqTPeeLJlhS3TIZwEn3M5K9zUZlAsZMPcufk0VCAroL6
 bAJNCFa3Q0Lmyn150b8J7dwLDgz98NzXeS6NwmnByHzdT9CJLtSQAWdh1w1K/FPaB8
 L7AZlO4Sbihhg==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id 10so4408158pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 09:19:11 -0700 (PDT)
X-Gm-Message-State: AOAM531DZOGmFouIstpBZeL/UigCvS1YsR+Wk7PLptzckrW57GBAkZgT
 LdBzbGGCs7S5XvfXPrqfZVIWmSk1tG8DGdUWQyg=
X-Google-Smtp-Source: ABdhPJzngWagrH7sftCmJHLWQj8sGBu5RbPw53TOYBqMF5rPdKgCNRSBDYInuS5dENRcQV0vKp3ZD6d3YNumIy51UKs=
X-Received: by 2002:a17:90b:1b12:: with SMTP id
 nu18mr20160486pjb.153.1602519550926; 
 Mon, 12 Oct 2020 09:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <2b00e566-112c-5657-c10f-7f210d3eae93@gmail.com>
In-Reply-To: <2b00e566-112c-5657-c10f-7f210d3eae93@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 13 Oct 2020 01:18:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQwib66YwnMuN9qGQBs8dqqVaufOr9BqYMKfYUqiXu6jg@mail.gmail.com>
Message-ID: <CAK7LNAQwib66YwnMuN9qGQBs8dqqVaufOr9BqYMKfYUqiXu6jg@mail.gmail.com>
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
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

On Sun, Oct 4, 2020 at 12:19 AM Ujjwal Kumar <ujjwalkumar0501@gmail.com> wrote:
>
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


Andrew Morton suggested and applied the doc patch
(commit e9aae7af4601688386 in linux-next),
but did not pick up this series.

It is difficult to predict which patch he would
pick up, and which he would not.


I can apply this series
together with Lukas' base patch.


I pointed out possible mistakes in 2/2.
I can locally fix them up if you agree.


BTW, Kees Cook suggested dropping the x bit
from all scripts, but I did not agree with that part.


In the doc change, Lukas mentioned
"further clean-up patches", but I hope
it does not mean dropping the x bits.


--
Best Regards

Masahiro Yamada
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
