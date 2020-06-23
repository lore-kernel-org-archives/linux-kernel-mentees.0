Return-Path: <SRS0=UFn2=AE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37CDC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Jun 2020 07:40:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A417020771
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Jun 2020 07:40:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ELdo8hdC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A417020771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F0DB894F2;
	Tue, 23 Jun 2020 07:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wpym8OFzuRkg; Tue, 23 Jun 2020 07:40:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 62FA2894CE;
	Tue, 23 Jun 2020 07:40:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41DFDC0891;
	Tue, 23 Jun 2020 07:40:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34D61C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 07:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1D62A88859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 07:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id knIO4M5gS6Mu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 07:40:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 52EE588663
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 07:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592898000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bRQOtyl6lVhUbOXwbZ0j6gA48P7oZ6lHfj3tURdm+Qk=;
 b=ELdo8hdCDxHmNcHyuoLZTXPTVPMw9p8g3KJGt+e3pkhElE7xKwibUhRWnXOHf0xvKVpnMo
 WvBLnU1ijM+CirHp/c22m0+1YZSKbVm5apWe0GAG7KUacqHg+JvJ6P8iV1K11sFcreH0kH
 UjkNu0TWgJqYCOLHF25/eKgdFRjmPK0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-Nn8P_cTIN8CCCsE3RjFVvQ-1; Tue, 23 Jun 2020 03:39:57 -0400
X-MC-Unique: Nn8P_cTIN8CCCsE3RjFVvQ-1
Received: by mail-wm1-f72.google.com with SMTP id t145so3164659wmt.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jun 2020 00:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bRQOtyl6lVhUbOXwbZ0j6gA48P7oZ6lHfj3tURdm+Qk=;
 b=Qudv3YIC6bQGVshPMxRpLTHYnZ+ivTSaStwTspcNJQJ9zA/tM3rFqel81rSAQsa8sJ
 eguTXsysAAtRZ1QWIo6GsOJnFg0gC6Y177I90A9xg7ENB1uq1mDY2h4fr35i4Co6U3zU
 3A2RPNOorPWDTyPrvkH7y2wlqB72Mhpkubb+EtzMx7ESa8Hzojn9baATwsIFXIDz39BG
 NQcsbjKfv0My8hRW+CSWradfX99c5lT/MzAJNsWyZsuDD3kI2tvcyULpAsaSMx8oZBc9
 4nzN3TgB/R9L+C+ki8VpInDrWyGqocAXttw5VwArA6WyGg+YCp2bSeKmxYZibPiGVzii
 gnzA==
X-Gm-Message-State: AOAM531zKEWxsZeBJXsnLNKoFcZil8P/1O34iJK/f94Xot4rbKANTGtT
 dLKEQ+BNtZkblHHjmI+IX6TTX/EesnrJ0oHPf2o/5r6GYJNYtuci9gCSMVpcWiP4Iq3lElRaUdX
 F2SkxvRv3JU+4MiNqNVfRZpcH8VG0xK1WXOAIMvEl+WPcyfDL
X-Received: by 2002:adf:f68d:: with SMTP id v13mr22045562wrp.291.1592897996032; 
 Tue, 23 Jun 2020 00:39:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyROt/FdYOL7D3F3GIScbHmS1rmvcw9/x/W6kr1tp+rrM2/YM/ISk0VKoa0qpUQrUlimzfQsQ==
X-Received: by 2002:adf:f68d:: with SMTP id v13mr22045539wrp.291.1592897995798; 
 Tue, 23 Jun 2020 00:39:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:24f5:23b:4085:b879?
 ([2001:b07:6468:f312:24f5:23b:4085:b879])
 by smtp.gmail.com with ESMTPSA id d9sm21004342wre.28.2020.06.23.00.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2020 00:39:55 -0700 (PDT)
To: madhuparnabhowmik10@gmail.com, sean.j.christopherson@intel.com,
 vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
 tglx@linutronix.de, bp@alien8.de
References: <20200516082227.22194-1-madhuparnabhowmik10@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9fff3c6b-1978-c647-16f7-563a1cdf62ff@redhat.com>
Date: Tue, 23 Jun 2020 09:39:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200516082227.22194-1-madhuparnabhowmik10@gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: kvm@vger.kernel.org, paulmck@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, joel@joelfernandes.org,
 Paul McKenney <paulmck@linux.vnet.ibm.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On 16/05/20 10:22, madhuparnabhowmik10@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> Fix the following false positive warnings:
> 
> [ 9403.765413][T61744] =============================
> [ 9403.786541][T61744] WARNING: suspicious RCU usage
> [ 9403.807865][T61744] 5.7.0-rc1-next-20200417 #4 Tainted: G             L
> [ 9403.838945][T61744] -----------------------------
> [ 9403.860099][T61744] arch/x86/kvm/mmu/page_track.c:257 RCU-list traversed in non-reader section!!
> 
> and
> 
> [ 9405.859252][T61751] =============================
> [ 9405.859258][T61751] WARNING: suspicious RCU usage
> [ 9405.880867][T61755] -----------------------------
> [ 9405.911936][T61751] 5.7.0-rc1-next-20200417 #4 Tainted: G             L
> [ 9405.911942][T61751] -----------------------------
> [ 9405.911950][T61751] arch/x86/kvm/mmu/page_track.c:232 RCU-list traversed in non-reader section!!
> 
> Since srcu read lock is held, these are false positive warnings.
> Therefore, pass condition srcu_read_lock_held() to
> list_for_each_entry_rcu().
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> ---
> v2:
> -Rebase v5.7-rc5
> 
>  arch/x86/kvm/mmu/page_track.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
> index ddc1ec3bdacd..1ad79c7aa05b 100644
> --- a/arch/x86/kvm/mmu/page_track.c
> +++ b/arch/x86/kvm/mmu/page_track.c
> @@ -229,7 +229,8 @@ void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
>  		return;
>  
>  	idx = srcu_read_lock(&head->track_srcu);
> -	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node)
> +	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node,
> +				srcu_read_lock_held(&head->track_srcu))
>  		if (n->track_write)
>  			n->track_write(vcpu, gpa, new, bytes, n);
>  	srcu_read_unlock(&head->track_srcu, idx);
> @@ -254,7 +255,8 @@ void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot)
>  		return;
>  
>  	idx = srcu_read_lock(&head->track_srcu);
> -	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node)
> +	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node,
> +				srcu_read_lock_held(&head->track_srcu))
>  		if (n->track_flush_slot)
>  			n->track_flush_slot(kvm, slot, n);
>  	srcu_read_unlock(&head->track_srcu, idx);
> 

Hi, sorry for the delay in reviewing this patch.  I would like to ask
Paul about it.

While you're correctly fixing a false positive, hlist_for_each_entry_rcu
would have a false _negative_ if you called it under
rcu_read_lock/unlock and the data structure was protected by SRCU.  This
is why for example srcu_dereference is used instead of
rcu_dereference_check, and why srcu_dereference uses
__rcu_dereference_check (with the two underscores) instead of
rcu_dereference_check.  Using rcu_dereference_check would add an "||
rcu_read_lock_held()" to the condition which is wrong.

I think instead you should add hlist_for_each_srcu and
hlist_for_each_entry_srcu macro to include/linux/rculist.h.

There is no need for equivalents of hlist_for_each_entry_continue_rcu
and hlist_for_each_entry_from_rcu, because they use rcu_dereference_raw.
 However, it's not documented why they do so.

Paul, do you have any objections to the idea?  Thanks,

Paolo

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
