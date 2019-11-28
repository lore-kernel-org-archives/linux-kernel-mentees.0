Return-Path: <SRS0=YOSY=ZU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2731C432C3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Nov 2019 15:10:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F4CC21775
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Nov 2019 15:10:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5OxcfVn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F4CC21775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 64011869D9;
	Thu, 28 Nov 2019 15:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3SpvO0cDn18; Thu, 28 Nov 2019 15:10:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E66BE85249;
	Thu, 28 Nov 2019 15:10:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DABB2C1DD5;
	Thu, 28 Nov 2019 15:10:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69F3CC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Nov 2019 15:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4F362883FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Nov 2019 15:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tSypMIHB4YHg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Nov 2019 15:10:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1744A883F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Nov 2019 15:10:29 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id w8so11999355pjh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Nov 2019 07:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Z2wU0E4d5s4/xK+13SW3DrjkiCtDxj7UMABJh83nudE=;
 b=c5OxcfVnBC5jamcSyxumsTvrFr88egXS4P+lN9zZWdpMu20m2zTLB7/E7qq0dW0BCd
 ScKf5xCamGQcz1nrfUmvavZYIKleOViPPnPD7AC+IvW5Uvw9nXn+8gpUb86p5QPrnpMR
 ixtnjJa9JEMmfJqXb9zrboDnEKM89dQncRUXaPP1mSqOuXtjP5mGOJIy/Kg/UsTEHHWk
 iegOzPLNe8CBS0Jb2x5yM5wQ/KEMz2j7zgdAf01PhNM63MW2M6vPVDEG/oibIorRUsX2
 ek+QpNVbMhMA8UMotnlY8cEhHxGFJTR4IxYTQXw5oSIoYdpX7kc0JZxuspkGjfq2XVx5
 kXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z2wU0E4d5s4/xK+13SW3DrjkiCtDxj7UMABJh83nudE=;
 b=ROQnwRDARfZlSR5WfHt52ZCJuxnbcA/Doj6jqhIIcS8k2YwHc1iX4RjQ6ytw01RHHi
 oYn1bGxKZHcpCbkn46kJgXVbcIYwYUQGSZJ+hZWzxW9uBS98i9pmst98i8KcGEp3sxlN
 UPWQOciNc/lM1QuvavW3tSTSy5UYHp80ZaALZjeZ8RIhPlJp2nsz4U0mfvcupfEQVUyp
 XpgXKyULsuVVa0qN31V63bDAmcdMGpnao7V3eR8y+JF6psI/nt8iqNuexwxqLi4NX4vG
 20IENUMGuVxd8HYSbfVMYkMbA5glEZYLwH++fMMzAnL5I1v2MrzZRmzo30Xh+4N6ASTT
 +QYw==
X-Gm-Message-State: APjAAAWRpXUPX4GStRtCbm8XWr7YITBCEzxeO9X76Qf42PF1B2UTMTI1
 MAX5G4CREwynNRbzKBlWdZ4=
X-Google-Smtp-Source: APXvYqyt+El6kPSt8sRjEBFZGlMkpGpdZo0+rg0M5e9jkdIU+Clr5DkO7mBNGSWNbn3kjaK8qooU+g==
X-Received: by 2002:a17:902:142:: with SMTP id
 60mr10314206plb.38.1574953828543; 
 Thu, 28 Nov 2019 07:10:28 -0800 (PST)
Received: from workstation-portable ([139.5.253.4])
 by smtp.gmail.com with ESMTPSA id h9sm8756948pfo.139.2019.11.28.07.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 07:10:27 -0800 (PST)
Date: Thu, 28 Nov 2019 20:39:49 +0530
From: Amol Grover <frextrite@gmail.com>
To: Joel Fernandes <joel@joelfernandes.org>
Message-ID: <20191128150949.GA30181@workstation-portable>
References: <20191126172723.GA12759@workstation-kernel-dev>
 <20191127022925.GB157739@google.com>
 <20191127052827.GA9782@workstation-portable>
 <CAEXW_YS=eDhmv+MaKLoRTCcPknscxqfHa2TyrjAEXpug1g67jw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEXW_YS=eDhmv+MaKLoRTCcPknscxqfHa2TyrjAEXpug1g67jw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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

On Wed, Nov 27, 2019 at 10:25:57AM -0500, Joel Fernandes wrote:
> On Wed, Nov 27, 2019 at 12:29 AM Amol Grover <frextrite@gmail.com> wrote:
> >
> > On Tue, Nov 26, 2019 at 09:29:25PM -0500, Joel Fernandes wrote:
> > > On Tue, Nov 26, 2019 at 10:57:23PM +0530, Amol Grover wrote:
> > > > add __rcu notation to RCU protected global pointer auditd_conn
> > > >
> > > > Fixes multiple instances of sparse error:
> > > > error: incompatible types in comparison expression
> > > > (different address spaces)
> > > >
> > > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > > ---
> > > >  kernel/audit.c | 6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > index da8dc0db5bd3..30e7fc9b8da2 100644
> > > > --- a/kernel/audit.c
> > > > +++ b/kernel/audit.c
> > > > @@ -102,12 +102,14 @@ struct audit_net {
> > > >   * This struct is RCU protected; you must either hold the RCU lock for reading
> > > >   * or the associated spinlock for writing.
> > > >   */
> > > > -static struct auditd_connection {
> > > > +struct auditd_connection {
> > > >     struct pid *pid;
> > > >     u32 portid;
> > > >     struct net *net;
> > > >     struct rcu_head rcu;
> > > > -} *auditd_conn = NULL;
> > > > +};
> > > > +static struct auditd_connection __rcu *auditd_conn;
> > > > +RCU_INIT_POINTER(auditd_conn);
> > >
> > > Looks like this causes a build error. Always please build test your patches
> > > in the very least. And I also did not understand how RCU_INIT_POINTER can
> > > even be used outside of a function. In C, executable code cannot be outside
> > > functions.
> > >
> > > Is doing the following not sufficient to fix the sparse issue?
> > >
> > > thanks,
> > >
> > >  - Joel
> > >
> > > ---8<-----------------------
> > >
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index 49b6049b26ac..c5d4b5a2dea1 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -108,8 +108,8 @@ struct auditd_connection {
> > >       struct net *net;
> > >       struct rcu_head rcu;
> > >  };
> > > -static struct auditd_connection __rcu *auditd_conn;
> > > -RCU_INIT_POINTER(auditd_conn);
> > > +static struct auditd_connection __rcu *auditd_conn = NULL;
> >
> > I ran a quick checkpatch and it gave me this error:
> > ERROR: do not initialise statics to NULL
> >
> > So in order to fix it I decided to INIT the pointer (and failed)
> 
> Well, try to understand the checkpatch error then, and do the right thing :)

I read-up a few articles about this. I think I've understood the problem. I'm
sending in the ammended patch now. Sorry for this. Won't happen again.

Thanks
Amol

> 
> - Joel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
