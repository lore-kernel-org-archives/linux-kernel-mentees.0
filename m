Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DED3C25B08
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Aug 2022 19:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C669D607FE;
	Mon,  8 Aug 2022 19:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C669D607FE
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=H4KzTYgN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIudGbsYe7gh; Mon,  8 Aug 2022 19:06:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D2F0B60774;
	Mon,  8 Aug 2022 19:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2F0B60774
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B215DC0033;
	Mon,  8 Aug 2022 19:06:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCF9CC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 19:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C46C740135
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 19:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C46C740135
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com
 header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=H4KzTYgN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJzgrfhPjKlf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 19:06:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E271A400AB
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E271A400AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 19:06:39 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id i84so7874628ioa.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Aug 2022 12:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csp-edu.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uPXo6qTNTanbnXMgeNkm7mqY+PRHfhhWTf2LLd9dBGo=;
 b=H4KzTYgNBlxoPeb/e0rP3AvidLHz6PPSSwBXGXIZ9j4s0sGC1E9Ws14T+f2fVVJV7T
 qVq3wawMz+jNDS8J+hLv028q6pFE/4IMimwcbO51WBMmuvZb6UOmYMuCNEMo2/eTgkap
 F95O0mxB1nqPcGsu263N0xzvReL1Kae+kVTjvKCy3uPlY/qdRopwolHK2jyADUs/lpaI
 uNOJhgc8Gg1qqUz5PnaC3T+a3hJjE3OaPUHlguB8vXPF0dCW5hx1E+I/9WvnD8fwuetG
 k2r8Ku1/Rig/oi6d6Fg5GpjXvDacO4EJRpO2+NEgm+3LDYrBdTgbjhb0sSXI11935FmY
 mmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uPXo6qTNTanbnXMgeNkm7mqY+PRHfhhWTf2LLd9dBGo=;
 b=Fj1vaN4ihbmJIS8F2uMDsIS5OepAw2IXNlCyQWpDQmytprzgnc5DzL6RCgGcZwBNVN
 D1Yq6g8dzN2eAjtuNd/qSy0YJO3Vf5dDkGUp0Gvp4p6SFEvOKzPzh7R2GSmEqU1cAHMP
 ygRdY0mtYgjD22ovKQpyKk+X967o8+NQZjly+B62sd0fW1/4lAd7TUbKe77A7Opl5Aup
 BAb2kDiN9CezsSOsf9GNtnO/OdFXNgZdVHu6RHrgMs9DE9qR66dwgSVZXPbdjlZleq14
 o7QsFWQbI1YHlIN2c61x90b6ns450tmqd6vuEoNbXO90+1cykCAG3yjR+O752WU06Fst
 Kjsg==
X-Gm-Message-State: ACgBeo1+LUtLnnGr4QsCK3QAkxpHWAIykgKe5txMHKpJDtRfYjG2PqYB
 VfcJUzx98CJTlCvUwv/7pWDBxw==
X-Google-Smtp-Source: AA6agR5v8DdlJpjjKMmnyxH00/6twNDvMMlSUi7EF0m/OpuY/fudEGo0kbPzrTu1a05jSdQNAVVc+Q==
X-Received: by 2002:a05:6602:13d5:b0:67c:9149:fe0f with SMTP id
 o21-20020a05660213d500b0067c9149fe0fmr8404219iov.114.1659985598998; 
 Mon, 08 Aug 2022 12:06:38 -0700 (PDT)
Received: from kernel-dev-1 (75-168-113-69.mpls.qwest.net. [75.168.113.69])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a05663810c700b003428c908a12sm5479715jad.32.2022.08.08.12.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 12:06:38 -0700 (PDT)
From: Coleman Dietsch <dietschc@csp.edu>
To: kvm@vger.kernel.org
Subject: [PATCH v3 2/2] KVM: x86/xen: Stop Xen timer before changing IRQ
Date: Mon,  8 Aug 2022 14:06:07 -0500
Message-Id: <20220808190607.323899-3-dietschc@csp.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808190607.323899-2-dietschc@csp.edu>
References: <20220808190607.323899-2-dietschc@csp.edu>
MIME-Version: 1.0
Cc: x86@kernel.org, Sean Christopherson <seanjc@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H . Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Pavel Skripkin <paskripkin@gmail.com>,
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

Stop Xen timer (if it's running) prior to changing the IRQ vector and
potentially (re)starting the timer. Changing the IRQ vector while the
timer is still running can result in KVM injecting a garbage event, e.g.
vm_xen_inject_timer_irqs() could see a non-zero xen.timer_pending from
a previous timer but inject the new xen.timer_virq.

Fixes: 536395260582 ("KVM: x86/xen: handle PV timers oneshot mode")
Cc: stable@vger.kernel.org
Link: https://syzkaller.appspot.com/bug?id=8234a9dfd3aafbf092cc5a7cd9842e3ebc45fc42
Reported-by: syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com
Signed-off-by: Coleman Dietsch <dietschc@csp.edu>
---
 arch/x86/kvm/xen.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 6e554041e862..280cb5dc7341 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -707,26 +707,25 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
 		break;
 
 	case KVM_XEN_VCPU_ATTR_TYPE_TIMER:
-		if (data->u.timer.port) {
-			if (data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
-				r = -EINVAL;
-				break;
-			}
-			vcpu->arch.xen.timer_virq = data->u.timer.port;
-
-			if (!vcpu->arch.xen.timer.function)
-				kvm_xen_init_timer(vcpu);
-
-			/* Restart the timer if it's set */
-			if (data->u.timer.expires_ns)
-				kvm_xen_start_timer(vcpu, data->u.timer.expires_ns,
-						    data->u.timer.expires_ns -
-						    get_kvmclock_ns(vcpu->kvm));
-		} else if (kvm_xen_timer_enabled(vcpu)) {
-			kvm_xen_stop_timer(vcpu);
-			vcpu->arch.xen.timer_virq = 0;
+		if (data->u.timer.port &&
+		    data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
+			r = -EINVAL;
+			break;
 		}
 
+		if (!vcpu->arch.xen.timer.function)
+			kvm_xen_init_timer(vcpu);
+
+		/* Stop the timer (if it's running) before changing the vector */
+		kvm_xen_stop_timer(vcpu);
+		vcpu->arch.xen.timer_virq = data->u.timer.port;
+
+		/* Start the timer if the new value has a valid vector+expiry. */
+		if (data->u.timer.port && data->u.timer.expires_ns)
+			kvm_xen_start_timer(vcpu, data->u.timer.expires_ns,
+					    data->u.timer.expires_ns -
+					    get_kvmclock_ns(vcpu->kvm));
+
 		r = 0;
 		break;
 
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
