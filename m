Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C110C25B08
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 18:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADC8640B05;
	Fri,  5 Aug 2022 18:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADC8640B05
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IjSOTsko
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ph5buwQvkdVE; Fri,  5 Aug 2022 18:37:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BF119405AD;
	Fri,  5 Aug 2022 18:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF119405AD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB6E4C0032;
	Fri,  5 Aug 2022 18:37:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64590C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 18:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D03760E0F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 18:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D03760E0F
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20210112 header.b=IjSOTsko
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFolaTFaw9HQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 18:37:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 672F960AAE
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 672F960AAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 18:37:18 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id f192so2943466pfa.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Aug 2022 11:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=lELyiIs1M4XhaXsTw4w5NqfKv5uqGU1KMVAeFBFrmLw=;
 b=IjSOTskopD9xhiXK61Q0+jIYrE1wEloCdlU8aKJFpxNmGh4dk0tEyWp8tiKqoAH9S/
 vfWt5HGfLWgwGo0iuRY1BHR0J5VSYzv85H9DvcVdXGdiqUhmxLyU7r5IdEYP247TdcGY
 PgogGFR/bHG35vakLhyyIOaHbTbVsxHDPcsi70s342ctBmpme/sQQORnmeln6LjFnUaS
 i91Whc6wvegRSfOiXyNrHvONBZm+q7SVhaRLQmNHA9VN49Gc7JaIL8eknoDE80Ausndf
 ZWUZU+XceH3clbGQghM592Uh7sYRu5a+pYvh1DHyFjF3YVkzgl8CO9fEeJw982UUMZdA
 Fx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=lELyiIs1M4XhaXsTw4w5NqfKv5uqGU1KMVAeFBFrmLw=;
 b=aziDVddI8fq9korphG0WxfiBMkfqeoKmUVIKORaBfmtUmn9AzXhWGFe8s7dzIxqq1T
 szmggj/nSr7GS4chtAeRuzM/Y9VmtTWzoNuyzNQjy9Qrq15R8Pdj81txOvHllJ/ngBVm
 fBP2hD+pYc1cbJCXgOUTLjUwyq5ewlg2/APiOgHLGesAxV9liaIXPh0TXPMuMcjMeMoP
 KJM4LPae/Hx2slatMoreunvKEvenDppYSwWrFXKMZzRQOwm6oyHSD3qvP1KQnBj1DfSD
 Xr6lWTbXijA/QKvtB1z0upeorI/qsuFwWIbOrsGYbtGM2uUT71bH0Xq7hQ+XPPzON6On
 p9lQ==
X-Gm-Message-State: ACgBeo34CwFDHJCtyHsronOngOW4b2khO+mtInwhsXGDY0ylnBeojtP9
 cAg8dFqxRoqBV3WmCJ++1CiOFA==
X-Google-Smtp-Source: AA6agR5uK/vVHvtkmvHFgUqgHizAXSnbLOqsLz1hkP/xNbxDCwRqyr+pfYvuuGfxHn/o2dsOXdYKvg==
X-Received: by 2002:a63:4645:0:b0:41a:6c24:4fa3 with SMTP id
 v5-20020a634645000000b0041a6c244fa3mr6892782pgk.114.1659724637580; 
 Fri, 05 Aug 2022 11:37:17 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 t67-20020a628146000000b0052d8b663c37sm3288244pfd.195.2022.08.05.11.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 11:37:17 -0700 (PDT)
Date: Fri, 5 Aug 2022 18:37:13 +0000
To: Coleman Dietsch <dietschc@csp.edu>
Subject: Re: [PATCH v2 1/2] KVM: x86/xen: Initialize Xen timer only once
Message-ID: <Yu1jWSPHiow72qVc@google.com>
References: <20220729184640.244969-1-dietschc@csp.edu>
 <20220729184640.244969-2-dietschc@csp.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220729184640.244969-2-dietschc@csp.edu>
Cc: x86@kernel.org, kvm@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H . Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
From: Sean Christopherson via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Jul 29, 2022, Coleman Dietsch wrote:
> Add a check for existing xen timers before initializing a new one.
> 
> Currently kvm_xen_init_timer() is called on every
> KVM_XEN_VCPU_ATTR_TYPE_TIMER, which is causing the following ODEBUG
> crash when vcpu->arch.xen.timer is already set.
> 
> ODEBUG: init active (active state 0)
> object type: hrtimer hint: xen_timer_callbac0
> RIP: 0010:debug_print_object+0x16e/0x250 lib/debugobjects.c:502
> Call Trace:
> __debug_object_init
> debug_hrtimer_init
> debug_init
> hrtimer_init
> kvm_xen_init_timer
> kvm_xen_vcpu_set_attr
> kvm_arch_vcpu_ioctl
> kvm_vcpu_ioctl
> vfs_ioctl
> 

Fixes: 536395260582 ("KVM: x86/xen: handle PV timers oneshot mode")
Cc: stable@vger.kernel.org

> Link: https://syzkaller.appspot.com/bug?id=8234a9dfd3aafbf092cc5a7cd9842e3ebc45fc42
> Reported-by: syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com
> Signed-off-by: Coleman Dietsch <dietschc@csp.edu>
> ---

One uber nit below, otherwise:

Reviewed-by: Sean Christopherson <seanjc@google.com>

>  arch/x86/kvm/xen.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> index 610beba35907..2dd0f72a62f2 100644
> --- a/arch/x86/kvm/xen.c
> +++ b/arch/x86/kvm/xen.c
> @@ -713,7 +713,10 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
>  				break;
>  			}
>  			vcpu->arch.xen.timer_virq = data->u.timer.port;
> -			kvm_xen_init_timer(vcpu);
> +
> +			/* Check for existing timer */

I vote to omit the comment, "existing timer" is ambiguous, e.g. it could mean that
there's an existing _running_ timer as opposed to an existing initialized timer.
IMO the code is obvious enough on its own.

> +			if (!vcpu->arch.xen.timer.function)
> +				kvm_xen_init_timer(vcpu);
>  
>  			/* Restart the timer if it's set */
>  			if (data->u.timer.expires_ns)
> -- 
> 2.34.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
