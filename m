Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C761C25B08
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Aug 2022 17:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0E7982AB9;
	Mon,  8 Aug 2022 17:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0E7982AB9
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=sKG1tRb9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2nMDSaPV7Vt; Mon,  8 Aug 2022 17:01:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CEC9C828AF;
	Mon,  8 Aug 2022 17:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC9C828AF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5EA4C0033;
	Mon,  8 Aug 2022 17:01:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D0F2C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 17:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67791828AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67791828AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVigaau6ulZK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 17:01:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54374827D9
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54374827D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 17:01:02 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id z8so3895559ile.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Aug 2022 10:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csp-edu.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=+dJtRlmFjt91K9tF3wZ5b+WYiCa7+aYk2YzrQB9nc/4=;
 b=sKG1tRb9wl6bKoNiuIS35OYXXdkOJ0X8XjeORGEnfVb/XUHTmKA2Fav2Kb1WruerUH
 2d/zTSw7GvqRwQOG0tYXh8lZuoiPsmYXosjKNiW8WJR3V/445UzxVPvr85vDw75FW/l6
 Xwn4btdNh90enwMgeHxTM0LkG7webzfC8CsSKuMv57Aq9kUz9gOg8TcMFvsd/j2fbaNr
 HtCtiomms0SWv7uC8HUnQYwHG6imSYVF5cphwDXuPIDRhClxsPAbFIEbndLA7iEVCci/
 0l3L8kz3R4yiawJoprvdICLOnOkeQrF1SHrkbhSfY7cMq805JBEd4iIECh5KtMAwuxVq
 tXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=+dJtRlmFjt91K9tF3wZ5b+WYiCa7+aYk2YzrQB9nc/4=;
 b=7jF8EysODle0jmnQSyc/pswyNfytcfno6Cfpg89c6FLYaBsIwWoKsu6fIxhfuB5WhZ
 VBjKMYSUZ0E14EGjQojyH65EXIX+pubDJ7cRyHVG8al3hKWrbrBzeSR0zktFrsp6C9Wo
 HjddIbZPiZ2FffUN4/+EBVWp5UNL/vgAKaLZD0qn3KIf+VVguUmMvbjcIKnlmP9ly0Mc
 nM6M8rP0+DKXVz8w+2wGLoaxA2Oom/+TUN4MFsSrnzUM4oCZmi3EQUrahjjK3BXYGaGd
 FApTsn8EsjeukrYQO2GjmgHA6LOa/xUWNmDxFjko56Sgu3yrvjkZbd/JClBsrn5nTxP5
 UdXA==
X-Gm-Message-State: ACgBeo3TFApCq1vCJzJ3d71TVynvRJnryMDDeuoAzAe6TBtWakvlnHG9
 8u1a6MrN9Py2bCH+2cwle8hYYA==
X-Google-Smtp-Source: AA6agR7WppV+RrWFuGSA7HHyqYMM1k2sgffgvpE/yI/hlGkpL+0PkCOwcxTzuwERpVONAk1THiXP+g==
X-Received: by 2002:a05:6e02:178d:b0:2de:a00d:d06c with SMTP id
 y13-20020a056e02178d00b002dea00dd06cmr8946772ilu.142.1659978061392; 
 Mon, 08 Aug 2022 10:01:01 -0700 (PDT)
Received: from kernel-dev-1 (75-168-113-69.mpls.qwest.net. [75.168.113.69])
 by smtp.gmail.com with ESMTPSA id
 u68-20020a022347000000b00339c3906b08sm5406500jau.177.2022.08.08.10.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 10:01:01 -0700 (PDT)
Date: Mon, 8 Aug 2022 12:00:59 -0500
From: Coleman Dietsch <dietschc@csp.edu>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v2 2/2] KVM: x86/xen: Stop Xen timer before changing the
 IRQ vector
Message-ID: <YvFBS04HIDTpnca8@kernel-dev-1>
References: <20220729184640.244969-1-dietschc@csp.edu>
 <20220729184640.244969-3-dietschc@csp.edu>
 <Yu1mZyJeYf/0/LP+@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yu1mZyJeYf/0/LP+@google.com>
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

