Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071C3C5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 19:05:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 653EA20882
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 19:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="VaEnLf46"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 653EA20882
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CF55286CC5;
	Fri,  6 Nov 2020 19:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BdKn3eQ+APNu; Fri,  6 Nov 2020 19:05:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F0BE686CCD;
	Fri,  6 Nov 2020 19:05:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8B56C088B;
	Fri,  6 Nov 2020 19:05:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4167AC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 19:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0ACD52044E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 19:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Ieuqpd0Vwq6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 19:05:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by silver.osuosl.org (Postfix) with ESMTPS id A34462034D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 19:05:36 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id m17so2411403oie.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Nov 2020 11:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R698vTS3sP7K10LIp+T/pBAzJll3NJN4xvHU3P1DGwg=;
 b=VaEnLf46w5vIExY59a+G9WTSqIbWqj+eUMwZksdIYvwFgg9NYmW6tFJMVSO7nUQ4tD
 ezz/DeLkXzjkhfXUHKcSGlFbUyh42hxCne6/lYXZejfEeetFS3kISHyyD1FgWP5c4qFa
 M9IOzy15cbcppijEQghWGg7j94ijBny6yqeVwvc4HsYgoB6kJ0I+W6Pmtxd6WaPrPufA
 HAmkD9D05NWgQR8UQF6VFzQJkA+/LUIRLx6LPpIkN1mPEKR3unfNWZMF0D5s2hHk0za8
 kI0RIMFIKvratitfXOYU32CibW45aA2MR1uWhaBI8UujKK2eJRIVz+yMbHVQs5UDyUsN
 kEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R698vTS3sP7K10LIp+T/pBAzJll3NJN4xvHU3P1DGwg=;
 b=Vccbew96PK4z9f3y+4QrjrOZOs1mriEZ4pzbEBAlaHjbz4kvlmRNDoT1rUam8OuPhO
 kiZjTZZbnB0HOmBP6ftGSnF6eBwhbrJighczQGTC8W4LMtjNCWMtr18wesrHpmt7x5d9
 7G6Mc3FWevWHaTzbpHzUQf5gSyNIwGDlNpa1EcuL1kGwr3IPiF0M/yQ35gzOIW1eJVog
 2NIeEHwgPKKyplSegOWsIrYbEqOkBUihV2Z44ZvT87IsNKwweMHF3zN3JZlO6sxImhQi
 yQeSEcDWgzX1ebIyetU/hKa8FEIdXHgdbzVOr1K9xQ9r94LOcADApsOWD4eK64JqYBI+
 cDew==
X-Gm-Message-State: AOAM530AD70/gzpoy0CmUKPF1YZedyHUbEyMGTkJv9QnkfdDdgFNXetH
 joCZqP//g0+Kdd7plnqDWMowqtvKznPInTsUlcfUcQ==
X-Google-Smtp-Source: ABdhPJyZWFBrGNICpuwwmJZU0LRFQXm5D2oVyMpcLMzRrOflbicLpntjl2xTCu1rs052y24YptuLj5Ko4AXCh6MZ9Ok=
X-Received: by 2002:aca:6206:: with SMTP id w6mr2060911oib.121.1604689535633; 
 Fri, 06 Nov 2020 11:05:35 -0800 (PST)
MIME-Version: 1.0
References: <20201106182657.30492-1-98.arpi@gmail.com>
 <CANpmjNPsACW1mZmkWiCSeXfvAGaxAS5sHtYMu0-DfE7ec2pFMA@mail.gmail.com>
 <11549107-7247-03a7-2469-f5aa793a0d19@gmail.com>
In-Reply-To: <11549107-7247-03a7-2469-f5aa793a0d19@gmail.com>
Date: Fri, 6 Nov 2020 20:05:23 +0100
Message-ID: <CANpmjNM-Wj0fReinwTxBC3GD7p-8qKHeao1cMYMerFd5bO1fqA@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v5 1/2] kunit: Support for
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

On Fri, 6 Nov 2020 at 20:00, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> On 07/11/20 12:15 am, Marco Elver wrote:
> > On Fri, 6 Nov 2020 at 19:28, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> >>
> >> Implementation of support for parameterized testing in KUnit.
> >> This approach requires the creation of a test case using the
> >> KUNIT_CASE_PARAM macro that accepts a generator function as input.
> >> This generator function should return the next parameter given the
> >> previous parameter in parameterized tests. It also provides
> >> a macro to generate common-case generators.
> >>
> >> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> >> Co-developed-by: Marco Elver <elver@google.com>
> >> Signed-off-by: Marco Elver <elver@google.com>
> > [...]
> >> -       kunit_suite_for_each_test_case(suite, test_case)
> >> -               kunit_run_case_catch_errors(suite, test_case);
> >> +       kunit_suite_for_each_test_case(suite, test_case) {
> >> +               struct kunit test = { .param_value = NULL, .param_index = 0 };
> >> +               bool test_success = true;
> >> +
> >> +               if (test_case->generate_params)
> >> +                       test.param_value = test_case->generate_params(NULL);
> >> +
> >> +               do {
> >> +                       kunit_run_case_catch_errors(suite, test_case, &test);
> >> +                       test_success &= test_case->success;
> >> +
> >> +                       if (test_case->generate_params) {
> >> +                               kunit_log(KERN_INFO, &test,
> >> +                                       KUNIT_SUBTEST_INDENT
> >> +                                       "# %s: param-%d %s",
> >> +                                       test_case->name, test.param_index,
> >> +                                       kunit_status_to_string(test.success));
> >
> > Sorry, I still found something. The patch I sent had this aligned with
> > the '(', whereas when I apply this patch it no longer is aligned. Why?
> >
> > I see the rest of the file also aligns arguments with opening '(', so
> > I think your change is inconsistent.
> >
>
> Ah those lines had spaces instead of tab and I think I messed up the alignment
> fixing that. I will send another version fixing this.
> Thanks!

It was tabs then <8 spaces to align. checkpatch.pl certainly is happy with that.

> > Thanks,
> > -- Marco
> >
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
