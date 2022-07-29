Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA661C3F6B0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 Jul 2022 18:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B42A8426B;
	Fri, 29 Jul 2022 18:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B42A8426B
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=LiPSLwJZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JV65F_ayvEuw; Fri, 29 Jul 2022 18:46:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7032584645;
	Fri, 29 Jul 2022 18:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7032584645
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12FCFC007C;
	Fri, 29 Jul 2022 18:46:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37306C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 18:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 041DC40BF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 18:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 041DC40BF5
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com
 header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=LiPSLwJZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HiZTWRjQJKlf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 18:46:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCC91404D5
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCC91404D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 18:46:50 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id v185so4239476ioe.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 11:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csp-edu.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=u9UDEya58Yn4eaL4Ab+cCmUC7ZdMS6RpOm/buj/Q9kM=;
 b=LiPSLwJZL5dU61oddu6kmisyqSQRKJ61a+GXtpwW5q1wMCl9/YovV5FcE0XLWrrcDT
 iZ2j88B/wbooCWgqtsgK83DOJOFY4gN8kCJ/C3SwcQp9xpaH9J3gq+TfXAWUEtcB8yv3
 nO4KoydFqc1vNjRcFNP48x7Wh2l6mMY4qgFNH7uX9zCJPyd6jbOky6sL1yiKNwk6bakC
 TsZamQeqAizxF6HByHeGVd1YKYZ2xSuZ5WrR0rkFYcVRhqpzU+g+w1TAzQwBrX7BMjpX
 aLXrfBmzurxiqnBNI2zLYSK9y0MoKc4lKhAHDX6Bxvn2vxpmyeMw1Q+KYgIdpItrkik9
 HFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=u9UDEya58Yn4eaL4Ab+cCmUC7ZdMS6RpOm/buj/Q9kM=;
 b=gIJ+4qbjhvb4ozPxcgXSjQ+Gff1efLJhwDcrWyHjW++XdKMAS4dvM24TnU5qRHq1T9
 a5gHljLlJ5AuazlYUSaIT3XDfsV5YCKKhi1XlKsIR6wCKupVvUnN1JN4o6tL2BPGjI+i
 i95EqCB4BfPQPp1o9IdamtnQg+AYNYTICFOIL7jCqAKTsDZJGEBbtI7BMd9mXw3kszKt
 Xw6y2d3AvfmnYcNn5j8LCNs1FwhNhgrdUtA47Wbm3LQqfOkO5bklc2yD92w9fzSn7Fmz
 Ak3ffAyocQFFBKpXBlJcNRxl+9IHGAURsAyyzJCVfhMc/a7Ke+XEDSsdTLxFCxZx86WX
 yIxQ==
X-Gm-Message-State: AJIora/1V4UQMotULfaSK94RV5lW0IeWXqK7WpHtpvGEhMqqw0UHHSir
 rd1iJYZmgdv+BB4AopyuKael+Q==
X-Google-Smtp-Source: AGRyM1t8c8mcZk2k+Inli2l2P+kqzB6u5o9yb+NDRDNwfhnQ7nvRPfZ+WiCwtTOLu/HspYyoERLtVQ==
X-Received: by 2002:a05:6638:238f:b0:33f:774f:5252 with SMTP id
 q15-20020a056638238f00b0033f774f5252mr1888123jat.216.1659120409992; 
 Fri, 29 Jul 2022 11:46:49 -0700 (PDT)
Received: from kernel-dev-1 (75-168-113-69.mpls.qwest.net. [75.168.113.69])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a0566380d9500b00339e2f0a9bfsm1973517jaj.13.2022.07.29.11.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 11:46:49 -0700 (PDT)
From: Coleman Dietsch <dietschc@csp.edu>
To: kvm@vger.kernel.org
Subject: [PATCH v2 2/2] KVM: x86/xen: Stop Xen timer before changing the IRQ
 vector
Date: Fri, 29 Jul 2022 13:46:40 -0500
Message-Id: <20220729184640.244969-3-dietschc@csp.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220729184640.244969-1-dietschc@csp.edu>
References: <20220729184640.244969-1-dietschc@csp.edu>
MIME-Version: 1.0
Cc: x86@kernel.org, Sean Christopherson <seanjc@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com,
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

This moves the stop xen timer call outside of the previously unreachable
if else statement as well as making sure that the timer is stopped first
before changing IRQ vector. Code was streamlined a bit also.

This was contributing to the ODEBUG bug in kvm_xen_vcpu_set_attr crash that
was discovered by syzbot.

ODEBUG: init active (active state 0)
object type: hrtimer hint: xen_timer_callbac0
RIP: 0010:debug_print_object+0x16e/0x250 lib/debugobjects.c:502
Call Trace:
__debug_object_init
debug_hrtimer_init
debug_init
hrtimer_init
kvm_xen_init_timer
kvm_xen_vcpu_set_attr
kvm_arch_vcpu_ioctl
kvm_vcpu_ioctl
vfs_ioctl

Link: https://syzkaller.appspot.com/bug?id=8234a9dfd3aafbf092cc5a7cd9842e3ebc45fc42
Reported-by: syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com
Signed-off-by: Coleman Dietsch <dietschc@csp.edu>
---
 arch/x86/kvm/xen.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 2dd0f72a62f2..f612fac0e379 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -707,27 +707,26 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
 		break;
 
 	case KVM_XEN_VCPU_ATTR_TYPE_TIMER:
-		if (data->u.timer.port) {
-			if (data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
-				r = -EINVAL;
-				break;
-			}
-			vcpu->arch.xen.timer_virq = data->u.timer.port;
-
-			/* Check for existing timer */
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
 
+		/* Check for existing timer */
+		if (!vcpu->arch.xen.timer.function)
+			kvm_xen_init_timer(vcpu);
+
+		/* Stop the timer (if it's running) before changing the vector */
+		kvm_xen_stop_timer(vcpu);
+		vcpu->arch.xen.timer_virq = data->u.timer.port;
+
+		/* Restart the timer if it's set */
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
