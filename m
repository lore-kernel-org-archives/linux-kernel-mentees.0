Return-Path: <SRS0=wdXo=FG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD271C64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 13:10:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB3292222F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 13:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB3292222F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1AF2120487;
	Wed,  2 Dec 2020 13:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AURjndD6-UMr; Wed,  2 Dec 2020 13:10:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2C9EF20453;
	Wed,  2 Dec 2020 13:10:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13CF9C0859;
	Wed,  2 Dec 2020 13:10:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE359C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 13:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A4385878E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 13:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGwhWGqqpqwS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 13:10:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 52EB3878DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 13:10:29 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id i17so3622202ljd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Dec 2020 05:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i4Suf39GCGNNHp9xQ0t7Zvgxat9mlBC6lgDT1pUfxf8=;
 b=FM8PTyPU6TQTdnznfVQtjDlCFBomkBLOza9aIVUNFobA4LQplmlPkVf91dS+rRDR4g
 b0DRhOd8uTdbxwVj5LQDZJWGmFHP6gVqF8LzPbDTQlUPTjG5Ega8JUm46ZF8kTCRiTGy
 E3HBlchayQ+Y+NEq03G2hLtfgXfYIhZWZD7fGTymaQiOnblWT6/AkrIlTUkv8Ukm9Sqn
 SrPa3h7I7+i+2mWLWFP1PqW8Fmk8EumQcSbFvXWdT2lYsZsYf246ARFDmelfpz1M0aZT
 GGlAhNPeiLBtONohGTwREA1bVCy0leHymUQyhcdmcVH9mJ5dZXrqoYAgi9+9sd6Ik7E/
 wsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i4Suf39GCGNNHp9xQ0t7Zvgxat9mlBC6lgDT1pUfxf8=;
 b=Lo37R6SP+96kh5RBMQkVJ3+J79NxrBB0VEbVYrpCGlQinc/7Nt8oToaQDQ1zuqmNrW
 L6P6y25nwTgN7dm57ogci+3UvW5Zxc9oZgt2Sysz5DzkhCCWMC4US4tMbE5U9P4Phm1s
 8Z566Bf8mt4HK/MyC2++m7+Fmyf9On5H8sU9AFghuswlJEMIydtcmULV9wagAiSkZeK7
 Ce9G6eAul1iyfhzNbbn9I/v6P2dDMy2AT7ampUWPYoxPMHQMliKbnMOpw6/YBUgEfu9l
 mmslS9WrKIUmZe8Dm4l8aYUTexQZOQ00RPWhT4XARtOZIIId+agRZpQBE/MM5AFx0PVR
 VZjg==
X-Gm-Message-State: AOAM5304eF4VjufDgfuowIoVPOltxssBu4GD5Rk89+QhVa9DUesxj+mL
 qoRtZ5VYBub2O4EtgcKppDqk7Bk/F11R04vMHYhMFQ==
X-Google-Smtp-Source: ABdhPJwZgoE4OEOGPdzSUfpTzinfghQsk702UafbRLuHOuND43/IE/y0+KvW+rUJQDzBKSbq80ZI3CI72rNCNK5My3Y=
X-Received: by 2002:a2e:9118:: with SMTP id m24mr1133847ljg.363.1606914626899; 
 Wed, 02 Dec 2020 05:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20201201071632.68471-1-98.arpi@gmail.com>
 <CAHp75VfV60sRAKkzvbEKW7UEZSiDmNVfd_kB-OOKZRk5MNMeDQ@mail.gmail.com>
 <e10ef8d3-f22b-db10-3784-c94ee425af46@gmail.com>
 <20201202094408.GW4077@smile.fi.intel.com>
 <CABVgOS=hrfma2Yq=h2vqOoH1Mz4xSyfDbgkM9EHvMFk=HJkcnQ@mail.gmail.com>
 <CAHp75VcSGJ-qVQf9SRj2rTME-_MZ2vM-HB_+LiRVgnkwn1TO=g@mail.gmail.com>
In-Reply-To: <CAHp75VcSGJ-qVQf9SRj2rTME-_MZ2vM-HB_+LiRVgnkwn1TO=g@mail.gmail.com>
Date: Wed, 2 Dec 2020 21:10:14 +0800
Message-ID: <CABVgOSmy4n_LGwDS7yWfoLftcQzxv6S+iXx9Y=OPcgG2gu0z1w@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: Convert test_hexdump.c
	to KUnit
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

