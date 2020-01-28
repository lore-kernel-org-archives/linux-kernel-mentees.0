Return-Path: <SRS0=C1jw=3R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43834C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 17:04:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08F6320663
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jan 2020 17:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqhrNAkJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08F6320663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EC18A87B48;
	Tue, 28 Jan 2020 17:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kxUXImWNTg3I; Tue, 28 Jan 2020 17:04:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 714F887ACB;
	Tue, 28 Jan 2020 17:04:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5432EC0178;
	Tue, 28 Jan 2020 17:04:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35DC1C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 17:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1EE3F834FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 17:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esXBP0WvD4tr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 17:04:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8AA5D834E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 17:04:33 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y8so5310566pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 09:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hrpqq0qmt055ivxYOcya64V22z0guJQnRikudWo5V1o=;
 b=iqhrNAkJpBFY77ZafhxIj7/QWP5/5H0XpYl+CIOJr/+f2wTff1CP8cck3B8bty4sn7
 sG+/tQWqexrTeQz7O4GW9hOAcXhKLvR1IHuiCOTlRV0DFn2VF6SHbaGjIV6utMs6iFuM
 oEr9RL7i8cidbU2te1StqRlY/EJOwtGpLvvueWiYpQCn2cA3L3nAx7S1t8HvxNsRWL/q
 bjX7ex8PEBlJg7GYQgzO+zbHQJXNeVWTuBEL/gNPpjIcEraxBumR+5wExUIYRdM2erw/
 TuKcE7LqDH8zojXUKiuM1YNcXOFxNE4oRaT+RQkxO3mCNirPJgELGXjfbb2ZWdgKy6Hi
 u3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hrpqq0qmt055ivxYOcya64V22z0guJQnRikudWo5V1o=;
 b=WGFHxC3rY4+Zd+KWLSzG9PzR+prFa+WgfX3uhcFwYVO/4AxJt9+iypdTOg2D/1+y2L
 jWay4k/p9oyKoM2tZ9KGTzMnP9iTjGenLyXlc4DsFtldp2uJgbLkNkgFsbGTTn7n42af
 DByw/w19OfM2HVB/3jhHHapl58io2NBbYNYcDFoi3bYHy0Vak94dWpb4itYUn+BbdQqd
 08dce0+QTmCUiZ5mtNycxNTvsgYOw/0wkMJ9YFMgExNjSJrgByq/KFy05kgBnqipZKi3
 3eK3RMHhMOzVFoKLTTVrS89lLtBNFjS1pexV8xTPctfeYB7wQrzIZzBULUiu5GNuy8Rn
 wdRQ==
X-Gm-Message-State: APjAAAXhlFCYlMxqyBwgB1IBAsJcSOUUdgsWFnRzb0fHHrYOVCCighSB
 9mgtPojS4n9N7jEKnCffos0=
X-Google-Smtp-Source: APXvYqwpWnWtmFhyZIcUf/4vhrtU1X6d2/NVeAtGcn6K7tfLSxaEpAwaH5kohS15m/ziPT5y5v6L6Q==
X-Received: by 2002:a17:902:e789:: with SMTP id
 cp9mr23713546plb.85.1580231073104; 
 Tue, 28 Jan 2020 09:04:33 -0800 (PST)
Received: from workstation-portable ([103.211.17.252])
 by smtp.gmail.com with ESMTPSA id a195sm20701932pfa.120.2020.01.28.09.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 09:04:32 -0800 (PST)
Date: Tue, 28 Jan 2020 22:34:26 +0530
From: Amol Grover <frextrite@gmail.com>
To: Jann Horn <jannh@google.com>
Message-ID: <20200128170426.GA10277@workstation-portable>
References: <20200128072740.21272-1-frextrite@gmail.com>
 <CAG48ez3ZcO+kVPJVG6XpCPyGUKF2o4UJ6AVdgZXGQ6XJJpcdmg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG48ez3ZcO+kVPJVG6XpCPyGUKF2o4UJ6AVdgZXGQ6XJJpcdmg@mail.gmail.com>
Cc: Kees Cook <keescook@chromium.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, James Morris <jamorris@linux.microsoft.com>,
 kernel list <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Shakeel Butt <shakeelb@google.com>,
 Joel Fernandes <joel@joelfernandes.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] cred: Use RCU primitives to
	access RCU pointers
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

On Tue, Jan 28, 2020 at 10:30:19AM +0100, Jann Horn wrote:
> On Tue, Jan 28, 2020 at 8:28 AM Amol Grover <frextrite@gmail.com> wrote:
> > task_struct.cred and task_struct.real_cred are annotated by __rcu,
> 
> task_struct.cred doesn't actually have RCU semantics though, see
> commit d7852fbd0f0423937fa287a598bfde188bb68c22. For task_struct.cred,
> it would probably be more correct to remove the __rcu annotation?
> 

Hi Jann,

I went through the commit you mentioned. If I understand it correctly,
->cred was not being accessed concurrently (via RCU), hence, a non_rcu
flag was introduced, which determined if the clean-up should wait for
RCU grace-periods or not. And since, the changes were 'thread local'
there was no need to wait for an entire RCU GP to elapse.

The commit too, as you said, mentions the removal of __rcu annotation.
However, simply removing the annotation won't work, as there are quite a
few instances where RCU primitives are used. Even get_current_cred()
uses RCU APIs to get a reference to ->cred. So, currently, maybe we
should continue to use RCU APIs and leave the __rcu annotation in?
(Until someone who takes it on himself to remove __rcu annotation and
fix all the instances). Does that sound good? Or do you want me to
remove __rcu annotation and get the process started?

Thanks
Amol

> > hence use rcu_access_pointer to access them.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
