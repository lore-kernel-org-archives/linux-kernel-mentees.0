Return-Path: <SRS0=cuc6=5T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA57C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Apr 2020 19:26:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD2920675
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Apr 2020 19:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="yIAUATGp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DD2920675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E408A88A76;
	Fri,  3 Apr 2020 19:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V7QkUDy7cYDQ; Fri,  3 Apr 2020 19:25:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9791088BFD;
	Fri,  3 Apr 2020 19:25:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79161C1831;
	Fri,  3 Apr 2020 19:25:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B103C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Apr 2020 19:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 19E3786302
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Apr 2020 19:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_4b78GNKCff
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Apr 2020 19:25:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 05A50858F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Apr 2020 19:25:54 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id de14so10640766edb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 03 Apr 2020 12:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=65rVr9Q9wr51d57tXR6aU7HcBrvBAcXIjk9gkyTDJto=;
 b=yIAUATGpTxycCd6OS4/9mbNgMIuLoAjFDHvlIkWj8Rpv7U2iT8eIT5UEq669+by3O6
 +2+9cS0/w5X+eP5/Q5HUbCaRkVlwKDEdIj1Vf0AjvJG5Ask5EmrfhNdxzn4zUyOHakUu
 i3qNWoKuZo4fTjdi09Wnjz9Tgz3tHK/PWPXXlHWl8LdbMLwO/gLxuNomGnjp4lAJ0yjT
 vpVVbxk1lGRrb+yIss3+VldnsIrapiNJQkCvCIlN6Mx1BX54F8XWFuN6Huh3hHskDkrm
 V7OIbPIA+McTO9XXT3A4jwi+48+SZtr6ZvTDu15U+ATosiHv0Qhn6ePOPdv2zsUQmGlb
 dvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=65rVr9Q9wr51d57tXR6aU7HcBrvBAcXIjk9gkyTDJto=;
 b=OSWQ2JeYtNeVBrhygFJZKHJLzIVqDiDAXT1bcollYWd2Ml2x/FVvIEMI+ASv86+6zL
 Uv4gVWuNxGVtE4vEGqBtMzbu0wBqo34KAQXX6gIUu9YDjc2ZAyGhhQVpPkK+/9TSQeCx
 OTBK88II2ysCHPKMW8F7TCEgdRiZtKiI1E3w2TtuT5yED3QDku5SlCSZA39VpxtjSnab
 S+ACuAR2zVWWW2IkP/b+EJLXg9Bxz/ilre+NOPcPhoPDahSCov21msDgn4DQoVCUA24X
 1BSYysnUmsmasQLWIKXGavPNWvFtn2OSj6zuQGdVaDiqCtPCJDNaAXNbytm4swS7aVCJ
 4uJQ==
X-Gm-Message-State: AGi0PubH+0raTHzVCGBwX27iVcCAP4/APHmFnThrMXb4TboAd0ydM4iB
 52Je4j/wbmYD9KI0RNHN6JSVA46CYc+IIR1jhflT
X-Google-Smtp-Source: APiQypIZXiwhRJiYQ//8F1YOVZN8BCmsRLIweQL3yqTmNbA6vuDSg3BLgdnvN3ElHRl4kaEFeY8Y9PTi9EbazfoxGjw=
X-Received: by 2002:a17:906:583:: with SMTP id 3mr9741790ejn.308.1585941953025; 
 Fri, 03 Apr 2020 12:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200402055640.6677-1-frextrite@gmail.com>
 <20200402055640.6677-3-frextrite@gmail.com>
 <CAHC9VhTUKepKiGZgAaWDADyTPnnM5unbM65T7jXZ3p8MFTNUuQ@mail.gmail.com>
 <20200403075613.GA2788@workstation-portable>
In-Reply-To: <20200403075613.GA2788@workstation-portable>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 3 Apr 2020 15:25:42 -0400
Message-ID: <CAHC9VhRFFoRQfOa=UkO2fNP-KNANrrKPnr0j+gNr7gtJp94W4A@mail.gmail.com>
To: Amol Grover <frextrite@gmail.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 David Howells <dhowells@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 James Morris <jamorris@linux.microsoft.com>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Paul E . McKenney" <paulmck@kernel.org>, Jann Horn <jannh@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Shakeel Butt <shakeelb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>,
 linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
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

On Fri, Apr 3, 2020 at 3:56 AM Amol Grover <frextrite@gmail.com> wrote:
> On Thu, Apr 02, 2020 at 08:56:36AM -0400, Paul Moore wrote:
> > On Thu, Apr 2, 2020 at 1:57 AM Amol Grover <frextrite@gmail.com> wrote:
> > > task_struct::cred is only used task-synchronously and does
> > > not require any RCU locks, hence, rcu_dereference_check is
> > > not required to read from it.
> > >
> > > Suggested-by: Jann Horn <jannh@google.com>
> > > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > > ---
> > >  kernel/auditsc.c | 15 +++++----------
> > >  1 file changed, 5 insertions(+), 10 deletions(-)
> >
> > This is the exact same patch I ACK'd back in February, yes?
> >
> > https://lore.kernel.org/linux-audit/CAHC9VhQCbg1V290bYEZM+izDPRpr=XYXakohnDaMphkBBFgUaA@mail.gmail.com
> >
>
> Hi Paul,
>
> That's correct. I've resend the series out of the fear that the first 2
> patches might've gotten lost as it's been almost a month since I last
> sent them. Could you please ack this again, and if you don't mind could
> you please go through the other 2 patches and ack them aswell?

If you hadn't changed the patch at all, and it doesn't look like you
did, you could have (and likely should have) just carried over my ACK.
Regardless, I'll re-ACK it now (below).  As far as the other two
patches are concerned, they look okay to me but I would defer my ACK
to maintainer of that code.

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
