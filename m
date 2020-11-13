Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2698CC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 10:31:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C0F122259
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 10:31:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="QvmfEZp1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C0F122259
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CDA7187434;
	Fri, 13 Nov 2020 10:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VruaVrdo7v5m; Fri, 13 Nov 2020 10:31:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 16E5187410;
	Fri, 13 Nov 2020 10:31:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEB86C088E;
	Fri, 13 Nov 2020 10:31:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADE45C0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 10:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9AC4F20441
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 10:31:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tk3PJRR5excj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 10:31:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 46A661FDFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 10:31:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d12so9167411wrr.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 02:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=P5UyDjLS/2j5NOQXFG9JlqktY1ORdwFsk3E8r8jdx9g=;
 b=QvmfEZp1GR7cR7jYyHNvp7jmshkyLAUcvw5UZ+tIfWrp8FdnIuBQq+HeYxeqR2YQM2
 B3v3dfgtwwRQNo0hZCXSfLg2gYHq7gUiuWRqXtdLDvbnF6zqM5f2PhftiYLGdccFQKbs
 1hABKGykYHD3amk32f2xyTBU+B+D1eAEsX2cOVOteH5cbapv2opX9/VNFGZOZN1BKzbh
 eutWT0ipfgBRukbd8eH9VZSSxMafzAa8oMeRZ9MHDKSfjA5MYDLvxLqk7xn/dkGAGWcu
 OfYGPkF5dYxT8VyWSa6iiz/Ppb7ORagfg5GZ8y7iVkvNlacT2tvgmGVZmS8ORLVEWCe8
 VJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P5UyDjLS/2j5NOQXFG9JlqktY1ORdwFsk3E8r8jdx9g=;
 b=kDzQkRy4OOVusChFL6oNqdNFUK+L9GdFWxE5chxvD4OTZ8qIpPZTAV9UncbMhpT4di
 CmMj/f9kqn32HNsiu+dysnRAoRcf89gVPdIKTbWWHtBA5pqZHbzLudfxA0NZZkImctXD
 1q7l+5jwU0SXwgsgmK6yV/W1c6s/jNmZr6sbzy/GF5Y/A/l9EnHn+qw+TBLj9qPgJHr7
 aRS/EX9AeY9P65yO5hTIr18Elx8VlAbRm+7ge39CPiaZwpDflG6JID/fW9QbmUe+CCBw
 tFUGvpsPBqzPwE/XPcMGHY91Lgh6hLlT8sVgUOgEMf0MS0X5z7Ee80k2OLLSYzbUXdeo
 boWg==
X-Gm-Message-State: AOAM5325B2Ql7W58be1AfyFXZG7t1ywqpaOXM9Pc+xBYfAwto7zQXsXX
 +7mHDrP223sFbxPZCT8hIrRb+A==
X-Google-Smtp-Source: ABdhPJzSamfywisqfvIkrQffiLHRG8vrI4VkRiZPKk9wtZObNBU9jFTVzdIxhEcKMyLlAFoPY6RWUg==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr2687568wrn.73.1605263463113; 
 Fri, 13 Nov 2020 02:31:03 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:15:13:f693:9fff:fef4:2449])
 by smtp.gmail.com with ESMTPSA id n23sm9713848wmk.24.2020.11.13.02.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 02:31:01 -0800 (PST)
Date: Fri, 13 Nov 2020 11:30:56 +0100
To: David Gow <davidgow@google.com>
Message-ID: <20201113103056.GA1568882@elver.google.com>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABVgOSkjExNtGny=CDT1WVaXUVgSEaf7hwx8=VY4atN5ot10KQ@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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

