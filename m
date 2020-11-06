Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06A0C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 08:11:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F03DC206FB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 08:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="q/n2tTky"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F03DC206FB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5A4872042E;
	Fri,  6 Nov 2020 08:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZ-Bm6cUmeKF; Fri,  6 Nov 2020 08:11:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EBA1B2E0D8;
	Fri,  6 Nov 2020 08:11:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D52C7C088B;
	Fri,  6 Nov 2020 08:11:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A090C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 08:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F299F85B99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 08:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F1h5BJsqmCND
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 08:11:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0984F84B62
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 08:11:38 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n15so525996otl.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Nov 2020 00:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qv+2fhKomPyM/Arm56dvQoUMdEAVFc/83vyB1HdFckk=;
 b=q/n2tTky7OkAqP8C6pWfwUzofJAe1/aH2LP6nRy8e86QEOAggOB2RABoWjxSqYs44w
 qiIby2q8K4FhstReXQ6XkcFr9tWdN0X6NV50+6/UqHfxtceRcfWAvIrZZ2ETjDWbQBRC
 LwzbC79eYqSOJV8XQTOzXRspkiTzY5nfYqOuo+TnW2BMmy0eAbGAke985JGk3hdcYdEo
 2UifHWiv+Z1Bj1bZqjfYYEbkXmLbhMTyGF6gmXReU2yayfvwesZ7H0R8ysw78y+UJisu
 oPWhbTXcAhmd6+XpKTS+IuhvQMAwO1Hl/dHQUiHZJiduF8KveOG+BkMNYS1MP76sb4CN
 k1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qv+2fhKomPyM/Arm56dvQoUMdEAVFc/83vyB1HdFckk=;
 b=qArUCubJyIVLtFx8ZbLr6bOm32Kmm5oqIH4sdGibVN0/1VIfstMdSesRG7LInQclvu
 2TG8eDfqbggpR1luLzLc/7Zc+mKt4lFF6gXL//5x+NHxUWr5YVAQCbKtlvbm9NhU/Sc/
 QD7XUBIxFS+BLDV0mVtUlSzF6hZXTFuAjXMfvMsFwao1DevOC4BlhKICH7WlGMRMebeq
 vMLZLvatK0Ds3MT4++MG1qG0b/pkLTuJhCBkBXB9bQzwZTHjqtsifAAstnJ3miAxU6aK
 Uj9Qb53h5hhMWQFWjow+Zz0/Fe1+REWBNpTA++3q3i/MfVwyau4XvVPa6gASGXTDwVS0
 SgUg==
X-Gm-Message-State: AOAM532EnAWsYqmR2t8IbP5u6LpL/pAHnBsixCpgJoc+IyI7RUDYrP62
 bNHrtX9lKTme0pTZV9cX2erK9t48ni0M0e8zXw/eWg==
X-Google-Smtp-Source: ABdhPJxC97FTLyOYcZyRpKP24T4PE7eX1pOb+QJrOBjrg70qARJkigVK455YCAtXpI2MxrBmhKX6SAd/yLl4g04HNo8=
X-Received: by 2002:a9d:f44:: with SMTP id 62mr426221ott.17.1604650296929;
 Fri, 06 Nov 2020 00:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20201027174630.85213-1-98.arpi@gmail.com>
 <CANpmjNOpbXHs4gs9Ro-u7hyN_zZ7s3AqDcdDy1Nqxq4ckThugA@mail.gmail.com>
 <73c4e46c-10f1-9362-b4fb-94ea9d74e9b2@gmail.com>
 <CANpmjNPxqQM0_f14ZwV3rHZzwhCtqx2fbOhHmXmiJawou6=z6Q@mail.gmail.com>
 <77d6dc66-1086-a9ae-ccbc-bb062ff81437@gmail.com>
 <CANpmjNORLJ4b_uwBB8v2h5cxoZF2SMTaz5K6QP37PxdUJDZUDA@mail.gmail.com>
 <20201105195503.GA2399621@elver.google.com>
 <f7e04221-607c-dd05-24a6-27c26d86919d@gmail.com>
