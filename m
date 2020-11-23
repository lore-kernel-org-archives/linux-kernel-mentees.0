Return-Path: <SRS0=GItZ=E5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2654C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 13:08:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B7720575
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 13:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="TjKKxvzD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27B7720575
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88078870DE;
	Mon, 23 Nov 2020 13:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RdmJYFRP0nDw; Mon, 23 Nov 2020 13:08:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 919008706A;
	Mon, 23 Nov 2020 13:08:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7ACFBC0891;
	Mon, 23 Nov 2020 13:08:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2441FC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 13:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 200DB85657
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 13:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0c24aHZWbjV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 13:08:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 67F1B8562D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 13:08:21 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id l36so15820613ota.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 05:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XOXAAY/4nvkcRrNExNVW2w/236SkW1Wa7iXXWBvmVzk=;
 b=TjKKxvzDW2xRKxIFZmHVFhGbVxv0QEA4azsjh4Se746LrbtvwDBbIpopLLJPcdhJuI
 o1UN/Sgy+csMwaKTMGZjpYSYYvmIyiPIPJb0BBaL970Yx0co3l6w5RlEUi5zoeO3a41o
 ixa59nJIh/qvyqIxi1Oh0NLbZPaCS9YL7gDr3qR0euTD9h1m8ImjYcjwxjtWd+Hb9JxT
 oySzIQ0UlURtEcJqYo1XjJlylqzaWFr1Zysp2vrEeH7IiLXI1zCnOHsBDlOqNUItHNct
 4XZv1QveWS5lUpstKQIx2lAfZBxr0/GA6fXyIxSheWczhQdhMpmv184qnScvo2+vRaoE
 m1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XOXAAY/4nvkcRrNExNVW2w/236SkW1Wa7iXXWBvmVzk=;
 b=c42kKlrRzoAN/9Z0ja11thesC6Cun6U3af3ZPX9TbM6jYtreLY7YXWvZgzLOFCITNT
 HoFHs+UJdjFw/5tyu9wJ6SOCe1SfUZA8pydDLS4msaAikuKjdSzmWJY9FJWh1xEov7Dx
 kL2IFiV13iftPsMpybB/vZS6sOyaSAetlBziYUcigiKFL9RcZZB6Rb69+6/E5bt5Q6WI
 A+9kB9EWnlCCqNR14v7m0qgquP6+l/H30xaswW9F28X9wrWE2ZGkwJ67SlpHH9C17rMf
 Cjvd2OU2oVucQ9LwOWPcC6TsseabD4kDbzS6P3h1Wt67l3jhJYLdUCmtV5KaxqXu9wJw
 Ekqw==
X-Gm-Message-State: AOAM531+tOb9Rb4kSodec78d+K7vUagM5g10/6g84DBt+z85IKMPyUID
 Sd9Tgrpmh8+2wMJ8GLgkFUG4lwPPfWQOmBJWj/QSvw==
X-Google-Smtp-Source: ABdhPJzr6yHUX5v7BGEcMhUDV1cUCOAKiltj24nnnPzP6TuGA0Pq1ldfeUd2BvVxt3jSHtlqeTvapEQeBsyIkpdrGqc=
X-Received: by 2002:a05:6830:1c76:: with SMTP id
 s22mr12465867otg.233.1606136900157; 
 Mon, 23 Nov 2020 05:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20201116054035.211498-1-98.arpi@gmail.com>
 <CABVgOSkoQahYqMJ3dD1_X2+rF3OgwT658+8HRM2EZ5e0-94jmw@mail.gmail.com>
In-Reply-To: <CABVgOSkoQahYqMJ3dD1_X2+rF3OgwT658+8HRM2EZ5e0-94jmw@mail.gmail.com>
Date: Mon, 23 Nov 2020 14:08:08 +0100
Message-ID: <CANpmjNOhb13YthVHmXxMjpD2JZUO4H2Z1KZSKqHeFUv-RbM5+Q@mail.gmail.com>
To: David Gow <davidgow@google.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, "Bird, Tim" <Tim.Bird@sony.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v9 1/2] kunit: Support for
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

On Tue, 17 Nov 2020 at 08:21, David Gow <davidgow@google.com> wrote:
> On Mon, Nov 16, 2020 at 1:41 PM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> >
> > Implementation of support for parameterized testing in KUnit. This
> > approach requires the creation of a test case using the
> > KUNIT_CASE_PARAM() macro that accepts a generator function as input.
> >
> > This generator function should return the next parameter given the
> > previous parameter in parameterized tests. It also provides a macro to
> > generate common-case generators based on arrays. Generators may also
> > optionally provide a human-readable description of parameters, which is
> > displayed where available.
> >
> > Note, currently the result of each parameter run is displayed in
> > diagnostic lines, and only the overall test case output summarizes
> > TAP-compliant success or failure of all parameter runs. In future, when
> > supported by kunit-tool, these can be turned into subsubtest outputs.
> >
> > Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> > Co-developed-by: Marco Elver <elver@google.com>
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> [Resending this because my email client re-defaulted to HTML! Aarrgh!]
>
> This looks good to me! I tested it in UML and x86-64 w/ KASAN, and
> both worked fine.
>
> Reviewed-by: David Gow <davidgow@google.com>
> Tested-by: David Gow <davidgow@google.com>

Thank you!

> Thanks for sticking with this!

Will these patches be landing in 5.11 or 5.12?

> -- David

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
