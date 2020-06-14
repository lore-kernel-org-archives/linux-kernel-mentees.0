Return-Path: <SRS0=8YXb=73=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D62C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Jun 2020 18:17:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97AF52071A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Jun 2020 18:17:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="imO/Ri9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97AF52071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3875D22686;
	Sun, 14 Jun 2020 18:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5-Zj3HjR94Bu; Sun, 14 Jun 2020 18:17:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 08CBA2266C;
	Sun, 14 Jun 2020 18:17:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5E47C088F;
	Sun, 14 Jun 2020 18:17:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AB72C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Jun 2020 18:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 569F48836F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Jun 2020 18:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a44M4ALQSrLO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Jun 2020 18:17:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 28AAF8835A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Jun 2020 18:17:52 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id p21so6592589pgm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Jun 2020 11:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :in-reply-to; bh=cb72U6z8Cr3P1sDvU4qKoKm5R8JCyir5KudWL5PBfe4=;
 b=imO/Ri9IjD4cKro9T+4QV21TjLNGHMG84h8k8JDVGRPG/lHK243ckZNCe+G3H+somu
 OL/M8bk8nLvnmkjCfLFwJZiSPs5XKzfU+4zW6+kqGhPBJJ8/qUvOa0ltRzQlWUf1kUh+
 64Kjo3XlIX2tF4GTCv0UO0eZxM2cMtYeM7dBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:in-reply-to;
 bh=cb72U6z8Cr3P1sDvU4qKoKm5R8JCyir5KudWL5PBfe4=;
 b=WQDTwlCODTHjjHWdhL+BjOQCoVQdAc+eTWSzREXrSQtbYD2E8gZzSiwPkIQwxgKS/s
 ueCTDjMKXB9b3E9Wd56NfBAjhqYQmx0pNuYgy+FMjhK/RQko99ibrdXGnqQc0GDcfhFX
 wQxHLoodAHbcK+tZY1S6KdVsSpAK584whxLQkD/XIOBNVjTSLSiPmckgaWGWCd155bVq
 EfHAYHQsdSaNXG+aREPS1OGFekNGHUjN3FF52sikBJqtoE5Q4ORd3xLRxxEftQTyM9VE
 0rdsKCbbhihc33fSnGoK2xw+/pR5SX+u8taLLxunEgqnNanmJGCGXMEHDDVz/iQyIHD2
 6D1A==
X-Gm-Message-State: AOAM531eylyK3FYcKSwyyj9PR3JhGRKdQrboIzId5/yshvyPoZrr3IqY
 jYqFcTnTd9gZgdEFi771oxrSRA==
X-Google-Smtp-Source: ABdhPJwu5IBcA4n/0wLJc3MDmle+pQFHlC4oN8rj1R1/IVTU3LUF6VllWPCiJNuJcKG+Kg8WLb0yAQ==
X-Received: by 2002:a65:52c3:: with SMTP id z3mr18513447pgp.146.1592158671493; 
 Sun, 14 Jun 2020 11:17:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 4sm1469791pgk.68.2020.06.14.11.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 11:17:50 -0700 (PDT)
Date: Sun, 14 Jun 2020 11:17:49 -0700
From: Kees Cook <keescook@chromium.org>
To: David Gow <davidgow@google.com>
Message-ID: <202006141050.5512F17@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR13MB1175B804E31E502221BC8163FD830@CY4PR13MB1175.namprd13.prod.outlook.com>
Cc: linux@rasmusvillemoes.dk, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] RFC - kernel selftest result
	documentation (KTAP)
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

