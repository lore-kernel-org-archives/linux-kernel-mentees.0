Return-Path: <SRS0=nBaC=E6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB88C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 06:54:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CCED206FB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Nov 2020 06:54:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkq3LttM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CCED206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B319D84ECD;
	Tue, 24 Nov 2020 06:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hBOSvzoocXKf; Tue, 24 Nov 2020 06:54:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A7E4C84EA7;
	Tue, 24 Nov 2020 06:54:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8138DC163C;
	Tue, 24 Nov 2020 06:54:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2D3AC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 06:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B69768715D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 06:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dp7nRSnzqsus
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 06:54:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EB67287158
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Nov 2020 06:54:24 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id y9so18296120ilb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 22:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jyg5lcJdKgnuPCVzERa4Rt0xWB2AfCQtzpyLk67O5hU=;
 b=lkq3LttM7CTkaBXuWnEHF9j9YCCIyQZMet9iO4QghTwL8ln4iFPDQRHEXJX9shLaBS
 UaiSxBBfpa/vYmTOV80ruwaBlfTNDDAdHVXEShbhwIIeMR5By32wVx+mpAbk2eiNm5tu
 ucm40VBmzvujaB55jq36tXz52pyOgKs6pHQP1WM23d92+f5yKTb6zHOg+yUmk/QDs4UB
 snaLHinXdMPVny2mt7+EElL9sMz5JYpGbDT7dYB6oOED9dwhzD/QyxlnqHJa/ZXRgV3o
 m+t+IuodS57GUUCoY/wgXSkZBb/DQtKSs8OYvAFJRRhHO3VhWI2nM5FUNEbN36/fNmEv
 7OTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jyg5lcJdKgnuPCVzERa4Rt0xWB2AfCQtzpyLk67O5hU=;
 b=I6rGO7e3GdsY6Xau68zehK9CK1ZJGyReaQ7zrd4VqPastSmqB2jzCdRU5z258mutQy
 O4riOvLOypinXAneesNC3KG3j5kTYKL6ktKB3D/fi+uC/GYL6HMEsZB18eoXau+arxZK
 RpwCTZmplYLh53sYYy7TKzNGEz3esF8edsUzsUDqCQGNG/m73iqFtU2mLrpYbqV96xb9
 fWtMsFtnXc0Y7mnkKrKAG0wkypfia1G9Cz/Y05YB5i2VsmuH3bd3gyMSPpzcEw73/55K
 Q8HyaSsOs9OKJYYKQlbxTNCodyopYCCufpdAYqQMAjKoOVTYAS/tl55Gh+tP4dS+6V/T
 FgMQ==
X-Gm-Message-State: AOAM533bM6DhX4k7/eewcpAKAxZL1zlGaFP+o5wiKi/NAITWC+0DkP3A
 1X+i3KoOW3TtR1qz71Lf72EFdL2jlt9IsbRNlgo=
X-Google-Smtp-Source: ABdhPJyCdOM0L5zrUb51hSfU7JeNsMaQ+XL9nXC5bGZFGTctTczOxXx9rKpmdH7xqcMblstNAgHqrpBzGiZ2idhhVag=
X-Received: by 2002:a92:aacc:: with SMTP id p73mr3053455ill.64.1606200864161; 
 Mon, 23 Nov 2020 22:54:24 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMx8siSm67jkBP_r+OKyKALfT2EDcX_SfX7JGBy3YisXcQ@mail.gmail.com>
 <20201123172430.12854-1-yashsri421@gmail.com>
 <148208ef84344069a6c95d3f686a86ca1199be90.camel@perches.com>
In-Reply-To: <148208ef84344069a6c95d3f686a86ca1199be90.camel@perches.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 24 Nov 2020 07:54:13 +0100
Message-ID: <CAKXUXMzcMWeM2M81b2PZ+D54LO6xd+m667vygWVF93Mnsq8QQg@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v4] checkpatch: add fix and
 improve warning msg for Non-standard signature
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

On Mon, Nov 23, 2020 at 6:33 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-11-23 at 22:54 +0530, Aditya Srivastava wrote:
> > Currently, checkpatch.pl warns for BAD_SIGN_OFF on non-standard signature
> > styles.
>
> I think this proposed change is unnecessary.
>
> > This warning occurs because of incorrect use of signature tags,
> > e.g. an evaluation on v4.13..v5.8 showed the use of following incorrect
> > signature tags, which may seem correct, but are not standard:
>
> Standards are useful, but standards are not constraints.
>

Agree, but we do try to create statistics and try to derive quality
statements from those tags (yes, empirical software engineering black
magic...).
Hence, I am in favor of suggesting to rewrite those tags that really
do not add anything at all. E.g., Suggestions-by: vs. Suggested-by, or
Coauthored-by vs. Co-developed-by.

Anyone can ignore checkpatch; so it is not a constraint unless
enforced by subsystem maintainers.

> > 1) Requested-by (count: 48) => Suggested-by
> > Rationale: In an open-source project, there are no 'requests', just
> > 'suggestions' to convince a maintainer to accept your patch
>
> There's nothing really wrong with some non-standard signatures.
> And I think leaving humor like brown-paper-bag-by: is useful.
>

I think we do not want to take the humor and fun away from patches.

So let us not suggest deleting the humorous and celebrating ones.

> Just telling people that they are using a non-standard signature
> I think is enough.
>

Maybe a patch reduced to the very obvious synonyms helps newcomers or
people with lousy memory to be reminded that it is called
"Co-developed-by:" not "Co-authored-by".

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
