Return-Path: <SRS0=gXAh=HV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D18C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Feb 2021 12:20:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C508264DE9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Feb 2021 12:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C508264DE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5DF5786287;
	Fri, 19 Feb 2021 12:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XQ9iPwsqdQTV; Fri, 19 Feb 2021 12:20:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9F35F85EB8;
	Fri, 19 Feb 2021 12:20:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85AABC000E;
	Fri, 19 Feb 2021 12:20:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09EDDC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 12:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F064160690
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 12:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Igkn50eD2lpb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 12:20:50 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 62D2E606BD; Fri, 19 Feb 2021 12:20:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AF4F606A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 12:20:49 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id d20so4336212ilo.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 04:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EEb1UJDvgCRWaCo3f0yPJzWzHS0WltOW5+cgoN1g8l0=;
 b=Rsn1RPwp1k60poOFHRWlw9M0/3JIL7NmKup0Ycj2Y4wQ5N9BYDy4RrtoLGbCOdKSBn
 ofgbLOTOCrbuFYub/HgUpaduHvVVUg05A6aUTdOwdwLtsi8qNOo5TGn6FhiYdAwutOgE
 CJF0ECtGRrWb7NyqjaOhFfmnFZJI4pbF/HiRbkrhrvnpXM3fbzP5bq+7KQ59NFZ2nGo/
 YbjgH2n8wIm1czRnP5vawyWPAyRRqgncy9Kf9ubY89bXf+3yGfRrDWt6Pozm6I2Kq7kA
 fawGTEk14rTx+74R1c2/1H1lftOFttqJeianooi/h2DhgOXnaNCD0kB9UC13kiWGECqy
 IoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EEb1UJDvgCRWaCo3f0yPJzWzHS0WltOW5+cgoN1g8l0=;
 b=toS422qvVRbHPE44xua7678yczgRSkL1aUX4o4N7zl65CHejy1qZcJXR+zFH80ip+0
 NTgHIy8NSmBsb8T8gHoJDgpsaDMH8v962Jtt7QoRLUozU4YPf5UJhfFoWcuT8dpFHS4Z
 5mdgov3yGLthduEnE9pAI6ptu/QntTP4QQXZx2/9J2xUk2tjoOXXJ+mA6oR3r4ibC/Uc
 E7ChilaCu62wgdWz1nW+pv3XMkEHiHmjqK6SBBASRDjOlt751GNTDXSvwoKzhdVd0XEu
 xSO1SSRyya/+mEI7QyOwTny4c1FABNFeE85lG68oRmnvJfLuL+lUErRol1qDaCQ8V0b2
 3JtA==
X-Gm-Message-State: AOAM532hApcFJoEKWjADcDz+3rJkG4+kRwmKzsgOa7nS5AqTJVhGMaDt
 gahGFJ2rYkcBlf7CXQxDDiN9+qMRSpq1c1Kr0+Q=
X-Google-Smtp-Source: ABdhPJw5G19nuIDpQC28jqcYTsaptWnbhNgKMn4wtxZ1408VLOIBY66rOT/CjgJZRXEIEMrWCtgMmmvtLxmRvIXQVNE=
X-Received: by 2002:a05:6e02:20ca:: with SMTP id
 10mr3793892ilq.14.1613737248080; 
 Fri, 19 Feb 2021 04:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20210219095835.9687-1-selvakumar16197@gmail.com>
 <20210219121219.GZ2087@kadam>
In-Reply-To: <20210219121219.GZ2087@kadam>
From: Selvakumar E <selvakumar16197@gmail.com>
Date: Fri, 19 Feb 2021 17:50:37 +0530
Message-ID: <CAD=cR89QCJ_6a20Pn9f2V6Zc5dTx86MbdwyrokjHbg70KmC1qw@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, oscar.carter@gmx.com, tvboxspy@gmail.com,
 linux-kernel@vger.kernel.org, forest@alittletooquiet.net,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] staging: vt6656: fixed a
	CamelCase coding style issue.
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

Hi Dan Carpenter

Thanks for the feedback, I'll work on the suggestion and come back with a fix.

Regards
Selvakumar Elangovan

On Fri, Feb 19, 2021 at 5:42 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> You're not asking the right questions.
>
> On Fri, Feb 19, 2021 at 03:28:35PM +0530, Selvakumar Elangovan wrote:
> > This patch renames CamelCase macros uVar and uModulo into u_var and
> > u_module in device.h
> >
>
> Is "u_var" a good name?  What does the "u_" even mean?
>
> > This issue was reported by checkpatch.pl
> >
> > Signed-off-by: Selvakumar Elangovan <selvakumar16197@gmail.com>
> > ---
> >  drivers/staging/vt6656/device.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/vt6656/device.h b/drivers/staging/vt6656/device.h
> > index 947530fefe94..6615d356f74a 100644
> > --- a/drivers/staging/vt6656/device.h
> > +++ b/drivers/staging/vt6656/device.h
> > @@ -385,11 +385,11 @@ struct vnt_private {
> >       struct ieee80211_low_level_stats low_stats;
> >  };
> >
> > -#define ADD_ONE_WITH_WRAP_AROUND(uVar, uModulo) {    \
> > -     if ((uVar) >= ((uModulo) - 1))                  \
> > -             (uVar) = 0;                             \
> > +#define ADD_ONE_WITH_WRAP_AROUND(u_var, u_modulo) {  \
> > +     if ((u_var) >= ((u_modulo) - 1))                        \
>
> The \ is not aligned any more.
>
> > +             (u_var) = 0;                            \
> >       else                                            \
> > -             (uVar)++;                               \
> > +             (u_var)++;                              \
> >  }
>
>
> This macro is rubbish.  How does the wrap around even make sense?
> I hope that if you review the code a bit I think you will find that the
> wrap around is impossible?  Just fix the two callers and delete this
> macro.
>
> regards,
> dan carpenter
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
