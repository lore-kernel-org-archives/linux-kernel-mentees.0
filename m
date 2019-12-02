Return-Path: <SRS0=TUsn=ZY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04257C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 23:41:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9734206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 23:41:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="DlQBanX7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9734206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9586F20414;
	Mon,  2 Dec 2019 23:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IT+hSOfZ1blc; Mon,  2 Dec 2019 23:41:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B85B622053;
	Mon,  2 Dec 2019 23:41:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6204C1798;
	Mon,  2 Dec 2019 23:41:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5FA74C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 23:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4E4B187D05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 23:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bW4Mb9EM1UUu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 23:41:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BB95D87B5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 23:41:34 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id l22so667756pff.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Dec 2019 15:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Z3rcMZkJZGj62FT1K1YiTzywyH6333nfY23ubK0gAps=;
 b=DlQBanX7XJUT9sN8nElYX0zHDgV759OWftBOocBhB1kN7kPYUUl/oD2UVC8y2Dk0sz
 h9Hn455e9FjDObkfMID44wWUG7qhj6n70RPn2JgNrgS39TQ01A/IfJ6v36jTRdVwRFdq
 vWn/SzPcaUP88D0FOc9ujYpHcYcn1tXqrbIOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z3rcMZkJZGj62FT1K1YiTzywyH6333nfY23ubK0gAps=;
 b=ejCQSdzNiqgfLjsTG3H8c2Z9QJR1ulDeGgDP+rceArkW185z9dF7QAm7r1tVb0KKcr
 LJBJoUoSOhgQvAM8nTf5hw02Xwdxqitj2YPEH20E4HnKPxDQDo1nJeZUHEfzOugjXCDr
 JOyaCVc0g7Wc1vFSIWkXQWKei/CuuI+qi/Wld2ZAGjpQh/BOYblZDZmgk5pjz1euJ14l
 jtGaWa/Oyl/WRDoTUzuJSGhuQPtp4USuEshHfPcVO/LwVjQqALhbHtN5vuG5QvzoKml4
 8R/qebgMrkWjmPyunvuzWpdIef4djGORH8tmSJ1xvey+uKrcxAFQhhzCBimsJ/t3iXTN
 Zt+w==
X-Gm-Message-State: APjAAAXE05LO1U9iy5b8M/IRubFMKHOW3OF9AdFsHuJ9CQLid7R3qZRm
 epbc5hWxhiY2zU1Yy38zJLOSRq6Qg7o=
X-Google-Smtp-Source: APXvYqxez88BfsSLdu0FphGWimROK+AQJM1Q600m7NCFYfCJF83uF/DiHX9wb+ydfYGeHCbWMkiGHQ==
X-Received: by 2002:a17:902:54f:: with SMTP id
 73mr1882143plf.213.1575329673560; 
 Mon, 02 Dec 2019 15:34:33 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id f13sm617154pfa.57.2019.12.02.15.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 15:34:32 -0800 (PST)
Date: Mon, 2 Dec 2019 18:34:31 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20191202233431.GM17234@google.com>
References: <20191201183347.18122-1-frextrite@gmail.com>
 <20191202211915.GF17234@google.com>
 <20191202172639.1c9ad544@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202172639.1c9ad544@gandalf.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Paul Moore <paul@paul-moore.com>, paulmck@kernel.org,
 linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 rcu@vger.kernel.org, linux-audit@redhat.com,
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

On Mon, Dec 02, 2019 at 05:26:39PM -0500, Steven Rostedt wrote:
> On Mon, 2 Dec 2019 16:19:15 -0500
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> > Good idea to CC the following on RCU patches:
> > Paul McKenney
> > Steven Rostedt
> 
> I'm fine with this if it doesn't cause any rcu splats with sparse. Not
> sure if use cases of RCU requires RCU maintainers Cc'd. Although we can
> usually keep people from misusing it ;-)

Yes true :) Thanks for taking a look.

 - Joel

> 
> -- Steve
> 
> 
> > (Any others on the RCU maintainers list).
> > And, the list: rcu@vger.kernel.org
> > 
> > Could anyone Ack the patch? Looks safe and straight forward.
> > 
> > On Mon, Dec 02, 2019 at 12:03:48AM +0530, Amol Grover wrote:
> > > Add __rcu annotation to RCU-protected global pointer auditd_conn.
> > > 
> > > auditd_conn is an RCU-protected global pointer,i.e., accessed
> > > via RCU methods rcu_dereference() and rcu_assign_pointer(),
> > > hence it must be annotated with __rcu for sparse to report
> > > warnings/errors correctly.
> > > 
> > > Fix multiple instances of the sparse error:
> > > error: incompatible types in comparison expression
> > > (different address spaces)
> > > 
> > > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > ---
> > > v3:
> > > - update changelog to be more descriptive
> > > 
> > > v2:
> > > - fix erroneous RCU pointer initialization
> > >  
> > >  kernel/audit.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index da8dc0db5bd3..ff7cfc61f53d 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -102,12 +102,13 @@ struct audit_net {
> > >   * This struct is RCU protected; you must either hold the RCU lock for reading
> > >   * or the associated spinlock for writing.
> > >   */
> > > -static struct auditd_connection {
> > > +struct auditd_connection {
> > >  	struct pid *pid;
> > >  	u32 portid;
> > >  	struct net *net;
> > >  	struct rcu_head rcu;
> > > -} *auditd_conn = NULL;
> > > +};
> > > +static struct auditd_connection __rcu *auditd_conn;
> > >  static DEFINE_SPINLOCK(auditd_conn_lock);
> > >  
> > >  /* If audit_rate_limit is non-zero, limit the rate of sending audit records
> > > -- 
> > > 2.24.0
> > >   
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
