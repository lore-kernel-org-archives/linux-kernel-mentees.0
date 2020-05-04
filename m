Return-Path: <SRS0=SEts=6S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5373EC4724C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 May 2020 16:47:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19B1420752
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 May 2020 16:47:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XynwaO9i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19B1420752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9C5EA20430;
	Mon,  4 May 2020 16:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-evQhIkkA-Z; Mon,  4 May 2020 16:47:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9924620412;
	Mon,  4 May 2020 16:47:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 952D6C088C;
	Mon,  4 May 2020 16:47:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2A74C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 May 2020 16:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C388420430
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 May 2020 16:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7XV+Yl5nplQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 May 2020 16:47:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 107A720412
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 May 2020 16:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588610868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqG4NiZOzEfqHtOMWsB/ZvHqz1Pp83h0dHQmV0QkakI=;
 b=XynwaO9iMmA6NFsjGHQICXwaz+gS9BdigwUMsaTch2oeJdu8XLMsyeYnlJ680DBcmDG2fL
 N0M+sXfBeY18kHQ3w7QZ+b5lks2KlFdJG6/NxGPPpsQgKsNMJSMHAymxo0zuzqkhCcZ9l5
 qoW3m3YKC9sVu3ovCu+RioQyUo8KV2k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-891tzUHSPr69LFwSEx_f_Q-1; Mon, 04 May 2020 12:47:47 -0400
X-MC-Unique: 891tzUHSPr69LFwSEx_f_Q-1
Received: by mail-wr1-f71.google.com with SMTP id r11so11085416wrx.21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 May 2020 09:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mqG4NiZOzEfqHtOMWsB/ZvHqz1Pp83h0dHQmV0QkakI=;
 b=iqZFr28guZhWFjyC/S8iYkjSOe1T/zSSB6vnEJP5mBW6KxlfDV3C05lPo3Cok9ejmn
 AR5+MDlHvArFor77kk9I9Q+RfWOqMkawc3z2sUi8zbCseHaXUCsHvum3wGgynKrbH5m9
 gGLBzp4XvbZyDU4hi8YkUxQpmU4XavMyMFPDCL1UitcEN1O40DyrT0SW+sZCuA5JL60Z
 bv5x7W76Ih2eeqfqQ0UX7nPtM5Jgxzl3S1O6fJJcnjmbiD+zTmkwFBHVwQhs1qUPs22X
 KEmleSjLmIBv2jIDBmTznEtO50tI//o7AuD9yCpqGr46EJMAO9tua9AJE6L/fR6WnzV4
 B0wQ==
X-Gm-Message-State: AGi0PuafZDAprrd0/waOUt7TutdOV8L+7R4tJeGdUCOTMXmG983L3E4F
 j0C6rl+2BTxYHbV5S0od+miQ4FJ52/iTXel+TrQaCwiX0lLNpDleDv4EEtV4sYN3Kbw010Y4g5p
 J4gCA+HAvPGc1MGf+bl6RAmLWHsMZ9xOkESez9zFBnj/IHxKy
X-Received: by 2002:a1c:1d92:: with SMTP id d140mr15413161wmd.67.1588610865738; 
 Mon, 04 May 2020 09:47:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypLDRC0oKvIrSTpQybtrO+sKCnZxuLzQYC4jjIPDre77gM0GB81TEH4UGwNEonZVOzx3VaVo3w==
X-Received: by 2002:a1c:1d92:: with SMTP id d140mr15413134wmd.67.1588610865542; 
 Mon, 04 May 2020 09:47:45 -0700 (PDT)
Received: from [192.168.178.58] ([151.20.132.175])
 by smtp.gmail.com with ESMTPSA id a9sm40312wmm.38.2020.05.04.09.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 09:47:45 -0700 (PDT)
To: madhuparnabhowmik10@gmail.com, mingo@redhat.com, bp@alien8.de
References: <20200430192932.13371-1-madhuparnabhowmik10@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6c992b7f-c6c7-44a6-fa5a-c3512646de05@redhat.com>
Date: Mon, 4 May 2020 18:47:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200430192932.13371-1-madhuparnabhowmik10@gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: kvm@vger.kernel.org, paulmck@kernel.org, linux-pci@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, sean.j.christopherson@intel.com,
 joel@joelfernandes.org, cai@lca.pw, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] x86: Fix RCU list usage to avoid
	false positive warnings
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

On 30/04/20 21:29, madhuparnabhowmik10@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> Use list_for_each_entry() instead of list_for_each_entry_rcu() whenever
> spinlock or mutex is always held.
> Otherwise, pass cond to list_for_each_entry_rcu().
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> ---
>  arch/x86/kernel/nmi.c          | 2 +-
>  arch/x86/kvm/irq_comm.c        | 3 ++-
>  arch/x86/pci/mmconfig-shared.c | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
> index 6407ea21fa1b..999dc6c134d2 100644
> --- a/arch/x86/kernel/nmi.c
> +++ b/arch/x86/kernel/nmi.c
> @@ -195,7 +195,7 @@ void unregister_nmi_handler(unsigned int type, const char *name)
>  
>  	raw_spin_lock_irqsave(&desc->lock, flags);
>  
> -	list_for_each_entry_rcu(n, &desc->head, list) {
> +	list_for_each_entry(n, &desc->head, list) {
>  		/*
>  		 * the name passed in to describe the nmi handler
>  		 * is used as the lookup key
> diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
> index c47d2acec529..5b88a648e079 100644
> --- a/arch/x86/kvm/irq_comm.c
> +++ b/arch/x86/kvm/irq_comm.c
> @@ -258,7 +258,8 @@ void kvm_fire_mask_notifiers(struct kvm *kvm, unsigned irqchip, unsigned pin,
>  	idx = srcu_read_lock(&kvm->irq_srcu);
>  	gsi = kvm_irq_map_chip_pin(kvm, irqchip, pin);
>  	if (gsi != -1)
> -		hlist_for_each_entry_rcu(kimn, &kvm->arch.mask_notifier_list, link)
> +		hlist_for_each_entry_rcu(kimn, &kvm->arch.mask_notifier_list, link,
> +					srcu_read_lock_held(&kvm->irq_srcu))
>  			if (kimn->irq == gsi)
>  				kimn->func(kimn, mask);
>  	srcu_read_unlock(&kvm->irq_srcu, idx);
> diff --git a/arch/x86/pci/mmconfig-shared.c b/arch/x86/pci/mmconfig-shared.c
> index 6fa42e9c4e6f..a096942690bd 100644
> --- a/arch/x86/pci/mmconfig-shared.c
> +++ b/arch/x86/pci/mmconfig-shared.c
> @@ -797,7 +797,7 @@ int pci_mmconfig_delete(u16 seg, u8 start, u8 end)
>  	struct pci_mmcfg_region *cfg;
>  
>  	mutex_lock(&pci_mmcfg_lock);
> -	list_for_each_entry_rcu(cfg, &pci_mmcfg_list, list)
> +	list_for_each_entry(cfg, &pci_mmcfg_list, list)
>  		if (cfg->segment == seg && cfg->start_bus == start &&
>  		    cfg->end_bus == end) {
>  			list_del_rcu(&cfg->list);
> 

For KVM parts, if the x86 maintainers want to apply the whole patch,

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
