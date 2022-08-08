Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F15EC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Aug 2022 16:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 004FA607F2;
	Mon,  8 Aug 2022 16:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 004FA607F2
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=XLeyE1+V
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dAqPuud1ue0n; Mon,  8 Aug 2022 16:50:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C2146605E0;
	Mon,  8 Aug 2022 16:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2146605E0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94A49C0033;
	Mon,  8 Aug 2022 16:50:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE29BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 16:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAD4A40154
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 16:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAD4A40154
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com
 header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=XLeyE1+V
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XGQkY8SpRgvu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 16:50:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1EC2400AC
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1EC2400AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 16:50:43 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id d4so5168176ilc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Aug 2022 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csp-edu.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=Hexph1Ne0TDVhVFt14xW1tLuE+4LWiZPsGHTJhk6mQQ=;
 b=XLeyE1+VrTmXUQ2nuKxWeZrS6RGNB82kYULu/5zVDdOMjPgFEYsh/5xUQlPDftLlVX
 pp5WP5s94cV3P//k6tjaVuhamv4e8D2bOPmdKqvCcOmgWdiTBz6laCXv64U2BSSyh1xP
 mrHxJkviJWuTp2rrlFwPkhpioxvYVp6oejMXqCdAQkEzi9yKSjF31f6os4AZ/bHkoVX4
 Q031O78lM5C9E2x5+Q+Qw9+W2VoR+2hCkZi7BCi+44Wbio7kuUZaSLgp0RN/+bgWg85O
 lMuOF5Lzs7orGDrHSaIGPJO5pnkpVh0jncqrBwKE+94uf3PW4yB/n3n+9FKWHZDrAFiP
 2veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Hexph1Ne0TDVhVFt14xW1tLuE+4LWiZPsGHTJhk6mQQ=;
 b=5FRjCht61mlxONalINGmncnkpJxedsT+/CW8vft1XBX2KfxpJHKSrTEVBWUcGiXcEq
 Lm/9/e3WJl1+eSGQrvYypn+Ufixc1hAEHrB/rvbtU5lU2TozdFbxO/TgRY4mrUcW96r8
 U9MCrU7oEIY15dJ5LGNMreilprFDwLe/4K1ucYtbe7QcAz+EF8AsgIscCjF1W+qI9Ytj
 tibP0PgXdZkd0znzPvs8F2/4Gr9q0QtqN3CdQM1XEu9nXAtooww3ljVGY4Wr3meSAnJ3
 9qYnCILnGtW1I/u6zLtEmGmSOTbuAoIUEFYpNRgy1jtBlwtBendyL4/pGQkmtq9f0S+z
 9AFg==
X-Gm-Message-State: ACgBeo02iPaAD45wO/pVqmgYLzijq4uFx5uH7XU1Ncy2P7RoWPpSVGyX
 DRB7TjqusuhtrCD/nvvYM9c/Rg==
X-Google-Smtp-Source: AA6agR7OlSEq77/USJRGE3OAR3nROR5QRah2QUhx5IjVTD7Exvwq0R1j0aNRbaqDFUfRc7urrOY7fA==
X-Received: by 2002:a92:cda6:0:b0:2df:a33b:202b with SMTP id
 g6-20020a92cda6000000b002dfa33b202bmr6244227ild.161.1659977442615; 
 Mon, 08 Aug 2022 09:50:42 -0700 (PDT)
Received: from kernel-dev-1 (75-168-113-69.mpls.qwest.net. [75.168.113.69])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a0566022d8300b006788259b526sm42598iow.41.2022.08.08.09.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 09:50:42 -0700 (PDT)
Date: Mon, 8 Aug 2022 11:50:41 -0500
From: Coleman Dietsch <dietschc@csp.edu>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v2 1/2] KVM: x86/xen: Initialize Xen timer only once
Message-ID: <YvE+4ZfWJ+86XDA1@kernel-dev-1>
References: <20220729184640.244969-1-dietschc@csp.edu>
 <20220729184640.244969-2-dietschc@csp.edu>
 <Yu1jWSPHiow72qVc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yu1jWSPHiow72qVc@google.com>
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

On Fri, Aug 05, 2022 at 06:37:13PM +0000, Sean Christopherson wrote:
> On Fri, Jul 29, 2022, Coleman Dietsch wrote:
> > Add a check for existing xen timers before initializing a new one.
> > 
> > Currently kvm_xen_init_timer() is called on every
> > KVM_XEN_VCPU_ATTR_TYPE_TIMER, which is causing the following ODEBUG
> > crash when vcpu->arch.xen.timer is already set.
> > 
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
> 
> One uber nit below, otherwise:
> 
> Reviewed-by: Sean Christopherson <seanjc@google.com>
> 

Got it, thanks Sean.

> >  arch/x86/kvm/xen.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
> > index 610beba35907..2dd0f72a62f2 100644
> > --- a/arch/x86/kvm/xen.c
> > +++ b/arch/x86/kvm/xen.c
> > @@ -713,7 +713,10 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
> >  				break;
> >  			}
> >  			vcpu->arch.xen.timer_virq = data->u.timer.port;
> > -			kvm_xen_init_timer(vcpu);
> > +
> > +			/* Check for existing timer */
> 
> I vote to omit the comment, "existing timer" is ambiguous, e.g. it could mean that
> there's an existing _running_ timer as opposed to an existing initialized timer.
> IMO the code is obvious enough on its own.
> 

This makes perfect sense. I will ommit the comment in the next patch.

> > +			if (!vcpu->arch.xen.timer.function)
> > +				kvm_xen_init_timer(vcpu);
> >  
> >  			/* Restart the timer if it's set */
> >  			if (data->u.timer.expires_ns)
> > -- 
> > 2.34.1
> > 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
