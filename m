Return-Path: <SRS0=10wB=76=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C409C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Jun 2020 04:21:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8B1020720
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Jun 2020 04:21:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="trYmk0NG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8B1020720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6058088763;
	Wed, 17 Jun 2020 04:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9X4pbD2PbUKn; Wed, 17 Jun 2020 04:21:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ABC95886F0;
	Wed, 17 Jun 2020 04:21:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 912D0C07FF;
	Wed, 17 Jun 2020 04:21:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41B72C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Jun 2020 04:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3920788728
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Jun 2020 04:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mWG4bJPCEP17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Jun 2020 04:21:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 10044886F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Jun 2020 04:21:02 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h5so774142wrc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Jun 2020 21:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HTfy5ZLyuJT0yC8McsN2BR/ssAXBpdtQpUx9FOK3zbk=;
 b=trYmk0NGqDbCC4+0yisOAMU2pUJhbmgPqz+08MzhL27FdwrZo5x8CC4LEpCfuYb/Zr
 s1QKUQ36/lFT54YeSj4wMO2z03xG7ZHUyULrLv/itHLmSJrxFSEhFzNxmLIDV3tA1gnK
 YAPUnmYpzNlEn1MNyIFPBRyY/DJQ8pPbeVuwcVP/tmWe4gav31Bs+27G+UlUAw8/YJ/5
 yTKh7XhbkytVPeIHwAX3HLHug9KZVFvVYeTpepaKrD1CyXC5RiXl6v+c5PUH6BO9zDaP
 GYJcs6px4Qrqv0P91Xbb+OkXoYyebl7f4EBsdAVNN8Tn4TXMxoaN1C0iiWjPseR0JNzw
 /irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HTfy5ZLyuJT0yC8McsN2BR/ssAXBpdtQpUx9FOK3zbk=;
 b=DEJDkRd2PilyAx0AnsV3+DxrUKMTeEG6zsm6Jw+xHOdpK3qxLyY0qzzquVcAND9Hbd
 7B2Chi3sgFjJlOr7fsfI5kLkdRBydQVSebJG1mD70WusmT4Ind9mLwvAMIQdDrB8jYAj
 X+u7jUhjMyBcLK0vQYDiAHhLkMc47AY29iUpFNbUWTSPFxAfsx/1nqBrMyBDu2vY+w/N
 qcu+2Al3FLwkhOquyQXnMpFpLmAi4wsUnRz6B9LWkN+2eUuca1xtq6hxtIM3eKGhJnyB
 i+UjAG7R7thgIbvD5evpYtJ9TDodMDSseOJD5f4k9t8B2SNlNgMW8nkMf9IOtMekJ9d7
 hi+Q==
X-Gm-Message-State: AOAM533gqLSVsoW4lquHWSMk0lfxQWEtNFWXWUPtZZmhZ2gIrdBYl5w7
 ES67qWzFT8YN06O6B6I6rKPDSGw6lvB7slz1xA+4fA==
X-Google-Smtp-Source: ABdhPJxJ1NKDw0A/Mr5gdEzqzF5vb61QgpH/v8tCiZA1rOlUaXZVgnusiMMA71lTFJNM8LFxei18qdWr+22zs53LCG8=
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr6465150wrw.203.1592367660051; 
 Tue, 16 Jun 2020 21:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200611215501.213058-1-vitor@massaru.org>
 <202006121403.CF8D57C@keescook>
 <CABVgOSnofuJQ_fiCL-8KdKezg3Hnqk3A+X509c4YP_toKeBVBg@mail.gmail.com>
 <202006141005.BA19A9D3@keescook>
 <CABVgOSkPYBL8Qy9Fsr0owNhh2=tXZmdwCsWhnq+PshJLr06YKA@mail.gmail.com>
 <alpine.LRH.2.21.2006160956170.16027@localhost>
In-Reply-To: <alpine.LRH.2.21.2006160956170.16027@localhost>
Date: Wed, 17 Jun 2020 12:20:48 +0800
Message-ID: <CABVgOS=-AHNABkAVV7p=pq67hwoVcXXJSEPvxNbp90Eh_RaxBg@mail.gmail.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kees Cook <keescook@chromium.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] common KUnit Kconfig and file naming
 (was: Re: [PATCH] lib: kunit_test_overflow: add KUnit test of
 check_*_overflow functions)
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

