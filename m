Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A4EC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 19:12:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B3D52415A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 19:12:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtZOp7+b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B3D52415A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 034118562D;
	Wed, 21 Oct 2020 19:12:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D9esIFksR_dB; Wed, 21 Oct 2020 19:12:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9878D84F76;
	Wed, 21 Oct 2020 19:12:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 831EAC088B;
	Wed, 21 Oct 2020 19:12:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6900FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 53F04874C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRlvzZAnI-gh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:12:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AEB38874A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:12:48 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id z2so3538225ilh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 12:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cicLxiZ2pJxeNcrsla6aQZQxECgsVNk7QwFVKAmvVic=;
 b=LtZOp7+bO31gS11qb7YgWyXytfCn3sfkOqfqT9tb7FTmqFPD+7SviB5IPlhX5CjdPp
 BIxzNvUjC0L6/rX7xcHpV7ibCg5x76DkD9A7AsJkC1akhMdNR0ueq7aVCXKdq70hn2ng
 8RQenoz1r3sdh74gyWsGdJupJ3SLYl7e6LP8yjflXQ1simfX3k+QkIVBi7XRmMsvFKO3
 RwV2DWFhZ743dn/27g99rhm2uge71DRd/eKDNavflidLQUETvRuGhHOb5/yDfuY9zedD
 /70afm/frJWXd2M5T8Qoq/AOgL1tSrIRE+kCAH+akg1xKshv/2yxsukItM+t17fXdp1C
 bwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cicLxiZ2pJxeNcrsla6aQZQxECgsVNk7QwFVKAmvVic=;
 b=ZD+izt0wvzoGfMAsVVJQJ2Am5R4HPVAVi70fGgbmELIKxiKBEufKlv5+PoUURuW22Z
 n9VhnWLJDMsTp0bcMdqk1sEuBg60B61AwMRxkEYM5qau4Xc9U/6zxOC20eOlR86BUtxi
 JkoBF+654mz/3DXoBiUWxY9/HfiuPAI/uY+R7Q60wDaE1XyCd81QljuLSWU7yPQDM+II
 s48VpqKfMojNbB1Ltgv+jHWfn4ZZUEB9XjzVsE5ztLyrHVzCuGrRjOnUA/Dkgg1r8x8F
 eUHJYUSf6RcNwlW6Dy9cLG3vbBymCVXYMzw9Kiqv2YgGYb5TT59cCDele8vteSisJPhf
 /uJQ==
X-Gm-Message-State: AOAM530UW1YkbiD/2HvHNosOs0DkcubQ/XzuIja4TuORPnPP5b5wtOiz
 op7py3qQr5cusOE6AuOsDFYKUNePJZ4zzvabfnA=
X-Google-Smtp-Source: ABdhPJy2peqg3nBLiM2eNvvIgRbEE8Ctr9quk7enFj9RmgHgo5LIK+1wClgBM701B1VkH/bKmYvpI4Rj8hSjfWq58bE=
X-Received: by 2002:a92:de43:: with SMTP id e3mr3291056ilr.62.1603307567874;
 Wed, 21 Oct 2020 12:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201021150120.29920-1-yashsri421@gmail.com>
 <f073750511750336de5f82600600ba6cb3ddbec0.camel@perches.com>
 <26647abf8cf14595a0dd22f10ec1c32e3dc2a8c0.camel@perches.com>
 <40ca3f0f9a960799ad0e534b77d778c90119e468.camel@perches.com>
 <c4f8aae0-d805-8d09-1a87-ba64bc01c29a@gmail.com>
 <d44e35ec1d923fd09ea6530ca5d1988cc8e59347.camel@perches.com>
 <0871715a-e605-91c0-ffa5-389a313ec34d@gmail.com>
In-Reply-To: <0871715a-e605-91c0-ffa5-389a313ec34d@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 21 Oct 2020 21:12:32 +0200
Message-ID: <CAKXUXMzdjV8aPL=Paf2QJs1iWB5swxYXFJozyPi_JxJVXRArxQ@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
	for REPEATED_WORD warning
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

On Wed, Oct 21, 2020 at 8:25 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 21/10/20 11:35 pm, Joe Perches wrote:
> > On Wed, 2020-10-21 at 23:25 +0530, Aditya wrote:
> >> Thanks for your feedback. I ran a manual check using this approach
> >> over v5.6..v5.8.
> >> The negatives occurring with this approach are for the word 'be'
> >> (Frequency 5) and 'add'(Frequency 1). For eg.
> >>
> >> WARNING:REPEATED_WORD: Possible repeated word: 'be'
> >> #278: FILE: drivers/net/ethernet/intel/ice/ice_flow.c:388:
> >> + * @seg: index of packet segment whose raw fields are to be be extracted
> >>
> >> WARNING:REPEATED_WORD: Possible repeated word: 'add'
> >> #21:
> >> Let's also add add a note about using only the l3 access without l4
> >>
> >> Apart from these, it works as expected. It also takes into account the
> >> cases for multiple occurrences of hex, as you mentioned. For eg.
> >>
> >> WARNING:REPEATED_WORD: Possible repeated word: 'ffff'
> >> #15:
> > []
> >> I'll try to combine both methods and come up with a better approach.
> >
> > Enjoy, but please consider:
> >
> > If for over 30K patches, there are just a few false positives and
> > a few false negatives, it likely doesn't need much improvement...
> >
> > checkpatch works on patch contexts.
> >
> > It's not intended to be perfect.
> >
> > It's just a little tool that can help avoid some common defects.
> >
> >
>
> Alright Sir. Then, we can proceed with the method you suggested, as it
> is more or less perfect.
> I'll re-send the patch with modified reduced warning figure.
>

Aditya, you can also choose to implement your solution;
yes, it is more work for you but it also seems to function better in
the long run.

Clearly, Joe would settle for a simpler solution, but his TODO list of
topics to engage in and work on is also much longer...

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
