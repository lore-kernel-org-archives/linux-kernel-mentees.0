Return-Path: <SRS0=NG44=77=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D59AC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 20:28:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE7EA208C3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 20:28:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ljl0z/8F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE7EA208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8843987285;
	Thu, 18 Jun 2020 20:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOs8odZBNG4V; Thu, 18 Jun 2020 20:28:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C02C48714A;
	Thu, 18 Jun 2020 20:28:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABEF4C07FF;
	Thu, 18 Jun 2020 20:28:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B4B0C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4F69C8714A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mRu1ub1lHXqA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:28:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5FAF087115
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 20:28:07 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b201so3349259pfb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 13:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PaDljQV4s0tsDjPd4KRhxqE94dP0XcNjhHGBsncvb84=;
 b=ljl0z/8F2OVrnZUPdzWXGnwnJYsUO5294WxIFZQvJlpyY0GKeKofK9oNAEXcgtMRGA
 Nkf+/zDMpmfMiEIWBzkJTZoGlDymxzpGxxQYzXAY4DSSud1ZlzwVGzg9uqRG8g806HMt
 4peYsIrDXi+XxUlErKoZtMpWXpRKrnDELE1mTYTLs71gnsI/Ypv3NLmf9cVKXUc5xqvf
 ZdECCeJNJs1ui/uOMge6bPexYw6wQly3rceKwKGmcIBzGB3Th8z1POylkBoduS8U2qn/
 B8d6MsdUXhc/x0LqmVUINBT8hChYQkfL/wgcNfvzypNIGZPtkvLL/OOzTRJ+cmfT+Gse
 diuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PaDljQV4s0tsDjPd4KRhxqE94dP0XcNjhHGBsncvb84=;
 b=FULdHcEAHUN0kNNGcKpq8d7amYl+V9IVL+DVJABDlzqxManX3I5uZ/sw+EBp7qwLRZ
 z8T7n/3Kxp2kPqJawxR29L37X8i0KuYx2tOU+hEXVdGth3liYW74yldenwN6+7qthJEj
 pUNayLjgcNGSGosN+tXzN/zESnl+UayqljuhfC1GQmSjlGZBfAD1WMcaoKfa0dCdiU2Z
 Gs6JTrdbdXPHAP+mSZDlPCs3jwmRUVG7VkoBnwFfSg+LC9QFKwCXgvLZ9HqTRPNqbq1y
 tEvhIOOZiJ+0S3NEFpLJ/BAlgILPPccA7nG6ZA08zKaygtj6qO2tKqDZC3gcjK0k9j5U
 kpvA==
X-Gm-Message-State: AOAM53167SjRrSzkOeM1AapIN1HZ5WlPIJ4m/g8+oDQ5f8puVo5FWaKE
 l1XyTqtHxr5iOVitWKFEvptgarX1q/eatYI0UMRK3g==
X-Google-Smtp-Source: ABdhPJyciZVCGHv5u4C8M75wPUGUizqVIkwf99p0oMyeVXwQcr3tTyYvoRLJDywFWzCaKer6yfA4tXu6GuaLkqIuvds=
X-Received: by 2002:a63:4c08:: with SMTP id z8mr254875pga.201.1592512086573;
 Thu, 18 Jun 2020 13:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200611215501.213058-1-vitor@massaru.org>
 <202006121403.CF8D57C@keescook>
 <CABVgOSnofuJQ_fiCL-8KdKezg3Hnqk3A+X509c4YP_toKeBVBg@mail.gmail.com>
 <202006141005.BA19A9D3@keescook>
 <CABVgOSkPYBL8Qy9Fsr0owNhh2=tXZmdwCsWhnq+PshJLr06YKA@mail.gmail.com>
 <alpine.LRH.2.21.2006160956170.16027@localhost>
 <CABVgOS=-AHNABkAVV7p=pq67hwoVcXXJSEPvxNbp90Eh_RaxBg@mail.gmail.com>
