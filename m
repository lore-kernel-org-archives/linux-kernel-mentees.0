Return-Path: <SRS0=FEGG=EN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322BBC4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 10:06:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABD99206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 10:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="cFZKFASw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABD99206C1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1328C86A1E;
	Sat,  7 Nov 2020 10:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QC8riqm1KcRr; Sat,  7 Nov 2020 10:06:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E2A2D868AA;
	Sat,  7 Nov 2020 10:06:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC579C088B;
	Sat,  7 Nov 2020 10:06:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 274AEC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 10:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1125C86C66
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 10:06:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVfxyDL5n55k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 10:06:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 045AB86B58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 10:06:40 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id c80so4323459oib.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Nov 2020 02:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TErsauc9tpAzI6S5cYpbCRvl4twcQzw2HKSJ2d2Z+Qg=;
 b=cFZKFASwAfugNcZhz/FuAFmwgIJgslvWVTlXGObXW4GVaiNx5l+4SITTnhwIes3oiJ
 reYnqBcoLt6G3wNTxTLRdKwgOg7Ns7cE5FqN5L4rV7tMFTjEp2540lKCJlUvc52aoVKR
 0YjZ0+zMCT0aW++pNadjtwASHdwbGcnxya4d7uBY6bTaj1NGc6B9kOGdHCcbOMUKZvXf
 bJd1gYeIAayqwjDTVfshWKIZxHJX7MEwCH3td/atGMHmO6tHjcBdloKYwzPy6HyHIlWy
 +nIGIc8yTT0VDKRsKtvKA7fit+ZKdqNJdSHlD/fEWKCd9D7kRQN5jIMqPlF0YA+MdZGz
 t+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TErsauc9tpAzI6S5cYpbCRvl4twcQzw2HKSJ2d2Z+Qg=;
 b=O3eGenuWST8Qn1bQlZQNYktITQerirXnrjiZrcH+RGQAL3ut39/U1ywcPweFgfxfvl
 Qh3LLRgvdBD2vxxGR6qoae4XkVCrxbDCREi6pjPieTmDsG+Br0ZKdOL9q6IiZdk2SNUl
 TjiOClqjYnHlZoa3MSabpBh1DvNq+az4O1KpqHg34mlRLPgR7P1CaCp96+DsturTabR5
 4GEHokZZFBhpOpFAzTkNoW5lhRWZG0XLC1NAxE8X+Qx76PXRFnXIule716mbRjOxmFQY
 DRuUwc62vFXV3TZWoKeFxNy4O/VHKlZ80DbBjOLkiWJTs5ktOsvbQV8EKSXHM6VgVNao
 ReXg==
X-Gm-Message-State: AOAM533vKSpdmOCqW7l4jRZE7QXVud/0kYaXSYstHnKwZIupWeDBKyvw
 d/J4RUIGOGAIP3IwPSUGr9q0Hfi9v8CUrG6EvSlP4w==
X-Google-Smtp-Source: ABdhPJxb+xfOZ9jVhfWoVlbABCI67vL5rewh1ARjZCLWNyu463apeEQlWxjA1SZroi07HqVGkXthuRthzuku33QQCxw=
X-Received: by 2002:aca:6206:: with SMTP id w6mr3818129oib.121.1604743599913; 
 Sat, 07 Nov 2020 02:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20201106192154.51514-1-98.arpi@gmail.com>
 <CABVgOSkQ6+y7OGw2494cJa2b60EkSjncLNAgc9cJDbS=X9J3WA@mail.gmail.com>
In-Reply-To: <CABVgOSkQ6+y7OGw2494cJa2b60EkSjncLNAgc9cJDbS=X9J3WA@mail.gmail.com>
Date: Sat, 7 Nov 2020 11:06:28 +0100
Message-ID: <CANpmjNNp2RUCE_ypp2R4MznikTYRYeCDuF7VMp+Hbh=55KWa3A@mail.gmail.com>
To: David Gow <davidgow@google.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v6 1/2] kunit: Support for
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