On Wed, Dec 2, 2020 at 8:21 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Dec 2, 2020 at 1:57 PM David Gow <davidgow@google.com> wrote:
> > On Wed, Dec 2, 2020 at 6:06 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Wed, Dec 02, 2020 at 09:51:19AM +0530, Arpitha Raghunandan wrote:
>
> ...
>
> > > What I;m talking about is the output. How it will be implemented (using the
> > > same variable or differently) is up to you. So the point is I want to see the
> > > statistics of success/total at the end.
> > >
> > > I think this should be done in KUNIT rather than in the individual test cases.
> >
> > I tend to agree here that this really is something for KUnit. At the
> > moment, the tools/testing/kunit/kunit.py script will parse the kernel
> > log and generate these sorts of statistics. I know that needing to run
> > it through a script might seem like a step backwards, but there's no
> > formal place for statistics in the KTAP specification[1] being worked
> > on to standardise kselftest/kunit output formats.
>
> Then it sucks. Fix specification (in a long term) and does it have a
> comment style of messages that we can have this statistics printed
> (but maybe not parsed)?

I should clarify: there's nothing in the spec which explicitly defines
a place for such statistics (nor anything which requires them). There
are "diagnostic" lines which are not parsed, and so it'd be possible
to output statistics there. KUnit itself doesn't at present, but
allows individual tests to log diagnostic lines which could be such
statistics, particularly in cases like this where the full structure
of the tests aren't quite exposed to the framework.



> > Note that there are
> > other parsers for TAP-like formats which are being used with KUnit
> > results, so systems like LAVA could also sum up these statistics. It's
> > also possible, as Arpitha alluded to, to have the test dump them out
> > as a comment.
>
> Fine to me.
>
> > This won't actually work for this test as-is, though, as the KUnit
> > version is running as a single giant test case (so KUnit believes that
> > 1/1 tests have passed, rather than having any more-detailed
> > statistics). It looks like there are a few ways to split it up a bit
> > which would make it neater (a test each for the for() loops in
> > test_hexdump_init() seems sensible to me), but at the moment, there's
> > not really a way of programmatically generating test cases which KUnit
> > then counts
>
> Fix it, please. We rely on this statistics pretty much.

The hope is that the Parameterised Test feature will make this
possible (though, as mentioned, there are a few other issues around
then making those statistics available, but we should be able to work
through those).

It may be a silly question, but what is it that makes these statistics
useful in this test? Maybe I'm misunderstanding something, but I'd've
thought that the important things were whether or not _all_ tests had
passed, and -- if not --- _which_ ones had failed. Is the count of
failing cases within a test like this really that useful for
debugging, or is it more for comparing against different versions?
Either way, we'll try to make sure they're available.

> > The "Parameterised Tests"[2] work Arpitha has been working on ought to
> > go some way to helping here, though it won't solve this completely in
> > this initial version. The problem there is that parameterised tests
> > are not reported individually in a way the kunit.py parser can report
> > cleanly, yet, so it'll still only be counted as one test until that's
> > changed (though, at least, that shouldn't require any test-specific
> > work).
> >
> > My suggestion for the ultimate state of the test would be:
> > - Split up the test into separate KUnit tests for the different
> > "categories" of tests: (e.g., test_hexdump_set,
> > test_hexdump_overflow_set_ascii, etc)
> > - Replace the for loops in test_hexdump_init() with parameters, so
> > that KUnit is aware of the original runs.
> > - Once KUnit and the tooling supports it, these will be reported as
> > subtests. (In the meantime, the results will be listed individually,
> > commented out)
>
> I'm fine as long as we have this information printed to the user.

Okay -- Arpitha: does this seem like a sensible approach to you?

If printing it to the kernel log is really essential, I'll have a look
into how we can do that in KUnit.

> > Of course, it'll take a while before all of those KUnit pieces are in
> > place. I personally think that a good compromise would be to just do
> > the first of these for now, which would make kunit_tool give at least
> > a 4/4 rather than 1/1 result. Then, once the parameterised testing
> > work is merged (and perhaps the tooling fixes are finished), the tests
> > could be updated to take advantage of that.
>
> How can we guarantee it will be not forgotten?

Thinking about it further, if we can get the parameterised testing
stuff in 5.11 as planned, then any tooling/output fixes done later
would automatically apply. Maybe rather than doing an intermediate
version with just the first splitting up of tests, we try it with the
current parameterised test patches, and we can possibly prototype some
kernel-side statistics reporting which should work. To be honest,
though, the subtest support on the kunit_tool side is likely to take
quite a while, so it would be nice to have something (like statistics
in the kernel log) which ameliorate the problem in the meantime.

I'll have a bit of a play around with the test output and parsing code
this week and see if there's a simple change that can get us most of
the way there. I think something should be possible if the test uses
the Parameterised testing feature.

Cheers,
-- David
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