On Fri, Nov 13, 2020 at 01:17PM +0800, David Gow wrote:
> On Thu, Nov 12, 2020 at 8:37 PM Marco Elver <elver@google.com> wrote:
[...]
> > > (It also might be a little tricky with the current implementation to
> > > produce the test plan, as the parameters come from a generator, and I
> > > don't think there's a way of getting the number of parameters ahead of
> > > time. That's a problem with the sub-subtest model, too, though at
> > > least there it's a little more isolated from other tests.)
> >
> > The whole point of generators, as I envisage it, is to also provide the
> > ability for varying parameters dependent on e.g. environment,
> > configuration, number of CPUs, etc. The current array-based generator is
> > the simplest possible use-case.
> >
> > However, we *can* require generators generate a deterministic number of
> > parameters when called multiple times on the same system.
> 
> I think this is a reasonable compromise, though it's not actually
> essential. As I understand the TAP spec, the test plan is actually
> optional (and/or can be at the end of the sequence of tests), though
> kunit_tool currently only supports having it at the beginning (which
> is strongly preferred by the spec anyway). I think we could get away
> with having it at the bottom of the subtest results though, which
> would save having to run the generator twice, when subtest support is
> added to kunit_tool.

I can't find this in the TAP spec, where should I look? Perhaps we
shouldn't venture too far off the beaten path, given we might not be the
only ones that want to parse this output.

> > To that end, I propose a v7 (below) that takes care of getting number of
> > parameters (and also displays descriptions for each parameter where
> > available).
> >
> > Now it is up to you how you want to turn the output from diagnostic
> > lines into something TAP compliant, because now we have the number of
> > parameters and can turn it into a subsubtest. But I think kunit-tool
> > doesn't understand subsubtests yet, so I suggest we take these patches,
> > and then somebody can prepare kunit-tool.
> >
> 
> This sounds good to me. The only thing I'm not sure about is the
> format of the parameter description: thus far test names be valid C
> identifier names, due to the fact they're named after the test
> function. I don't think there's a fundamental reason parameters (and
> hence, potentially, subsubtests) need to follow that convention as
> well, but it does look a bit odd.  Equally, the square brackets around
> the description shouldn't be necessary according to the TAP spec, but
> do seem to make things a little more readable, particuarly with the
> names in the ext4 inode test. I'm not too worried about either of
> those, though: I'm sure it'll look fine once I've got used to it.

The parameter description doesn't need to be a C identifier. At least
that's what I could immediately glean from TAP v13 spec (I'm looking
here: https://testanything.org/tap-version-13-specification.html and see
e.g. "ok 1 - Input file opened" ...).

[...]
> > > In any case, I'm happy to leave the final decision here to Arpitha and
> > > Marco, so long as we don't actually violate the TAP/KTAP spec and
> > > kunit_tool is able to read at least the top-level result. My
> > > preference is still to go either with the "# [test_case->name]:
> > > [ok|not ok] [index] - param-[index]", or to get rid of the
> > > per-parameter results entirely for now (or just print out a diagnostic
> > > message on failure). In any case, it's a decision we can revisit once
> > > we have support for named parameters, better tooling, or a better idea
> > > of how people are actually using this.
> >
> > Right, so I think we'll be in a better place if we implement: 1)
> > parameter to description conversion support, 2) counting parameters. So
> > I decided to see what it looks like, and it wasn't too bad. I just don't
> > know how you want to fix kunit-tool to make these non-diagnostic lines
> > and not complain, but as I said, it'd be good to not block these
> > patches.
> 
> Yup, I tried this v7, and it looks good to me. The kunit_tool work
> will probably be a touch more involved, so I definitely don't want to
> hold up supporting this on that.
> 
> My only thoughts on the v7 patch are:
> - I don't think we actually need the parameter count yet (or perhaps
> ever if we go with subtests as planned), so I be okay with getting rid
> of that.

As noted above, perhaps we should keep it for compatibility with other
parsers and CI systems we don't have much control over. It'd be a shame
if 99% of KUnit output can be parsed by some partially compliant parser,
yet this would break it.

> - It'd be a possibility to get rid of the square brackets from the
> output, and if we still want them, make them part of the test itself:
> if this were TAP formatted, those brackets would be part of the
> subsubtest name.

I don't mind. It's just that we can't prescribe a format, and as
seen below the descriptions include characters -<>=,. which can be
confusing. But perhaps you're right, so let's remove them.

But as noted, TAP doesn't seem to care. So let's remove them.

[...]
> > I hope this is a reasonable compromise for now.
> 
> Yeah: this seems like a great compromise until kunit_tool is improved.

Thank you!

-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
