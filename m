Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243E9C83F12
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Aug 2023 15:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99D51610C9;
	Mon, 28 Aug 2023 15:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99D51610C9
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=cfQqaL/I
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnb05Z-YU91M; Mon, 28 Aug 2023 15:04:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8350F60E5D;
	Mon, 28 Aug 2023 15:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8350F60E5D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F142C0039;
	Mon, 28 Aug 2023 15:04:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D554C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 15:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BC4D80E27
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 15:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BC4D80E27
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=cfQqaL/I
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLDEKFzGADSO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 15:04:19 +0000 (UTC)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69F7A80D7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 15:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69F7A80D7B
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-56f75ec7ca9so3444261a12.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693235059; x=1693839859;
 h=to:from:subject:message-id:references:mime-version:in-reply-to:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=44z04Upq456UQmw678VVBxGUGBJlGyeCqGamftbBzBI=;
 b=cfQqaL/IgFqjVPy1uxXhOnPoIcUzStfsVfY2XTS+f8qyN8I/TPlrLPkXMtnMHQL0hw
 eRs5YPhOyntfV3Yk919brYJIa7QFoPtF0o2OpVbSikSYVDq9EPtJUqothhsfbUdkTE2d
 vVf8C/aldP7zaxVLQ8/KYf3esHR2VLxdxCxVNdQ3NegLvf9K4sJ50aOOOYKGC0pqPae8
 +kGua2sD7Uxi312eA0eHodErjGJ6Vpl1tkgHI7l011Xdxvpy1+8XPLkzgxRjBWn5kgms
 pJVvOJlDlhCs25wlVGuNPOfw/+pVTHgUzV+T9ZpWWbvqZmxO1b4sGMNfGT2aRbUL8+XS
 IJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693235059; x=1693839859;
 h=to:from:subject:message-id:references:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=44z04Upq456UQmw678VVBxGUGBJlGyeCqGamftbBzBI=;
 b=Ed9dtnXDAicHhwABxqjwWXkl5BYk3Yxjo1aJyWTOy0BPn0mPpEfQLt5kVWM7IHENPr
 RKv+jG2Cq7Ea4tghOU7Y3SvraHrgTLQkR2g1tI5wqQ9KXVTZQB1PHatOVj1rws6UVF1f
 CyZXTxI19XF7FUVN6mCwEbVDOjaKK7rnqmm+5HEI1lq50hZxvda2TTqRLZEunoCPjrIB
 f1tpYxifN/qBAj0BK+0BnlVJaiz02cJ25QH8SQxZnF3Igzv6Smxjyeu5I7Yz7KeZpIGc
 X2IQgAUO45TPFzRtyVzajOBGcB6hWQd7BfLSvN3C65aLRF0MhJdPohRtfdyTiML8AzTZ
 mUYw==
X-Gm-Message-State: AOJu0YwjpXIg295PvzXWZ8p8r7N4Fy1hz9H20QHal0efm/dWK5u5PorL
 WXWuMJorx/G6nsXdHsQk07FmVaghi90=
X-Google-Smtp-Source: AGHT+IHx8QoPWXG0uiFs074kxBJ4wZlo7XAZfUZCF9qCl2ZpFWDd3rF0lIPdKRvJ34ciqAdr+HR2gVtKTXk=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:6d83:0:b0:566:2d6:f720 with SMTP id
 i125-20020a636d83000000b0056602d6f720mr4944654pgc.7.1693235058652; Mon, 28
 Aug 2023 08:04:18 -0700 (PDT)
Date: Mon, 28 Aug 2023 08:04:17 -0700
In-Reply-To: <20230826094523.bl6kbcwelj23cydu@mmaatuq-HP-Laptop-15-dy2xxx>
Mime-Version: 1.0
References: <20230824202415.131824-1-mahmoudmatook.mm@gmail.com>
 <ZOjIHo2A6HZ8K4Qp@google.com>
 <20230826094523.bl6kbcwelj23cydu@mmaatuq-HP-Laptop-15-dy2xxx>
Message-ID: <ZOy3cXUJld0FskSk@google.com>
Subject: Re: [PATCH v2 1/2] selftests: Provide local define of min() and max()
To: keescook@chromium.org, edumazet@google.com, 
 willemdebruijn.kernel@gmail.com, wad@chromium.org, luto@amacapital.net, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, 
 shuah@kernel.org, pabeni@redhat.com, linux-kselftest@vger.kernel.org, 
 davem@davemloft.net, linux-kernel-mentees@lists.linuxfoundation.org, 
 David Laight <David.Laight@aculab.com>
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
From: Sean Christopherson via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, Aug 26, 2023, Mahmoud Matook wrote:
> On 08/25, Sean Christopherson wrote:
> 
> > On Fri, Aug 25, 2023, Mahmoud Maatuq wrote:
> > > to avoid manual calculation of min and max values
> > > and fix coccinelle warnings such WARNING opportunity for min()/max()
> > > adding one common definition that could be used in multiple files
> > > under selftests.
> > > there are also some defines for min/max scattered locally inside sources
> > > under selftests.
> > > this also prepares for cleaning up those redundant defines and include
> > > kselftest.h instead.
> > > 
> > > Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
> > > Suggested-by: David Laight <David.Laight@aculab.com>
> > > ---
> > > changes in v2:
> > > redefine min/max in a more strict way to avoid 
> > > signedness mismatch and multiple evaluation.
> > > is_signed_type() moved from selftests/kselftest_harness.h 
> > > to selftests/kselftest.h.
> > > ---
> > >  tools/testing/selftests/kselftest.h         | 24 +++++++++++++++++++++
> > 
> > Heh, reminds me of https://xkcd.com/927.
> > 
> > All of these #defines are available in tools/include/linux/kernel.h, and it's
> > trivially easy for selftests to add all of tools/include to their include path.
> > I don't see any reason for the selftests framework to define yet another version,
> > just fix the individual tests.
> 
> giving the reviews seems that patchset is useless.
> still a confusing point for me; after adding tools/include to the
> include path of selftes how we can differentaite between  #include
> <linux/kernel.h> that under tools/include and one under usr/include.

AFAIK, it's up to the individual selftest (or it's "local" framework) to declare
the tools/include path before usr/include, e.g. see tools/testing/selftests/kvm/Makefile.

The whole setup is definitely a bit kludgy, but IMO it's better than conditionally
providing selftests specific fallbacks and potentially ending up with multiple
definitions of min/max within a single test.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
