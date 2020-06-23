Return-Path: <SRS0=UFn2=AE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9456C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Jun 2020 15:29:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A7902070E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Jun 2020 15:29:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/OEIZh0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A7902070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F94A89514;
	Tue, 23 Jun 2020 15:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cN72n4fO6jU5; Tue, 23 Jun 2020 15:29:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AABF389128;
	Tue, 23 Jun 2020 15:29:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F2A1C0890;
	Tue, 23 Jun 2020 15:29:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23752C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 15:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1B78889514
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 15:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ITPXMYMvoivo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 15:29:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6E1E189128
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 15:29:15 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id u14so1615689pjj.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 08:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KDCfSozN/IsFdVgihX+4tXj9STjMapc13JwQrRlGOGI=;
 b=T/OEIZh0zGlP2T9RFvlsU5XYkUCDBl7ASqg608sxi47S9mKGhwAFLwcfgL1MqyXRcp
 uklUH5Or7eaEv71m02+vA97XLy/dXH5U+foa4S7Vj9Q0O50iPLVwvAqj+5jgG9RS9md7
 pQP1ro8onkLP5R/3cMKjIsXABJs/oGVlz13NfuZqm98Vb3xYHslPqTkQ3XCeuz3OesqI
 ZR5AxtYNoJ5OQysH1gWddF5qJ0Zp+bewtxlnLHAeWoSMb4zv4HR0EVfJhvONtvuUnNYy
 HCg0vwEsUV5V960RXRAHsYR8Cy45XFsxCo16xubO//gmpXwHfBksLCgISWWv8156XHdY
 QMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KDCfSozN/IsFdVgihX+4tXj9STjMapc13JwQrRlGOGI=;
 b=nZNs4TxG2N5EwpXnNPPNuuHrBqtIyFLuWC1ifiuiiJhf1y3dN2L92jUVeY/U4jNitL
 hjKuAg5XJ4nl4eGEAotLnEojnm7rlTTdXrQ6wTwfbNLRv5CsFUUq3lQvjekS11suNRz0
 uZDLvI9huFMA1GMFEXD0LHK07fyT+sWHJnrzWbu2OfwrI/Azj8cZmoOs2OKavuJLmxRR
 YobhCesr0zPcZJQ3a6wtpJdpjyo3v/7WYvaKkusMw6NeGipgaKqBWMu/tvClwryUWJV3
 mlJKUjPk5C1zLWaf1vjmG9UrmE9D5Dt0I6ehDzeYCdIIHgJiAZHHvxaZ9PgnOAY3UlkY
 rALg==
X-Gm-Message-State: AOAM533d+552a3hH6v9I5kuvJbZfRwCV4sB52C+j8tJeg7837Ah4k+0S
 19QPZPOaehBCd9TJ0/DAaw==
X-Google-Smtp-Source: ABdhPJxkqvJJZzhda47S/KsXfI8hQaJBLoqa63OrEAxyytojiWtkO6JBXA35r6p572mg7DM/mxBfSA==
X-Received: by 2002:a17:902:6b8c:: with SMTP id
 p12mr22159395plk.256.1592926154950; 
 Tue, 23 Jun 2020 08:29:14 -0700 (PDT)
Received: from madhuparna-HP-Notebook ([2402:3a80:ceb:846:8098:13b7:478d:bfe2])
 by smtp.gmail.com with ESMTPSA id l2sm2841461pjl.34.2020.06.23.08.29.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 08:29:13 -0700 (PDT)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Tue, 23 Jun 2020 20:59:05 +0530
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20200623152905.GA9914@madhuparna-HP-Notebook>
References: <20200516082227.22194-1-madhuparnabhowmik10@gmail.com>
 <9fff3c6b-1978-c647-16f7-563a1cdf62ff@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9fff3c6b-1978-c647-16f7-563a1cdf62ff@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: wanpengli@tencent.com, paulmck@kernel.org, kvm@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, sean.j.christopherson@intel.com,
 madhuparnabhowmik10@gmail.com, bp@alien8.de, joel@joelfernandes.org,
 vkuznets@redhat.com, Paul McKenney <paulmck@linux.vnet.ibm.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, tglx@linutronix.de,
 jmattson@google.com
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