On Fri, Aug 05, 2022 at 06:50:15PM +0000, Sean Christopherson wrote:
> On Fri, Jul 29, 2022, Coleman Dietsch wrote:
> > This moves the stop xen timer call outside of the previously unreachable
> 
> Please avoid "This", "This patch", etc... and describe what the change is, not
> what the patch is.
> 
> > if else statement as well as making sure that the timer is stopped first
> > before changing IRQ vector. Code was streamlined a bit also.
> 
> Generally speaking, don't describe the literal code changes, e.g. write the changelog
> as if you were describing the bug and the fix to someone in a verbal conversation.
> 

Understood.

> > This was contributing to the ODEBUG bug in kvm_xen_vcpu_set_attr crash that
> > was discovered by syzbot.
> 
> That's not proper justification as it doesn't explain why this patch is needed
> even after fixing the immedate cause of the ODEBUG splat.
> 
>   Stop Xen's timer (if it's running) prior to changing the vector and
>   potentially (re)starting the timer.  Changing the vector while the timer
>   is still running can result in KVM injecting a garbage event, e.g.
>   vm_xen_inject_timer_irqs() could see a non-zero xen.timer_pending from
>   a previous timer but inject the new xen.timer_virq.
> 

Thanks for helping clarify this Sean.

> > ODEBUG: init active (active state 0)
> > object type: hrtimer hint: xen_timer_callbac0
> > RIP: 0010:debug_print_object+0x16e/0x250 lib/debugobjects.c:502
> > Call Trace:
> > __debug_object_init
> > debug_hrtimer_init
> > debug_init
> > hrtimer_init
> > kvm_xen_init_timer
> > kvm_xen_vcpu_set_attr
> > kvm_arch_vcpu_ioctl
> > kvm_vcpu_ioctl
> > vfs_ioctl
> > 
> 
> Fixes: 536395260582 ("KVM: x86/xen: handle PV timers oneshot mode")
> Cc: stable@vger.kernel.org
> 
> > Link: https://syzkaller.appspot.com/bug?id=8234a9dfd3aafbf092cc5a7cd9842e3ebc45fc42
> > Reported-by: syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com
> > Signed-off-by: Coleman Dietsch <dietschc@csp.edu>
> > ---
> >  arch/x86/kvm/xen.c | 37 ++++++++++++++++++-------------------
> >  1 file changed, 18 insertions(+), 19 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> > index 2dd0f72a62f2..f612fac0e379 100644
> > --- a/arch/x86/kvm/xen.c
> > +++ b/arch/x86/kvm/xen.c
> > @@ -707,27 +707,26 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
> >  		break;
> >  
> >  	case KVM_XEN_VCPU_ATTR_TYPE_TIMER:
> > -		if (data->u.timer.port) {
> > -			if (data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
> > -				r = -EINVAL;
> > -				break;
> > -			}
> > -			vcpu->arch.xen.timer_virq = data->u.timer.port;
> > -
> > -			/* Check for existing timer */
> > -			if (!vcpu->arch.xen.timer.function)
> > -				kvm_xen_init_timer(vcpu);
> > -
> > -			/* Restart the timer if it's set */
> > -			if (data->u.timer.expires_ns)
> > -				kvm_xen_start_timer(vcpu, data->u.timer.expires_ns,
> > -						    data->u.timer.expires_ns -
> > -						    get_kvmclock_ns(vcpu->kvm));
> > -		} else if (kvm_xen_timer_enabled(vcpu)) {
> > -			kvm_xen_stop_timer(vcpu);
> > -			vcpu->arch.xen.timer_virq = 0;
> > +		if (data->u.timer.port &&
> > +		    data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
> > +			r = -EINVAL;
> > +			break;
> >  		}
> >  
> > +		/* Check for existing timer */
> > +		if (!vcpu->arch.xen.timer.function)
> > +			kvm_xen_init_timer(vcpu);
> > +
> > +		/* Stop the timer (if it's running) before changing the vector */
> > +		kvm_xen_stop_timer(vcpu);
> > +		vcpu->arch.xen.timer_virq = data->u.timer.port;
> > +
> > +		/* Restart the timer if it's set */
> 
> The "if it's set" part is stale, maybe this?
> 
> 		/* Start the timer if the new value has a valid vector+expiry. */
> 

Agreed, I'll clean that comment up a bit.

> > +		if (data->u.timer.port && data->u.timer.expires_ns)
> > +			kvm_xen_start_timer(vcpu, data->u.timer.expires_ns,
> > +					    data->u.timer.expires_ns -
> > +					    get_kvmclock_ns(vcpu->kvm));
> > +
> >  		r = 0;
> >  		break;
> >  
> > -- 
> > 2.34.1
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
