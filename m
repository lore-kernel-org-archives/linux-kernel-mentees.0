Return-Path: <SRS0=zsCJ=A2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C46C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 03:47:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC6D82074B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 03:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="b5kE0esf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC6D82074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B24D420456;
	Wed, 15 Jul 2020 03:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duvPIDI0qQuY; Wed, 15 Jul 2020 03:47:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EA1FA20447;
	Wed, 15 Jul 2020 03:47:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D39B6C0891;
	Wed, 15 Jul 2020 03:47:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 897D4C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 03:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9B06C2038D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 03:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s+N7kDBVKamN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 03:47:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 2E34520357
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 03:47:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z2so916388wrp.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 20:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=80hgB3Fq3XFIKiId7PbT4ZtffySmJWFsmTxk7R8Jg78=;
 b=b5kE0esfW+M+PVUtyf+1XnxZWg/JuNQGk9B30zFKSWwurrF2Da7rR/RbN+1Bsb5aak
 6KCFwvBiX1KbZ/IogP3pgSu/O8PM6byEbFMOnbofAE3e1bqbESydmUgbJoT2RamHCP3e
 7v/euNreVZcaLhwBYqZjk2NGFCoTAsl0SrlER1JeMtgBdpcy+r18pjhL7vJV/dsDXyoO
 FUrWxn5TvZREZUQE4uNfw4jrxhuCA4zh+n6XztLstMWmDrC+KPeKPxvwWVCLv2faVPb+
 /nh1TAQA68sOIRN8bgOsMTmahPxi+zieMcpGMPPMLaHf9LVlWYr2Tb582/rfA9b77/Yz
 B/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=80hgB3Fq3XFIKiId7PbT4ZtffySmJWFsmTxk7R8Jg78=;
 b=G0jpkA+GxA9ysR9T6SiVBRu/+fSKD30txl8dGFbw7A+t669u6kXmLhOF+FwIrpSTxI
 uovTZWksBQRb0o67O1iIhwJ4n5nVyPrQ6JAiZ3PMzOHTP5CXHOOdX0fKR9Fi9qhT6WB2
 trvA4orWrNtA1gEbVt/wOR1jpUBhSfcFuvO7hKPoxc9nCqFntUftu1nHwmTjDGpJOJAx
 J8rKmwUrOv9t3CVCtloSe815coqmx4NJXR+LxWByHy84+si0Pdpt+o7i91bh/S/yrOiR
 5V5T98C2Npc+sjdf4/KSPTo0my8qi4bAWRx0a+FNPdunRHAEOpTytHesapCAl+nIYEde
 kw9Q==
X-Gm-Message-State: AOAM530edpgHDqkWjXwppkaFuN1TFlepIMfHW71+QX2ipdLSDjpY5q/V
 fpPeEMlBgGz/2kOvCn1gGc18h5msTJ76sK6UILUEag==
X-Google-Smtp-Source: ABdhPJw9P2wWnLC30qk6qeKsB/4onQBt5QQ/Ff4rue+kzOL0Dw7pLXwt158nTqEpcLRe3Tk+o/VWZozgd5+OwoBRTJ8=
X-Received: by 2002:a05:6000:cf:: with SMTP id
 q15mr9253893wrx.203.1594784843205; 
 Tue, 14 Jul 2020 20:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200715031120.1002016-1-vitor@massaru.org>
In-Reply-To: <20200715031120.1002016-1-vitor@massaru.org>
Date: Wed, 15 Jul 2020 11:47:11 +0800
Message-ID: <CABVgOSkBAiMSMzCx62_CRo_0e2SGdvRWZ0dSC4t628YJBw-3Aw@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: Kees Cook <keescook@chromium.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [RFC 0/3] kunit: add support to use
	modules
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
From: David Gow via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: David Gow <davidgow@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Jul 15, 2020 at 11:11 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> Currently, KUnit does not allow the use of tests as a module.
> This prevents the implementation of tests that require userspace.

If this is what I think it is, thanks! I'll hopefully get a chance to
play with it over the next few days.

Can we clarify what this means: the current description is a little
misleading, as KUnit tests can already be built and run as modules,
and "tests that require userspace" is a bit broad.

As I understand it, this patchset does three things:
- Let kunit_tool install modules to a root filesystem and boot UML
with that filesystem.
- Have tests inherit the mm of the process that started them, which
(if the test is in a module), provides a user-space memory context so
that copy_{from,to}_user() works.
- Port the test_user_copy.c tests to KUnit, using this new feature.

A few comments from my quick glance over it:
- The rootfs support is useful: I'm curious how it'll interact with
non-UML architectures in [1]. It'd be nice for this to be extensible
and to not explicitly state UML where possible.
- The inheriting of the mm stuff still means that
copy_{from,to}_user() will only work if loaded as a module. This
really needs to be documented. (Ideally, we'd find a way of having
this work even for built-in tests, but I don't have any real ideas as
to how that could be done).
- It'd be nice to split the test_user_copy.c test port into a separate
commit. In fact, it may make sense to also split the kunit_tool
changes and the mm changes into separate series, as they're both quite
useful independently.

Cheers,
-- David

> This patchset makes this possible by introducing the use of
> the root filesystem in KUnit. And it allows the use of tests
> that can be compiled as a module
>
> Vitor Massaru Iha (3):
>   kunit: tool: Add support root filesystem in kunit-tool
>   lib: Allows to borrow mm in userspace on KUnit
>   lib: Convert test_user_copy to KUnit test
>
>  include/kunit/test.h                        |   1 +
>  lib/Kconfig.debug                           |  17 ++
>  lib/Makefile                                |   2 +-
>  lib/kunit/try-catch.c                       |  15 +-
>  lib/{test_user_copy.c => user_copy_kunit.c} | 196 +++++++++-----------
>  tools/testing/kunit/kunit.py                |  37 +++-
>  tools/testing/kunit/kunit_kernel.py         | 105 +++++++++--
>  7 files changed, 238 insertions(+), 135 deletions(-)
>  rename lib/{test_user_copy.c => user_copy_kunit.c} (55%)
>
>
> base-commit: 725aca9585956676687c4cb803e88f770b0df2b2
> prerequisite-patch-id: 582b6d9d28ce4b71628890ec832df6522ca68de0
> --
> 2.26.2
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
