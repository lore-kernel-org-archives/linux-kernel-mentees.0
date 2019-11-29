Return-Path: <SRS0=QJdD=ZV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75AAC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 Nov 2019 20:08:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A69DF215A5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 Nov 2019 20:08:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="x9QOTCRR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A69DF215A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 83ECA2043A;
	Fri, 29 Nov 2019 20:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1XUyXfNTLmv8; Fri, 29 Nov 2019 20:08:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A45E823335;
	Fri, 29 Nov 2019 20:08:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F4A6C1DD5;
	Fri, 29 Nov 2019 20:08:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5965AC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Nov 2019 20:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3B42E88341
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Nov 2019 20:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66xTMAkFr9b7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Nov 2019 20:08:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9024D8833E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Nov 2019 20:08:19 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id d199so10445403pfd.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Nov 2019 12:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DvDMSJKpd/DCMvLbsXJa6FXI7w1LfpYRNLVlppSW228=;
 b=x9QOTCRRFsFpPM5tf9H9+SF7dl2x8ogdtGQkav0LCZ0gi2gK0qMJT0rbIJFu4lIK1p
 Zh/Ii2/xMNQmi2umqA5Kk77RZbQusCI2BkSxYRl5qfLKJPqHjp9xk6Tn589u9KhvD8JU
 AZ7jnj87ZDoUyKZUyiAv4YABp/QEa0kvjrrP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DvDMSJKpd/DCMvLbsXJa6FXI7w1LfpYRNLVlppSW228=;
 b=g/JqFsdEvjq8IGb5uaF7wwI8epE6hB/UFQTBDGFTdDsy31/hyAdlLDzRNfwotTdg8+
 H66Fx1xnar46BsL5FOBtPPs/XF4n7FzMQDsfxczp51SocSVG0SCB73GIT5bizbnPX+Db
 hGwGCb+0keIvX351P0Xpe1QMRsQW3kHpmN2BpS3FuVy9qNAjIubVyTGpKB8cujFZxvRo
 EXmT+fV8EDrhHCE7rgHFSSBXDzzSNdOKM1o3SQX5aza76T6IN+3MficXOS3/2cet8YNA
 7Yvo0bOd+VIiGCTo5EiVUOVyFaqVGXAJMZc/Spt09xAPPTVBg9VRwWXgFLZLu8Nau3WX
 ipyQ==
X-Gm-Message-State: APjAAAVZrdcKD6VRqZbJLYCsqe4nphNWucrDNSF825BNk73+GUtSs9Hd
 B3HVb0wOyDmTwuYj7YLaJSJEsA==
X-Google-Smtp-Source: APXvYqyvHDa6weyYNMuYF7suMbcRmWdL7aPk8WE9JYrA5LAZ4jm/TAuWpWHyle/hpFduKHzrIZi9mA==
X-Received: by 2002:a63:d544:: with SMTP id v4mr18283741pgi.288.1575058098939; 
 Fri, 29 Nov 2019 12:08:18 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id y6sm23937455pfm.12.2019.11.29.12.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 12:08:18 -0800 (PST)
Date: Fri, 29 Nov 2019 15:08:17 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20191129200817.GB239292@google.com>
References: <20191126172723.GA12759@workstation-kernel-dev>
 <20191127022925.GB157739@google.com>
 <20191127052827.GA9782@workstation-portable>
 <CAEXW_YS=eDhmv+MaKLoRTCcPknscxqfHa2TyrjAEXpug1g67jw@mail.gmail.com>
 <20191128150949.GA30181@workstation-portable>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191128150949.GA30181@workstation-portable>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Paul Moore <paul@paul-moore.com>, LKML <linux-kernel@vger.kernel.org>,
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

On Thu, Nov 28, 2019 at 08:39:49PM +0530, Amol Grover wrote:
> On Wed, Nov 27, 2019 at 10:25:57AM -0500, Joel Fernandes wrote:
> > On Wed, Nov 27, 2019 at 12:29 AM Amol Grover <frextrite@gmail.com> wrote:
> > >
> > > On Tue, Nov 26, 2019 at 09:29:25PM -0500, Joel Fernandes wrote:
> > > > On Tue, Nov 26, 2019 at 10:57:23PM +0530, Amol Grover wrote:
> > > > > add __rcu notation to RCU protected global pointer auditd_conn
> > > > >
> > > > > Fixes multiple instances of sparse error:
> > > > > error: incompatible types in comparison expression
> > > > > (different address spaces)
> > > > >
> > > > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > > > ---
> > > > >  kernel/audit.c | 6 ++++--
> > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > > index da8dc0db5bd3..30e7fc9b8da2 100644
> > > > > --- a/kernel/audit.c
> > > > > +++ b/kernel/audit.c
> > > > > @@ -102,12 +102,14 @@ struct audit_net {
> > > > >   * This struct is RCU protected; you must either hold the RCU lock for reading
> > > > >   * or the associated spinlock for writing.
> > > > >   */
> > > > > -static struct auditd_connection {
> > > > > +struct auditd_connection {
> > > > >     struct pid *pid;
> > > > >     u32 portid;
> > > > >     struct net *net;
> > > > >     struct rcu_head rcu;
> > > > > -} *auditd_conn = NULL;
> > > > > +};
> > > > > +static struct auditd_connection __rcu *auditd_conn;
> > > > > +RCU_INIT_POINTER(auditd_conn);
> > > >
> > > > Looks like this causes a build error. Always please build test your patches
> > > > in the very least. And I also did not understand how RCU_INIT_POINTER can
> > > > even be used outside of a function. In C, executable code cannot be outside
> > > > functions.
> > > >
> > > > Is doing the following not sufficient to fix the sparse issue?
> > > >
> > > > thanks,
> > > >
> > > >  - Joel
> > > >
> > > > ---8<-----------------------
> > > >
> > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > index 49b6049b26ac..c5d4b5a2dea1 100644
> > > > --- a/kernel/audit.c
> > > > +++ b/kernel/audit.c
> > > > @@ -108,8 +108,8 @@ struct auditd_connection {
> > > >       struct net *net;
> > > >       struct rcu_head rcu;
> > > >  };
> > > > -static struct auditd_connection __rcu *auditd_conn;
> > > > -RCU_INIT_POINTER(auditd_conn);
> > > > +static struct auditd_connection __rcu *auditd_conn = NULL;
> > >
> > > I ran a quick checkpatch and it gave me this error:
> > > ERROR: do not initialise statics to NULL
> > >
> > > So in order to fix it I decided to INIT the pointer (and failed)
> > 
> > Well, try to understand the checkpatch error then, and do the right thing :)
> 
> I read-up a few articles about this. I think I've understood the problem. I'm
> sending in the ammended patch now. Sorry for this. Won't happen again.

Oh, no need apology. You are learning. But yeah always do a thorough job
before sending patches.

thanks,

 - Joel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
