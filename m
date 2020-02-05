Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7CFC352A2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 17:09:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E0421927
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 17:09:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3pW73dH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42E0421927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EC4FE86C7A;
	Wed,  5 Feb 2020 17:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybsD4tOSewY2; Wed,  5 Feb 2020 17:09:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 714A38174C;
	Wed,  5 Feb 2020 17:09:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5EB96C0175;
	Wed,  5 Feb 2020 17:09:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0AA62C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 17:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0712483F2A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 17:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71iPTd_pQWEJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 17:09:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 962FF83F1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 17:09:39 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id l3so1259531pgi.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Feb 2020 09:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pbXnDbHJtM+LDjIhpTVDNZGKnCDN+h/h3x64indO5es=;
 b=X3pW73dHatde6yRFIcSKUyx2bYQUA/wYR8V8AcOrSXqzGFyRRf0SLwQyBj0qJKox/0
 PqkjC/C44V6X9MGwgfAgl1u8yPr91HOfNlqzBFe3rH1goNjrBbXoc1KsLry4rSDYpDZh
 FkMvYGav+CR1Q6L0UmCe1zd3utyDn0bYqlgIQ4E+NqaFgb8w8CKusDhB7tDSvgYoBvTD
 3Z/o3V0KG29fxcVID6cN4FgYtXa8FaKZ5XmQO3sPSJwTb0Zt3QqNqW4/ql6VXJbyPyCY
 2NNuhrAGWz9tXxxEKxiMvqKmNVY6z8Puqu94nWOC7MLvVUaWNOIDlOFcxL3+PLi/Y0z3
 4WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pbXnDbHJtM+LDjIhpTVDNZGKnCDN+h/h3x64indO5es=;
 b=dM0NoHbA9lr5MuUBhqEHLtN8NyflZVHK8C+EaoxtizjKBOnUmXNqf5LkYG+Tr6KR+1
 yz4gmqUahJ74zFH9l0KNi6HXph3emY/zlhQhKrOmjVKK1BV9RKeWg3nSKWqQt4FRUct7
 lvGUgVzzFWJFp5q9ggzZcI5JqPnrFLle5AlMBUHT3qvQcZ71spedMV8EMZZAr4UoCEC2
 pujtLkF670Zf0zAeup0bl3roSFUbUQLcjHuDFI9bjZHjdlRym1wqX7eUmv0JEcpQAVtR
 FoIkqsRlsfYpRQHtnU/RsKfTpq4zmG9DviTSdLu5uNU9IJSMa7cQWf1xzmlTQeb7YulP
 Togw==
X-Gm-Message-State: APjAAAXq9vZph5ZNHhcSN+wOVMvH/PCtsfBhA+f6PvB/G2uIsQndCKrN
 JbCc11HAz32PHKU9NVX8SA==
X-Google-Smtp-Source: APXvYqxOqV6N2/grbqu/ZXbSC4tCY5XK5SSj2ztilWg/Fm1cjkDSevEXQM12uQOXu/yVeT9paZ3sNg==
X-Received: by 2002:a63:de54:: with SMTP id y20mr36176194pgi.79.1580922579252; 
 Wed, 05 Feb 2020 09:09:39 -0800 (PST)
Received: from madhuparna-HP-Notebook
 ([2402:3a80:542:9945:9d58:40ca:c55a:7c02])
 by smtp.gmail.com with ESMTPSA id fh24sm335673pjb.24.2020.02.05.09.09.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Feb 2020 09:09:38 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Wed, 5 Feb 2020 22:39:21 +0530
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200205170921.GA2755@madhuparna-HP-Notebook>
References: <20200205162319.28263-1-madhuparnabhowmik10@gmail.com>
 <20200205165138.GB22537@workstation-portable>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205165138.GB22537@workstation-portable>
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

On Wed, Feb 05, 2020 at 10:21:38PM +0530, Amol Grover wrote:
> On Wed, Feb 05, 2020 at 09:53:19PM +0530, madhuparnabhowmik10@gmail.com wrote:
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
> > index 9ad8dea93dbb..3d59e5652d94 100644
> > --- a/kernel/signal.c
> > +++ b/kernel/signal.c
> > @@ -1945,8 +1945,8 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
> >  	 * correct to rely on this
> >  	 */
> >  	rcu_read_lock();
> > -	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(tsk->parent));
> > -	info.si_uid = from_kuid_munged(task_cred_xxx(tsk->parent, user_ns),
> > +	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(rcu_access_pointer(tsk->parent)));
> > +	info.si_uid = from_kuid_munged(task_cred_xxx(rcu_access_pointer(tsk->parent), user_ns),
> 
> Shouldn't rcu_dereference() OR rcu_dereference_check() be better suited
> here? Since, rcu_access_pointer() omits all lockdep checks.
>
I used rcu_access_pointer() because I thought the pointer is not
dereferenced. But it is dereferenced in task_pid() and task_cred_xxx().

Thank you for pointing out, I will send the updated patch.

Thanks,
Madhuparna

> Thanks
> Amol
> 
> >  				       task_uid(tsk));
> >  	rcu_read_unlock();
> >  
> > -- 
> > 2.17.1
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