On Tue, Jun 16, 2020 at 5:40 PM Alan Maguire <alan.maguire@oracle.com> wrote:
>
> On Tue, 16 Jun 2020, David Gow wrote:
>
> > CONFIG_PM_QOS_KUNIT_TESTOn Mon, Jun 15, 2020 at 1:48 AM Kees Cook
> > <keescook@chromium.org> wrote:
> > >
> > > On Sat, Jun 13, 2020 at 02:51:17PM +0800, David Gow wrote:
> > > > Yeah, _KUNIT_TEST was what we've sort-of implicitly decided on for
> > > > config names, but the documentation does need to happen.
> > >
> > > That works for me. It still feels redundant, but all I really want is a
> > > standard name. :)
> > >
> > > > We haven't put as much thought into standardising the filenames much, though.
> > >
> > > I actually find this to be much more important because it is more
> > > end-user-facing (i.e. in module naming, in build logs, in scripts, on
> > > filesystem, etc -- CONFIG is basically only present during kernel build).
> > > Trying to do any sorting or greping really needs a way to find all the
> > > kunit pieces.
> > >
> >
> > Certainly this is more of an issue now we support building KUnit tests
> > as modules, rather than having them always be built-in.
> >
> > Having some halfway consistent config-name <-> filename <-> test suite
> > name could be useful down the line, too. Unfortunately, not
> > necessarily a 1:1 mapping, e.g.:
> > - CONFIG_KUNIT_TEST compiles both kunit-test.c and string-stream-test.c
> > - kunit-test.c has several test suites within it:
> > kunit-try-catch-test, kunit-resource-test & kunit-log-test.
> > - CONFIG_EXT4_KUNIT_TESTS currently only builds ext4-inode-test.c, but
> > as the plural name suggests, might build others later.
> > - CONFIG_SECURITY_APPARMOR_KUNIT_TEST doesn't actually have its own
> > source file: the test is built into policy_unpack.c
> > - &cetera
> >
> > Indeed, this made me quickly look up the names of suites, and there
> > are a few inconsistencies there:
> > - most have "-test" as a suffix
> > - some have "_test" as a suffix
> > - some have no suffix
> >
> > (I'm inclined to say that these don't need a suffix at all.)
> >
>
> A good convention for module names - which I _think_ is along the lines
> of what Kees is suggesting - might be something like
>
> <subsystem>[_<optional_test-area>]_kunit.ko
>
> So for example
>
> kunit_test -> test_kunit.ko
> string_stream_test.ko -> test_string_stream_kunit.ko
> kunit_example_test -> example_kunit.ko
> ext4_inode_test.ko -> ext4_inode_kunit.ko
>
> For the kunit selftests, "selftest_" might be a better name
> than "test_", as the latter might encourage people to reintroduce
> a redundant "test" into their module name.
>

I quite like the idea of having the deeper "subsystem:suite:test"
hierarchy here. "selftest" possibly would be a bit confusing against
kselftest for the KUnit tests -- personally I'd probably go with
"kunit", even if that introduces a redundant-looking kunit into the
module name.

So, this could look something like:
- Kconfig name: CONFIG_<subsystem>_<suite>_KUNIT_TEST, or very
possibly CONFIG_<subsystem>_KUNIT_TEST(S?) -- we already have
something like that for the ext4 tests.
- Source filename: <suite>_kunit.c within a subsystem directory. (We
probably don't need to enforce suites being in separate files, but
whatever file does contain the tests should at least end "kunit.c")
- Module filename: <subsystem>_<suite>_kunit.ko, or
<subsystem>_kunit.ko if all suites are built into the same module (or
there's just one suite for the whole subsystem)
- Suite name: Either <subsystem>_<suite> or have a separate subsystem
field in kunit_suite. If there's only one suite for the subsystem, set
suite==subsystem
- Test names: Personally, I'd kind-of like to not prefix these at all,
as they're already part of the suite. If we do want to, though, prefix
them with <subsystem> and <suite>.

> > Within test suites, we're also largely prefixing all of the tests with
> > a suite name (even if it's not actually the specified suite name). For
> > example, CONFIG_PM_QOS_KUNIT_TEST builds
> > drivers/base/power/qos-test.c which contains a suite called
> > "qos-kunit-test", with tests prefixed "freq_qos_test_". Some of this
> > clearly comes down to wanting to namespace things a bit more
> > ("qos-test" as a name could refer to a few things, I imagine), but
> > specifying how to do so consistently could help.
> >
>
> Could we add some definitions to help standardize this?
> For example, adding a "subsystem" field to "struct kunit_suite"?
>
> So for the ext4 tests the "subsystem" would be "ext4" and the
> name "inode" would specify the test area within that subsystem.
> For the KUnit selftests, the subsystem would be "test"/"selftest".
> Logging could utilize the subsystem definition to allow test
> writers to use less redundant test names too.  For example
> the suite name logged could be constructed from the
> subsystem + area values associated with the kunit_suite,
> and individual test names could be shown as the
> suite area + test_name.

As above, I quite like this. If we were really brave, we could
actually nest the results into subsystem:area/suite:test using the TAP
subtests stuff. Generating the longer suite name may be easier on
people manually reading large test logs, though, as they wouldn't have
to scroll quite as far to determine what subsystem they're in. (Again,
something that could be solved with tooling, and probably less of a
problem for people accessing results through debugfs.)

Cheers,
-- David
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