On Sat, 7 Nov 2020 at 05:58, David Gow <davidgow@google.com> wrote:
> On Sat, Nov 7, 2020 at 3:22 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> >
> > Implementation of support for parameterized testing in KUnit.
> > This approach requires the creation of a test case using the
> > KUNIT_CASE_PARAM macro that accepts a generator function as input.
> > This generator function should return the next parameter given the
> > previous parameter in parameterized tests. It also provides
> > a macro to generate common-case generators.
> >
> > Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> > Co-developed-by: Marco Elver <elver@google.com>
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
>
> This looks good to me! A couple of minor thoughts about the output
> format below, but I'm quite happy to have this as-is regardless.
>
> Reviewed-by: David Gow <davidgow@google.com>
>
> Cheers,
> -- David
>
> > Changes v5->v6:
> > - Fix alignment to maintain consistency
> > Changes v4->v5:
> > - Update kernel-doc comments.
> > - Use const void* for generator return and prev value types.
> > - Add kernel-doc comment for KUNIT_ARRAY_PARAM.
> > - Rework parameterized test case execution strategy: each parameter is executed
> >   as if it was its own test case, with its own test initialization and cleanup
> >   (init and exit are called, etc.). However, we cannot add new test cases per TAP
> >   protocol once we have already started execution. Instead, log the result of
> >   each parameter run as a diagnostic comment.
> > Changes v3->v4:
> > - Rename kunit variables
> > - Rename generator function helper macro
> > - Add documentation for generator approach
> > - Display test case name in case of failure along with param index
> > Changes v2->v3:
> > - Modifictaion of generator macro and method
> > Changes v1->v2:
> > - Use of a generator method to access test case parameters
> >
> >  include/kunit/test.h | 36 ++++++++++++++++++++++++++++++++++
> >  lib/kunit/test.c     | 46 +++++++++++++++++++++++++++++++-------------
> >  2 files changed, 69 insertions(+), 13 deletions(-)
> >
> > diff --git a/include/kunit/test.h b/include/kunit/test.h
> > index db1b0ae666c4..16616d3974f9 100644
> > --- a/include/kunit/test.h
> > +++ b/include/kunit/test.h
> > @@ -107,6 +107,7 @@ struct kunit;
[...]
> > -       kunit_suite_for_each_test_case(suite, test_case)
> > -               kunit_run_case_catch_errors(suite, test_case);
> > +       kunit_suite_for_each_test_case(suite, test_case) {
> > +               struct kunit test = { .param_value = NULL, .param_index = 0 };
> > +               bool test_success = true;
> > +
> > +               if (test_case->generate_params)
> > +                       test.param_value = test_case->generate_params(NULL);
> > +
> > +               do {
> > +                       kunit_run_case_catch_errors(suite, test_case, &test);
> > +                       test_success &= test_case->success;
> > +
> > +                       if (test_case->generate_params) {
> > +                               kunit_log(KERN_INFO, &test,
> > +                                         KUNIT_SUBTEST_INDENT
> > +                                         "# %s: param-%d %s",
>
> Would it make sense to have this imitate the TAP format a bit more?
> So, have "# [ok|not ok] - [name]" as the format? [name] could be
> something like "[test_case->name]:param-[index]" or similar.
> If we keep it commented out and don't indent it further, it won't
> formally be a nested test (though if we wanted to support those later,
> it'd be easy to add), but I think it would be nicer to be consistent
> here.

The previous attempt [1] at something similar failed because it seems
we'd need to teach kunit-tool new tricks [2], too.
[1] https://lkml.kernel.org/r/20201105195503.GA2399621@elver.google.com
[2] https://lkml.kernel.org/r/20201106123433.GA3563235@elver.google.com

So if we go with a different format, we might need a patch before this
one to make kunit-tool compatible with that type of diagnostic.

Currently I think we have the following proposals for a format:

1. The current "# [test_case->name]: param-[index] [ok|not ok]" --
this works well, because no changes to kunit-tool are required, and it
also picks up the diagnostic context for the case and displays that on
test failure.

2. Your proposed "# [ok|not ok] - [test_case->name]:param-[index]".
As-is, this needs a patch for kunit-tool as well. I just checked, and
if we change it to "# [ok|not ok] - [test_case->name]: param-[index]"
(note the space after ':') it works without changing kunit-tool. ;-)

3. Something like "# [ok|not ok] param-[index] - [test_case->name]",
which I had played with earlier but kunit-tool is definitely not yet
happy with.

So my current preference is (2) with the extra space (no change to
kunit-tool required). WDYT?

> My other suggestion -- albeit one outside the scope of this initial
> version -- would be to allow the "param-%d" name to be overridden
> somehow by a test. For example, the ext4 inode test has names for all
> its test cases: it'd be nice to be able to display those instead (even
> if they're not formatted as identifiers as-is).

Right, I was thinking about this, but it'd need a way to optionally
pass another function that converts const void* params to readable
strings. But as you say, we should do that as a follow-up patch later
because it might require a few more iterations.

[...]

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
