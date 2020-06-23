Return-Path: <SRS0=UFn2=AE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5444BC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Jun 2020 17:49:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DBC220781
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Jun 2020 17:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lt4FeIyK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DBC220781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0F51289690;
	Tue, 23 Jun 2020 17:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJQJ7NlJOSCP; Tue, 23 Jun 2020 17:49:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F79389677;
	Tue, 23 Jun 2020 17:49:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56271C0890;
	Tue, 23 Jun 2020 17:49:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E325C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 17:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 18EFC87767
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 17:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hXtOI13HArzu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 17:49:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 84E2C87764
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 17:49:29 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id u8so1787781pje.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 10:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mU2Mqb/3Lzu3sqpNfQHlFitWN9RRppFyAwuH1XGEq/o=;
 b=Lt4FeIyKfPgR3dcCvP2WoEwHlKCPfb+zd+e7g56VPCjojWT8UAkOuMcNuZ8GfO1e9z
 PLvj9Ie8IethxX+Hvch4tg+PMXZQfAMVl+k1MaZ49GWwd5HLN0nrU3kShISTA8iUUUiy
 nmqzb/gb/ZMfRS87ayTJxcGIfmgVe9uTycEehOic1Q/13UayHkxdqmzzFHgScG0gfCDa
 CzyWaQdhZTEt9hHIqWdlW2gIcur5ZpUV5KVNfWlhXTP58vy+DUtzuEl83SxW6UIjxckQ
 GSn2Y7Zup2rr0S8eh3iENpeAEn8Xdy3XU1N/hIuEWA1Bb35+YYND8xOGo2Du4lwYp0Rr
 XvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mU2Mqb/3Lzu3sqpNfQHlFitWN9RRppFyAwuH1XGEq/o=;
 b=WGpp7nJ2vDjWkfqCByNYQTvr22ofDU0jzBi/ujRstAJnzuYbXs/AtIpsFm05tMzaAI
 UGbBudF6xiBNPHN5sYX3F+1NbySHxyMqJAcuYyolfwbHovWTPkSa2J/qK3y3M22NA7gJ
 4+s6SIPPHP8RTXtKDWXw8ZaiMrHIWOcnO8fbkLHEaQ4Me2fAG/1DUPTT1fy84Ebz5Pvk
 AgvD5ETPnCk6xfTEGY0t4K3euAGqRppCUysJW69xWAk7T9wFrQ2qyfYDvkfXJPXiEyL2
 AQg1pcc35PbNMUmo6Up7K64oE8L4ub9QGi5GuGaKzKgZW1t5VPfGVTNeikHfANN5M6HL
 sl9Q==
X-Gm-Message-State: AOAM5318LjCpHGgwJxTG3gH+u70yjAUocM/NSQRlc3C7tYHKFvo7Hugm
 I5IpgERWPB+Q6k7hfyck6w==
X-Google-Smtp-Source: ABdhPJxw/501/ORteOExfhyBnl/+yEVHkdQ3mDOuLpARGMwKOdFv65cx46gPEERRdrAfgGM6ZQ1jSQ==
X-Received: by 2002:a17:90a:70c6:: with SMTP id
 a6mr22379165pjm.16.1592934569041; 
 Tue, 23 Jun 2020 10:49:29 -0700 (PDT)
Received: from madhuparna-HP-Notebook ([2402:3a80:ceb:846:8098:13b7:478d:bfe2])
 by smtp.gmail.com with ESMTPSA id y10sm14768935pgi.54.2020.06.23.10.49.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 10:49:28 -0700 (PDT)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Tue, 23 Jun 2020 23:19:20 +0530
To: "Paul E. McKenney" <paulmck@kernel.org>
Message-ID: <20200623174920.GA13794@madhuparna-HP-Notebook>
References: <20200516082227.22194-1-madhuparnabhowmik10@gmail.com>
 <9fff3c6b-1978-c647-16f7-563a1cdf62ff@redhat.com>
 <20200623150236.GD9005@google.com>
 <20200623153036.GB9914@madhuparna-HP-Notebook>
 <20200623153901.GG9247@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623153901.GG9247@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, sean.j.christopherson@intel.com,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, bp@alien8.de,
 Joel Fernandes <joel@joelfernandes.org>, Paolo Bonzini <pbonzini@redhat.com>,
 vkuznets@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 tglx@linutronix.de, jmattson@google.com
Subject: Re: [Linux-kernel-mentees] [PATCH v2] kvm: Fix false positive RCU
	usage warning
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

