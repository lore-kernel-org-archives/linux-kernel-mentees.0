Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DA0C19F2A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 Jul 2022 18:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 466A9421F0;
	Fri, 29 Jul 2022 18:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 466A9421F0
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=t8xemHbM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPqiF9a_CHk5; Fri, 29 Jul 2022 18:46:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1ADCF421C4;
	Fri, 29 Jul 2022 18:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ADCF421C4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB041C0033;
	Fri, 29 Jul 2022 18:46:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07C92C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 18:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAD2D40BF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 18:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAD2D40BF5
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com
 header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=t8xemHbM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3jcxcVgkrvU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 18:46:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E606240C4A
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E606240C4A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 18:46:48 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id b12so2142558ils.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 11:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csp-edu.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=n9k2YMAlV+e8e432QUJ2PyPKup021wpFALKoUT5LbfA=;
 b=t8xemHbMEOFF8aIZYKKQUu/GtHy43f3Fqg86S8UanB4LEb84lG9couq0EXyiscKOfM
 vCmBKRhkZZtyGzmbMzuTeGjkAFGdp7rbh9+8ds5DjoILSUOTJGi6YLs1sNpGuZzbUEZH
 10iSC8S7U1sRfpantRGB8LOKZN+UfLRp+uJHFQo0q7uiaN5bWWZooFq+yCWCmv31FnDm
 v7teJTYMhnqt81hUFBaVeJ2NurQ6NaDdiQF5Hl/oHKELjczbj7Odbf59Om4/wVI7kheC
 eHxwbTXv3982ju0Rm16EYWrRG4XfUdqDanShbkp9Li0zMPdkSh9WLWyx/8scNJsMnA5V
 NcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=n9k2YMAlV+e8e432QUJ2PyPKup021wpFALKoUT5LbfA=;
 b=mPJF9u815ceBcKiDqfW1C+ECb4PxwxDuHqVq/vmpKzNQPZkVME4hJxFAjj6gk1TIR6
 ugq50SenggSI9TQkKgVSUOByOOFLoN9KiNeNA4x3CCAx9EjLLQJpUALqlH5YherE4eeA
 VmIK+rmyqrs8QXhJwp1QltotuDHB2ZGVS3n75cyGt7dq23pcx5158g4TWa4+8iB58f/0
 93nNmFEf6iAxtk42P1ilGsWwUNzKFH7U6Z3KXYGsnClwkWOPjb9Q0gVi684MA9QwmBqc
 a+6K+hloQB8qBoa25yURMllWf84Hk7h0wpGPPbZTB5vVwMXjV9VH6Uhc7a8HTW51hLrM
 sThA==
X-Gm-Message-State: AJIora8I+/ycJ184CeqQq51Xa7M/KmI9qDJd6Q5L0O1vmPO+JjHthd4x
 rDv/j3tlABaJGxuOe7YPzcVr4Q==
X-Google-Smtp-Source: AGRyM1tMybxHnE1PTpdbKjHoSc/38FzbC7CdYsABqDMQN8d/mR8rV/1QXfGZp0Nt9aj937GQq6ocFg==
X-Received: by 2002:a05:6e02:160a:b0:2dc:12db:121 with SMTP id
 t10-20020a056e02160a00b002dc12db0121mr2026813ilu.117.1659120407979; 
 Fri, 29 Jul 2022 11:46:47 -0700 (PDT)
Received: from kernel-dev-1 (75-168-113-69.mpls.qwest.net. [75.168.113.69])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a02a118000000b0033f7d500749sm1949399jag.128.2022.07.29.11.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 11:46:47 -0700 (PDT)
From: Coleman Dietsch <dietschc@csp.edu>
To: kvm@vger.kernel.org
Subject: [PATCH v2 1/2] KVM: x86/xen: Initialize Xen timer only once
Date: Fri, 29 Jul 2022 13:46:39 -0500
Message-Id: <20220729184640.244969-2-dietschc@csp.edu>
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

Add a check for existing xen timers before initializing a new one.

Currently kvm_xen_init_timer() is called on every
KVM_XEN_VCPU_ATTR_TYPE_TIMER, which is causing the following ODEBUG
crash when vcpu->arch.xen.timer is already set.

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
 arch/x86/kvm/xen.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 610beba35907..2dd0f72a62f2 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -713,7 +713,10 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
 				break;
 			}
 			vcpu->arch.xen.timer_virq = data->u.timer.port;
-			kvm_xen_init_timer(vcpu);
+
+			/* Check for existing timer */
+			if (!vcpu->arch.xen.timer.function)
+				kvm_xen_init_timer(vcpu);
 
 			/* Restart the timer if it's set */
 			if (data->u.timer.expires_ns)
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
