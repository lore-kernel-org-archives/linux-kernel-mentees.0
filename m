Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722B0C19F2B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Jul 2022 20:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD7434042B;
	Thu, 28 Jul 2022 20:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD7434042B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=aoqiVzJq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFCufPXljGwd; Thu, 28 Jul 2022 20:41:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5B5674031D;
	Thu, 28 Jul 2022 20:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B5674031D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30753C0035;
	Thu, 28 Jul 2022 20:41:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7A2CC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 20:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADDE560ABB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 20:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADDE560ABB
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20210112 header.b=aoqiVzJq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Gk3zZPT0abl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 20:41:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C123F60A9F
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C123F60A9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 20:41:19 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 w63-20020a17090a6bc500b001f3160a6011so4508691pjj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 13:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=HFpO6jXv+thLIEQmIbyzTm5jXFu4Gb0lIjJbAQsrEBg=;
 b=aoqiVzJqBUfNWGKmug4CGVbsDsNx+O56FJEyWStkwyukKWyC0Oh9JgPMLicB6uvdAS
 FhJwN8mlZCK1chuNvxIAueX6DRpnawWaKcvjicasit8HCZUKQzDXouMjGsmuKynft9U9
 RE6V3Xx51zrUJnpMcMXN1kPM88/Ld7cBfLoFBaRWZv72mG6a0RuE6j86k7WlV5NWRycI
 STaX6kpYhyLRJFsDJRoskx4z7OLJLa2ddRpg5LxZyJFYIC4nMGaPQoAtIm2MFJWwqHMw
 zY5aD9YNHbIKQ31VtzNXg86MzdDGpzrySC1pMJ8it60kedxFcMSv9JmbGzbosDJGwGQU
 Oxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=HFpO6jXv+thLIEQmIbyzTm5jXFu4Gb0lIjJbAQsrEBg=;
 b=XoLHq1sClGEpTVVygPwN9a3H4O4Dx35HUM6rH0K7TsFsyzjF1G4s6L2KnGOrMpfhiS
 1FKmdU0JhmhTQTFdYT8ppTUjgzy1LbMtirP4crWsD2NT4SU3G4pa//TI2jZ2W1MoJrUH
 rIwX2JPhaFALyvZQJ0QhR6NqAxVhIWgu6M44mxuYJPsF/XOvVdg5TjJa3XOEUNAQY7z4
 +K5FQAYudvyV927HHrOlu9mG6sNf3jk/RHQf6YdGXRRaSLi8/gfXwSiehqPuGkrec8xr
 zJWN87sXCbuXJ351kV7PPwyOGJU39W54m4lHtNuvzLQlND7Mtknv8XHAAXCV3G/nsKlL
 DUnw==
X-Gm-Message-State: ACgBeo06ghIhT23kfVumT2DWGwIeSgRc9fyY4aLO1vTJOU5u8rm9Ph7X
 SjNAyjA6AxIjGWejdtxijq90IA==
X-Google-Smtp-Source: AA6agR54UwxPWT+BJOMkCljAJZfwv/32I4EBEEeqIHnPKrlI00ej/DcuGkMtWit4bE0esUs0+oMo5g==
X-Received: by 2002:a17:90a:8c88:b0:1f2:12b0:ae9e with SMTP id
 b8-20020a17090a8c8800b001f212b0ae9emr1208812pjo.42.1659040878988; 
 Thu, 28 Jul 2022 13:41:18 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 ij27-20020a170902ab5b00b0016daee46b72sm1713570plb.237.2022.07.28.13.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 13:41:18 -0700 (PDT)
Date: Thu, 28 Jul 2022 20:41:14 +0000
To: Coleman Dietsch <dietschc@csp.edu>
Subject: Re: [PATCH] KVM: x86/xen: Fix bug in kvm_xen_vcpu_set_attr()
Message-ID: <YuL0auT3lFhfQHeY@google.com>
References: <20220728194736.383727-1-dietschc@csp.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220728194736.383727-1-dietschc@csp.edu>
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