In-Reply-To: <CABVgOS=-AHNABkAVV7p=pq67hwoVcXXJSEPvxNbp90Eh_RaxBg@mail.gmail.com>
Date: Thu, 18 Jun 2020 13:27:55 -0700
Message-ID: <CAFd5g44kZe7h+qKHmx029Qj15FdqxsFRFD3TEx_iEhPEt0jJmA@mail.gmail.com>
To: David Gow <davidgow@google.com>
Cc: Kees Cook <keescook@chromium.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Alan Maguire <alan.maguire@oracle.com>,
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Jun 16, 2020 at 9:21 PM David Gow <davidgow@google.com> wrote:
>
> On Tue, Jun 16, 2020 at 5:40 PM Alan Maguire <alan.maguire@oracle.com> wrote:
> >
> > On Tue, 16 Jun 2020, David Gow wrote:
> >
> > > CONFIG_PM_QOS_KUNIT_TESTOn Mon, Jun 15, 2020 at 1:48 AM Kees Cook
> > > <keescook@chromium.org> wrote:
> > > >
> > > > On Sat, Jun 13, 2020 at 02:51:17PM +0800, David Gow wrote:
> > > > > Yeah, _KUNIT_TEST was what we've sort-of implicitly decided on for
> > > > > config names, but the documentation does need to happen.
> > > >
> > > > That works for me. It still feels redundant, but all I really want is a
> > > > standard name. :)
> > > >
> > > > > We haven't put as much thought into standardising the filenames much, though.
> > > >
> > > > I actually find this to be much more important because it is more
> > > > end-user-facing (i.e. in module naming, in build logs, in scripts, on
> > > > filesystem, etc -- CONFIG is basically only present during kernel build).
> > > > Trying to do any sorting or greping really needs a way to find all the
> > > > kunit pieces.
> > > >
> > >
> > > Certainly this is more of an issue now we support building KUnit tests
> > > as modules, rather than having them always be built-in.
> > >
> > > Having some halfway consistent config-name <-> filename <-> test suite
> > > name could be useful down the line, too. Unfortunately, not
> > > necessarily a 1:1 mapping, e.g.:
> > > - CONFIG_KUNIT_TEST compiles both kunit-test.c and string-stream-test.c
> > > - kunit-test.c has several test suites within it:
> > > kunit-try-catch-test, kunit-resource-test & kunit-log-test.
> > > - CONFIG_EXT4_KUNIT_TESTS currently only builds ext4-inode-test.c, but
> > > as the plural name suggests, might build others later.
> > > - CONFIG_SECURITY_APPARMOR_KUNIT_TEST doesn't actually have its own
> > > source file: the test is built into policy_unpack.c
> > > - &cetera
> > >
> > > Indeed, this made me quickly look up the names of suites, and there
> > > are a few inconsistencies there:
> > > - most have "-test" as a suffix
> > > - some have "_test" as a suffix
> > > - some have no suffix
> > >
> > > (I'm inclined to say that these don't need a suffix at all.)
> > >
> >
> > A good convention for module names - which I _think_ is along the lines
> > of what Kees is suggesting - might be something like
> >
> > <subsystem>[_<optional_test-area>]_kunit.ko
> >
> > So for example
> >
> > kunit_test -> test_kunit.ko
> > string_stream_test.ko -> test_string_stream_kunit.ko
> > kunit_example_test -> example_kunit.ko
> > ext4_inode_test.ko -> ext4_inode_kunit.ko
> >
> > For the kunit selftests, "selftest_" might be a better name
> > than "test_", as the latter might encourage people to reintroduce
> > a redundant "test" into their module name.
> >
>
> I quite like the idea of having the deeper "subsystem:suite:test"
> hierarchy here. "selftest" possibly would be a bit confusing against
> kselftest for the KUnit tests -- personally I'd probably go with
> "kunit", even if that introduces a redundant-looking kunit into the
> module name.

