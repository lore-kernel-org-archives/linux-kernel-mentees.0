Return-Path: <SRS0=o3A5=ZZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BACAC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 00:03:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CBE42068E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 00:03:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="hRuf95R5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CBE42068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1EDB484F27;
	Tue,  3 Dec 2019 00:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPMboVZ7uEyt; Tue,  3 Dec 2019 00:03:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7425986E1A;
	Tue,  3 Dec 2019 00:03:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70DF7C1798;
	Tue,  3 Dec 2019 00:03:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD452C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 00:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B3A1188393
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 00:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xs21lSoMjeSy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 00:03:35 +0000 (UTC)
X-Greylist: delayed 00:22:44 by SQLgrey-1.7.6
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DB22287EAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 00:03:34 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id p21so1152186vsq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Dec 2019 16:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NqtaB9MKOQhSliHwumWMYNqfR+eF1LGGZAxjF3ljDPg=;
 b=hRuf95R5Q6W5esJSAoe7/lzgpx0Qx+VAvNE1tzQ0cBJ4fEhgxAIRCF1FrGjy7QIa39
 BqZ7RMIsqyVEki1+/pZIUo3SXoEWrgnGK4poCpb1GtfT1a1AtuQWRBwlBemwyCB3eS9x
 6A46kaANsw1PWgvxCCt3gUZeNPfJkb0t7JDrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NqtaB9MKOQhSliHwumWMYNqfR+eF1LGGZAxjF3ljDPg=;
 b=Tr9rBSzK/L7QYx8SDLu9sWZKU/4Mw+H0v0cn9PGUUKGFMKZNHBwoi1O7i2yj5UidMl
 T9jJGZsU4DsTzJLkmZRPaHCKxrtfg2xadV6rHqoWRWxuiy78x4i3rF6lLZWcvsYRkTDz
 +U5u7p9gOFuORWvB2E0eXjtTW61+uRpScj4IWvJjsvFbr02rHdFwlIrxkPMs20+0ZY5x
 /7qrvzoc3Qdk9V/IRP2d7kIlLC4DSUdBjgYUsyKijBvSirRUR4/CePJQQaQ0SyPizDes
 re11igG3Yii+xIa0a8xqpmvEH3ozeHKsBXLynMnshLzSi5x6LJqA3+V9pv5iID7SKNRd
 G2qg==
X-Gm-Message-State: APjAAAUAGP+R3D9vNahXRSCTNLN1AWE1v2C4clGeGyRyeRakwPKL2ef0
 L1+FIPH1yPCJN4OyfG6RVVJFLUR7EQM=
X-Google-Smtp-Source: APXvYqwi12259yJbqYXkvJ9Obbu0PA3rzoi2KUWw1tLwRCP44TS0LXGWkJD+SD/WZ0yQglnk8HAcNA==
X-Received: by 2002:a17:902:b20c:: with SMTP id
 t12mr1790521plr.191.1575329700251; 
 Mon, 02 Dec 2019 15:35:00 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id h9sm596572pfo.139.2019.12.02.15.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 15:34:59 -0800 (PST)
Date: Mon, 2 Dec 2019 18:34:58 -0500
From: Joel Fernandes <joel@joelfernandes.org>
To: Paul Moore <paul@paul-moore.com>
Message-ID: <20191202233458.GN17234@google.com>
References: <20191201183347.18122-1-frextrite@gmail.com>
 <20191202211915.GF17234@google.com>
 <CAHC9VhTTS43aKQojtoBRRipP7TwhaVnK7DAqpFN0J0_FNLY+sw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhTTS43aKQojtoBRRipP7TwhaVnK7DAqpFN0J0_FNLY+sw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Dec 02, 2019 at 06:24:29PM -0500, Paul Moore wrote:
> On Mon, Dec 2, 2019 at 4:19 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> > Good idea to CC the following on RCU patches:
> > Paul McKenney
> > Steven Rostedt
> > (Any others on the RCU maintainers list).
> > And, the list: rcu@vger.kernel.org
> >
> > Could anyone Ack the patch? Looks safe and straight forward.
> 
> FWIW, this looks reasonable to me, but I don't see this as a critical
> fix that needs to go in during the merge window.  Unless I see any
> objections, I'll plan on merging this into audit/next once the merge
> window closes.

Sounds good, thanks!

 - Joel


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
> > >       struct pid *pid;
> > >       u32 portid;
> > >       struct net *net;
> > >       struct rcu_head rcu;
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
> 
> 
> --
> paul moore
> www.paul-moore.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
