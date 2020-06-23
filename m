Return-Path: <SRS0=UFn2=AE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83728C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Jun 2020 15:39:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 295092078A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Jun 2020 15:39:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1TBY+NtH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 295092078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 07AAB89564;
	Tue, 23 Jun 2020 15:39:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qycpJJIb4AIp; Tue, 23 Jun 2020 15:39:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 60D22896F0;
	Tue, 23 Jun 2020 15:39:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48123C0890;
	Tue, 23 Jun 2020 15:39:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7690FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 15:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 72B6886E7E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 15:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KUvgATylRM9U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 15:39:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C7FBC86E64
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 15:39:01 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73A4E20723;
 Tue, 23 Jun 2020 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592926741;
 bh=+x1igQ+cwGJahoOJANLkVvcfFKTZ4z3VP4CCyxbX6vg=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=1TBY+NtHCatXMh0x3ApkXXBFe0f14Wt+7fwqLHvSh2/22tPRahTYUPd0jbTy++osU
 JSLNRJIaQnKZVNQMh6ggqiDcvvlq7D9makuUG4Yjlldmc3wbK9x6M8DH7UOExsZR4q
 s4OdTFfEb6fy23ojr1kND05pFsPLYxV26Fk8ia48=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 5A3873522657; Tue, 23 Jun 2020 08:39:01 -0700 (PDT)
Date: Tue, 23 Jun 2020 08:39:01 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Message-ID: <20200623153901.GG9247@paulmck-ThinkPad-P72>
References: <20200516082227.22194-1-madhuparnabhowmik10@gmail.com>
 <9fff3c6b-1978-c647-16f7-563a1cdf62ff@redhat.com>
 <20200623150236.GD9005@google.com>
 <20200623153036.GB9914@madhuparna-HP-Notebook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623153036.GB9914@madhuparna-HP-Notebook>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, sean.j.christopherson@intel.com, bp@alien8.de,
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Jun 23, 2020 at 09:00:36PM +0530, Madhuparna Bhowmik wrote:
> On Tue, Jun 23, 2020 at 11:02:36AM -0400, Joel Fernandes wrote:
> > On Tue, Jun 23, 2020 at 09:39:53AM +0200, Paolo Bonzini wrote:
> > > On 16/05/20 10:22, madhuparnabhowmik10@gmail.com wrote:
> > > > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > > > 
> > > > Fix the following false positive warnings:
> > > > 
> > > > [ 9403.765413][T61744] =============================
> > > > [ 9403.786541][T61744] WARNING: suspicious RCU usage
> > > > [ 9403.807865][T61744] 5.7.0-rc1-next-20200417 #4 Tainted: G             L
> > > > [ 9403.838945][T61744] -----------------------------
> > > > [ 9403.860099][T61744] arch/x86/kvm/mmu/page_track.c:257 RCU-list traversed in non-reader section!!
> > > > 
> > > > and
> > > > 
> > > > [ 9405.859252][T61751] =============================
> > > > [ 9405.859258][T61751] WARNING: suspicious RCU usage
> > > > [ 9405.880867][T61755] -----------------------------
> > > > [ 9405.911936][T61751] 5.7.0-rc1-next-20200417 #4 Tainted: G             L
> > > > [ 9405.911942][T61751] -----------------------------
> > > > [ 9405.911950][T61751] arch/x86/kvm/mmu/page_track.c:232 RCU-list traversed in non-reader section!!
> > > > 
> > > > Since srcu read lock is held, these are false positive warnings.
> > > > Therefore, pass condition srcu_read_lock_held() to
> > > > list_for_each_entry_rcu().
> > > > 
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > > > ---
> > > > v2:
> > > > -Rebase v5.7-rc5
> > > > 
> > > >  arch/x86/kvm/mmu/page_track.c | 6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
> > > > index ddc1ec3bdacd..1ad79c7aa05b 100644
> > > > --- a/arch/x86/kvm/mmu/page_track.c
> > > > +++ b/arch/x86/kvm/mmu/page_track.c
> > > > @@ -229,7 +229,8 @@ void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
> > > >  		return;
> > > >  
> > > >  	idx = srcu_read_lock(&head->track_srcu);
> > > > -	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node)
> > > > +	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node,
> > > > +				srcu_read_lock_held(&head->track_srcu))
> > > >  		if (n->track_write)
> > > >  			n->track_write(vcpu, gpa, new, bytes, n);
> > > >  	srcu_read_unlock(&head->track_srcu, idx);
> > > > @@ -254,7 +255,8 @@ void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot)
> > > >  		return;
> > > >  
> > > >  	idx = srcu_read_lock(&head->track_srcu);
> > > > -	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node)
> > > > +	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node,
> > > > +				srcu_read_lock_held(&head->track_srcu))
> > > >  		if (n->track_flush_slot)
> > > >  			n->track_flush_slot(kvm, slot, n);
> > > >  	srcu_read_unlock(&head->track_srcu, idx);
> > > > 
> > > 
> > > Hi, sorry for the delay in reviewing this patch.  I would like to ask
> > > Paul about it.
> > > 
> > > While you're correctly fixing a false positive, hlist_for_each_entry_rcu
> > > would have a false _negative_ if you called it under
> > > rcu_read_lock/unlock and the data structure was protected by SRCU.  This
> > > is why for example srcu_dereference is used instead of
> > > rcu_dereference_check, and why srcu_dereference uses
> > > __rcu_dereference_check (with the two underscores) instead of
> > > rcu_dereference_check.  Using rcu_dereference_check would add an "||
> > > rcu_read_lock_held()" to the condition which is wrong.
> > > 
> > > I think instead you should add hlist_for_each_srcu and
> > > hlist_for_each_entry_srcu macro to include/linux/rculist.h.
> > > 
> > > There is no need for equivalents of hlist_for_each_entry_continue_rcu
> > > and hlist_for_each_entry_from_rcu, because they use rcu_dereference_raw.
> > >  However, it's not documented why they do so.
> > 
> > You are right, this patch is wrong, we need a new SRCU list macro to do the
> > right thing which would also get rid of the last list argument.
> >
> Can we really get rid of the last argument? We would need the
> srcu_struct right for checking?

Agreed!  However, the API could be simplified by passing in a pointer to
the srcu_struct instead of a lockdep expression.  An optional lockdep
expression might still be helpful for calls from the update side,
of course.

							Thanx, Paul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
