Return-Path: <SRS0=qk0A=57=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AFDC2BA19
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Apr 2020 16:53:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33BC8208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Apr 2020 16:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fP0HSpR4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33BC8208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E84E1204FC;
	Wed, 15 Apr 2020 16:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oq9qNRRDUeDp; Wed, 15 Apr 2020 16:53:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0820A2010E;
	Wed, 15 Apr 2020 16:53:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4E50C1AE2;
	Wed, 15 Apr 2020 16:53:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E145C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 16:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 37D4C86187
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 16:53:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNArYcT3OVwJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 16:53:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C03B285754
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586969626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3em5+hnHLkvNRuTqcYfplgX0m0Gs4o4IJazfnt21sak=;
 b=fP0HSpR4btG8DNsiw2Kq+nwJd4pPvgzug5xVG/qLeDZfuH2gE025i1IyfYMCnVM9lgIayJ
 oSTcUhc/2GcZogxZvndr8tR5EccAASEQWvTuwV8yhOFM5yQ1jOnyZr7hKlWTuLEfnbwL4x
 teRtnp4c5WkQT41td7L4nIToWKDdXqo=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-Slmtxct3O1CNXWmS_1VMlA-1; Wed, 15 Apr 2020 12:53:44 -0400
X-MC-Unique: Slmtxct3O1CNXWmS_1VMlA-1
Received: by mail-oi1-f200.google.com with SMTP id l2so8456336oih.19
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Apr 2020 09:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5OcF7TWn34i9EQblMYEKpClfav9C/6cS7BZfVRtY1ig=;
 b=CekOEjqq/kpVZrnfb0LNNEwfsGz+t1ujMmltlndmjKWV+XuW28rd2GylJcjZOLNd/p
 EY3NgWOyJdMgRDRe9gLVHwiaP8CJnhLMfiRakVrQGr53bA5qR/zddl7spxV9yfjrAeMW
 l3+uKtTLSxejiCHOe9jdLRsO1DekdCeSnGPPbA+JttvHbADerKsyJ03HoHikxEkklNky
 JugzlNCbHTTBQcSw1TdqlxWf9TWsr8g9P+wynLoElyQJdQ3MilHzGePUgIy6GzT4EKRr
 Dq9lLkyiy+nYdhMQa2u0ISTSaxMzfdeCPtBC+To0FO07hcARqc31YlJATLRviLjWYCaZ
 2piA==
X-Gm-Message-State: AGi0PuYhq+CnO14FDd1FYTvxiOuI/td8cALLOYU4Nj9j+w7yQ8BOKV2V
 IUrfszgWGfkfNIpJpYaxrhvJXqCZjELNJp9h0WQuAzQQmHuv0d3Zvx0c4Ny0SWi2yx6uPyG5SQl
 yLhkI+1XdXKcx2kGXQyjCcXQLaLEgkp7NeM/7IrfPvk9dndAgeSTq27IGA6xC+8L5
X-Received: by 2002:aca:b104:: with SMTP id a4mr98034oif.103.1586969623609;
 Wed, 15 Apr 2020 09:53:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypLkvY6tKCCKHK+4XBaEZP1jLaOUmd+3Gz8TobGRm5I4yu2oGVOna4Zb5zyid5UxSIVu1Z9+oaZs2SxeDRP40G8=
X-Received: by 2002:aca:b104:: with SMTP id a4mr98019oif.103.1586969623350;
 Wed, 15 Apr 2020 09:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191128153203.GA23803@workstation-kernel-dev>
 <20191130020742.GF157739@google.com>
 <20200415153417.svpbimg66vbeuk7u@madcap2.tricolour.ca>
 <CAHC9VhTdfkxdiEwCZu-JCQGxJ_DNr0b_Ukm40VEUxq=Lc-zx1g@mail.gmail.com>
 <20200415161503.umujm6v4gadmf6qm@madcap2.tricolour.ca>
In-Reply-To: <20200415161503.umujm6v4gadmf6qm@madcap2.tricolour.ca>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Wed, 15 Apr 2020 18:53:32 +0200
Message-ID: <CAFqZXNuYnvru+pMhPwNTBn1+uB=MfYh1yWWBeAn+J-=LXrFgcg@mail.gmail.com>
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Wed, Apr 15, 2020 at 6:15 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-04-15 12:06, Paul Moore wrote:
> > On Wed, Apr 15, 2020 at 11:34 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2019-11-29 21:07, Joel Fernandes wrote:
> > > > On Thu, Nov 28, 2019 at 09:02:03PM +0530, Amol Grover wrote:
> > > > > add __rcu notation to RCU protected global pointer auditd_conn
> > > >
> > > > Again, please use proper punctuation and captilization. This is unacceptable.
> > > > Please put more effort into changelog.
> > > >
> > > > Otherwise the patch diff itself looks good to me, with the above nit
> > > > corrected, you could add my tag to the next revision:
> > > >
> > > > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > >
> > > > thanks,
> > > >
> > > >  - Joel
> > > >
> > > > >
> > > > > Fixes multiple instances of sparse error:
> > > > > error: incompatible types in comparison expression
> > > > > (different address spaces)
> > >
> > > Amol or Joel: Is there a reproducer recipe for this?
> >
> > The commit which was merged has a slightly better description which may help.
>
> I've already seen this.  Perhaps I should have replied to this message
> instead to make that evident.  What really needed was Amol's original
> message sent to this list, but it was Joel who included this list in his
> reply (all 3 versions).
>
> I'm looking for the specific setup and commands that produced this error.

You can run make with "C=1", which will run sparse on all files that
are rebuilt during that make run. For example, if I fully build the
kernel and then revert commit
cb5172d96d16df72db8b55146b0ec00bfd97f079, I get:

$ make [...] C=1
[...]
  CHECK   [...]/kernel/audit.c
[...]/kernel/audit.c:218:14: error: incompatible types in comparison
expression (different address spaces):
[...]/kernel/audit.c:218:14:    struct auditd_connection [noderef] <asn:4> *
[...]/kernel/audit.c:218:14:    struct auditd_connection *
(...and a lot more errors like this + 2 different warnings)

And when I un-revert it again, I get only the 2 warnings.

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
