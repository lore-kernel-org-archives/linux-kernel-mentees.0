Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D5DC2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 08:11:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C02222275
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 08:11:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIVn5uph"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C02222275
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17C9B85FA7;
	Tue,  3 Nov 2020 08:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6AW1OWAXuYN; Tue,  3 Nov 2020 08:11:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D38085F77;
	Tue,  3 Nov 2020 08:11:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73D19C0889;
	Tue,  3 Nov 2020 08:11:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E442CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 08:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CAC2485F7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 08:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V520gWjKGBPR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 08:11:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0BABA85F77
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 08:11:09 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id o11so6298297ioo.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 00:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kWNEcvYHB1Y+hYGFC0n25x7P0WSWWMjwyFtXRi1KVuc=;
 b=WIVn5uphjuvxZyJn06lfWTowtZ7KxvFDIHfU4LM3/vHTIGvTPCkuYQJUOKsgAdQxuo
 Q7ckz+8b+vcpj2IhVBOWLnW2HQKvOD0DVeoIftB/QKHZeGOtcRLYzOhjx5l1J2XbOmEB
 3xMGIi1itApit8gOK6UN18yMh2bEKbz7Gb61oM4VFASLAiiuEK8WHC4N7mKmEuf8M/8S
 Uh7wWL9Ua/3l78eoi4pXvIZRQXVGBfOOiVfdph/PRp/auZpeqsyYxonQFl62C/UY+Xr/
 D0QbovbM/C5XglVBGvgpt31RmPRjGuJ4hdD5L/cjGURDakj2dOQSiAgD8lFwMXGP9yOO
 id5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kWNEcvYHB1Y+hYGFC0n25x7P0WSWWMjwyFtXRi1KVuc=;
 b=JVS9mO/dwfyzq5o0NyWMW930qenEpJNoZhTaBD1G8Bb9tr4Z8PbW8m1mAeZUdnkyBl
 OM7OjURFWu3cE37q5Gx+s/ZYK19nNNQPp+UC6vpKhXHamOKzF++b9UO58O0PJF3LRwsR
 ja8LtKttWHdJm4OoCg/gny/pYzzk5Uyd04ScI894sHfAPNsgT0lIPRZfUH+660Dvfsvu
 7sBBElOoFJByJkIyygj+6+yI19ZzAlRDg5lhmU1geUJsprjwh3ScAXsNLp0eHxFg9Tk8
 GZdZQLH9V7/JSBknt33p3UKJmWaTv+eziSadW16U1lcGcNH3vfU/QLAiQDiKRGnwFCYp
 w7Eg==
X-Gm-Message-State: AOAM531N+x/Ubk1y+RSDaty2cGxwcqGOp3Md0gc9yz583eIkwO8V/J9i
 VCAF6uX8WtcOTCX0W9KOeiWCEScAliKGX5LKQEY=
X-Google-Smtp-Source: ABdhPJzSJwDJoErUxdthW2TS1p6R8cFpiAGMGXVdITnOSnwZCtXtdKBT1Gkl4Pwe+ETTYi63amCPX1kdS7W3DXuCBW0=
X-Received: by 2002:a5e:9743:: with SMTP id h3mr13036096ioq.158.1604391068175; 
 Tue, 03 Nov 2020 00:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20201103054810.21978-1-dwaipayanray1@gmail.com>
 <CABJPP5DkJ3gwZDW+FBShs3Yo8z6GfP4LSMRW4hO5hL+fVXjShQ@mail.gmail.com>
 <e9d540c35ac04f0bb69e26d29c76c7cbd5693df8.camel@perches.com>
In-Reply-To: <e9d540c35ac04f0bb69e26d29c76c7cbd5693df8.camel@perches.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 3 Nov 2020 09:10:54 +0100
Message-ID: <CAKXUXMwH+tEBSV6xA952xQQFe+HvdJ5ew6V=n63sk89enj6p7Q@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
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

On Tue, Nov 3, 2020 at 8:28 AM Joe Perches <joe@perches.com> wrote:
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

I agree that handling stable@vger.kernel.org should be a special case.

We can even ask Greg KH and Sasha if they have certain preferences for
the format of this meta information after the #, so that their scripts
could pick this up.

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

I agree with refining the error message here. Also, Aditya, Dwaipayan,
here we can probably have some suitable fix methods, e.g., detect
where the parsing fails (a missing ">" or a space where the should not
be one, or a just few characters at the end, or a long list of email
addresses which should be split etc.

Maybe you can coordinate among each other who would want to create
suitable fix rules here?

Also, start with the class of the most frequent mistakes for
unexpected content after email addresses.

I imagine that a maintainer can simply run a tag sanitizing script
which just cleans up those stupid mistakes before creating their git
trees or sending git pulls to Linus. Let us try to add these
sanitizing rules to checkpatch.pl with fix options for now; if that
sanitizing feature becomes a monster script of its own within
checkpatch.pl, we can refactor that into an independent script for
cleaning up.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