On Tue, Jun 23, 2020 at 08:39:01AM -0700, Paul E. McKenney wrote:
> On Tue, Jun 23, 2020 at 09:00:36PM +0530, Madhuparna Bhowmik wrote:
> > On Tue, Jun 23, 2020 at 11:02:36AM -0400, Joel Fernandes wrote:
> > > On Tue, Jun 23, 2020 at 09:39:53AM +0200, Paolo Bonzini wrote:
> > > > On 16/05/20 10:22, madhuparnabhowmik10@gmail.com wrote:
> > > > > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > > > > 
> > > > > Fix the following false positive warnings:
> > > > > 
> > > > > [ 9403.765413][T61744] =============================
> > > > > [ 9403.786541][T61744] WARNING: suspicious RCU usage
> > > > > [ 9403.807865][T61744] 5.7.0-rc1-next-20200417 #4 Tainted: G             L
> > > > > [ 9403.838945][T61744] -----------------------------
> > > > > [ 9403.860099][T61744] arch/x86/kvm/mmu/page_track.c:257 RCU-list traversed in non-reader section!!
> > > > > 
> > > > > and
> > > > > 
> > > > > [ 9405.859252][T61751] =============================
> > > > > [ 9405.859258][T61751] WARNING: suspicious RCU usage
> > > > > [ 9405.880867][T61755] -----------------------------
> > > > > [ 9405.911936][T61751] 5.7.0-rc1-next-20200417 #4 Tainted: G             L
> > > > > [ 9405.911942][T61751] -----------------------------
> > > > > [ 9405.911950][T61751] arch/x86/kvm/mmu/page_track.c:232 RCU-list traversed in non-reader section!!
> > > > > 
> > > > > Since srcu read lock is held, these are false positive warnings.
> > > > > Therefore, pass condition srcu_read_lock_held() to
> > > > > list_for_each_entry_rcu().
> > > > > 
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > > > > ---
> > > > > v2:
> > > > > -Rebase v5.7-rc5
> > > > > 
> > > > >  arch/x86/kvm/mmu/page_track.c | 6 ++++--
> > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
> > > > > index ddc1ec3bdacd..1ad79c7aa05b 100644
> > > > > --- a/arch/x86/kvm/mmu/page_track.c
> > > > > +++ b/arch/x86/kvm/mmu/page_track.c
> > > > > @@ -229,7 +229,8 @@ void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
> > > > >  		return;
> > > > >  
> > > > >  	idx = srcu_read_lock(&head->track_srcu);
> > > > > -	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node)
> > > > > +	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node,
> > > > > +				srcu_read_lock_held(&head->track_srcu))
> > > > >  		if (n->track_write)
> > > > >  			n->track_write(vcpu, gpa, new, bytes, n);
> > > > >  	srcu_read_unlock(&head->track_srcu, idx);
> > > > > @@ -254,7 +255,8 @@ void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot)
> > > > >  		return;
> > > > >  
> > > > >  	idx = srcu_read_lock(&head->track_srcu);
> > > > > -	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node)
> > > > > +	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node,
> > > > > +				srcu_read_lock_held(&head->track_srcu))
> > > > >  		if (n->track_flush_slot)
> > > > >  			n->track_flush_slot(kvm, slot, n);
> > > > >  	srcu_read_unlock(&head->track_srcu, idx);
> > > > > 
> > > > 
> > > > Hi, sorry for the delay in reviewing this patch.  I would like to ask
> > > > Paul about it.
> > > > 
> > > > While you're correctly fixing a false positive, hlist_for_each_entry_rcu
> > > > would have a false _negative_ if you called it under
> > > > rcu_read_lock/unlock and the data structure was protected by SRCU.  This
> > > > is why for example srcu_dereference is used instead of
> > > > rcu_dereference_check, and why srcu_dereference uses
> > > > __rcu_dereference_check (with the two underscores) instead of
> > > > rcu_dereference_check.  Using rcu_dereference_check would add an "||
> > > > rcu_read_lock_held()" to the condition which is wrong.
> > > > 
> > > > I think instead you should add hlist_for_each_srcu and
> > > > hlist_for_each_entry_srcu macro to include/linux/rculist.h.
> > > > 
> > > > There is no need for equivalents of hlist_for_each_entry_continue_rcu
> > > > and hlist_for_each_entry_from_rcu, because they use rcu_dereference_raw.
> > > >  However, it's not documented why they do so.
> > > 
> > > You are right, this patch is wrong, we need a new SRCU list macro to do the
> > > right thing which would also get rid of the last list argument.
> > >
> > Can we really get rid of the last argument? We would need the
> > srcu_struct right for checking?
> 
> Agreed!  However, the API could be simplified by passing in a pointer to
> the srcu_struct instead of a lockdep expression.  An optional lockdep
> expression might still be helpful for calls from the update side,
> of course.
>
Sure, I will work on this.

Thanks,
Madhuparna
> 							Thanx, Paul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
