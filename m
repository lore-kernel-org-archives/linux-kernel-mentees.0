Return-Path: <SRS0=Bb3l=7H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD22EC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 May 2020 18:04:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 507C6207D8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 May 2020 18:04:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQt1HWBC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 507C6207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0EAA986AAE;
	Mon, 25 May 2020 18:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11rQ7vCt1PAz; Mon, 25 May 2020 18:04:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 851E0868F5;
	Mon, 25 May 2020 18:04:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61B64C088D;
	Mon, 25 May 2020 18:04:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D85EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 18:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0DD30881D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 18:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-QRYrsETJaS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 18:04:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1C3F0881D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 18:04:39 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id v2so3994555pfv.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 May 2020 11:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PAB8InMNdHtw1sY8dxXS0+RSR7K8nRd/W2k8ffZ4Q3w=;
 b=dQt1HWBCWLmDUW4sY0Mjq7AsizTnXYbIqlA07X17hC7kRvqZXOW0r5uLSBi7HIboJy
 1oaEhozTeWEe0OMESdA0thK5z5GakMN70IXUvYQptEkgg6WxQ3OF/ZtuzZ5QLrDwvxE9
 Jzlu2CivysdX9LI7xIfqdUKF2roCZCnzYPwtnWUJyVt4ddzDV1MUwy5zxdOUrBnx9wDM
 PGCkHPAt5bZp95Z+al59oUl1263zfkAQWD7cCBlM2WAXvB8POff8EF+5wMtPIpGMdg7F
 coqtJIBArB+oepQtEqTJszeDkudWjkWEHw76Jkuqd+LljrBB0qFp3UQT/MlNKFd0/OGM
 HyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PAB8InMNdHtw1sY8dxXS0+RSR7K8nRd/W2k8ffZ4Q3w=;
 b=IJOONnTJRbX3IB3frtxerLJkDihrmyZHWN/koFF1M6oN3mX01lTnU85uIH23Fx/kSj
 MuWbupewa04zb78O/iE/9uXex4dBxGvq843SDXUQNLNNuerIZHewKYYDS5NVjGAybth7
 d7fwgtsYkR5d51amADbIh4C7kdfbs+prw3rFJbDry+nUhPPILELNiFI3zAVD7etctK/d
 d9Q//pCVTkswko3J/4/FxvhrYCy/42+6N94PIUvMOQwXZdZywi+QjgFeTJqJFgham1p5
 CLXwaJ7CrOIey6RN3uqC0z6IShBFDOf36aRKAbAqS/XdLBKaK9hOs3aJ2e10I0Gw5H67
 oMJw==
X-Gm-Message-State: AOAM533A7IDV3CBkEhi/CgoiOGDDGD/hHhe1fdIzlZEV4a+B9xANk/Bv
 fNxJ8IXLmnt18pvFNjWSaDI=
X-Google-Smtp-Source: ABdhPJyezKLdoitt2fakdRXnl6cL2BqFHQ3TU7kenobJ/b2iPakDh/rya/euYiDtrb6NEdZdJ/Onzg==
X-Received: by 2002:a63:4cc:: with SMTP id 195mr27470706pge.294.1590429878562; 
 Mon, 25 May 2020 11:04:38 -0700 (PDT)
Received: from workstation-LAP.localdomain ([103.87.56.138])
 by smtp.gmail.com with ESMTPSA id k2sm13946901pfd.108.2020.05.25.11.04.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 May 2020 11:04:37 -0700 (PDT)
Date: Mon, 25 May 2020 23:34:21 +0530
From: Amol Grover <frextrite@gmail.com>
To: Richard Guy Briggs <rgb@redhat.com>
Message-ID: <20200525180421.GA19@workstation-LAP.localdomain>
References: <20200402055640.6677-1-frextrite@gmail.com>
 <20200524081117.GA29@workstation-LAP.localdomain>
 <20200525131741.s6lgb263fpo5uszk@madcap2.tricolour.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200525131741.s6lgb263fpo5uszk@madcap2.tricolour.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 David Howells <dhowells@redhat.com>, Joel Fernandes <joel@joelfernandes.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, Paul Moore <paul@paul-moore.com>,
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

On Mon, May 25, 2020 at 09:17:41AM -0400, Richard Guy Briggs wrote:
> On 2020-05-24 13:41, Amol Grover wrote:
> > On Thu, Apr 02, 2020 at 11:26:38AM +0530, Amol Grover wrote:
> > > task_struct::cred (subjective credentials) is *always* used
> > > task-synchronously, hence, does not require RCU semantics.
> > > 
> > > task_struct::real_cred (objective credentials) can be used in
> > > RCU context and its __rcu annotation is retained.
> > > 
> > > However, task_struct::cred and task_struct::real_cred *may*
> > > point to the same object, hence, the object pointed to by
> > > task_struct::cred *may* have RCU delayed freeing.
> > > 
> > > Suggested-by: Jann Horn <jannh@google.com>
> > > Co-developed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > Signed-off-by: Amol Grover <frextrite@gmail.com>
> > 
> > Hello everyone,
> > 
> > Could you please go through patches 1/3 and 2/3 and if deemed OK, give
> > your acks. I sent the original patch in beginning of February (~4 months
> > back) and resent the patches again in beginning of April due to lack of
> > traffic. Paul Moore was kind enough to ack twice - the 3/3 and its
> > resend patch. However these 2 patches still remain. I'd really
> > appreciate if someone reviewed them.
> 
> I asked on April 3 which upstream tree you expect this patchset to go
> through and I did not see a reply.  Do you have a specific target or is
> the large addressee list assuming someone else is taking this set?  All
> we have seen is that it is not intended to go through the audit tree.
> 

Apologies for it. As Paul Moore replied, initially I assumed this
patchset to not go through the audit tree as the audit specific changes
were secondary to the main change (though certainly I did not think
which upstream tree the patchset would go through). But now I am okay
with the patchset making it to upstream via audit tree if it is fine by
the maintainers.

Thanks
Amol

> > Thanks
> > Amol
> 
> - RGB
> 
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