On Sat, Jun 13, 2020 at 02:51:17PM +0800, David Gow wrote:
> On Sat, Jun 13, 2020 at 6:36 AM Kees Cook <keescook@chromium.org> wrote:
> > Regarding output:
> >
> > [   36.611358] TAP version 14
> > [   36.611953]     # Subtest: overflow
> > [   36.611954]     1..3
> > ...
> > [   36.622914]     # overflow_calculation_test: s64: 21 arithmetic tests
> > [   36.624020]     ok 1 - overflow_calculation_test
> > ...
> > [   36.731096]     # overflow_shift_test: ok: (s64)(0 << 63) == 0
> > [   36.731840]     ok 2 - overflow_shift_test
> > ...
> > [   36.750294] kunit_try_catch: vmalloc: allocation failure: 18446744073709551615 bytes, mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
> > ...
> > [   36.805350]     # overflow_allocation_test: devm_kzalloc detected saturation
> > [   36.807763]     ok 3 - overflow_allocation_test
> > [   36.807765] ok 1 - overflow
> >
> > A few things here....
>
> Tim Bird has just sent out an RFC for a "KTAP" specification, which
> we'll hope to support in KUnit:

Ah-ha! Thanks for the heads-up. :)

> https://lore.kernel.org/linux-kselftest/CY4PR13MB1175B804E31E502221BC8163FD830@CY4PR13MB1175.namprd13.prod.outlook.com/T/#u

*thread split/merge*

This is coming from:
https://lore.kernel.org/linux-kselftest/CABVgOSnofuJQ_fiCL-8KdKezg3Hnqk3A+X509c4YP_toKeBVBg@mail.gmail.com/
But I'm attempting a thread jump... ;)

> That's probably where we'll end up trying to hash out exactly what
> this format should be. Fortunately, I don't think any of these will
> require any per-test work, just changes to the KUnit implementation.

Yup, good.

> > - On the outer test report, there is no "plan" line (I was expecting
> >   "1..1"). Technically it's optional, but it seems like the information
> >   is available. :)
>
> There's work underway to support this, but it's hit a few minor snags:
> https://lkml.org/lkml/2020/2/27/2155

Okay, cool. It's not critical, I don't think.

> > - The subtest should have its own "TAP version 14" line, and it should
> >   be using the diagnostic line prefix for the top-level test (this is
> >   what kselftest is doing).
>
> Alas, TAP itself hasn't standardised subtests. Personally, I think it
> doesn't fundamentally matter which way we do this (I actually prefer
> the way we're doing it currently slightly), but converging with what
> kselftest does would be ideal.

I see the KTAP RFC doesn't discuss subtests at all, but kselftest actually
already handles subtests. I strongly feel that line-start formatting is
the correct way to deal with this, with each subtest having it's own
self-contained KTAP. This allows for several important features:

- the subtest, run on its own, needs no knowledge about its execution
  environment: it simply emits its standard KTAP output.

- subtest output can be externally parsed separably, without any
  knowledge or parsing of the enclosing test.

For example, with my recent series[1], "make -C seccomp run_tests"
produces:

TAP version 13
1..2
# selftests: seccomp: seccomp_bpf
# TAP version 13
# 1..77
# # Starting 77 tests from 6 test cases.
# #  RUN           global.mode_strict_support ...
# #            OK  global.mode_strict_support
# ok 1 global.mode_strict_support
...
# ok 77 TSYNC.two_siblings_not_under_filter
# # FAILED: 73 / 77 tests passed.
# # Totals: pass:72 fail:4 xfail:1 xpass:0 skip:0 error:0
not ok 1 selftests: seccomp: seccomp_bpf # exit=1
# selftests: seccomp: seccomp_benchmark
#
not ok 2 selftests: seccomp: seccomp_benchmark # TIMEOUT

> > - There is no way to distinguish top-level TAP output from kernel log
> >   lines. I think we should stick with the existing marker, which is
> >   "# ", so that kernel output has no way to be interpreted as TAP
> >   details -- unless it intentionally starts adding "#"s. ;)
>
> At the moment, we're doing this in KUnit tool by stripping anything
> before "TAP version 14" (e.g., the timestamp), and then only incuding
> lines which parse correctly (are a test plan, result, or a diagnostic
> line beginning with '#').
> This has worked pretty well thus far, and we do have the ability to
> get results from debugfs instead of the kernel log, which won't have
> the same problems.
>
> It's worth considering, though, particularly since our parser should
> handle this anyway without any changes.

