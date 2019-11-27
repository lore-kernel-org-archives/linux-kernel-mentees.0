Return-Path: <SRS0=A+ee=ZT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB56C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 15:32:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B1BB20674
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 15:32:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="pnkn80E8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B1BB20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 650098584F;
	Wed, 27 Nov 2019 15:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CiJuDO-GrEpD; Wed, 27 Nov 2019 15:31:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD0928559F;
	Wed, 27 Nov 2019 15:31:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C68BFC1DDA;
	Wed, 27 Nov 2019 15:31:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF146C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 15:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BE17920475
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 15:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UL5sMZNZ6oUm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 15:31:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by silver.osuosl.org (Postfix) with ESMTPS id CE3CE2000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 15:31:54 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z22so4889717qto.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 07:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m8XASQ33ScpPMW9Lk7i08lqftHVIhhUvhoQmKMQABbc=;
 b=pnkn80E8scR8OP9K1ql6Itvkl8+SnCbu+Dqzoa7buKcqDvIJ6fvN5RXHrEvAbbuP/B
 Z3xNb8VsfHx+ctarmuV2zL9XA52orUWS1O5afOFFBp+k6vFL5pVCuY2NFjUVhMtRjvIQ
 VdZUDb0gXj1V85KUfEtxHsPp/0+24jOlIUDfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m8XASQ33ScpPMW9Lk7i08lqftHVIhhUvhoQmKMQABbc=;
 b=HUcZFw5xOoa0on+NkPdW+gHvwsZ1NjR1O2P2k8eT7yhXN9x+bCYUx6gKEP5p7P+YJa
 mKgCuO7X437iBqY1FlWg8iak/4wuBFh0RayzFxTwR3Ailfp49fy48ukc5Fgwaq9/2uPO
 4WKGkcqTSIWpcsTQ4gvGSo1llLc5kT65PjtvSfSfCJAyfwc5+qEoYOAH/60jPtuMj2dG
 Vw0KlbxkIbIeex5V8VrqjLr5gVHCT0EU4PzOtxpM5sUvhE8ksVzgXvYnclaz3tui50zI
 j8F4VZ4ZUprrY5pssLdwYnUu31ZGt8guCCottDZ0XdxSkF0wdPKn4sUpGq+U2/seglII
 hijg==
X-Gm-Message-State: APjAAAVWD5ICxRyVMMB/FBSLU1MZbvoYwcbfeeKk1MK1iwszEibWlHz5
 O4VoJoXH9+aHD/ww3ME6ZfTHF8VV+ceAghGimi9yumuv
X-Google-Smtp-Source: APXvYqxmt7EJm6XHe3c8cZCXvjViANZ57FQDXdBpxpmjlh/GOMdASfyOe+aRvHafsySiNAzQc11Jy+o+X72q47vcr88=
X-Received: by 2002:ae9:c219:: with SMTP id j25mr4939170qkg.470.1574868368530; 
 Wed, 27 Nov 2019 07:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20191126172723.GA12759@workstation-kernel-dev>
 <20191127022925.GB157739@google.com>
 <20191127052827.GA9782@workstation-portable>
In-Reply-To: <20191127052827.GA9782@workstation-portable>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Wed, 27 Nov 2019 10:25:57 -0500
Message-ID: <CAEXW_YS=eDhmv+MaKLoRTCcPknscxqfHa2TyrjAEXpug1g67jw@mail.gmail.com>
To: Amol Grover <frextrite@gmail.com>
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

On Wed, Nov 27, 2019 at 12:29 AM Amol Grover <frextrite@gmail.com> wrote:
>
> On Tue, Nov 26, 2019 at 09:29:25PM -0500, Joel Fernandes wrote:
> > On Tue, Nov 26, 2019 at 10:57:23PM +0530, Amol Grover wrote:
> > > add __rcu notation to RCU protected global pointer auditd_conn
> > >
> > > Fixes multiple instances of sparse error:
> > > error: incompatible types in comparison expression
> > > (different address spaces)
> > >
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > ---
> > >  kernel/audit.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > index da8dc0db5bd3..30e7fc9b8da2 100644
> > > --- a/kernel/audit.c
> > > +++ b/kernel/audit.c
> > > @@ -102,12 +102,14 @@ struct audit_net {
> > >   * This struct is RCU protected; you must either hold the RCU lock for reading
> > >   * or the associated spinlock for writing.
> > >   */
> > > -static struct auditd_connection {
> > > +struct auditd_connection {
> > >     struct pid *pid;
> > >     u32 portid;
> > >     struct net *net;
> > >     struct rcu_head rcu;
> > > -} *auditd_conn = NULL;
> > > +};
> > > +static struct auditd_connection __rcu *auditd_conn;
> > > +RCU_INIT_POINTER(auditd_conn);
> >
> > Looks like this causes a build error. Always please build test your patches
> > in the very least. And I also did not understand how RCU_INIT_POINTER can
> > even be used outside of a function. In C, executable code cannot be outside
> > functions.
> >
> > Is doing the following not sufficient to fix the sparse issue?
> >
> > thanks,
> >
> >  - Joel
> >
> > ---8<-----------------------
> >
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 49b6049b26ac..c5d4b5a2dea1 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -108,8 +108,8 @@ struct auditd_connection {
> >       struct net *net;
> >       struct rcu_head rcu;
> >  };
> > -static struct auditd_connection __rcu *auditd_conn;
> > -RCU_INIT_POINTER(auditd_conn);
> > +static struct auditd_connection __rcu *auditd_conn = NULL;
>
> I ran a quick checkpatch and it gave me this error:
> ERROR: do not initialise statics to NULL
>
> So in order to fix it I decided to INIT the pointer (and failed)

Well, try to understand the checkpatch error then, and do the right thing :)

- Joel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
