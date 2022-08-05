Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88D2C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 18:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D33283E54;
	Fri,  5 Aug 2022 18:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D33283E54
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=A4cz+6MJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBA50S733ASj; Fri,  5 Aug 2022 18:50:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4319383E4B;
	Fri,  5 Aug 2022 18:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4319383E4B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 068CEC0032;
	Fri,  5 Aug 2022 18:50:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC7D5C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 18:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C768F40AB5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 18:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C768F40AB5
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20210112 header.b=A4cz+6MJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1szE_oofgzTY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 18:50:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 407BF40327
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 407BF40327
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 18:50:20 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id r186so3388538pgr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Aug 2022 11:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=IcI0dLC9PfhjnsRXg+d0B7Dkxih292fFLLz0vnGA0yk=;
 b=A4cz+6MJrIAigBX3SMz8GASWuAFGOE2ABZwdbuYRFcUm88GxYfjBG4qljFTZOuYtUq
 Wa9gINp37YjkMMvityfLVreV1kl61mG4sMbGJMS5nqt4dOeLS0QJ5Elt1fgOOhgJAB6Q
 BfjXNg3mF9lnychcnaCeFa+UjZVag+o67gDTNSMuKB1qbPpdvhg5GvJUlgrEsxZdBxkv
 esLu6LSuaHxQ4ng6AvGy4HKv/E/xJuG987BHT2Fncs30Ry5cAGjVPZyew2HhZ3twL6jI
 6gMefXAI3egr2B0tOlcAuaRvGrzQLK9rNAMUHs8Deys22SKcFt5QOxlUev3TdpryUw56
 nW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=IcI0dLC9PfhjnsRXg+d0B7Dkxih292fFLLz0vnGA0yk=;
 b=zADHZJJ8tZuzl7Sq+fkBfDmPYUIEmIN5vWWsElKC3Nk/fXIEwpucjlZQUOz89XORpv
 jAiJJxt+nxcvtATL2BjudmwzYcNHcgZV5iTWowSTYCtlZYjQewU7OJCZuw/6LIDBOE/w
 2bcjoevHfVU90a245nhG4okFTmgoUPLJ4Vu2xN32bESTagbW2NnR5LoMd2cbgF87K6DQ
 pD/FTWpaS2wACtKAdUk0axv4dCe2Ygz7kg8VQBBaPAf2tzBmoxhFv9uclnCLcopVD2HB
 xi3nhcWF0/wUzrMJ3uohFUVofHU+sDT+cMjLK1SFO94VnTiqWiVmoOmXzUnFj7nK8/e0
 6/SA==
X-Gm-Message-State: ACgBeo2FPaUS2wESI+mp9s3qhE81J2EAnNVHKBrb1lnC5oKEvpPhZmJv
 IpjKnNCwIz9dCo9FCtLBMZjN5w==
X-Google-Smtp-Source: AA6agR5lmpe/MTkZsFSxmfgL2Dw/FuKlbLRGdONHPB/BeqByVsc7b8wIBZS5DjYiZeKGpHOY+ohKvw==
X-Received: by 2002:a63:6941:0:b0:41c:9703:d2ea with SMTP id
 e62-20020a636941000000b0041c9703d2eamr6655204pgc.304.1659725419479; 
 Fri, 05 Aug 2022 11:50:19 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 u2-20020a170902e5c200b0016ec8286733sm3377528plf.243.2022.08.05.11.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 11:50:19 -0700 (PDT)
Date: Fri, 5 Aug 2022 18:50:15 +0000
To: Coleman Dietsch <dietschc@csp.edu>
Subject: Re: [PATCH v2 2/2] KVM: x86/xen: Stop Xen timer before changing the
 IRQ vector
Message-ID: <Yu1mZyJeYf/0/LP+@google.com>
References: <20220729184640.244969-1-dietschc@csp.edu>
 <20220729184640.244969-3-dietschc@csp.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220729184640.244969-3-dietschc@csp.edu>
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
> This moves the stop xen timer call outside of the previously unreachable

Please avoid "This", "This patch", etc... and describe what the change is, not
what the patch is.

> if else statement as well as making sure that the timer is stopped first
> before changing IRQ vector. Code was streamlined a bit also.

Generally speaking, don't describe the literal code changes, e.g. write the changelog
as if you were describing the bug and the fix to someone in a verbal conversation.

> This was contributing to the ODEBUG bug in kvm_xen_vcpu_set_attr crash that
> was discovered by syzbot.

That's not proper justification as it doesn't explain why this patch is needed
even after fixing the immedate cause of the ODEBUG splat.

  Stop Xen's timer (if it's running) prior to changing the vector and
  potentially (re)starting the timer.  Changing the vector while the timer
  is still running can result in KVM injecting a garbage event, e.g.
  vm_xen_inject_timer_irqs() could see a non-zero xen.timer_pending from
  a previous timer but inject the new xen.timer_virq.

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
>  arch/x86/kvm/xen.c | 37 ++++++++++++++++++-------------------
>  1 file changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> index 2dd0f72a62f2..f612fac0e379 100644
> --- a/arch/x86/kvm/xen.c
> +++ b/arch/x86/kvm/xen.c
> @@ -707,27 +707,26 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
>  		break;
>  
>  	case KVM_XEN_VCPU_ATTR_TYPE_TIMER:
> -		if (data->u.timer.port) {
> -			if (data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
> -				r = -EINVAL;
> -				break;
> -			}
> -			vcpu->arch.xen.timer_virq = data->u.timer.port;
> -
> -			/* Check for existing timer */
> -			if (!vcpu->arch.xen.timer.function)
> -				kvm_xen_init_timer(vcpu);
> -
> -			/* Restart the timer if it's set */
> -			if (data->u.timer.expires_ns)
> -				kvm_xen_start_timer(vcpu, data->u.timer.expires_ns,
> -						    data->u.timer.expires_ns -
> -						    get_kvmclock_ns(vcpu->kvm));
> -		} else if (kvm_xen_timer_enabled(vcpu)) {
> -			kvm_xen_stop_timer(vcpu);
> -			vcpu->arch.xen.timer_virq = 0;
> +		if (data->u.timer.port &&
> +		    data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
> +			r = -EINVAL;
> +			break;
>  		}
>  
> +		/* Check for existing timer */
> +		if (!vcpu->arch.xen.timer.function)
> +			kvm_xen_init_timer(vcpu);
> +
> +		/* Stop the timer (if it's running) before changing the vector */
> +		kvm_xen_stop_timer(vcpu);
> +		vcpu->arch.xen.timer_virq = data->u.timer.port;
> +
> +		/* Restart the timer if it's set */

The "if it's set" part is stale, maybe this?

		/* Start the timer if the new value has a valid vector+expiry. */

> +		if (data->u.timer.port && data->u.timer.expires_ns)
> +			kvm_xen_start_timer(vcpu, data->u.timer.expires_ns,
> +					    data->u.timer.expires_ns -
> +					    get_kvmclock_ns(vcpu->kvm));
> +
>  		r = 0;
>  		break;
>  
> -- 
> 2.34.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
