Return-Path: <SRS0=TUsn=ZY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4735DC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 23:32:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 151CE20684
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 23:32:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="AOzK5o8h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 151CE20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CEF398626D;
	Mon,  2 Dec 2019 23:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NA8AjGOgrsIp; Mon,  2 Dec 2019 23:32:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ABAE286228;
	Mon,  2 Dec 2019 23:32:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B958C1798;
	Mon,  2 Dec 2019 23:32:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D663C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 23:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 68D8D20034
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 23:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F9VHo-FFYSuv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 23:32:37 +0000 (UTC)
X-Greylist: delayed 00:07:55 by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 54FDB2002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 23:32:37 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id e28so1494088ljo.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Dec 2019 15:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AzQ+1A7+ETKD73tFjtgF7MkvN8fC39GSMBwN2Sm2LGs=;
 b=AOzK5o8hu+0IIvPKpWviWtgRkwf04TVyc5XvqhQbrMHvWzfWsQGqIE8DR+b6wesDP5
 TkI6FvODprL1Yl9ByZr37GnxnuEupSDssPFTacVSJ280XKDF8DR/S0qTm+aEBfcVeoQj
 urBvNDb/Iqyupc/P8NZdH2CM5I9OFH/H2JGHKi2DIZGh41vqA8Fl47rivdoldWZG+nSe
 rkYwSisb45DmbOhVfJem8UVM5/4A7Ypfgigo/dwhIjPbY64mEPmjQQXCdmiyAECBd2iu
 08cbvu+lzysPtRO1GyTRKQ8AJZK3m/xYzC/SHwNTI40VOagOpvTWqLSVyKaSiTOZMCFB
 LRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AzQ+1A7+ETKD73tFjtgF7MkvN8fC39GSMBwN2Sm2LGs=;
 b=W3Ap2R4fy+SWUWqbmqn5iRRHMHXwM0xlWW7bwobJ93X3Mtm07amwfGMtKmFHvV19aj
 7RzfGkSAV/ZxS2FPz0GHHZGbl12Rs8qTAVKznCVLny94Ni58AT6Gl1+ljW81Xp1lXwVo
 6ixZUDA+QdA/JAX/sZIB0vjKe+ajmLjHQe6VlwYhxI1pza7OQV3dF/S8U668mZ3IofGy
 HzvDhFWPPjufCxESWpBTUc33Sm76HgWFTwpo0n7n5DaGT3hPLzmJLP/C0sT1yW1t2R1N
 MmhOx29gl9deKIuqQL7fqeuHR4wMZwsImBS5RtFG7uwpnXe44c62ncgFC2ZgJMrmWnKj
 Di/g==
X-Gm-Message-State: APjAAAVv/bvOQirT4XYnjwNbd9cqJ3TcPJ8u9lkAritpr1WeVFwN3r7x
 t47cEr81Hc8YOOMSbRiSYm0RNpDG7xLDjmeGWI6u
X-Google-Smtp-Source: APXvYqykUQo2KP90VW0MNxkrGcDGJ4i6AJcEymHsB4IKVcZLiqRu7unrYT+Jeupmhlc8Z/8+gCMxFOuX8RJXtya79Bc=
X-Received: by 2002:a2e:970e:: with SMTP id r14mr712772lji.57.1575329080094;
 Mon, 02 Dec 2019 15:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20191201183347.18122-1-frextrite@gmail.com>
 <20191202211915.GF17234@google.com>
In-Reply-To: <20191202211915.GF17234@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 2 Dec 2019 18:24:29 -0500
Message-ID: <CAHC9VhTTS43aKQojtoBRRipP7TwhaVnK7DAqpFN0J0_FNLY+sw@mail.gmail.com>
To: Joel Fernandes <joel@joelfernandes.org>
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org,
 Eric Paris <eparis@redhat.com>, rcu@vger.kernel.org, linux-audit@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, rostedt@kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] kernel: audit.c: Add __rcu
	annotation to RCU pointer
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

On Mon, Dec 2, 2019 at 4:19 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> Good idea to CC the following on RCU patches:
> Paul McKenney
> Steven Rostedt
> (Any others on the RCU maintainers list).
> And, the list: rcu@vger.kernel.org
>
> Could anyone Ack the patch? Looks safe and straight forward.

FWIW, this looks reasonable to me, but I don't see this as a critical
fix that needs to go in during the merge window.  Unless I see any
objections, I'll plan on merging this into audit/next once the merge
window closes.

> On Mon, Dec 02, 2019 at 12:03:48AM +0530, Amol Grover wrote:
> > Add __rcu annotation to RCU-protected global pointer auditd_conn.
> >
> > auditd_conn is an RCU-protected global pointer,i.e., accessed
> > via RCU methods rcu_dereference() and rcu_assign_pointer(),
> > hence it must be annotated with __rcu for sparse to report
> > warnings/errors correctly.
> >
> > Fix multiple instances of the sparse error:
> > error: incompatible types in comparison expression
> > (different address spaces)
> >
> > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > ---
> > v3:
> > - update changelog to be more descriptive
> >
> > v2:
> > - fix erroneous RCU pointer initialization
> >
> >  kernel/audit.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index da8dc0db5bd3..ff7cfc61f53d 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -102,12 +102,13 @@ struct audit_net {
> >   * This struct is RCU protected; you must either hold the RCU lock for reading
> >   * or the associated spinlock for writing.
> >   */
> > -static struct auditd_connection {
> > +struct auditd_connection {
> >       struct pid *pid;
> >       u32 portid;
> >       struct net *net;
> >       struct rcu_head rcu;
> > -} *auditd_conn = NULL;
> > +};
> > +static struct auditd_connection __rcu *auditd_conn;
> >  static DEFINE_SPINLOCK(auditd_conn_lock);
> >
> >  /* If audit_rate_limit is non-zero, limit the rate of sending audit records
> > --
> > 2.24.0
> >



--
paul moore
www.paul-moore.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