Ditto. My first reaction was that it would create too much nesting and
subsystems are a poorly defined notion in the Linux kernel; however,
after thinking about it some, I think we are already doing what you
are proposing with namespacing in identifier names. It makes sense to
reflect that in test organization and reporting.

> So, this could look something like:
> - Kconfig name: CONFIG_<subsystem>_<suite>_KUNIT_TEST, or very
> possibly CONFIG_<subsystem>_KUNIT_TEST(S?) -- we already have
> something like that for the ext4 tests.

I think the biggest question there is whether we go with the every
suite gets its own config approach or all suites in a subsystem are
turned on by a single config. I don't think there are enough examples
to determine what the community would prefer, and I can see advantages
and disadvantages to both.

> - Source filename: <suite>_kunit.c within a subsystem directory. (We
> probably don't need to enforce suites being in separate files, but
> whatever file does contain the tests should at least end "kunit.c")

I am cool with changing *-test.c to *-kunit.c. The *-test.c was a hold
over from when everything was prefixed TEST_* instead of KUNIT_* (back
in the early days of the RFC). I never liked naming everything KUNIT_*
or -kunit- whatever; it felt kind of egotistical to me (there was also
always a part of me that hoped I would come up with a better name than
KUnit, but that ship sailed a long time ago). However, purely
logically speaking, I think naming all KUnit tests *-kunit.c makes
more sense than anything else.

One question: the AppArmor KUnit tests are #included into another .c
file when the tests are selected. Should tests #included in this
manner be -kunit.h or should all tests be -kunit.c?

> - Module filename: <subsystem>_<suite>_kunit.ko, or
> <subsystem>_kunit.ko if all suites are built into the same module (or
> there's just one suite for the whole subsystem)
> - Suite name: Either <subsystem>_<suite> or have a separate subsystem
> field in kunit_suite. If there's only one suite for the subsystem, set
> suite==subsystem

No strong feelings here.

> - Test names: Personally, I'd kind-of like to not prefix these at all,
> as they're already part of the suite. If we do want to, though, prefix
> them with <subsystem> and <suite>.

Eh, I did that to remain consistent with the kernel naming
conventions, but I think those have diverged too. If maintainers are
cool with it, I agree that the prefixes are redundant on tests and
generally way too long.

> > > Within test suites, we're also largely prefixing all of the tests with
> > > a suite name (even if it's not actually the specified suite name). For
> > > example, CONFIG_PM_QOS_KUNIT_TEST builds
> > > drivers/base/power/qos-test.c which contains a suite called
> > > "qos-kunit-test", with tests prefixed "freq_qos_test_". Some of this
> > > clearly comes down to wanting to namespace things a bit more
> > > ("qos-test" as a name could refer to a few things, I imagine), but
> > > specifying how to do so consistently could help.
> > >
> >
> > Could we add some definitions to help standardize this?
> > For example, adding a "subsystem" field to "struct kunit_suite"?
> >
> > So for the ext4 tests the "subsystem" would be "ext4" and the
> > name "inode" would specify the test area within that subsystem.
> > For the KUnit selftests, the subsystem would be "test"/"selftest".
> > Logging could utilize the subsystem definition to allow test
> > writers to use less redundant test names too.  For example
> > the suite name logged could be constructed from the
> > subsystem + area values associated with the kunit_suite,
> > and individual test names could be shown as the
> > suite area + test_name.
>
> As above, I quite like this. If we were really brave, we could
> actually nest the results into subsystem:area/suite:test using the TAP
> subtests stuff. Generating the longer suite name may be easier on
> people manually reading large test logs, though, as they wouldn't have
> to scroll quite as far to determine what subsystem they're in. (Again,
> something that could be solved with tooling, and probably less of a
> problem for people accessing results through debugfs.)

SGTM
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
