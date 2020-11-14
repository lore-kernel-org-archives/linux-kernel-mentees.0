Return-Path: <SRS0=iase=EU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070A2C4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Nov 2020 00:14:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A05B221EB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Nov 2020 00:14:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="E2W3oz/2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A05B221EB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7F4C32E21A;
	Sat, 14 Nov 2020 00:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AVU3f5qCg9qd; Sat, 14 Nov 2020 00:14:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6BD43204E7;
	Sat, 14 Nov 2020 00:14:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5196EC0891;
	Sat, 14 Nov 2020 00:14:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B043AC0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Nov 2020 00:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 95D4C879BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Nov 2020 00:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mqqurXb5LUFj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Nov 2020 00:14:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E70308796E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Nov 2020 00:14:27 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id n11so10576385ota.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 16:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lXb79r9eQqeGrU9lZoy7WQBr2nE5wh9PY1abAkxIwPs=;
 b=E2W3oz/2iYUeIPyV02+SezMqtQY/70ozzZZb8SOsnD0nle//BEFQDh9gLwPFDZ7O+3
 Bj76sPInHmBxP7SG4b428XKoLBaNFeM30/icXb2FYhbMv341FQ6nNUIXr0LtW+1Xd86m
 Vexe9vgPASuSr6Y57CNMvIJI00HEW2tY4VR/RvcJn6JrFQMcP2PCKaXjlIvi00pblRdi
 vE+Xd6Z5FixidDIHXnWYFR0t05SRYYRcGHOhRcK+5vukPzQxZfkmm8yKCz3H+q8jXpAZ
 drZ9hJL/b+BR246s4SS84pgtfBylk306EBVy+EEDpPwawhrv5axdDzK225mFbspKzhKL
 8q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lXb79r9eQqeGrU9lZoy7WQBr2nE5wh9PY1abAkxIwPs=;
 b=EIozkhqogf3MrYN678oLY2wJglpB6Y0uDr8LX9pzY5yvQ/2TVDAZRxfF4JMymZx08i
 raMz27MBY/ZnO14tgqPQIkOR6lty/l08ffP2+XjwgGv/06g3rgM2mibiB9rTKjbqprAT
 LVo5yMlrShHGf/PUB1gialjY77cIsZ5OkL6wKbJrIS6L6sCJSDYGD9m7yrhhTNWLif7b
 Ed22I4T4LA3wDaaCHD2fAFZz6hFR7iCy1jrfENZXt6/qZASpuFWwTyY/HW0uzLqVDKx8
 WJ7PvsIEp6HdYfX9nRai/kx4Tk7Gme+HNHNQa/lCuHbQwdyU9EkjXnTH+ihwDNKTcfm2
 dj4w==
X-Gm-Message-State: AOAM533kgh0VE21RkY73vJdjtFMvpf1K3li3xfrSDqU9A8k3N8phyGdk
 bsjRE4ICVUPLXdyA85bQ3fifHqXtlPTNTAPTdrJwyg==
X-Google-Smtp-Source: ABdhPJzFtA69t1obQkfZ4EP67sQdQFhdbkzgoBtqyhc91HSeJ3YD5tUXYXYKJgU1VXjTOr/cqsuOlWQzmmRAV3N7eV4=
X-Received: by 2002:a9d:f44:: with SMTP id 62mr3532683ott.17.1605312866894;
 Fri, 13 Nov 2020 16:14:26 -0800 (PST)
MIME-Version: 1.0
References: <CABVgOSkQ6+y7OGw2494cJa2b60EkSjncLNAgc9cJDbS=X9J3WA@mail.gmail.com>
 <CANpmjNNp2RUCE_ypp2R4MznikTYRYeCDuF7VMp+Hbh=55KWa3A@mail.gmail.com>
 <47a05c5a-485d-026b-c1c3-476ed1a97856@gmail.com>
 <CABVgOSkZ9k6bHPp=LVATWfokMSrEuD87jOfE5MiVYAEbZMmaQQ@mail.gmail.com>
 <BY5PR13MB29336C5BE374D69939DCADABFDE90@BY5PR13MB2933.namprd13.prod.outlook.com>
 <CABVgOSnJAgWvTTABaF082LuYjAoAWzrBsyu9sT7x4GGMVsOD6Q@mail.gmail.com>
 <BY5PR13MB293305FE7ED35EC2B2C81AF1FDE80@BY5PR13MB2933.namprd13.prod.outlook.com>
 <CABVgOSn0vUvHFTPPnFGCmg0pEotwr6TQXQieRV=EMqs1QmFYUw@mail.gmail.com>
 <20201112123706.GA2457520@elver.google.com>
 <CABVgOSkjExNtGny=CDT1WVaXUVgSEaf7hwx8=VY4atN5ot10KQ@mail.gmail.com>
 <20201113103056.GA1568882@elver.google.com>
 <CABVgOS=0Qm-Aa5qgh3PRxbcV0-2ZZaQCm-4HY0dx8597oY+yXw@mail.gmail.com>
