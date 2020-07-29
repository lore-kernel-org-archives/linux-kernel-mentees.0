Return-Path: <SRS0=ZpoD=BI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2511C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 21:57:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A52952082E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jul 2020 21:57:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="rJaH5wiX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A52952082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 71D0386427;
	Wed, 29 Jul 2020 21:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJe-99ZQSLU8; Wed, 29 Jul 2020 21:57:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C78CD863C5;
	Wed, 29 Jul 2020 21:57:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABF93C0050;
	Wed, 29 Jul 2020 21:57:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C343C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 21:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3B58A86CC5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 21:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBQRgJ44WFm0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 21:57:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6D39481E2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 21:57:54 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id c14so13363938ybj.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jul 2020 14:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d/ukW0X/5BiKbJEKr2oeHvITKKVidatQzqB3tkKKQNg=;
 b=rJaH5wiXRvUWjGwEt7fJ1cni+QUEQC+KArZY6p9dqwr+4i9DiQKMSTcR2iiDPSaH8u
 fs+PexYNdlCvXC5wsnATdxceiAcJXPGlFX2e9AmEodp+cXu385RH3dMPBV1cVaFZ8sWv
 DQ823qFab2ZxTt4iFeEC9dVOjJgenL7Ch/RIR1u/PCbMpZXEOui01nlr3cARdxjtAy9L
 CzpjWgxyXcgh931rMjLjrAVgbhTDVmK0kglNHoNPDvJhLXtUMjjdo47t8tApp/WMUli+
 +Veo/yRPfOpoJnwAamAlxDyucbmT1wpFRznchCnqhxMgKido4q6VF/LK607lXukFaMP1
 AX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d/ukW0X/5BiKbJEKr2oeHvITKKVidatQzqB3tkKKQNg=;
 b=SAGXYVBnuHyTUeiDke4bEHOCxnG5/+Yl3ATTo21HHKckCt4hV/LPGZOqRyK1PnhWn0
 nNsCSbdjLNZrWPMgkzEuRfP8dwiSj/SO17GX6R0c+lprbafDql44vU3dpoFllYa9J2jc
 2QLVhrM371zC749P4qYzva/Y5YDkB3mkAO5oJDF1BZ9H5Bh2rJ4QCLs4wuNTzj6JXsjM
 lEoDdgDbdMIupH5is7hIkFBUPpVvgdXBOmnvtnvxvJgIxfhM6wVTR+UUzi/PNw5mQiGH
 lAteFGJFeYqzsRFLXVHTKJrcQBAsuwUbrkMsf5o4vdrZIRr/Q7tQKJk4B4+uD5aBymMo
 Lbag==
X-Gm-Message-State: AOAM531jTQBaiIX1+nfzBbt+YmgSld48xhudwbh903/AMd7MqDQ9136t
 O8JC+a6Q50FNoH8tk+qjMc1WTcfOxJ78txH4dCFJUw==
X-Google-Smtp-Source: ABdhPJz9dkLbOEKynG62lQISCs1yNneZEmgV3y/1OTZdR9Y2aBJ9odsOuCArdCa9NY4jjb6DO9llKm9ES6IszlsGFk4=
X-Received: by 2002:a25:361b:: with SMTP id d27mr66842yba.348.1596059873438;
 Wed, 29 Jul 2020 14:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200729201146.537433-1-vitor@massaru.org>
 <20200729203908.GD2655@hirez.programming.kicks-ass.net>
In-Reply-To: <20200729203908.GD2655@hirez.programming.kicks-ass.net>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Wed, 29 Jul 2020 18:57:17 -0300
Message-ID: <CADQ6JjW-=SNjV-abGpGA9NfHD4yGG_bD5FmvW99W-Vo06twkbw@mail.gmail.com>
To: peterz@infradead.org
Cc: irogers@google.com, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, mingo@kernel.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: kunit: add test_min_heap
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

Hi Peter,

On Wed, Jul 29, 2020 at 5:39 PM <peterz@infradead.org> wrote:
>
> On Wed, Jul 29, 2020 at 05:11:46PM -0300, Vitor Massaru Iha wrote:
> > This adds the conversion of the runtime tests of test_min_heap,
> > from `lib/test_min_heap.c` to KUnit tests.
> >
> > Please apply this commit first (linux-kselftest/kunit-fixes):
> > 3f37d14b8a3152441f36b6bc74000996679f0998 kunit: kunit_config: Fix parsing of CONFIG options with space
> >
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  lib/Kconfig.debug                         |  29 ++++--
> >  lib/Makefile                              |   2 +-
> >  lib/{test_min_heap.c => min_heap_kunit.c} | 117 ++++++++++++----------
> >  3 files changed, 83 insertions(+), 65 deletions(-)
> >  rename lib/{test_min_heap.c => min_heap_kunit.c} (60%)
>
> So where's the win? What's KUnit, why should I care and more lines.

KUnit is a unit testing and mocking framework for the Linux kernel. [0]

In Kconfig.debug you only have some more information about KUnit.

If the number of lines is a parameter that should be considered, I can
change sections like this

-                       if (last > values[0]) {
-                               pr_err("error: expected %d <= %d\n", last,
-                                       values[0]);
-                               err++;
-                       }
+                       KUNIT_EXPECT_FALSE_MSG(context,
+                                              last > values[0],
+                                              "expected %d <= %d\n",
+                                              last, values[0]);

To this:

-                       if (last > values[0]) {
-                               pr_err("error: expected %d <= %d\n", last,
-                                       values[0]);
-                               err++;
-                       }
+                       KUNIT_EXPECT_FALSE_MSG(context, last >
values[0],  "expected %d <= %d\n",  last, values[0]);

And from this:

+static struct kunit_case __refdata min_heap_test_cases[] = {
+       KUNIT_CASE(test_heapify_all_true),
+       KUNIT_CASE(test_heapify_all_false),
+       KUNIT_CASE(test_heap_push_true),
+       KUNIT_CASE(test_heap_push_false),
+       KUNIT_CASE(test_heap_pop_push_true),
+       KUNIT_CASE(test_heap_pop_push_false),
+       {}

To this:

+static struct kunit_case __refdata min_heap_test_cases[] = {
+       KUNIT_CASE(test_min_heap),
+       {}

I did the latter this way to be more informative, but if the goal is
to reduce lines of code, this is possible.

The results can be seen this way:

This is an excerpt from the test.log with the result in TAP format:
[snip]
ok 5 - example
    # Subtest: min-heap
    1..6
    ok 1 - test_heapify_all_true
    ok 2 - test_heapify_all_false
    ok 3 - test_heap_push_true
    ok 4 - test_heap_push_false
    ok 5 - test_heap_pop_push_true
    ok 6 - test_heap_pop_push_false
[snip]

And this from kunit-tool:
[snip]
[18:43:32] ============================================================
[18:43:32] ======== [PASSED] min-heap ========
[18:43:32] [PASSED] test_heapify_all_true
[18:43:32] [PASSED] test_heapify_all_false
[18:43:32] [PASSED] test_heap_push_true
[18:43:32] [PASSED] test_heap_push_false
[18:43:32] [PASSED] test_heap_pop_push_true
[18:43:32] [PASSED] test_heap_pop_push_false
[18:43:32] ============================================================
[18:43:32] Testing complete. 20 tests run. 0 failed. 0 crashed.
[18:43:32] Elapsed time: 9.758s total, 0.001s configuring, 6.012s
building, 0.000s running
[snip]

BR,
Vitor

[0] https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html#what-is-kunit
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
