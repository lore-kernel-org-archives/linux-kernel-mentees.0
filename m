Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7434C19F2B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Jul 2022 22:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5906560D67;
	Thu, 28 Jul 2022 22:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5906560D67
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=6PGeof5t
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ThXHaGtbEe0O; Thu, 28 Jul 2022 22:49:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DC36660608;
	Thu, 28 Jul 2022 22:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC36660608
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACA14C0035;
	Thu, 28 Jul 2022 22:49:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7BCBC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 22:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 807B8403A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 22:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 807B8403A4
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com
 header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=6PGeof5t
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jxkbJ4P1DJga
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 22:49:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FE33400DB
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FE33400DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 22:49:52 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id v185so2473403ioe.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 15:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csp-edu.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=zp3s0H17eNS8RLeZJwuDNDBm2rORUB76Sr+0ULT5CUY=;
 b=6PGeof5tavB8xZZTMvnmR1G9QRO/mLfOjc0reQCxtLSivzfi9q8iDpINmOG3CqIk1J
 V/4tvnXKugAAt21XfV/Z2uiIxw+8hXzLA2dsAv/uoXinTF4o8Nqwz1gfVxY8qwjGwY/g
 ufPTjRpLHsKTfLpawEKVoX2rNyPWNAmDWeHmOBct8AVx0zYE3CiPQ8jV0V4RIpUngPKE
 1fnLh+jaLYGb+QbWJx0XiPPLS/1W7idEyupyUBwnk3IYA1WWk6ObCbHxbzGlYOeQ7hMS
 srTT0S2fMC/rzOYu2eNTUrB+cZyNdLRlHtwIcSDAz3Wu+lGFtnno1DSP3IU7TtdWciEa
 si1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=zp3s0H17eNS8RLeZJwuDNDBm2rORUB76Sr+0ULT5CUY=;
 b=dw9jiW7YQbcrwak0GIGYQaSd0MuJb52cmq9nMYlewlZv+mRBpaOtIXm3OFU3fPiDRg
 xVQqtMqO6JqP53IalXmSPoVIYIf2JQiKnGC3bSKDkIUNLKUOswEfIZ5mPpULByqHt6Ca
 sFJ6ZE0MY6/kIqJJ58zoKfi1HNHZt7BLH5TBMcJ66cMNANTuKBHoQlNT0y8T6z/roxjz
 MC+vHHNu4zOw1Es/IE+JXFetkXy/mwZCGkALMNwELoR/EGfHIHv2Ardc6nBEuUyuSVWP
 9jKDTp0OkgQS12/vykpwsMfaIMiAt3Ysy3hXXnjJjw/T+la8HhTRvll6KkXAxElk/SYg
 o/Cw==
X-Gm-Message-State: AJIora9P1McDF4BhTXei+o9QBt3t0H6LnaP0w2E8Vf0H1Aq0QE/xLXzP
 VtTM7kDqMBPWbgCH4nx1fxdw2g==
X-Google-Smtp-Source: AGRyM1uqTbWLghcYSIroC35qIH2sScjpChjXWce93/xlSm9BiJZwYwxOvdmB3S0gh0B1moTqmpnYeQ==
X-Received: by 2002:a05:6638:270d:b0:33f:3f96:468c with SMTP id
 m13-20020a056638270d00b0033f3f96468cmr394388jav.272.1659048591254; 
 Thu, 28 Jul 2022 15:49:51 -0700 (PDT)
Received: from kernel-dev-1 (75-168-113-69.mpls.qwest.net. [75.168.113.69])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a056602034b00b0067bd23bb692sm853686iou.27.2022.07.28.15.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 15:49:50 -0700 (PDT)
Date: Thu, 28 Jul 2022 17:49:49 -0500
From: Coleman Dietsch <dietschc@csp.edu>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH] KVM: x86/xen: Fix bug in kvm_xen_vcpu_set_attr()
Message-ID: <YuMSjQ3Y2ADA40KV@kernel-dev-1>
References: <20220728194736.383727-1-dietschc@csp.edu>
 <YuL0auT3lFhfQHeY@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YuL0auT3lFhfQHeY@google.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Jul 28, 2022 at 08:41:14PM +0000, Sean Christopherson wrote:
