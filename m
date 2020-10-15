Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33207C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 17:59:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D6DD2225F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 17:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="nd45TYeM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D6DD2225F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C300788134;
	Thu, 15 Oct 2020 17:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ve0tVW+vIUoG; Thu, 15 Oct 2020 17:59:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A4368810B;
	Thu, 15 Oct 2020 17:59:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4244CC0052;
	Thu, 15 Oct 2020 17:59:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A60EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 17:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4787A88216
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 17:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxSF7w47SVMx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 17:59:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8C2B588809
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 17:59:42 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id l15so3003712ybp.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 10:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wKh+0HzGrAAmsHpcRBa9cGPedjwN4QDV3FOpmLuMWLo=;
 b=nd45TYeMyASH3X2XxyTeQWZp5/vlwX5hzsc+o/t08Q0mcf3EzG7hfRG8B1D71kPDWv
 P4L/Y/FlKsu2tu7Hh7zScMTUyOH5KveObkxyPvPnTPo/3YQGSGWyzfTpdlC9qrqlWW80
 bU3Y+hf6NBmSUxGCm1Ea5ywrqXNTBbup7F7JrkVdmZ9fqWJaNqiiyv6oMVnxA0dD4DQW
 yvRptvHtkPZeT1eKFJzz8kFPSjeuXpok189ISDQrsKGL9r0maF+t4jH6/iC/BDeO+yfW
 0d/IgKhp2D1d8YfF4auBqFG/Y3OYKfTfzC5DI9/wE5eUDaA8XTJjRdP0Wmg7sWGTD/bd
 gHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wKh+0HzGrAAmsHpcRBa9cGPedjwN4QDV3FOpmLuMWLo=;
 b=LfI5DyF+HXY6Ml60RPYfbrVGMUzyYK5Vz9fSYTmiY6BCi8TxOTUooI1A56bdk0Glnv
 +PCoDE9341sQvgfDIQqq/3ZtXeSivQ+TB91B6XwoqgXGL9/hn5un5NHNKf+MsK2N8tf3
 iJaFb8lSq2S3VbU9Rt69TVFQqUcG256dDhMYf5J1QkEr27unRlLhxMCn/5TmcsY1XCzq
 WHwpuT+O3iP4vA+gotW+63/qz5323kMMy1p1LaVvkcBT/qmX1iwqGln3+JEByu4FuerX
 szY2aKYGSHR5+U/LcUM/n6iLalRkB194tpMn84qkKP62FZZovjFtePIniAlRm589NYxW
 hjNw==
X-Gm-Message-State: AOAM530BmeDGHecXdb4WN7m/XXdxn/gnPvZ+eVySkLN8GqKNPMjl0cBv
 blyZVj5LNA/rM4SxWS7GK0hjNOaeGS4PWoH+e6Mk6V5vmBYOFtA9rCI=
X-Google-Smtp-Source: ABdhPJwyxXAnCsEWQ2qq755UXIZ0LSyCvR1SxEYGrAYoLnYYwsalh/yzr9VPcTnFL7XmNsATtfKUXWEohcxiY4aMEDw=
X-Received: by 2002:a5b:1c4:: with SMTP id f4mr7199645ybp.205.1602784781497;
 Thu, 15 Oct 2020 10:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201015014616.309000-1-vitor@massaru.org>
 <20201015174823.GY4077@smile.fi.intel.com>
In-Reply-To: <20201015174823.GY4077@smile.fi.intel.com>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Thu, 15 Oct 2020 14:59:05 -0300
Message-ID: <CADQ6JjVYiDQOJt1apsygEUK=530hfF9V+8QSZ_ntgvwYYoYqfQ@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marco Elver <elver@google.com>, mhocko@suse.com, arnd@arndb.de,
 torvalds@linux-foundation.org, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 elfring@users.sourceforge.net, paul.gortmaker@windriver.com,
 geert@linux-m68k.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 tglx@linutronix.de, linux-kernel-mentees@lists.linuxfoundation.org,
 akpm@linux-foundation.org, KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] lib: kunit: add list_sort
	test conversion to KUnit
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

On Thu, Oct 15, 2020 at 2:47 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 14, 2020 at 10:46:16PM -0300, Vitor Massaru Iha wrote:
> > This adds the conversion of the runtime tests of test_list_sort,
> > from `lib/test_list_sort.c` to KUnit tests.
>
> >  rename lib/{test_list_sort.c => list_sort_kunit.c} (62%)
>
> One more thing. The documentation [1] doesn't specify any name conventions.
> So, please leave file name untouched.
>
> [1]: https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html

This convention hasn't yet entered the Torvaldos tree, but it is in
the Shuah tree: [1]

+Test File and Module Names
+==========================
+
+KUnit tests can often be compiled as a module. These modules should be named
+after the test suite, followed by ``_test``. If this is likely to conflict with
+non-KUnit tests, the suffix ``_kunit`` can also be used.
+
+The easiest way of achieving this is to name the file containing the test suite
+``<suite>_test.c`` (or, as above, ``<suite>_kunit.c``). This file should be
+placed next to the code under test.
+
+If the suite name contains some or all of the name of the test's parent
+directory, it may make sense to modify the source filename to reduce
redundancy.
+For example, a ``foo_firmware`` suite could be in the ``foo/firmware_test.c``
+file.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=kunit&id=2a41fc52c21b6ece49921716bd289bfebaadcc04

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
> --
> You received this message because you are subscribed to the Google Groups "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kunit-dev/20201015174823.GY4077%40smile.fi.intel.com.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
