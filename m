Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4ACC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 08:03:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E9B21D40
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 08:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxW3zUmh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86E9B21D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1695685FA7;
	Tue,  3 Nov 2020 08:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BvmNb0d7eKXf; Tue,  3 Nov 2020 08:03:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C37E85F94;
	Tue,  3 Nov 2020 08:03:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89FBEC088B;
	Tue,  3 Nov 2020 08:03:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DDA3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 08:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6AD0D85FA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 08:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 503TpK5wDm2P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 08:03:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 882A085F94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 08:03:12 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id f9so20968100lfq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 00:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o8mlm/Qp/onAhk8/kvztnd8MhySLP+TPn3sjDt5NLiQ=;
 b=cxW3zUmhRl1EB3w2jHglo2o82jpPpZKF8Gdu2qJZceyQogIHaxCoce4L+DzBT0y5G+
 yauB3QTSzekB1R3Eh9Wn6JB3i75nqp5j/k72WuFRpXp1ytynkuV0be7B3Fw9r/Ob6MxL
 6FtL3PQ3zT6zqSakjJirME5goCPS2XVW9roHWx3232IsDu6oqBIgVmFkUbGQsk9WvtnJ
 cB0K0jjd//W2vLR7ooWoAZMmvfrs40loSbHJ2vo5/fB8CRy6mQyBCoXLUaMbIsCvv+BR
 6U2o+OEPv0LSkZC+YU5vj6mhAXyJ6pV+yRmGEI13H0JC8sXN8D+GCOh92MFxeqXX5PuJ
 Y7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o8mlm/Qp/onAhk8/kvztnd8MhySLP+TPn3sjDt5NLiQ=;
 b=O5RTCM7o+/OAGGbPV//2Tz1Oabt8fAGGY+D0IqXaWF041xd2EotIaDgkpCLucemdIu
 q3det7waB+D+ed4I35/Xm3GkvEu5DRh2Ivp9ZvY7EF2XLt7H/W4gPwCCvkSHJT7BxOu+
 Xb4OySoW6Z8vL7EL6gp+1YJwI4iyRS3XhPjPFZaJZwxCzPmXodaXqT72ULbFsAJrUTm/
 Wqr+SCU52BbAwBoDD4Iq0uJupsOfrhMdqpWqTEj7ZRLttk6zagXvYw5iUgN8LHCmKnJb
 gIJLunpeeJ+07HxQp0ss/6uhu2hGV6M+yG8Nf33ovmSTxJMsMUhOwHmYagQuWWwULEZ7
 k4rw==
X-Gm-Message-State: AOAM530ZPa/5As6A4PPI0q0V3kQdN95b8zCrhj9f0E1luhpnuzOxZ3T2
 fYhEO//s92wdqqk4sps1EczGtvXIXwllkkQdvyM=
X-Google-Smtp-Source: ABdhPJztgVgZuzzhImE3PmiV7kc6P7RWG1BbSzEJkZpReb6ALVgGXw1c4V4FjifQn0T6SL9E9b5zMDkSfxsapPalOlE=
X-Received: by 2002:a19:e016:: with SMTP id x22mr6868888lfg.400.1604390589169; 
 Tue, 03 Nov 2020 00:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20201103054810.21978-1-dwaipayanray1@gmail.com>
 <CABJPP5DkJ3gwZDW+FBShs3Yo8z6GfP4LSMRW4hO5hL+fVXjShQ@mail.gmail.com>
 <e9d540c35ac04f0bb69e26d29c76c7cbd5693df8.camel@perches.com>
In-Reply-To: <e9d540c35ac04f0bb69e26d29c76c7cbd5693df8.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 3 Nov 2020 13:32:38 +0530
Message-ID: <CABJPP5D3v9ZGCCqn_wg43H5CN0ff=C8J8jDGYU6LHJBBn6-wAw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: improve email
	parsing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Nov 3, 2020 at 12:58 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-11-03 at 11:28 +0530, Dwaipayan Ray wrote:
> > On Tue, Nov 3, 2020 at 11:18 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > >
> > > checkpatch doesn't report warnings for many common mistakes
> > > in emails. Some of which are trailing commas and incorrect
> > > use of email comments.
> > >
> > > At the same time several false positives are reported due to
> > > incorrect handling of mail comments. The most common of which
> > > is due to the pattern:
> > >
> > > <stable@vger.kernel.org> # X.X
> > >
> > > Improve email parsing mechanism in checkpatch.
> > >
> > > What is added:
> > >
> > > - Support for multiple name/address comments.
> > > - Improved handling of quoted names.
> > > - Sanitize improperly formatted comments.
> > > - Sanitize trailing semicolon or dot after email.
> []
> > What do you think? Should warnings for the names which should
> > be quoted be reported considering this result?
>
> Clearly the quote suggestion is unnecessary.
>
> I think that "cc: stable@(?:vger\.)?kernel\.org" should be
> treated differently from other forms of invalid/odd address lines.
>
> My suggestion is that the case insensitive form of
>
> Cc: stable@vger.kernel.org
>
> or only another similar case insensitive forms with a
> # comment separator like
>
> Cc: <stable@vger.kernel.org> # some comment
>
> be acceptable for stable.
>
> All other forms with stable@ should emit some message.
>
> And other <foo>-by: and cc: addresses should only have a form like
>
> Signed-off-by: "Full.Name" (possible comment) <email@domain.tld>
> or
> Signed-off-by: Full Name (possible comment) <email@domain.tld>
>
> etc..
>
> and any additional content after .tld in the email address be flagged
> with some message like "unexpected content after email address" rather
> than "might be better as".
>
> What do you think best?
>

Hello,
I think the warning "unexpected content after email" is more reasonable.
But maybe we can allow addresses of type:

Full Name <email@domain.tld> (comment here)
or
Full Name <email@domain.tld> [another comment]

I checked the following:
$ git log --format=email -100000 | grep -P '^(?:[\w\-]+-by:|cc:|CC:|Cc:)' \
| grep -P ".*<\S+\@\S+>\s*(?:\(|\[|\/)" | wc -l
280

And for stable ones, I found another pattern which is common:
Cc: <stable@vger.kernel.org> [X.X]
and only few instances of:
cc: stable@vger.kernel.org (X.X)

Apart from these no other style has been used for stable so far.
Maybe placing it in the generic check would suffice.

So I think we can introduce the unexpected content warning for
anything other than the braces or c89 comment styles. And
maybe a separate check for stable won't be necessary then.

What is your thought on this?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