> Be more specific in the shortlog.  "Fix a bug in XYZ" doesn't provide any info
> about the bug itself, and can even become frustratingly stale if XYZ is renamed.
> I believe we should end up with two patches (see below), e.g.
> 
>   KVM: x86/xen: Initialize Xen timer only once (when it's NOT running)
> 
> and
>   
>   KVM: x86/xen: Stop Xen timer before changing the IRQ vector
> 

Got it, I will work on splitting the v2 into a patch set as you suggested
(with better names of course).

> Note, I'm assuming timer_virq is a vector of some form, I haven't actually looked
> that far into the code.
> 
> On Thu, Jul 28, 2022, Coleman Dietsch wrote:
> > This crash appears to be happening when vcpu->arch.xen.timer is already set
> 
> Instead of saying "This crash", provide the actual splat (sanitized to make it
> more readable).  That way readers, reviewers, and archaeologists don't need to
> open up a hyperlink to get details on what broken.
> 
> > and kvm_xen_init_timer(vcpu) is called.
> 
> Wrap changelogs at ~75 chars.
> 
> > During testing with the syzbot reproducer code it seemed apparent that the
> > else if statement in the KVM_XEN_VCPU_ATTR_TYPE_TIMER switch case was not
> > being reached, which is where the kvm_xen_stop_timer(vcpu) call is located.
> 
> Neither the shortlog nor the changelog actually says anything about what is actually
> being changed.
> 

I will make sure to address all these issues in the v2 patch set.

> > Link: https://syzkaller.appspot.com/bug?id=8234a9dfd3aafbf092cc5a7cd9842e3ebc45fc42
> > Reported-and-tested-by: syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com
> > Signed-off-by: Coleman Dietsch <dietschc@csp.edu>
> > ---
> >  arch/x86/kvm/xen.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> > index 610beba35907..4b4b985813c5 100644
> > --- a/arch/x86/kvm/xen.c
> > +++ b/arch/x86/kvm/xen.c
> > @@ -707,6 +707,12 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
> >  		break;
> >  
> >  	case KVM_XEN_VCPU_ATTR_TYPE_TIMER:
> > +		/* Stop current timer if it is enabled */
> > +		if (kvm_xen_timer_enabled(vcpu)) {
> > +			kvm_xen_stop_timer(vcpu);
> > +			vcpu->arch.xen.timer_virq = 0;
> > +		}
> > +
> >  		if (data->u.timer.port) {
> >  			if (data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
> >  				r = -EINVAL;
> 
> I'm not entirely sure this is correct.  Probably doesn't matter, but there's a
> subtle ABI change here in that invoking the ioctl with a "bad" priority will
> cancel any existing timer.
> 

I will try to get some clarification before I send in the next patch.

> And there appear to be two separate bugs: initializing the hrtimer while it's
> running, and not canceling a running timer before changing timer_virq.
> 

This does seem to be the case so I will be splitting v2 into a patch
set.

> Calling kvm_xen_init_timer() on "every" KVM_XEN_VCPU_ATTR_TYPE_TIMER is odd and
> unnecessary, it only needs to be called once during vCPU setup.  If Xen doesn't
> have such a hook, then a !ULL check can be done on vcpu->arch.xen.timer.function
> to initialize the timer on-demand.
> 

Yes I also thought that was a bit odd that kvm_xen_init_timer() is called on "every" KVM_XEN_VCPU_ATTR_TYPE_TIMER 

> With that out of the way, the code can be streamlined a bit, e.g. something like
> this?
> 
> 	case KVM_XEN_VCPU_ATTR_TYPE_TIMER:
> 		if (data->u.timer.port &&
> 		    data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
> 			r = -EINVAL;
> 			break;
> 		}
> 
> 		if (!vcpu->arch.xen.timer.function)
> 			kvm_xen_init_timer(vcpu);
> 
> 		/* Stop the timer (if it's running) before changing the vector. */
> 		kvm_xen_stop_timer(vcpu);
> 		vcpu->arch.xen.timer_virq = data->u.timer.port;
> 
> 		if (data->u.timer.port && data->u.timer.expires_ns)
> 			kvm_xen_start_timer(vcpu, data->u.timer.expires_ns,
> 					    data->u.timer.expires_ns -
> 					    get_kvmclock_ns(vcpu->kvm));
> 		r = 0;
> 		break;
> 

I agree this code could use some cleanup, I'll see what I can do.

> > @@ -720,9 +726,6 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
> >  				kvm_xen_start_timer(vcpu, data->u.timer.expires_ns,
> >  						    data->u.timer.expires_ns -
> >  						    get_kvmclock_ns(vcpu->kvm));
> > -		} else if (kvm_xen_timer_enabled(vcpu)) {
> > -			kvm_xen_stop_timer(vcpu);
> > -			vcpu->arch.xen.timer_virq = 0;
> >  		}
> >  
> >  		r = 0;
> > -- 
> > 2.34.1
> > 

Thank you for the feedback Sean, it has been most helpful!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