Be more specific in the shortlog.  "Fix a bug in XYZ" doesn't provide any info
about the bug itself, and can even become frustratingly stale if XYZ is renamed.
I believe we should end up with two patches (see below), e.g.

  KVM: x86/xen: Initialize Xen timer only once (when it's NOT running)

and
  
  KVM: x86/xen: Stop Xen timer before changing the IRQ vector

Note, I'm assuming timer_virq is a vector of some form, I haven't actually looked
that far into the code.

On Thu, Jul 28, 2022, Coleman Dietsch wrote:
> This crash appears to be happening when vcpu->arch.xen.timer is already set

Instead of saying "This crash", provide the actual splat (sanitized to make it
more readable).  That way readers, reviewers, and archaeologists don't need to
open up a hyperlink to get details on what broken.

> and kvm_xen_init_timer(vcpu) is called.

Wrap changelogs at ~75 chars.

> During testing with the syzbot reproducer code it seemed apparent that the
> else if statement in the KVM_XEN_VCPU_ATTR_TYPE_TIMER switch case was not
> being reached, which is where the kvm_xen_stop_timer(vcpu) call is located.

Neither the shortlog nor the changelog actually says anything about what is actually
being changed.

> Link: https://syzkaller.appspot.com/bug?id=8234a9dfd3aafbf092cc5a7cd9842e3ebc45fc42
> Reported-and-tested-by: syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com
> Signed-off-by: Coleman Dietsch <dietschc@csp.edu>
> ---
>  arch/x86/kvm/xen.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> index 610beba35907..4b4b985813c5 100644
> --- a/arch/x86/kvm/xen.c
> +++ b/arch/x86/kvm/xen.c
> @@ -707,6 +707,12 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
>  		break;
>  
>  	case KVM_XEN_VCPU_ATTR_TYPE_TIMER:
> +		/* Stop current timer if it is enabled */
> +		if (kvm_xen_timer_enabled(vcpu)) {
> +			kvm_xen_stop_timer(vcpu);
> +			vcpu->arch.xen.timer_virq = 0;
> +		}
> +
>  		if (data->u.timer.port) {
>  			if (data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
>  				r = -EINVAL;

I'm not entirely sure this is correct.  Probably doesn't matter, but there's a
subtle ABI change here in that invoking the ioctl with a "bad" priority will
cancel any existing timer.

And there appear to be two separate bugs: initializing the hrtimer while it's
running, and not canceling a running timer before changing timer_virq.

Calling kvm_xen_init_timer() on "every" KVM_XEN_VCPU_ATTR_TYPE_TIMER is odd and
unnecessary, it only needs to be called once during vCPU setup.  If Xen doesn't
have such a hook, then a !ULL check can be done on vcpu->arch.xen.timer.function
to initialize the timer on-demand.

With that out of the way, the code can be streamlined a bit, e.g. something like
this?

	case KVM_XEN_VCPU_ATTR_TYPE_TIMER:
		if (data->u.timer.port &&
		    data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
			r = -EINVAL;
			break;
		}

		if (!vcpu->arch.xen.timer.function)
			kvm_xen_init_timer(vcpu);

		/* Stop the timer (if it's running) before changing the vector. */
		kvm_xen_stop_timer(vcpu);
		vcpu->arch.xen.timer_virq = data->u.timer.port;

		if (data->u.timer.port && data->u.timer.expires_ns)
			kvm_xen_start_timer(vcpu, data->u.timer.expires_ns,
					    data->u.timer.expires_ns -
					    get_kvmclock_ns(vcpu->kvm));
		r = 0;
		break;

> @@ -720,9 +726,6 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
>  				kvm_xen_start_timer(vcpu, data->u.timer.expires_ns,
>  						    data->u.timer.expires_ns -
>  						    get_kvmclock_ns(vcpu->kvm));
> -		} else if (kvm_xen_timer_enabled(vcpu)) {
> -			kvm_xen_stop_timer(vcpu);
> -			vcpu->arch.xen.timer_virq = 0;
>  		}
>  
>  		r = 0;
> -- 
> 2.34.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