On Tue, Jun 23, 2020 at 09:39:53AM +0200, Paolo Bonzini wrote:
> On 16/05/20 10:22, madhuparnabhowmik10@gmail.com wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > 
> > Fix the following false positive warnings:
> > 
> > [ 9403.765413][T61744] =============================
> > [ 9403.786541][T61744] WARNING: suspicious RCU usage
> > [ 9403.807865][T61744] 5.7.0-rc1-next-20200417 #4 Tainted: G             L
> > [ 9403.838945][T61744] -----------------------------
> > [ 9403.860099][T61744] arch/x86/kvm/mmu/page_track.c:257 RCU-list traversed in non-reader section!!
> > 
> > and
> > 
> > [ 9405.859252][T61751] =============================
> > [ 9405.859258][T61751] WARNING: suspicious RCU usage
> > [ 9405.880867][T61755] -----------------------------
> > [ 9405.911936][T61751] 5.7.0-rc1-next-20200417 #4 Tainted: G             L
> > [ 9405.911942][T61751] -----------------------------
> > [ 9405.911950][T61751] arch/x86/kvm/mmu/page_track.c:232 RCU-list traversed in non-reader section!!
> > 
> > Since srcu read lock is held, these are false positive warnings.
> > Therefore, pass condition srcu_read_lock_held() to
> > list_for_each_entry_rcu().
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > ---
> > v2:
> > -Rebase v5.7-rc5
> > 
> >  arch/x86/kvm/mmu/page_track.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
> > index ddc1ec3bdacd..1ad79c7aa05b 100644
> > --- a/arch/x86/kvm/mmu/page_track.c
> > +++ b/arch/x86/kvm/mmu/page_track.c
> > @@ -229,7 +229,8 @@ void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
> >  		return;
> >  
> >  	idx = srcu_read_lock(&head->track_srcu);
> > -	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node)
> > +	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node,
> > +				srcu_read_lock_held(&head->track_srcu))
> >  		if (n->track_write)
> >  			n->track_write(vcpu, gpa, new, bytes, n);
> >  	srcu_read_unlock(&head->track_srcu, idx);
> > @@ -254,7 +255,8 @@ void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot)
> >  		return;
> >  
> >  	idx = srcu_read_lock(&head->track_srcu);
> > -	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node)
> > +	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node,
> > +				srcu_read_lock_held(&head->track_srcu))
> >  		if (n->track_flush_slot)
> >  			n->track_flush_slot(kvm, slot, n);
> >  	srcu_read_unlock(&head->track_srcu, idx);
> > 
> 
> Hi, sorry for the delay in reviewing this patch.  I would like to ask
> Paul about it.
> 
> While you're correctly fixing a false positive, hlist_for_each_entry_rcu
> would have a false _negative_ if you called it under
> rcu_read_lock/unlock and the data structure was protected by SRCU.  This
> is why for example srcu_dereference is used instead of
> rcu_dereference_check, and why srcu_dereference uses
> __rcu_dereference_check (with the two underscores) instead of
> rcu_dereference_check.  Using rcu_dereference_check would add an "||
> rcu_read_lock_held()" to the condition which is wrong.
>
Yes, that makes sense, there would be a false negative, thank you for
pointing out this issue.

> I think instead you should add hlist_for_each_srcu and
> hlist_for_each_entry_srcu macro to include/linux/rculist.h.
> 
This seems good to me, I can work on this, but I would wait for Paul's
suggestion on this.

> There is no need for equivalents of hlist_for_each_entry_continue_rcu
> and hlist_for_each_entry_from_rcu, because they use rcu_dereference_raw.
>  However, it's not documented why they do so.
> 
> Paul, do you have any objections to the idea?  Thanks,
> 
> Paolo

Thank you,
Madhuparna

> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
