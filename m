Return-Path: <SRS0=qk0A=57=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1F5C2BA19
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Apr 2020 16:07:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02D202166E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Apr 2020 16:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="iRUvs+9r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02D202166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E648F86450;
	Wed, 15 Apr 2020 16:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DxyvWb-iBh5O; Wed, 15 Apr 2020 16:07:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3A8E386229;
	Wed, 15 Apr 2020 16:07:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B8F0C1AE2;
	Wed, 15 Apr 2020 16:07:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA79CC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 16:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B450A2044C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 16:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6i0VoEJrfET
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 16:07:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 5006E2013C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 16:07:08 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id e5so5601107edq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0MLjDM9KsRvMVgG43FusnRuA/V1fF1PP6aJDpeifgKM=;
 b=iRUvs+9ratAYYazdxRWQjGbETjt7wPo7elXFoTo9rRkgbMtlx6glo20cP0xHh5oOQZ
 zeoBKppefNbtAwADYvNW3aaQHFPhaLgG/Xr22tvPeRHjK9+7Lyft492IH+Uz68AA0Gbf
 zqfhAgSiEtudIo8NwOetfiGetxDJK77hkLLlYH2OSU/8PD/p49nlLiWiLFLVB7Hh7AxM
 nfv4YUwHvsKfaT4aK+FtqtDlH/ue9Hr3nZo/z18/Q1Q9UCMNvr3lEpFhTUOD7YwXNffF
 6eeTGYZRTZHX/FIaDU7P8mPNGvESLOspPGAVRPqDizrEjlxZGcsWThQ+kr2XY6oaO4dm
 dHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0MLjDM9KsRvMVgG43FusnRuA/V1fF1PP6aJDpeifgKM=;
 b=WME4bK7hl77nEn+9iuhvff1zKqpkp1TfNe5Uzt0yA/bf+28o89+aYTqiiS9pdIXNb0
 fO8w3u3MjlH0ElnLXoiCiVZhJhAEp6ZrUkgvl5sjUYDrhy6jeAoQEx9XV3WeS9pBNEwl
 wADyTdu+16YDc+H7IiOdG8WyopFyJ3226sFWMyJheiGHZ6YEM+a8efeO9Tq6/UvWYmf2
 SQjdyQ7FqNLmBsKRRgieDDm3s7xmJh6AI2DtZZGUj1VkuMq0byZLBVluJ4G/MgpCbTvb
 qjVjmLZfufMzYPrhfy5lvsI+6qESou0+v/n3joN1eKLriMpITf7p+3zuOwSJuLELETgY
 MAwQ==
X-Gm-Message-State: AGi0PuZp27wQZn90xLPUMg2qC0Jk8/2oP2KrOze+8ykB4aUbVPee5XuJ
 VZWQdZ7VRLCZdLYcZfGOx6I0VeZTNlKjCvPwXkRO
X-Google-Smtp-Source: APiQypLP8COjvsdYHv4oXFXwMf6J6TP99ygaMw9PYLf1PRivCLwn52/dEdrcmQ4/gmtocLU0XDdyhTYcQV/snRujxWw=
X-Received: by 2002:a05:6402:1d1c:: with SMTP id
 dg28mr23779746edb.135.1586966826498; 
 Wed, 15 Apr 2020 09:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191128153203.GA23803@workstation-kernel-dev>
 <20191130020742.GF157739@google.com>
 <20200415153417.svpbimg66vbeuk7u@madcap2.tricolour.ca>
In-Reply-To: <20200415153417.svpbimg66vbeuk7u@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 15 Apr 2020 12:06:55 -0400
Message-ID: <CAHC9VhTdfkxdiEwCZu-JCQGxJ_DNr0b_Ukm40VEUxq=Lc-zx1g@mail.gmail.com>
To: Richard Guy Briggs <rgb@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-audit@redhat.com,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] kernel: audit.c: Add __rcu
	notation to RCU pointer
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

On Wed, Apr 15, 2020 at 11:34 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-11-29 21:07, Joel Fernandes wrote:
> > On Thu, Nov 28, 2019 at 09:02:03PM +0530, Amol Grover wrote:
> > > add __rcu notation to RCU protected global pointer auditd_conn
> >
> > Again, please use proper punctuation and captilization. This is unacceptable.
> > Please put more effort into changelog.
> >
> > Otherwise the patch diff itself looks good to me, with the above nit
> > corrected, you could add my tag to the next revision:
> >
> > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> >
> > thanks,
> >
> >  - Joel
> >
> > >
> > > Fixes multiple instances of sparse error:
> > > error: incompatible types in comparison expression
> > > (different address spaces)
>
> Amol or Joel: Is there a reproducer recipe for this?

The commit which was merged has a slightly better description which may help.

  commit cb5172d96d16df72db8b55146b0ec00bfd97f079
  Author: Amol Grover <frextrite@gmail.com>
  Date:   Mon Dec 2 00:03:48 2019 +0530

   audit: Add __rcu annotation to RCU pointer

   Add __rcu annotation to RCU-protected global pointer auditd_conn.

   auditd_conn is an RCU-protected global pointer,i.e., accessed
   via RCU methods rcu_dereference() and rcu_assign_pointer(),
   hence it must be annotated with __rcu for sparse to report
   warnings/errors correctly.

   Fix multiple instances of the sparse error:
   error: incompatible types in comparison expression
   (different address spaces)

   Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
   Signed-off-by: Amol Grover <frextrite@gmail.com>
   [PM: tweak subject line]
   Signed-off-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
