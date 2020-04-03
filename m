Return-Path: <SRS0=cuc6=5T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D857C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Apr 2020 21:44:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BEE8206F6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Apr 2020 21:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="BqhEXmar"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BEE8206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2CE4126CA1;
	Fri,  3 Apr 2020 21:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id avH4v8wYjUgk; Fri,  3 Apr 2020 21:44:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7E1412050F;
	Fri,  3 Apr 2020 21:44:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63AACC1831;
	Fri,  3 Apr 2020 21:44:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCB0EC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Apr 2020 21:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AEC3726CA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Apr 2020 21:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTl11jE72+3L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Apr 2020 21:44:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 6C0A62050F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Apr 2020 21:44:09 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id i16so11010220edy.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 03 Apr 2020 14:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vrK7vwUeUnQBBKtc7jLVryrHjAhV8bpINdD94AtArAQ=;
 b=BqhEXmarpha79beDhAorB7lrnB2lI2KqeqEc9AalPy8EKuqfwoJUOFuhlDZM0NCIp7
 HYaQ3xyxEV40Uz96yFvPMayjvCC1LJJzKF6j2T8RKSsyGrWS1YzFBBmbQtz77rHlnCeh
 IctJOBWK1WJPBhECOIuCiEm7oE+XykwiB2gqVQcOaUUkfhBjgNwKahFWqyugap3x+UQq
 AZSMWWuYDVfRTjAAw9pn9KztugTIxD7EZ+GEijrCzzLS4EXkqSYDYbdDiwYmA+di2JSP
 F9ks/fvOHQDQdBpdEaSudpR/AdtMfrZ+Fi6ZxkFvnJhuncgORpMdFbSNnXAzXFvGFe66
 Wq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vrK7vwUeUnQBBKtc7jLVryrHjAhV8bpINdD94AtArAQ=;
 b=l41uplKWA6tfFc+GfNK/iiBM8Cw+RkE2p1xjTbhQJLJ7N3kDF/m2zaxltmW/eOPOZx
 8RvBFg3SItIbqulJ32KqTl141PimcZ7+Qkw9NFDPVCQI4zWc8FghBUMuVqSty5Vy6oHm
 CyxGdvyUrtN+5zAOSf99guR8bsKDRiUHiIchAXb1OoBuo59g2sFnCsQo7BgHFZhbo1wA
 yshZgvF6q+7B/K+phE0xjEjeglHSy7wGUlzXWbmwI9dj4IS61yvbByQ7PQMFv0qYUlk+
 Ffh85TSYHU0eMiWaXr+Fu/LjfXAaQeauN4zznAbKpwwEfTmcgGSLcB5fFcCaItn6rWSs
 lM3A==
X-Gm-Message-State: AGi0PuaBuJrlAXwrcwNrTBQVz69H2WpHm2iT2/kNoJLXUAIubib896G7
 UKm/yFJq/aHRp654C1rBu/z3NiFjmfKqdCgD+U5u
X-Google-Smtp-Source: APiQypL59OxS7QNGPWqemd6Y/5Vu/44PzNASHeGhEZ++QX22x2xMJLmmDasdvS6/rH/XJN9sN5fraRX5tZkWBVbXnpo=
X-Received: by 2002:a17:906:b2c7:: with SMTP id
 cf7mr10678793ejb.271.1585950247447; 
 Fri, 03 Apr 2020 14:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200402055640.6677-1-frextrite@gmail.com>
 <20200402055640.6677-3-frextrite@gmail.com>
 <CAHC9VhTUKepKiGZgAaWDADyTPnnM5unbM65T7jXZ3p8MFTNUuQ@mail.gmail.com>
 <20200403075613.GA2788@workstation-portable>
 <20200403212138.kr72jr57ppzsv6rm@madcap2.tricolour.ca>
In-Reply-To: <20200403212138.kr72jr57ppzsv6rm@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 3 Apr 2020 17:43:56 -0400
Message-ID: <CAHC9VhTKPvJCsqS9dNg_MSfR1xaHuxhVSJixNPLoAgdC+WqeeA@mail.gmail.com>
To: Richard Guy Briggs <rgb@redhat.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Ben Segall <bsegall@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 James Morris <jamorris@linux.microsoft.com>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Paul E . McKenney" <paulmck@kernel.org>, Jann Horn <jannh@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Shakeel Butt <shakeelb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org,
 linux-audit@redhat.com, "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 3/3 RESEND] auditsc: Do not use
 RCU primitive to read from cred pointer
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

On Fri, Apr 3, 2020 at 5:22 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-04-03 13:26, Amol Grover wrote:
> > On Thu, Apr 02, 2020 at 08:56:36AM -0400, Paul Moore wrote:
> > > On Thu, Apr 2, 2020 at 1:57 AM Amol Grover <frextrite@gmail.com> wrote:
> > > > task_struct::cred is only used task-synchronously and does
> > > > not require any RCU locks, hence, rcu_dereference_check is
> > > > not required to read from it.
> > > >
> > > > Suggested-by: Jann Horn <jannh@google.com>
> > > > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > > ---
> > > >  kernel/auditsc.c | 15 +++++----------
> > > >  1 file changed, 5 insertions(+), 10 deletions(-)
> > >
> > > This is the exact same patch I ACK'd back in February, yes?
> > >
> > > https://lore.kernel.org/linux-audit/CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com
> > >
> >
> > Hi Paul,
> >
> > That's correct. I've resend the series out of the fear that the first 2
> > patches might've gotten lost as it's been almost a month since I last
> > sent them. Could you please ack this again, and if you don't mind could
> > you please go through the other 2 patches and ack them aswell?
>
> Via who's tree are you expecting this will make it upstream?

When I asked a similar question back in February the response was
basically not the audit tree.

-- 
paul moore
www.paul-moore.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