For the KTAP parsing, actually think it's very important to include
kernel log lines in the test output (as diagnostic lines), since they
are "unexpected" (they fail to have the correct indentation) and may
provide additional context for test failures when reading log files.
(As in the "vmalloc: allocation failure" line in the quoted section
above, to be included as a diagnostic line for test #3.)

> > - There is no summary line (to help humans). For example, the kselftest
> >   API produces a final pass/fail report.
>
> Currently, we're relying on the kunit.py script to produce this, but
> it shouldn't be impossible to add to the kernel, particularly once the
> "KUnit Executor" changes mentioned above land.

Cool. Yeah, it's not required, but I think there are two use cases:
humans running a single test (where is a summary is valuable, especially
for long tests that scroll off the screen), and automation (where it can
ignore the summary, as it will produce its own in a regularized fashion).

> > Taken together, I was expecting the output to be:
> >
> > [   36.611358] # TAP version 14
> > [   36.611953] # 1..1
> > [   36.611958] # # TAP version 14
> > [   36.611954] # # 1..3
> > ...
> > [   36.622914] # # # overflow_calculation_test: s64: 21 arithmetic tests
> > [   36.624020] # # ok 1 - overflow_calculation_test
> > ...
> > [   36.731096] # # # overflow_shift_test: ok: (s64)(0 << 63) == 0
> > [   36.731840] # # ok 2 - overflow_shift_test
> > ...
> > [   36.750294] kunit_try_catch: vmalloc: allocation failure: 18446744073709551615 bytes, mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
> > ...
> > [   36.805350] # # # overflow_allocation_test: devm_kzalloc detected saturation
> > [   36.807763] # # ok 3 - overflow_allocation_test
> > [   36.807763] # # # overflow: PASS
> > [   36.807765] # ok 1 - overflow
> > [   36.807767] # # kunit: PASS
> >
> > But I assume there are threads on this that I've not read... :)
>
> These discussions all seem to be coming to a head now, so this is
> probably just the kick we need to prioritise this a bit more. The KTAP
> thread hasn't covered all of these (particularly the subtest stuff)
> yet, so I confess I hadn't realised the extent of the divergence
> between KUnit and kselftest here.

Cool. Yeah, I'd like to keep things as close as possible. In looking at
this again, I wonder if perhaps it would be better to change the
"indent" from "# " to "  ", which might make things more readable for
both dmesg and terminal output:

[   36.611358]   TAP version 14
[   36.611953]   1..1
[   36.611958]     TAP version 14
[   36.611954]     1..3
...
[   36.622914]     # overflow_calculation_test: s64: 21 arithmetic tests
[   36.624020]     ok 1 - overflow_calculation_test
...
[   36.731096]     # overflow_shift_test: ok: (s64)(0 << 63) == 0
[   36.731840]     ok 2 - overflow_shift_test
...
[   36.750294] kunit_try_catch: vmalloc: allocation failure: 18446744073709551615 bytes, mode:0xcc0(GFP_KERNEL), nodemask=(null),cpuset=/,mems_allowed=0
...
[   36.805350]     # overflow_allocation_test: devm_kzalloc detected saturation
[   36.807763]     ok 3 - overflow_allocation_test
[   36.807763]     # overflow: PASS
[   36.807765]   ok 1 - overflow
[   36.807767]   # kunit: PASS

As it happens, subtests are a bit rare in kselftests right now, but
for kunit, the "common" output (IIUC) will fundamentally be a top-level
test running all the subtests, so we should get it right. :)

-Kees

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=selftests/harness/tap

--
Kees Cook
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
