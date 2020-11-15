Return-Path: <SRS0=uYLy=EV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73019C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 20:22:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6BFC22283
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 20:22:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DggMQ1AO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6BFC22283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6B34F86169;
	Sun, 15 Nov 2020 20:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iyjxEWou72_g; Sun, 15 Nov 2020 20:22:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 178008615E;
	Sun, 15 Nov 2020 20:22:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06479C0891;
	Sun, 15 Nov 2020 20:22:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A58BC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ED684871E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cKFHs1EMXyBh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:22:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0C337871A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:22:12 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id z21so22101748lfe.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 12:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XkRCtXx+czx/oBRIo2v8kj7/1kUvy+xMxx8MfeaE4OY=;
 b=DggMQ1AOYTqHsCXfbkQMg+w4m7aYKxBrwmR4dwk819sXZyJSZABXCUnPzqM2TEtXnt
 WEOSh7PXnfD1ZSeMrVKvPdtVg8g0Y5IpK8g0j4O/Bdx/FkzHDwtzF/YrqcInOJunBqlN
 yUB8jmGxVlX4gva3Sss24Lde+8WCAgkSpveRhR1AV2dikTZOD/c7+UlOHVPJvqBqhLd7
 PODAfmdchME/qO6i1hl2yoj0YP0WL8+aEAx86qt71ItDUzctDoljiYVE3QLK7SaA2+ZH
 hiDVLYBa3JBnsfkSNAVKC6/8Bh3SZpBCW8Do2Tz/nB9wzA/Qgj86sz5V9Y79mwHhJEF8
 CEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XkRCtXx+czx/oBRIo2v8kj7/1kUvy+xMxx8MfeaE4OY=;
 b=Yv/5wxscXket9c5aBrTHfwBJe4qf8HNMpxcmzQdu4ZnSkqME0opi3HqmaT6nwVGiAI
 vs6vhOIZTafOFSVBrcYxq4VR82iOFkg0Oi8B7J4RbDcxIMOxxLKtmJcnXQC3mZldSp9n
 8w/A5VdoldmP89ttpJ2dpc4dQv1dct7dNx8y0K4qNMw0F+UX2oodmMhnOe7YyXJKiiGw
 toUXIdbqZIzf4PADNJ94FFdKKNMOc+VzzTN8lJUHNe0zacH0E3L4HLplsBjUm+As1w6b
 h9bcBrMydaJaCTTU3MZPn4kulDQEhRcUBXh0xcYFRI5IF6TgiLSFztHpF8dXAj0UMMFM
 TJ7A==
X-Gm-Message-State: AOAM5333An86qNlFbeLNdMdqbv1o2gDQ9dxeu6KhAD9KaCM5M6bKhHe5
 XSA6zX2m8OB+Uq6eOqO6y3rdfF7YvtqK7N0yqLw=
X-Google-Smtp-Source: ABdhPJyjeO6YTBvNHojBI6ZeycmiZRW5tw7Gmqtoth9jcrPuVCJIwBA2L4tS9JGegELhMRZDhwnr1n16Gp4lMFaHT28=
X-Received: by 2002:a19:8110:: with SMTP id c16mr4163659lfd.372.1605471730033; 
 Sun, 15 Nov 2020 12:22:10 -0800 (PST)
MIME-Version: 1.0
References: <20201115171626.38478-1-dwaipayanray1@gmail.com>
 <CAKXUXMy+fKU=RODBagFL8YzT4xdbSZMi3fHV3ATx=bLNPp-hRg@mail.gmail.com>
In-Reply-To: <CAKXUXMy+fKU=RODBagFL8YzT4xdbSZMi3fHV3ATx=bLNPp-hRg@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 16 Nov 2020 01:51:38 +0530
Message-ID: <CABJPP5Dae-8AkPF8RQxLk-mNhbCKFXUyyEei552PGW7i=gEUSw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix unescaped left
	brace
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

On Mon, Nov 16, 2020 at 1:43 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Sun, Nov 15, 2020 at 6:16 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > There is an unescaped left brace in a regex in OPEN_BRACE
> > check. This throws a runtime error when checkpatch is run
> > with --fix flag and the OPEN_BRACE check is executed.
> >
> > Fix it by escaping the left brace.
> >
>
> Can you find with 'git blame' which commit introduced this issue and
> add a Fixes: tag?
>
> Other than that, it looks good.

Apparently it was introduced back in 2014 when it was first written
by commit 8d1824780f2f. I guess perl depreciated allowing unescaped
left braces at some point.

I will add that and send it off.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
