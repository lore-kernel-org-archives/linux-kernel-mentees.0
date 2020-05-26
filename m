Return-Path: <SRS0=2zBv=7I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C431C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 12:34:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31B942088E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 12:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="Q1G6ImSR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31B942088E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D6F2022CCE;
	Tue, 26 May 2020 12:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVyg-mJfNJUu; Tue, 26 May 2020 12:34:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5C5982049D;
	Tue, 26 May 2020 12:34:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41086C0888;
	Tue, 26 May 2020 12:34:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A580C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 12:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 19BBE85FB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 12:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6ekXlgVWmIw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 12:34:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DE4FD85F91
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 12:34:45 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id b91so17522471edf.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 05:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JUFqBLf1RiIPnvjRp2NeVt7jf0hFenXjeR9kjT+Rdf0=;
 b=Q1G6ImSRc/01YqdhB6mWCmEe/l4IF827QZZCdkXZi5fpxWvRPUQLlrm6r3Aqsf+Q5p
 i7C9AzPEpnqFga5IAaazmqb0xjO2eq24t34iW7ZdFGDkmS8zo8ojsurxUDg1u2enqyFv
 8Bm/L705TWD6kTYco6/L6nYO7BudiVhZjXMJD7N3P/Cn9wV2pdYXLlrkSPuW/MAWxutu
 Ve1d5ejarNGPbce+dqUHzszZqDGXomMcuIlE4U2wrY11wMy0dF62LuvytGOQmzjqnKvP
 gWn3PVFimungMQz+ZhioqxaziPvDG/GW1qNjStXmyLSCKPkIJChDzfLQyE+4joc9Cpsw
 jX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JUFqBLf1RiIPnvjRp2NeVt7jf0hFenXjeR9kjT+Rdf0=;
 b=NvFYla5YP+NcayVI+vzTdf0j/W4bSKO3+Hma4IZLALKiAsQRB57eU605Lqn6FM84R8
 LdBDUUbZqkJI4Mi5i/BelLDEjJW3dJX5jJHAXb7LH0GswKpNJDJvfjmuhuv4YCYRZuCq
 ouPg8wIriYxD2obpLgbE9Z9W3av7vUG9CVCVH4AU+MImaO4gAo7eP9qezJjecnHs6Z+i
 YhlsnWCF80VqmTbmovs1zQ3EAODZsAaqYn5gC9MtVQOelhDBUhmR0VEocb2uKYryCdJP
 sQZ16KgGvZHgOFTVcO3/mwGRjJDNcShBHgptQTfIU1sSSy+AGrEE3GUoOmm1q3+uHpxK
 6LNQ==
X-Gm-Message-State: AOAM5307XNS50DrDDuwxsF52UsPzXXHzmqjHK9AbQzSzKG/nw/Q0ecas
 OgCzAvRxtk07zGJ0SlcI7b4xfg87LmgP8nJ56Ivg
X-Google-Smtp-Source: ABdhPJwVhTK/f1+ttt/wIH/DF4otAgZkYmCBshCaTHZu+pV434ay6yyTjaqEoYxYdPBJpQQXAqjcQZ1DMw1Wtx1TaHg=
X-Received: by 2002:aa7:cf17:: with SMTP id a23mr16099251edy.128.1590496483906; 
 Tue, 26 May 2020 05:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200402055640.6677-1-frextrite@gmail.com>
 <20200524081117.GA29@workstation-LAP.localdomain>
 <20200525131741.s6lgb263fpo5uszk@madcap2.tricolour.ca>
 <20200525180421.GA19@workstation-LAP.localdomain>
In-Reply-To: <20200525180421.GA19@workstation-LAP.localdomain>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 26 May 2020 08:34:33 -0400
Message-ID: <CAHC9VhQ_jNbNFChy3i6AfmOkEQtER_pxrd5uCJwpfNeedyUM4Q@mail.gmail.com>
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
 Richard Guy Briggs <rgb@redhat.com>, linux-kernel@vger.kernel.org,
 Eric Paris <eparis@redhat.com>, linux-audit@redhat.com,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 1/3 RESEND] sched: Remove __rcu
	annotation from cred pointer
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

On Mon, May 25, 2020 at 2:04 PM Amol Grover <frextrite@gmail.com> wrote:
> On Mon, May 25, 2020 at 09:17:41AM -0400, Richard Guy Briggs wrote:
> > On 2020-05-24 13:41, Amol Grover wrote:
> > > On Thu, Apr 02, 2020 at 11:26:38AM +0530, Amol Grover wrote:
> > > > task_struct::cred (subjective credentials) is *always* used
> > > > task-synchronously, hence, does not require RCU semantics.
> > > >
> > > > task_struct::real_cred (objective credentials) can be used in
> > > > RCU context and its __rcu annotation is retained.
> > > >
> > > > However, task_struct::cred and task_struct::real_cred *may*
> > > > point to the same object, hence, the object pointed to by
> > > > task_struct::cred *may* have RCU delayed freeing.
> > > >
> > > > Suggested-by: Jann Horn <jannh@google.com>
> > > > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > >
> > > Hello everyone,
> > >
> > > Could you please go through patches 1/3 and 2/3 and if deemed OK, give
> > > your acks. I sent the original patch in beginning of February (~4 months
> > > back) and resent the patches again in beginning of April due to lack of
> > > traffic. Paul Moore was kind enough to ack twice - the 3/3 and its
> > > resend patch. However these 2 patches still remain. I'd really
> > > appreciate if someone reviewed them.
> >
> > I asked on April 3 which upstream tree you expect this patchset to go
> > through and I did not see a reply.  Do you have a specific target or is
> > the large addressee list assuming someone else is taking this set?  All
> > we have seen is that it is not intended to go through the audit tree.
> >
>
> Apologies for it. As Paul Moore replied, initially I assumed this
> patchset to not go through the audit tree as the audit specific changes
> were secondary to the main change (though certainly I did not think
> which upstream tree the patchset would go through). But now I am okay
> with the patchset making it to upstream via audit tree if it is fine by
> the maintainers.

This patchset is not appropriate for the audit tree as the most
significant changes are not audit related.

My ACK on patch 3/3 was, and is, conditional on the previous patches
being acceptable to the greater kernel community; this is the main
reason why I didn't ACK patch 1/3 or 2/3.

-- 
paul moore
www.paul-moore.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
