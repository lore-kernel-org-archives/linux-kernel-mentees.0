Return-Path: <SRS0=nXBU=32=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CF5C2D0B1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 11:01:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9654920659
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Feb 2020 11:01:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7G9Vc2A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9654920659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5CC9785EF2;
	Thu,  6 Feb 2020 11:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a2o5HvUZikM0; Thu,  6 Feb 2020 11:01:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CC8C18657C;
	Thu,  6 Feb 2020 11:01:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3275C0881;
	Thu,  6 Feb 2020 11:01:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9EAFC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 11:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C7A9884C99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 11:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rr8jpWGekMXL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 11:01:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 38E9984763
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Feb 2020 11:01:01 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id j7so2217833plt.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Feb 2020 03:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=B8bvNpykVDgQC9hk3603Rl2GIFzoG6wwUdwHDUabs1k=;
 b=O7G9Vc2AuE7mWt1YBeW9+Ncjcl07/rGGQN4eDuXaG/UUfLFuxP67P/JA+D+N76FpW3
 xmMRSR/LhBebqdf6QRe8A0SeF3nIYkxiQqEekdjDPArG7ziwyIeiA5IoibNZrhxP4U2l
 9lr/87MlY0pDwN7xQ9BYGahOhhJLdYRua93qFY8i1S8Ys1MIW5v6fIuw6fE01GtRztld
 XnSAQyEzMPlVl05jaW/a9RiELZgQw/N3jXa0G+JEIWQrXUvAT6ZdH7+5jmHPdYcaq/z8
 +LleDSauaxtYE9cmn0D7JE3m8fpEEzUCcNOrJ6fmhQCyF0NTUNPLP954mm8i7rRobQOZ
 kAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B8bvNpykVDgQC9hk3603Rl2GIFzoG6wwUdwHDUabs1k=;
 b=VD1Yyb2QzBh+W8vUWGvaH9c+NFWWN1S+q9xLTVYIVLmD2EnHfJvcBdKLVgNHameWoF
 Qj5KrZ8lS5UfNfIFOPqIwh5V5/WryTCh1KXydQKMzUW1nbKK6AiEdd8wfYcFoaptFXgh
 O0YdBFiBvevvWJW8RZRitAkUT+eqtkUoPC54fJYvtY+krDqTF+2YGei6illAAgEX7cI4
 PqAf+DfFr/YrzORMK4D4QhivqNWNdUH6S2GRK7hT5yu9xie7//3qk0p8JeroICSOMlny
 ZqwPzHFunGFhICut1cNyU6WBeSexnEe4RONPtnPfJAq3f73Qk/zVEFk8KflqBx2svpAE
 pD8g==
X-Gm-Message-State: APjAAAXhzQlhQ/fOP+ezWNf2/ArFELWZQIEloV6XDNIiIdn5AXRSwD5r
 cqEoM0Tc/GHhKugyvrGf4g==
X-Google-Smtp-Source: APXvYqz0wz9KCKiUmNhqSDan+ujm7+gwNzv7SyueZhaDtSnhgiRcO6R1GnrXKZ+e1JtT1HIrlYl7rQ==
X-Received: by 2002:a17:902:9b93:: with SMTP id
 y19mr3063945plp.89.1580986859115; 
 Thu, 06 Feb 2020 03:00:59 -0800 (PST)
Received: from madhuparna-HP-Notebook ([218.248.46.83])
 by smtp.gmail.com with ESMTPSA id y75sm3068441pfb.116.2020.02.06.03.00.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Feb 2020 03:00:58 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Thu, 6 Feb 2020 16:30:51 +0530
To: "Eric W. Biederman" <ebiederm@gmail.com>
Message-ID: <20200206110051.GA4531@madhuparna-HP-Notebook>
References: <20200205172437.10113-1-madhuparnabhowmik10@gmail.com>
 <87wo90myhj.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wo90myhj.fsf@x220.int.ebiederm.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: paulmck@kernel.org, oleg@redhat.com, joel@joelfernandes.org,
 linux-kernel@vger.kernel.org, madhuparnabhowmik10@gmail.com,
 ebiederm@xmission.com, tj@kernel.org, christian.brauner@ubuntu.com,
 linux-kernel-mentees@lists.linuxfoundation.org, guro@fb.com
Subject: Re: [Linux-kernel-mentees] [PATCH] signal.c: Fix sparse warnings
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

On Wed, Feb 05, 2020 at 04:59:52PM -0600, Eric W. Biederman wrote:
> madhuparnabhowmik10@gmail.com writes:
> 
> > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> >
> > This patch fixes the following two sparse warnings caused due to
> > accessing RCU protected pointer tsk->parent without rcu primitives.
> >
> > kernel/signal.c:1948:65: warning: incorrect type in argument 1 (different address spaces)
> > kernel/signal.c:1948:65:    expected struct task_struct *tsk
> > kernel/signal.c:1948:65:    got struct task_struct [noderef] <asn:4> *parent
> > kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
> > kernel/signal.c:1949:40:    expected void const volatile *p
> > kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
> > kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
> > kernel/signal.c:1949:40:    expected void const volatile *p
> > kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
> >
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > ---
> >  kernel/signal.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/signal.c b/kernel/signal.c
> > index 9ad8dea93dbb..8227058ea8c4 100644
> > --- a/kernel/signal.c
> > +++ b/kernel/signal.c
> > @@ -1945,8 +1945,8 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
> >  	 * correct to rely on this
> >  	 */
> >  	rcu_read_lock();
> > -	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(tsk->parent));
> > -	info.si_uid = from_kuid_munged(task_cred_xxx(tsk->parent, user_ns),
> > +	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(rcu_dereference(tsk->parent)));
> > +	info.si_uid = from_kuid_munged(task_cred_xxx(rcu_dereference(tsk->parent), user_ns),
> >  				       task_uid(tsk));
> >  	rcu_read_unlock();
> 
> 
> Still wrong because that access fundamentally depends upon the
> task_list_lock no the rcu_read_lock.  Things need to be consistent for
> longer than the rcu_read_lock is held.
>
Okay, then how about something like rcu_dereference_protected(tsk->parent, lockdep_is_held(&tasklist_lock))?
Let me know if this looks fine to you.

Thank you,
Madhuparna

> This patch makes sparse happy and confuses programmers who are trying to
> read the code.
> 
> 
> Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
