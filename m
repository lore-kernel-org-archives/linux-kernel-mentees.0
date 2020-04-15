Return-Path: <SRS0=qk0A=57=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7AEC2BA19
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Apr 2020 19:27:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 429BF20784
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Apr 2020 19:27:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ob3oK4I5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 429BF20784
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F3F1F21FAC;
	Wed, 15 Apr 2020 19:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ldh0zB+xoG4b; Wed, 15 Apr 2020 19:27:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1685920463;
	Wed, 15 Apr 2020 19:27:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06514C089E;
	Wed, 15 Apr 2020 19:27:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4D4FC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 19:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9DDBD8620B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p+zx3GZSG5Zr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 19:27:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A3D1586CF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586978859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qJS2xD/VOhghsaFkFFvHEazrHBxU5zPlf7mCEhLQdiQ=;
 b=Ob3oK4I5jCWWLPCovk9dySMYhTXycs8mrDbMvXIOwEYvofnu9yW0sRaoNamMpyXf/As5no
 TofNM9QFdUEyKpRDfj/AhdB1uLbPKm8plvjngxkP9hG8BFjR+yUaq4p68MBY3LicLHxc71
 3MIJ4IYo222zlhZgSKWgPxjEqVinLqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-9B1YcOYqM9-ip6w5Y6j5iQ-1; Wed, 15 Apr 2020 15:27:37 -0400
X-MC-Unique: 9B1YcOYqM9-ip6w5Y6j5iQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D62E8017F3;
 Wed, 15 Apr 2020 19:27:36 +0000 (UTC)
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DA471001DC2;
 Wed, 15 Apr 2020 19:27:26 +0000 (UTC)
Date: Wed, 15 Apr 2020 15:27:23 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Ondrej Mosnacek <omosnace@redhat.com>
Message-ID: <20200415192723.rrdwtitiu3f2cd67@madcap2.tricolour.ca>
References: <20191128153203.GA23803@workstation-kernel-dev>
 <20191130020742.GF157739@google.com>
 <20200415153417.svpbimg66vbeuk7u@madcap2.tricolour.ca>
 <CAHC9VhTdfkxdiEwCZu-JCQGxJ_DNr0b_Ukm40VEUxq=Lc-zx1g@mail.gmail.com>
 <20200415161503.umujm6v4gadmf6qm@madcap2.tricolour.ca>
 <CAFqZXNuYnvru+pMhPwNTBn1+uB=MfYh1yWWBeAn+J-=LXrFgcg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFqZXNuYnvru+pMhPwNTBn1+uB=MfYh1yWWBeAn+J-=LXrFgcg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Paul Moore <paul@paul-moore.com>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] kernel: audit.c: Add __rcu
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

On 2020-04-15 18:53, Ondrej Mosnacek wrote:
> On Wed, Apr 15, 2020 at 6:15 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-04-15 12:06, Paul Moore wrote:
> > > On Wed, Apr 15, 2020 at 11:34 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > On 2019-11-29 21:07, Joel Fernandes wrote:
> > > > > On Thu, Nov 28, 2019 at 09:02:03PM +0530, Amol Grover wrote:
> > > > > > add __rcu notation to RCU protected global pointer auditd_conn
> > > > >
> > > > > Again, please use proper punctuation and captilization. This is unacceptable.
> > > > > Please put more effort into changelog.
> > > > >
> > > > > Otherwise the patch diff itself looks good to me, with the above nit
> > > > > corrected, you could add my tag to the next revision:
> > > > >
> > > > > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > >
> > > > > thanks,
> > > > >
> > > > >  - Joel
> > > > >
> > > > > >
> > > > > > Fixes multiple instances of sparse error:
> > > > > > error: incompatible types in comparison expression
> > > > > > (different address spaces)
> > > >
> > > > Amol or Joel: Is there a reproducer recipe for this?
> > >
> > > The commit which was merged has a slightly better description which may help.
> >
> > I've already seen this.  Perhaps I should have replied to this message
> > instead to make that evident.  What really needed was Amol's original
> > message sent to this list, but it was Joel who included this list in his
> > reply (all 3 versions).
> >
> > I'm looking for the specific setup and commands that produced this error.
> 
> You can run make with "C=1", which will run sparse on all files that
> are rebuilt during that make run. For example, if I fully build the
> kernel and then revert commit
> cb5172d96d16df72db8b55146b0ec00bfd97f079, I get:
> 
> $ make [...] C=1
> [...]
>   CHECK   [...]/kernel/audit.c
> [...]/kernel/audit.c:218:14: error: incompatible types in comparison
> expression (different address spaces):
> [...]/kernel/audit.c:218:14:    struct auditd_connection [noderef] <asn:4> *
> [...]/kernel/audit.c:218:14:    struct auditd_connection *
> (...and a lot more errors like this + 2 different warnings)
> 
> And when I un-revert it again, I get only the 2 warnings.

Perfect, thanks Ondrej.

> Ondrej Mosnacek <omosnace at redhat dot com>

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
