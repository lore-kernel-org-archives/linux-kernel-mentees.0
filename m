Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4795DC63777
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 15:51:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F45205F4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 15:51:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CA2hTKbC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98F45205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0F86522BCC;
	Mon, 30 Nov 2020 15:51:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ggiz-TqdnFfX; Mon, 30 Nov 2020 15:51:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 624AC20116;
	Mon, 30 Nov 2020 15:51:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46DD9C0859;
	Mon, 30 Nov 2020 15:51:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3B90C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 15:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C20B987170
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 15:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dyoaSU8KtJwH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 15:51:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 214C487167
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 15:51:54 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id f20so3851467ioc.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 07:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3tzHBYv4kAgDPAOFnmDkgtRo0X1jUWkUmDcEEwAaNgw=;
 b=CA2hTKbCINssMWV7MsfK61Yfs/3LNLleFBaMj/H3JJ06IH9C6bf/+1o6Q8pMmsD/wt
 sv+aTNXuC8Iufa4F/Qy6tUmmKBJ78283pbW9gilk2E3e0lyEQ+phBD1bN4sI95csMqJk
 lUxrKtxftv15Y6/2P3yIIkd8zXq2paPaKsJ+i9+iCgCiGS4tQMA4xKnQ4sjdh2aGgM22
 5wRstoovpEEo2YNL4I7o3QnhUhSsrVzOtT/oPxJYaB76pqQG+lD26c3189pX+90VUGYM
 ZDOwb3ICtv4IVt3AHOgRtEO45mp3+zhyArmcxA3kQUYgNNbAVHEu1YFCMhUUegDM/eNk
 gU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3tzHBYv4kAgDPAOFnmDkgtRo0X1jUWkUmDcEEwAaNgw=;
 b=SdBqDa37gDwocR/1Q3i+zoLqUWX+xJtF18DjBEmBtX6r3/lHOZZuqBU27gL2rnkxa/
 6zGiPe8jaMWjyiqQomCx4wZOSk9fbRSFNZfh4UjWAMpyNLyK4TFFDVqu207/0ELvoqdo
 GgOALwv1lGwJTX8QOMK/9erhAx+M/2Qys8qrUC0IGnRIjZaI3B3zdfPcosVmMkj1b6Fg
 a3RII6vr5LEcht1S92VCq7OrBji6uDxsMzCgFE3GDFX63SE3Lh+dfuwHHKiBvhdRKnEF
 YmwFxpidY0oovnr6vq3gDawSjDIPJsuYCCYi5PumpT+SKfWzpUuBMpF8GKMVg+g014UK
 duhw==
X-Gm-Message-State: AOAM533Ngy+FkD51emIWuOhd1hSfSK0ZhmNAXpG1upZDe/VfqooFRF7L
 XWn4dkrNpBKqpdq2uPS0BKcbGwPUpGMpKYtX5ng=
X-Google-Smtp-Source: ABdhPJzryPPaPbJtXxg1aFW2SMdWt9UchI/1LnwR+Z7Jz/VLh5v8SzB8LXiPpO+DT1rTDyGc9d/wtVrUzRccGuoiMno=
X-Received: by 2002:a6b:b2c6:: with SMTP id
 b189mr12387866iof.183.1606751513158; 
 Mon, 30 Nov 2020 07:51:53 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5CZhURjFi9xE9KpxKSygS2z_8pbnrvhvV0nQGP9+vZ5_g@mail.gmail.com>
 <20201130152329.GA25773@PWN>
In-Reply-To: <20201130152329.GA25773@PWN>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 30 Nov 2020 16:51:42 +0100
Message-ID: <CAKXUXMxGdWNQy95AEB1Ph8dqBgambD2t6s+--g0aT2VYj0q__g@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Possible new warning for checkpatch
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

On Mon, Nov 30, 2020 at 4:23 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Mon, Nov 30, 2020 at 08:28:23PM +0530, Dwaipayan Ray wrote:
> > Hi Lukas,
> > I was having a talk with Peilin and a possible new idea came up.
> > It's about lines in the commit message that start with a '#'.
> >
> > Normally if a patch contains lines starting with '#' in the commit
> > message, when they are applied they successfully appear in the
> > git log. But if a maintainer for some reason decides to rebase and
> > reword the commit message for whatever reason, the # lines are gone.
>
> Thanks for bringing this up Dwaipayan!
>
> Yes, for example, if one included some code examples (e.g. `#define ...`)
> in the commit message, then the maintainer applied, and reworded the
> commit to add their own Signed-off-by:, then all the # lines are gone.
>
> > Peilin had a look at it and he was able to successfully reproduce this
> > fault.
> >
> > Now would it make sense if a warning for such lines starting with '#' in
> > the commit message are emitted by checkpatch itself? I have no idea
> > what other developers do, so I could be wrong at this point. But I would
> > like your opinion.
>
> I admit it is a beginner's mistake, but I myself learned it in a hard
> way (i.e. by having a patch mainline'd then seeing these # lines gone),
> so personally I hope this becomes a new feature of checkpatch.
>

I think this makes sense and checkpatch should warn about that;
probably the easy way to fix it is just to indent such lines by a few
spaces, e.g., four spaces.

Lukas

> Thank you,
> Peilin Ye
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