In-Reply-To: <CABVgOS=0Qm-Aa5qgh3PRxbcV0-2ZZaQCm-4HY0dx8597oY+yXw@mail.gmail.com>
Date: Sat, 14 Nov 2020 01:14:15 +0100
Message-ID: <CANpmjNNmzzuHpJOVV2JAKdgA48fxmqtXjDDOUg0e4+08kfQEXg@mail.gmail.com>
To: David Gow <davidgow@google.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, "Bird, Tim" <Tim.Bird@sony.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
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

On Fri, 13 Nov 2020 at 23:37, David Gow <davidgow@google.com> wrote:
>
> On Fri, Nov 13, 2020 at 6:31 PM Marco Elver <elver@google.com> wrote:
> >
> > On Fri, Nov 13, 2020 at 01:17PM +0800, David Gow wrote:
> > > On Thu, Nov 12, 2020 at 8:37 PM Marco Elver <elver@google.com> wrote:
> > [...]
> > > > > (It also might be a little tricky with the current implementation to
> > > > > produce the test plan, as the parameters come from a generator, and I
> > > > > don't think there's a way of getting the number of parameters ahead of
> > > > > time. That's a problem with the sub-subtest model, too, though at
> > > > > least there it's a little more isolated from other tests.)
> > > >
> > > > The whole point of generators, as I envisage it, is to also provide the
> > > > ability for varying parameters dependent on e.g. environment,
> > > > configuration, number of CPUs, etc. The current array-based generator is
> > > > the simplest possible use-case.
> > > >
> > > > However, we *can* require generators generate a deterministic number of
> > > > parameters when called multiple times on the same system.
> > >
> > > I think this is a reasonable compromise, though it's not actually
> > > essential. As I understand the TAP spec, the test plan is actually
> > > optional (and/or can be at the end of the sequence of tests), though
> > > kunit_tool currently only supports having it at the beginning (which
> > > is strongly preferred by the spec anyway). I think we could get away
> > > with having it at the bottom of the subtest results though, which
> > > would save having to run the generator twice, when subtest support is
> > > added to kunit_tool.
> >
> > I can't find this in the TAP spec, where should I look? Perhaps we
> > shouldn't venture too far off the beaten path, given we might not be the
> > only ones that want to parse this output.
> >
>
> It's in the "Test Lines and the Plan" section:
> "The plan is optional but if there is a plan before the test points it
> must be the first non-diagnostic line output by the test file. In
> certain instances a test file may not know how many test points it
> will ultimately be running. In this case the plan can be the last
> non-diagnostic line in the output. The plan cannot appear in the
> middle of the output, nor can it appear more than once."

Ah, that's fine then.

> My only concern with running through the generator multiple times to
> get the count is that it might be slow and/or more difficult if
> someone uses a more complicated generator. I can't think of anything
> specific yet, though, so we can always do it for now and change it
> later if a problematic case occurs.

I'm all for simplicity, so if nobody objects, let's just get rid of
the number of parameters and avoid running it twice.

> > > > To that end, I propose a v7 (below) that takes care of getting number of
> > > > parameters (and also displays descriptions for each parameter where
> > > > available).
> > > >
> > > > Now it is up to you how you want to turn the output from diagnostic
> > > > lines into something TAP compliant, because now we have the number of
> > > > parameters and can turn it into a subsubtest. But I think kunit-tool
> > > > doesn't understand subsubtests yet, so I suggest we take these patches,
> > > > and then somebody can prepare kunit-tool.
> > > >
> > >
> > > This sounds good to me. The only thing I'm not sure about is the
> > > format of the parameter description: thus far test names be valid C
> > > identifier names, due to the fact they're named after the test
> > > function. I don't think there's a fundamental reason parameters (and
> > > hence, potentially, subsubtests) need to follow that convention as
> > > well, but it does look a bit odd.  Equally, the square brackets around
> > > the description shouldn't be necessary according to the TAP spec, but
> > > do seem to make things a little more readable, particuarly with the
> > > names in the ext4 inode test. I'm not too worried about either of
> > > those, though: I'm sure it'll look fine once I've got used to it.
> >
> > The parameter description doesn't need to be a C identifier. At least
> > that's what I could immediately glean from TAP v13 spec (I'm looking
> > here: https://testanything.org/tap-version-13-specification.html and see
> > e.g. "ok 1 - Input file opened" ...).
> >
>
> Yeah: it looked a bit weird for everything else to be an identifier
> (given that KUnit does require it for tests), but these parameter
> descriptions not to be. It's not a problem, though, so let's go ahead
> with it.
>
> > [...]
> > > > > In any case, I'm happy to leave the final decision here to Arpitha and
> > > > > Marco, so long as we don't actually violate the TAP/KTAP spec and
> > > > > kunit_tool is able to read at least the top-level result. My
> > > > > preference is still to go either with the "# [test_case->name]:
> > > > > [ok|not ok] [index] - param-[index]", or to get rid of the
> > > > > per-parameter results entirely for now (or just print out a diagnostic
> > > > > message on failure). In any case, it's a decision we can revisit once
> > > > > we have support for named parameters, better tooling, or a better idea
> > > > > of how people are actually using this.
> > > >
> > > > Right, so I think we'll be in a better place if we implement: 1)
> > > > parameter to description conversion support, 2) counting parameters. So
> > > > I decided to see what it looks like, and it wasn't too bad. I just don't
> > > > know how you want to fix kunit-tool to make these non-diagnostic lines
> > > > and not complain, but as I said, it'd be good to not block these
> > > > patches.
> > >
> > > Yup, I tried this v7, and it looks good to me. The kunit_tool work
> > > will probably be a touch more involved, so I definitely don't want to
> > > hold up supporting this on that.
> > >
> > > My only thoughts on the v7 patch are:
> > > - I don't think we actually need the parameter count yet (or perhaps
> > > ever if we go with subtests as planned), so I be okay with getting rid
> > > of that.
> >
> > As noted above, perhaps we should keep it for compatibility with other
> > parsers and CI systems we don't have much control over. It'd be a shame
> > if 99% of KUnit output can be parsed by some partially compliant parser,
> > yet this would break it.
>
> KUnit has only started providing the test plans in some cases pretty
> recently, and the spec does make it optional, so I'm not particularly
> worried about this breaking parsers. I'm not too worried about it
> causing problems to have it either, though, so if you'd rather keep
> it, that's fine by me as well.
>
> > > - It'd be a possibility to get rid of the square brackets from the
> > > output, and if we still want them, make them part of the test itself:
> > > if this were TAP formatted, those brackets would be part of the
> > > subsubtest name.
> >
> > I don't mind. It's just that we can't prescribe a format, and as
> > seen below the descriptions include characters -<>=,. which can be
> > confusing. But perhaps you're right, so let's remove them.
> >
> > But as noted, TAP doesn't seem to care. So let's remove them.
> >
>
> Yeah: I have a slight preference for removing them, as TAP parsers
> would otherwise include them in the parameter name, which looks a
> little weird.
> Of course, the point is moot until we actually fix kunit_tool and make
> these subtests, so there's no fundamental reason we couldn't leave
> them in for now, and remove them then if you thought it was
> significantly more readable. (Personally, I'd still err on the side of
> removing them to avoid any unnecessary churn.)

Sounds good.

Arpitha: Do you want to send v7, but with the following modifications
from what I proposed? Assuming nobody objects.

1. Remove the num_params counter and don't print the number of params
anymore, nor do validation that generators are deterministic.
2. Remove the [].
[ I'm happy to send as well, just let me know what you prefer. ]

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
