Return-Path: <SRS0=WLyE=FS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9882C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 06:17:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 070482067B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 06:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 070482067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 793A285E27;
	Mon, 14 Dec 2020 06:17:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8_RXsFgxZREH; Mon, 14 Dec 2020 06:17:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0CFE385CA3;
	Mon, 14 Dec 2020 06:17:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEE29C0893;
	Mon, 14 Dec 2020 06:17:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CCF6C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 06:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5A3C486C8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 06:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q03Wi0YIqmve
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 06:17:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6E04986CAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 06:17:16 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id w13so27245350lfd.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 22:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0BYxIOZNNVamRek4rdBeQ68NEt0ZMRYmRtQDfqpjcyI=;
 b=W8QoLGj6m7lr5DBwwgXJv/1MQAlCwRDD2SpPlirIXzjOFZXOwT4er9CQikPfaSrHPj
 vv2Cb68tgVQd9Ui5B3lmmI/AQ+H8tO8MlcU0lZ+NvdOelwIfZ519I6RUaHq6d1NB4ekA
 5maTW0ULNSp5GALmjvt8l5nHZsHXY4dj3xkEhZxhuBwhCBk0ocVaYy4Cm9bQ6/5Wc9FU
 hURk4MGWF3ITHfDplXN3QafGT9N+qbeoU5ru1zvSK7MutCi1aksXCaCj+gtZKeTvQ/yV
 mZ/8HKCdjI6vlMJuj77WKTaIHGabdsA2Jfdth1aWlRqfOdPjNTA9o2Vq0LfAJeryqNtQ
 nGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0BYxIOZNNVamRek4rdBeQ68NEt0ZMRYmRtQDfqpjcyI=;
 b=ktsysrjOr8KHM2fPF5AcMTlV2msPk5UY/qYPnKFCePHr6Wrz/pGRmPZ1zQveYGDcjm
 uv4e1tlEbeqrrwbumu6zs6bU1KQ9gL/W/a/DnMcMmb0eGd6voumGsaNXuHxqLUYvsq59
 uJ+qlvlhl02eYHLZ94stbSKnLpPYJ3ZCq2lK4CGtRfA1MMNI8QtkTX6a9f+UcVUyOzmW
 Jgd9U3mDTV2CY7TOnVlhIXPQlg6oeKUJgRwHPg/W14b58XPZGg71Ca9o1bL8COq7IvuJ
 3CV38sjHrKdcVWNt9kfx1RnWpfW2IEwY2trAVR89Gw6BGiqooARo/8RtZ2/lnTneDq/j
 2/pA==
X-Gm-Message-State: AOAM532RlU4a7K8FWCvFzoWCbVuTIPgNDLKUeK0LFgPPO7bF0XQpZYWv
 cZrOZy1taDMoqIaL0PfMyiJgUVhDPvzo6a8jL6M=
X-Google-Smtp-Source: ABdhPJxngOQSSoyoG9/zM4LhlR9ct4C3Bl3NAUugEqWgeNhJl7r7W4qp2tzjjd9SSbwpZcQOLsPb7OXLGtmNmu+FX1I=
X-Received: by 2002:a05:651c:1192:: with SMTP id
 w18mr9502960ljo.40.1607926634256; 
 Sun, 13 Dec 2020 22:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20201213085927.33281-1-dwaipayanray1@gmail.com>
 <CABJPP5DYuApo_vreOAq02ODxux-uU=W1X4VBqcZEVw+bj7Ao7w@mail.gmail.com>
 <CAKXUXMzEqpYFL4VSB0gRWGCOm2fqVngDS9A3Jv8OjPVPf5=KMg@mail.gmail.com>
In-Reply-To: <CAKXUXMzEqpYFL4VSB0gRWGCOm2fqVngDS9A3Jv8OjPVPf5=KMg@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 14 Dec 2020 11:46:51 +0530
Message-ID: <CABJPP5DWJk1HF458C3hFiATV7YmmxLWNaR42ZqDik_BJDCWu1Q@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: add more corrections to
	spelling.txt
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

On Mon, Dec 14, 2020 at 11:20 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Mon, Dec 14, 2020 at 6:44 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > On Sun, Dec 13, 2020 at 2:29 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > >
> > > Analyzing misspellings over the past 10k commit messages,
> > > a few more corrections are added to spelling.txt
> > >
> > > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > > ---
> > >  scripts/spelling.txt | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >
> > > diff --git a/scripts/spelling.txt b/scripts/spelling.txt
> > > index 953f4a2de1e5..cf2453ddb216 100644
> > > --- a/scripts/spelling.txt
> > > +++ b/scripts/spelling.txt
> > > @@ -315,6 +315,7 @@ commited||committed
> > >  commiting||committing
> > >  committ||commit
> > >  commoditiy||commodity
> > > +comon||common
> > >  comsume||consume
> >
> > Lukas, if you are okay with the additions, should I send it off to
> > Andrew Morton?
> > He seems to have had the most commits for that file according to get_maintainers
> >
>
> This probably should go to Joe and Andrew.
>
> Joe will ack it; Andrew will pick it.
>
> Be aware that the merge window is ongoing, so patch review might need
> more time and then Christmas is coming up. That is really the one time
> in the year, where kernel development visibly slows down (all other
> holiday seasons are spread).
>
> However, send it out, but keep track and maybe resend the patches that
> were not noticed in the beginning of January.
>

Okay sure, that seems reasonable.
I will be keeping a track of them for the time being.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
