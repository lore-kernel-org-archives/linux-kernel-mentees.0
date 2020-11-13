Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A971DC4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 14:18:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27D9922240
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 14:18:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G95AmXin"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27D9922240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C449B878A5;
	Fri, 13 Nov 2020 14:18:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2uLc8mBojOYB; Fri, 13 Nov 2020 14:18:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E63C8727E;
	Fri, 13 Nov 2020 14:18:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C82DC0FAA;
	Fri, 13 Nov 2020 14:18:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3538C088E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9F885876C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9eBtBc9KOmRJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 14:18:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 74BD88727E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 14:18:08 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id v144so13960784lfa.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 06:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6tBAwBzS7iwqCUewGR0y+Gc4bMGvCRT0xXoTY4P2mKg=;
 b=G95AmXiniU6+6+gndCRtrbAiQmgHotx7w7EJwmMNy6RoSo4LDZuMSsMpg1v8ZCZ708
 ab0PqXEZcVJNselEJQCZtL6cTw7nqudpLwkYXkAbw3PV3dXRo48YYfaJt3e2P6oTb/IP
 nPNgnvxnh3JPSAUjxkFDIe671yg3DK9EqCZgH7fTDEnPJpl8lTLARcbSGYwOre4B/yaM
 efreXHIVhlyPsC4M2KEhfoQEXghewnen2Yce9av+KHKwnbvGbo2p7sIIzDMEu6eCL/43
 a3HHmww6E8kfO2ydfSxUd3vX7LXZNjI4cfxI00x4odai1FuOXqquR2FDaSNrg7/Aqd1U
 e4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6tBAwBzS7iwqCUewGR0y+Gc4bMGvCRT0xXoTY4P2mKg=;
 b=Ue1iaaE1XhB99Xef/dtZ40D9fzx+/80viqjOrPfyYEEzrMJIo4j8Bf4aVP7iLPV0Tp
 Ty1ljt57Q44ZmhSqG54WOuw0IBhu0edKp11jd0KBwLrl9QjXYDAO78eRAc3dpYPsfDyX
 zsEpA2u4yhsg6PzUZjv6JBV5OR2tXEohWizMfXFxrckFmwhi2rpTQ89ag41cWkr4hvq+
 5t+hNmBPPTMI7kPdZrnHMBBMiLTuOnROTTx5NI/uYlCOQv6y0JyT16t6vgXoqNKkB2ZF
 7sUvlDCEDT+ykBW2+lLVAKg0GSGOeBGaK/bFYvnJsNxdx+P7gpKWmawAZ9r6TDlvmqUk
 oUCg==
X-Gm-Message-State: AOAM530jz4GBTbwi0HDV5ORjvrM8w8Orm+LDYAx+H1lxkRFg/aoOZGz/
 RPI38QYN6uaGeZUbm2pTRsovYnr/dazRAwcDgFU=
X-Google-Smtp-Source: ABdhPJxkqnyjaPfiFauMuqRVvmoGQcpOfuPydcNvcl+fjGJuXb1+0M14H99LplxxvXpAHyDqpyilntUtCOuOdgO95RU=
X-Received: by 2002:a19:5c8:: with SMTP id 191mr1024039lff.111.1605277086543; 
 Fri, 13 Nov 2020 06:18:06 -0800 (PST)
MIME-Version: 1.0
References: <20201113123101.29057-1-dwaipayanray1@gmail.com>
 <CAKXUXMxS-hF=j8wbwzc4d3x_guaUPs+WH=pK_QAJPEHmxg=5vA@mail.gmail.com>
 <CAKXUXMzmFjZv231eBgeESosyUzahg9Uv9sUqxZ-68cGjCkwLnQ@mail.gmail.com>
In-Reply-To: <CAKXUXMzmFjZv231eBgeESosyUzahg9Uv9sUqxZ-68cGjCkwLnQ@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 13 Nov 2020 19:47:35 +0530
Message-ID: <CABJPP5B4EDKccFt=9x2QGV_8VCOmtu38xu=m2mZ17-KwiTBuXg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new cases to
	commit handling
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

On Fri, Nov 13, 2020 at 7:31 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Fri, Nov 13, 2020 at 2:37 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > On Fri, Nov 13, 2020 at 1:31 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > >
> > > Commit extraction in checkpatch fails in some cases.
> > > One of the most common false positives is a split line
> > > between "commit" and the git SHA of the commit.
> > >
> > > Improve commit handling to reduce false positives.
> > >
> > > Improvements:
> > > - handle split line between commit and git SHA of commit.
> > > - fix handling of split commit description.
> > >
> > > A quick evaluation of 50k commits from v5.4 showed that
> > > the GIT_COMMIT_ID errors dropped from 1032 to 897. Most
> > > of these were split lines between commit and its hash.
> > >
> >
> > Can you send me the file of the evaluation, e.g., all contexts (two
> > lines above and two lines below) around the warned line in the commits
> > where the GIT_COMMIT_ID dropped?
> >
> > Then, I can do a quick sanity check as well.
> >
>
> Thanks, Dwaipayan; I checked your file sent off-list and it looks good
> to not report on those cases.
>
> Maybe we can now check the remaining 900 cases once again; are they
> all true positives or is there still a big false positive class?
>
> Lukas

Hi,
I had roughly gone through the list and most of them are true positives.
But there are two particular cases which may be false:

1) References: tag. (I don't know if it is a proper convention).
There were about 50 of these:

References: 22b7a426bbe1 ("drm/i915/execlists: Preempt-to-busy")

But it is non uniform. Some commits use this tag to refer to links also.

2) Quotes inside commit title. (apart from the main enclosing quotes)
I think by design checkpatch doesn't handle this case.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
