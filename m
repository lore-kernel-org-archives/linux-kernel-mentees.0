Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235D1C388F2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 18:46:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59EDC2067B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 18:46:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="D5+Q8S8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59EDC2067B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 125B5872AC;
	Fri,  6 Nov 2020 18:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTTnPErmts-f; Fri,  6 Nov 2020 18:46:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6D9B587259;
	Fri,  6 Nov 2020 18:46:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52DF1C0893;
	Fri,  6 Nov 2020 18:46:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 570C9C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 40C1B872A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id moggwd30j3Kg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:46:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 955AB87259
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 18:46:10 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id n15so2148274otl.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Nov 2020 10:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ElN3AyTjh5aMXmGHUFTcrTsMazikTf7o2LtiuSniYZ4=;
 b=D5+Q8S8gQ/D72X/54r2aCENNdmG3qQ/uSOs4qlrC+meTGrBxWzyUhbGN5AcVRTbEoX
 aBSlJSl6MMdPmek/r8GTKw7FWl8xaY2+bPHhNZzTHG/0p2owpuWq/aKHsdju2u8Fnvzi
 vUDnyU57uiirO5PL4roeYjBl10DFZqt4pZ5UO/cJGeBRMCpUP0Hh/3nCf1LJ50MLGTOb
 1mRyWLZT4mNkiGXwj1Y4seayHJZR0/rogLS8o4xfuxPZsiC75TDzUe7IbEPkul49oP6t
 YZmd+0T8fWEzyfDN/uM1DegNmzRu9xJlEABocHUEQaG6ygy2Lvg9lKy3Vb+HQqWkvMXg
 lY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ElN3AyTjh5aMXmGHUFTcrTsMazikTf7o2LtiuSniYZ4=;
 b=dAeAhqWJKfwBy4ijz4OBMUHmtUpdR24Td7aYTHDlSWNb2xtaQl/ilHMp7FGbSkd39N
 z1qYAzL1gEBfKOYh/KRn0CounXX9LlPcxNkhU4eRJ8ztu8QIbv2dXHkbqh3JUncmw3Hd
 m/gkMaRwdQrF9WDuAa6Mdzp7NIkNkWx13q2XC+wN74cdnEKl1cN/mv9B86E+Gl4ds647
 N7JVyNB3li3XUdl3pN7S2BSBADJ/Fs1P7gKPRgEvncSEf7l0WoK12pbeo83SwLUlRjqQ
 En9mhNr+NhLmKjHJBnjfw7TUFoHZMc4doSGcUThZrgFu+V52XL96f/6HUVUgAEJECFQT
 gSqw==
X-Gm-Message-State: AOAM530sGE2I9xBebxZWczDNZxA7NpUdonkZVWRXd5HOmzGhkJKelDzr
 jSqj4dH4R+iyYFW+02E7uQs6kc1CO2ODfBy2SYmfYQ==
X-Google-Smtp-Source: ABdhPJyh/Y4j/Wq2GsZz2D7bg/jo7/og/6yXxY6CRqxe+L0UEXv1UfKub2quFBwezIXP7sjaOGFzFmPQYxb0C85z3RU=
X-Received: by 2002:a9d:65d5:: with SMTP id z21mr1868950oth.251.1604688369657; 
 Fri, 06 Nov 2020 10:46:09 -0800 (PST)
MIME-Version: 1.0
References: <20201106182657.30492-1-98.arpi@gmail.com>
In-Reply-To: <20201106182657.30492-1-98.arpi@gmail.com>
Date: Fri, 6 Nov 2020 19:45:58 +0100
Message-ID: <CANpmjNPsACW1mZmkWiCSeXfvAGaxAS5sHtYMu0-DfE7ec2pFMA@mail.gmail.com>
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

On Fri, 6 Nov 2020 at 19:28, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> Implementation of support for parameterized testing in KUnit.
> This approach requires the creation of a test case using the
> KUNIT_CASE_PARAM macro that accepts a generator function as input.
> This generator function should return the next parameter given the
> previous parameter in parameterized tests. It also provides
> a macro to generate common-case generators.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> Co-developed-by: Marco Elver <elver@google.com>
> Signed-off-by: Marco Elver <elver@google.com>
[...]
> -       kunit_suite_for_each_test_case(suite, test_case)
> -               kunit_run_case_catch_errors(suite, test_case);
> +       kunit_suite_for_each_test_case(suite, test_case) {
> +               struct kunit test = { .param_value = NULL, .param_index = 0 };
> +               bool test_success = true;
> +
> +               if (test_case->generate_params)
> +                       test.param_value = test_case->generate_params(NULL);
> +
> +               do {
> +                       kunit_run_case_catch_errors(suite, test_case, &test);
> +                       test_success &= test_case->success;
> +
> +                       if (test_case->generate_params) {
> +                               kunit_log(KERN_INFO, &test,
> +                                       KUNIT_SUBTEST_INDENT
> +                                       "# %s: param-%d %s",
> +                                       test_case->name, test.param_index,
> +                                       kunit_status_to_string(test.success));

Sorry, I still found something. The patch I sent had this aligned with
the '(', whereas when I apply this patch it no longer is aligned. Why?

I see the rest of the file also aligns arguments with opening '(', so
I think your change is inconsistent.

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