In-Reply-To: <f7e04221-607c-dd05-24a6-27c26d86919d@gmail.com>
Date: Fri, 6 Nov 2020 09:11:25 +0100
Message-ID: <CANpmjNMH9v3RE9xCh9nS=ZmBboxAsMvhfgby+QEO=Q3-oEyiNA@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v4 1/2] kunit: Support for
	Parameterized Testing
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
From: Marco Elver via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, 6 Nov 2020 at 06:54, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> On 06/11/20 1:25 am, Marco Elver wrote:
> > On Thu, Nov 05, 2020 at 04:02PM +0100, Marco Elver wrote:
> >> On Thu, 5 Nov 2020 at 15:30, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> > [...]
> >>>>> I tried adding support to run each parameter as a distinct test case by
> >>>>> making changes to kunit_run_case_catch_errors(). The issue here is that
> >>>>> since the results are displayed in KTAP format, this change will result in
> >>>>> each parameter being considered a subtest of another subtest (test case
> >>>>> in KUnit).
> >>>>
> >>>> Do you have example output? That might help understand what's going on.
> >>>>
> >>>
> >>> The change that I tried can be seen here (based on the v4 patch):
> >>> https://gist.github.com/arpi-r/4822899087ca4cc34572ed9e45cc5fee.
> >>>
> >>> Using the kunit tool, I get this error:
> >>>
> >>> [19:20:41] [ERROR]  expected 7 test suites, but got -1
> >>> [ERROR] no tests run!
> >>> [19:20:41] ============================================================
> >>> [19:20:41] Testing complete. 0 tests run. 0 failed. 0 crashed.
> >>>
> >>> But this error is only because of how the tool displays the results.
> >>> The test actually does run, as can be seen in the dmesg output:
> >>>
> >>> TAP version 14
> >>> 1..7
> >>>     # Subtest: ext4_inode_test
> >>>     1..1
> >>>     ok 1 - inode_test_xtimestamp_decoding 1
> >>>     ok 1 - inode_test_xtimestamp_decoding 2
> >>>     ok 1 - inode_test_xtimestamp_decoding 3
> >>>     ok 1 - inode_test_xtimestamp_decoding 4
> >>>     ok 1 - inode_test_xtimestamp_decoding 5
> >>>     ok 1 - inode_test_xtimestamp_decoding 6
> >>>     ok 1 - inode_test_xtimestamp_decoding 7
> >>>     ok 1 - inode_test_xtimestamp_decoding 8
> >>>     ok 1 - inode_test_xtimestamp_decoding 9
> >>>     ok 1 - inode_test_xtimestamp_decoding 10
> >>>     ok 1 - inode_test_xtimestamp_decoding 11
> >>>     ok 1 - inode_test_xtimestamp_decoding 12
> >>>     ok 1 - inode_test_xtimestamp_decoding 13
> >>>     ok 1 - inode_test_xtimestamp_decoding 14
> >>>     ok 1 - inode_test_xtimestamp_decoding 15
> >>>     ok 1 - inode_test_xtimestamp_decoding 16
> >>> ok 1 - ext4_inode_test
> >>> (followed by other kunit test outputs)
> >>
> >> Hmm, interesting. Let me play with your patch a bit.
> >>
> >> One option is to just have the test case number increment as well,
> >> i.e. have this:
> >> |    ok 1 - inode_test_xtimestamp_decoding#1
> >> |    ok 2 - inode_test_xtimestamp_decoding#2
> >> |    ok 3 - inode_test_xtimestamp_decoding#3
> >> |    ok 4 - inode_test_xtimestamp_decoding#4
> >> |    ok 5 - inode_test_xtimestamp_decoding#5
> >> ...
> >>
> >> Or is there something else I missed?
> >
> > Right, so TAP wants the exact number of tests it will run ahead of time.
> > In which case we can still put the results of each parameterized test in
> > a diagnostic. Please see my proposed patch below, which still does
> > proper initialization/destruction of each parameter case as if it was
> > its own test case.
> >
> > With it the output looks as follows:
> >
> > | TAP version 14
> > | 1..6
> > |     # Subtest: ext4_inode_test
> > |     1..1
> > |     # ok param#0 - inode_test_xtimestamp_decoding
> > |     # ok param#1 - inode_test_xtimestamp_decoding
> > |     # ok param#2 - inode_test_xtimestamp_decoding
> > |     # ok param#3 - inode_test_xtimestamp_decoding
> > |     # ok param#4 - inode_test_xtimestamp_decoding
> > |     # ok param#5 - inode_test_xtimestamp_decoding
> > |     # ok param#6 - inode_test_xtimestamp_decoding
> > |     # ok param#7 - inode_test_xtimestamp_decoding
> > |     # ok param#8 - inode_test_xtimestamp_decoding
> > |     # ok param#9 - inode_test_xtimestamp_decoding
> > |     # ok param#10 - inode_test_xtimestamp_decoding
> > |     # ok param#11 - inode_test_xtimestamp_decoding
> > |     # ok param#12 - inode_test_xtimestamp_decoding
> > |     # ok param#13 - inode_test_xtimestamp_decoding
> > |     # ok param#14 - inode_test_xtimestamp_decoding
> > |     # ok param#15 - inode_test_xtimestamp_decoding
> > |     ok 1 - inode_test_xtimestamp_decoding
> > | ok 1 - ext4_inode_test
> >
> > Would that be reasonable? If so, feel free to take the patch and
> > test/adjust as required.
> >
> > I'm not sure on the best format -- is there is a recommended format for
> > parameterized test result output? If not, I suppose we can put anything
> > we like into the diagnostic.
> >
>
> I think this format of output should be fine for parameterized tests.
> But, this patch has the same issue as earlier. While, the tests run and
> this is the output that can be seen using dmesg, it still causes an issue on
> using the kunit tool. It gives a similar error:
>
> [11:07:38] [ERROR]  expected 7 test suites, but got -1
> [11:07:38] [ERROR] expected_suite_index -1, but got 2
> [11:07:38] [ERROR] got unexpected test suite: kunit-try-catch-test
> [ERROR] no tests run!
> [11:07:38] ============================================================
> [11:07:38] Testing complete. 0 tests run. 0 failed. 0 crashed.
>

I'd suggest testing without these patches and diffing the output.
AFAIK we're not adding any new non-# output, so it might be a
pre-existing bug in some parsing code. Either that, or the parsing
code does not respect the # correctly?

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
