Return-Path: <SRS0=UFn2=AE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F7CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Jun 2020 15:33:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3B0A20656
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Jun 2020 15:33:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="E9w4bJSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3B0A20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9301822CB0;
	Tue, 23 Jun 2020 15:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39c9yeRMXt1F; Tue, 23 Jun 2020 15:33:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8D9A020505;
	Tue, 23 Jun 2020 15:33:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C58DC0890;
	Tue, 23 Jun 2020 15:33:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E44CBC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 15:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D4F0920528
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 15:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X+jTiitj9kdv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 15:33:22 +0000 (UTC)
X-Greylist: delayed 00:23:08 by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 70FB620505
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 15:33:22 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id h23so8576524qtr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 08:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1z1ehSCwot5VnE3TNEBjXXOGfLvJr+9MkOksrysPCMc=;
 b=E9w4bJSaqWf/pKpisHHt1S+BthSyfa0e5/L1Sq+lQv8OUIH0PphxurlrzMDvFKQ7iF
 3KTnDZDNNgWGryp4CFe6qW97zQXbedEQrAo8NBVUe4qsOTKQvQUC2xRgeBfIF3aOWQbl
 itGNugF83gHq5dlbL/dzymckUmqzbu1BXAM68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1z1ehSCwot5VnE3TNEBjXXOGfLvJr+9MkOksrysPCMc=;
 b=WxH06LNSFEZSVm78A29ACa7ouQaWOZCPVIeGkh/awMZvVbE4miy7m0ZeqCNWow+dwc
 FdD0rej3+fg+qIQKELqVyN4NKGkz41WnxO0LB0nvnI/pApdwIl6o2OnJqYgNOPVtFp6V
 zOiBOZjRtkNojjSI3T8xsX4fuwVKDKzgfFiWCfuhPkTR9a0CMP1BEC8izNloBnhDiO35
 Hi6wPyFPhuDGUN8g/cgofV31udLFVB2tgoEAXbTbVOlfkG3Ald4L8BGvJwIQyiO1F2BW
 2zrua83xI6l0qt/V2Nkz9qmtDLGzuoy803ZK3bm08EwkZpupwSzvomVjrDFtggPg53Af
 vtfQ==
X-Gm-Message-State: AOAM533jXZode+Umvmt9JlcPKPQ1zr7KkKXl2meKthTDRNV0lwFPTKiF
 hPJmSvGxFqjVNG9Gc/y/c41R899TTZU=
X-Google-Smtp-Source: ABdhPJyTSkcTrA3rEAn3O/WxA9L/aDtqy8cJk0ZXY9Bz0OBYsb6e1d9hSYWAguNsZHEfozmInbFSDw==
X-Received: by 2002:a05:620a:b1a:: with SMTP id
 t26mr21010205qkg.473.1592924557749; 
 Tue, 23 Jun 2020 08:02:37 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
 by smtp.gmail.com with ESMTPSA id d186sm737579qkb.110.2020.06.23.08.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 08:02:36 -0700 (PDT)
Date: Tue, 23 Jun 2020 11:02:36 -0400
From: Joel Fernandes <joel@joelfernandes.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20200623150236.GD9005@google.com>
References: <20200516082227.22194-1-madhuparnabhowmik10@gmail.com>
 <9fff3c6b-1978-c647-16f7-563a1cdf62ff@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9fff3c6b-1978-c647-16f7-563a1cdf62ff@redhat.com>
Cc: wanpengli@tencent.com, paulmck@kernel.org, kvm@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, sean.j.christopherson@intel.com,
 madhuparnabhowmik10@gmail.com, bp@alien8.de, vkuznets@redhat.com,
 Paul McKenney <paulmck@linux.vnet.ibm.com>,
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
> I think instead you should add hlist_for_each_srcu and
> hlist_for_each_entry_srcu macro to include/linux/rculist.h.
> 
> There is no need for equivalents of hlist_for_each_entry_continue_rcu
> and hlist_for_each_entry_from_rcu, because they use rcu_dereference_raw.
>  However, it's not documented why they do so.

You are right, this patch is wrong, we need a new SRCU list macro to do the
right thing which would also get rid of the last list argument.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
