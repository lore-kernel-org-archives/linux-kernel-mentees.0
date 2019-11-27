Return-Path: <SRS0=A+ee=ZT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BE8C43215
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 05:29:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 379982073F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 05:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIViTYeh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 379982073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E4E98868AD;
	Wed, 27 Nov 2019 05:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CUO0-POrN31D; Wed, 27 Nov 2019 05:29:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5DCCA867F0;
	Wed, 27 Nov 2019 05:29:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51E33C1DDA;
	Wed, 27 Nov 2019 05:29:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FF2FC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 05:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 75779204B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 05:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zb+mmBudLdhn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 05:29:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id B4C4F20475
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 05:29:03 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l26so59434pgb.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 21:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hGK+ULtfQAwtVprH1HVEYd0b3Bl+iwzMbxZKRpXwyhA=;
 b=VIViTYeh7HxV+i9Gir8odWMfV02isZz3zK3o0eY3y1n+WyM4ki8jABXSBq7KmtssLG
 y8c1Mh18pvZL3nOWiYIqxtKB6yoErwjuxT6yjMLok690nnZivrm8AxV40bZ3N2OT1JVe
 1F0XIi+yXdfiRcMKnQ0W6D5a05Dxa0lHj1AQxmPk9QwmM0cBVwfvlZZ5GUKsN8GBLoLl
 oOU6kcYsx3LJF+Ahy+8BOXjYhCXLz6LyMgtpzCefYEu/239pheqI9zEkxIsK4IT4eYXu
 LE9lgMHATwpOu0RA7V6xtTT2/mUIf9+knrSDxaUiXYV5oD7YF2ZHbGrHzeJDLDyLfT9d
 ZSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hGK+ULtfQAwtVprH1HVEYd0b3Bl+iwzMbxZKRpXwyhA=;
 b=f6x7vq3tFd9qHzTQAXcK/QSJX1bia6iq+efYJMjuaBLDoXHXyk0ceppxOcIWzvJj55
 BN5Wr8sMHAQGdoDAG0MDbEPh4bgkG6cNGdQckUh+bIv4KVRsdMFH9D4tsKGFXgFbH2Wh
 xafAskQ0DnCnvUjBKvLaG5IQE4/C8VhwzTbblHs6y8Kbim42V6ppue3RYxQglv78qqdK
 Va+gkPmX2seicmWnRIYaakxi9Yos9B0+SfvPvQU5J6YZnpmL/79QD6qJKbSISIrSOd71
 WY2n3sSSp+7NSIjJQHhkSkJ/q2WzQm82YB7MfagIMYc4kKcn3Y6B+24e8lpkVa2Te3u/
 Kf3w==
X-Gm-Message-State: APjAAAX+3/HCWlI2bF6eXDdq+TCQ6XmbNi8R4RlNokboPIxihgNCoQUu
 puodsi+h0irGokKCr5w/X+Y=
X-Google-Smtp-Source: APXvYqzxw222HkDIvEgoVoeHtvUCNMvqOSbBGEu3aSnUiacJfErpDJTINHnrg4lFk5kWawSMOii5PA==
X-Received: by 2002:a63:204e:: with SMTP id r14mr2830105pgm.101.1574832543122; 
 Tue, 26 Nov 2019 21:29:03 -0800 (PST)
Received: from workstation-portable ([139.5.253.146])
 by smtp.gmail.com with ESMTPSA id m5sm4801910pjl.30.2019.11.26.21.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 21:29:02 -0800 (PST)
Date: Wed, 27 Nov 2019 10:58:27 +0530
From: Amol Grover <frextrite@gmail.com>
To: Joel Fernandes <joel@joelfernandes.org>
Message-ID: <20191127052827.GA9782@workstation-portable>
References: <20191126172723.GA12759@workstation-kernel-dev>
 <20191127022925.GB157739@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191127022925.GB157739@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Paul Moore <paul@paul-moore.com>, linux-kernel@vger.kernel.org,
 Eric Paris <eparis@redhat.com>, linux-audit@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] kernel: audit.c: Add __rcu
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

On Tue, Nov 26, 2019 at 09:29:25PM -0500, Joel Fernandes wrote:
> On Tue, Nov 26, 2019 at 10:57:23PM +0530, Amol Grover wrote:
> > add __rcu notation to RCU protected global pointer auditd_conn
> > 
> > Fixes multiple instances of sparse error:
> > error: incompatible types in comparison expression
> > (different address spaces)
> > 
> > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > ---
> >  kernel/audit.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index da8dc0db5bd3..30e7fc9b8da2 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -102,12 +102,14 @@ struct audit_net {
> >   * This struct is RCU protected; you must either hold the RCU lock for reading
> >   * or the associated spinlock for writing.
> >   */
> > -static struct auditd_connection {
> > +struct auditd_connection {
> >  	struct pid *pid;
> >  	u32 portid;
> >  	struct net *net;
> >  	struct rcu_head rcu;
> > -} *auditd_conn = NULL;
> > +};
> > +static struct auditd_connection __rcu *auditd_conn;
> > +RCU_INIT_POINTER(auditd_conn);
> 
> Looks like this causes a build error. Always please build test your patches
> in the very least. And I also did not understand how RCU_INIT_POINTER can
> even be used outside of a function. In C, executable code cannot be outside
> functions.
> 
> Is doing the following not sufficient to fix the sparse issue?
> 
> thanks,
> 
>  - Joel
> 
> ---8<-----------------------
> 
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 49b6049b26ac..c5d4b5a2dea1 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -108,8 +108,8 @@ struct auditd_connection {
>  	struct net *net;
>  	struct rcu_head rcu;
>  };
> -static struct auditd_connection __rcu *auditd_conn;
> -RCU_INIT_POINTER(auditd_conn);
> +static struct auditd_connection __rcu *auditd_conn = NULL;

I ran a quick checkpatch and it gave me this error:
ERROR: do not initialise statics to NULL

So in order to fix it I decided to INIT the pointer (and failed)

Should I consider this as a false positive?

Thanks
Amol

> +
>  static DEFINE_SPINLOCK(auditd_conn_lock);
>  
>  /* If audit_rate_limit is non-zero, limit the rate of sending audit records
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
