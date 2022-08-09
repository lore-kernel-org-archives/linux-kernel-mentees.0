Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2B9C19F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  9 Aug 2022 14:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D14540A20;
	Tue,  9 Aug 2022 14:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D14540A20
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TaXG+ej0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hSYpR6lB0IjX; Tue,  9 Aug 2022 14:40:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 10A02409EF;
	Tue,  9 Aug 2022 14:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10A02409EF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4666C0033;
	Tue,  9 Aug 2022 14:40:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F8A3C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 14:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A0ED60EF2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 14:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A0ED60EF2
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20210112 header.b=TaXG+ej0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mn1Fgwy82Yap
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 14:40:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39CE260634
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39CE260634
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  9 Aug 2022 14:40:33 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id pm17so11884007pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 09 Aug 2022 07:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=OdbOjGUjW12bCfbeWBjGSJ1Nu6Rk3c5Ky+ZI53W01wg=;
 b=TaXG+ej0jDZE0fRN4noaJtSFB5ltkCHj7OE6Qr0NL5hSpQhtaKSX0RdDRHiXlYQdy7
 MSEMDDxfpGEWa+w6jBWpVEwFG41oOAiq602dOmmdikaoW+Jsupla/nPEcG2Wug4G8QeI
 R/6wu3IwfV1cXrxn1hb2o5uHm34Q7XMdvKznNBglR8Vqp2fkXdJwB9/T97p/P5tbfJC2
 iJC6RTuGl32t6ZBKATAv6goAxQVAAVbtv3vsIH6qp290lpHClC8dvzuVSIkWK6lUJDt0
 ctBxtIYfoWBW7cm+VQpAFbdsgBentT5METMZgPILhQltDG0Q34WrrfR8jy3B1NmYNvwD
 EmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=OdbOjGUjW12bCfbeWBjGSJ1Nu6Rk3c5Ky+ZI53W01wg=;
 b=YaaINlLLRSamhbDQRiQPo/KoHcZwiu/xSC4Nnw58ivfsNp054V4UrTpQDMNoexxpqW
 j7AHqpkPUSVfhYZxFQyTcF+ET6q+JsWgRQZrBhKncnfAv9ZV6aUBSdHtRhe11eSraOLP
 KuE5F1OwifvIAaUS+FbMkhoEmwKA3Qd9bC8D8Vqofuu3W6JZoUSQPi1F48Xt9EF1n+bC
 BhTmgRUB+ceA9QOYZ9e/+TER21Un5tVmg0cCEAouimZm14U/DwuyEurjtUsi1XAf5HSh
 5MD1gJLyZmGNeAGt/svlgRJWEADVv2x3Q4mYSniPxVVoOrGTHRCGraQyReHA6qtrJHpE
 JtkQ==
X-Gm-Message-State: ACgBeo271QONIyvxFmfizElD+SgnRWrDUcs7zBjPy6JVXS/wSptdPs+v
 fc3par7g3cHbBooFSP8CjtCJ+A==
X-Google-Smtp-Source: AA6agR5dJBGAgBiZdySMn0shi1wg9/jp8sdMtEe28i2vcg1gxytljbDTOA1J7khCTdbdWwzUz3C3pA==
X-Received: by 2002:a17:903:22c1:b0:16f:3d1:f5c with SMTP id
 y1-20020a17090322c100b0016f03d10f5cmr23843077plg.155.1660056032526; 
 Tue, 09 Aug 2022 07:40:32 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 q11-20020a170902dacb00b0016dcfedfe30sm11056894plx.90.2022.08.09.07.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 07:40:31 -0700 (PDT)
Date: Tue, 9 Aug 2022 14:40:28 +0000
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 2/2] KVM: x86/xen: Stop Xen timer before changing IRQ
Message-ID: <YvJx3Dje4zS/c+H0@google.com>
References: <20220808190607.323899-2-dietschc@csp.edu>
 <20220808190607.323899-3-dietschc@csp.edu>
 <c648744c096588d30771a22efa6d65c31fffd06c.camel@infradead.org>
 <43e258cc-71ac-bde4-d1f8-9eb9519928d3@redhat.com>
 <4fc1371b83001b4eed1617c37bec6b9d007e45c2.camel@infradead.org>
 <YvJqIsQsg+ThMg/C@google.com>
 <0b5dcab333906f166fcdbc296373cc5e08bec79f.camel@infradead.org>
 <953d2e99-ed1a-384d-6d3a-0f656a243f82@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <953d2e99-ed1a-384d-6d3a-0f656a243f82@redhat.com>
Cc: x86@kernel.org, metikaya <metikaya@amazon.co.uk>, kvm@vger.kernel.org,
 Pavel Skripkin <paskripkin@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
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

On Tue, Aug 09, 2022, Paolo Bonzini wrote:
> On 8/9/22 16:16, David Woodhouse wrote:
> > I find the new version a bit harder to follow, with its init-then-stop-
> > then-start logic:
> > 
> > 	case KVM_XEN_VCPU_ATTR_TYPE_TIMER:
> > 		if (data->u.timer.port &&
> > 		    data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
> > 			r = -EINVAL;
> > 			break;
> >                  }
> > 
> > 		if (!vcpu->arch.xen.timer.function)
> > 			kvm_xen_init_timer(vcpu);
> > 
> > 		/* Stop the timer (if it's running) before changing the vector */
> > 		kvm_xen_stop_timer(vcpu);
> > 		vcpu->arch.xen.timer_virq = data->u.timer.port;
> 
> 
> I think this is fine, if anything the kvm_xen_stop_timer() call could be
> placed in an "else" but I'm leaning towards applying this version of the
> patch.

I wanted to separate the "init" from the "stop+start", e.g. if there were a more
appropriate place for invoking kvm_xen_init_timer() I would have suggested moving
the call outside of KVM_XEN_VCPU_ATTR_TYPE_TIMER entirely.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
