Return-Path: <SRS0=mlYZ=3Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31057C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 17:15:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8AD322527
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 17:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADlD8+7A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8AD322527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BCCE386397;
	Mon, 27 Jan 2020 17:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hkd4iQwfZh7z; Mon, 27 Jan 2020 17:15:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5340A81F48;
	Mon, 27 Jan 2020 17:15:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3ACCFC0175;
	Mon, 27 Jan 2020 17:15:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B763CC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 17:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AA91286397
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 17:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkOgL3rKAuvY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 17:15:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 411A981F48
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 17:15:03 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id 12so1963030pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 09:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pf0S3I7vm4DQQ+rPfSSMEtOHhIykr+8LjXy2v0z/gKo=;
 b=ADlD8+7AhV4HzY3kn3Ja8H1Ycseuc28mPYXZZ/eAyrR62S2ZsMjPrTBwJ+SSgxsiri
 efC5T5z3CfQONzDAsBLjN5sJEgqIRYExedglJcFORykliKnmEAqMBDFBPDFENgjgtums
 HOWaeM626innmksq7XKDCb+WCnXvY6NTUm7bBmdCx42Ie0QIrvueia5inIIGcnpz8uGC
 9qpepbRm32bWkk18JtnCnBBiecFn4dBG0JxAYQPleKK6IrQaQuvZvw1YK+oJEwjkSmty
 9FqQ6NHPzrJQm3ioPl//09wv612aAK5LCsIZOH3T8T2SamMky43OEMz7mcQa6Pu3XBZS
 vwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pf0S3I7vm4DQQ+rPfSSMEtOHhIykr+8LjXy2v0z/gKo=;
 b=qjPPy5ezjpHWfLOvuVx8ln9YPXJeP4mVJf/yJMYUvPlAhjbdJXM5QOx0rxIyhsqwHP
 Nv9LItXHAPScU8mD55qUjf+Hbbr5C0MNKSz7u0f64aBvgYSFFsnIlsFLxptO9HcrjCkT
 vMsFqNJz4kImx0MVB/nSFZRtrUPeCppLDj5YtgyeUSjAfAUJoyyWwi6zwxfuBIU7tnK3
 6CHot+z+va14JeS885hdK2EIruBQ95ITJJzuryUHVktgKen/X4k2O3vaScbDGa29onUr
 wKYStPB+gpUWQ2n7bsNAyhTje7dMsJ94SvrhcWI6kDFBSGj5+DSnXusIXseyAu9ihJ15
 HwdQ==
X-Gm-Message-State: APjAAAUNGuciK6Es+qn564Dj6PO08c8dYxKUI7xbWtvStdoTt65SFqrx
 u7787e+/fbzWmAm6mE5Bjg==
X-Google-Smtp-Source: APXvYqzom7c2cD2NnMvS2GD3/InzZy/uvSEfzngg4NO7xKuRkgQSq7Bn8jFMo9WlIKjnCpC22NXWnQ==
X-Received: by 2002:a17:902:ff11:: with SMTP id
 f17mr18053213plj.273.1580145302885; 
 Mon, 27 Jan 2020 09:15:02 -0800 (PST)
Received: from madhuparna-HP-Notebook
 ([2402:3a80:1ee2:faa0:c576:b7c8:dab8:85b])
 by smtp.gmail.com with ESMTPSA id k9sm16398869pjo.19.2020.01.27.09.14.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jan 2020 09:15:02 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Mon, 27 Jan 2020 22:44:53 +0530
To: Oleg Nesterov <oleg@redhat.com>
Message-ID: <20200127171453.GA4002@madhuparna-HP-Notebook>
References: <20200124045908.26389-1-madhuparnabhowmik10@gmail.com>
 <20200127092951.GA1116@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127092951.GA1116@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: juri.lelli@redhat.com, vincent.guittot@linaro.org, paulmck@kernel.org,
 peterz@infradead.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 madhuparnabhowmik10@gmail.com, mingo@redhat.com, ebiederm@xmission.com,
 joel@joelfernandes.org, christian.brauner@ubuntu.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] sched.h: Annotate sighand_struct
	with __rcu
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

On Mon, Jan 27, 2020 at 10:29:52AM +0100, Oleg Nesterov wrote:
> On 01/24, madhuparnabhowmik10@gmail.com wrote:
> >
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -918,7 +918,7 @@ struct task_struct {
> >  
> >  	/* Signal handlers: */
> >  	struct signal_struct		*signal;
> > -	struct sighand_struct		*sighand;
> > +	struct sighand_struct __rcu		*sighand;
> >  	sigset_t			blocked;
> >  	sigset_t			real_blocked;
> >  	/* Restored if set_restore_sigmask() was used: */
> > diff --git a/kernel/signal.c b/kernel/signal.c
> > index bcd46f547db3..9ad8dea93dbb 100644
> > --- a/kernel/signal.c
> > +++ b/kernel/signal.c
> > @@ -1383,7 +1383,7 @@ struct sighand_struct *__lock_task_sighand(struct task_struct *tsk,
> >  		 * must see ->sighand == NULL.
> >  		 */
> >  		spin_lock_irqsave(&sighand->siglock, *flags);
> > -		if (likely(sighand == tsk->sighand))
> > +		if (likely(sighand == rcu_access_pointer(tsk->sighand)))
> >  			break;
> >  		spin_unlock_irqrestore(&sighand->siglock, *flags);
> >  	}
> 
> ACK,
> 
> perhaps you can also cleanup copy_sighand(). rcu_assign_pointer() makes no
> sense, we should either move it down or simply use RCU_INIT_POINTER().
> 
Sure, I will do it and send a patch soon.

Thank you,
Madhuparna

> Oleg.
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
