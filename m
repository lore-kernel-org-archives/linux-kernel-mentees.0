Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1445CC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Aug 2022 19:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD62607F2;
	Mon,  8 Aug 2022 19:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FD62607F2
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=KnuCUT3+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tDp1fo4Cq2-d; Mon,  8 Aug 2022 19:06:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A6F81605AE;
	Mon,  8 Aug 2022 19:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6F81605AE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79F15C0033;
	Mon,  8 Aug 2022 19:06:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B3C3C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 19:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6F3C400FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 19:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6F3C400FD
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com
 header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=KnuCUT3+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iOxGBUMGVfhI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 19:06:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFB7F400AB
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFB7F400AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 19:06:37 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id y82so1043163iof.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Aug 2022 12:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csp-edu.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=DfkYWLinzITcd/FJI51hf3bH49wjjl87W/fTyl+XXYA=;
 b=KnuCUT3+QBXT0EVXP+LbdiSG5CLJ3zJmeNDuR+4pqdnGPgyDrAg7SnOg8S1imSdBkf
 MtLWzaleN9Zvz8IwTnM4do1QofcWTqe8Jq2AMdRxO3aRnWuEH/Eu6rcGWyweC0GZQ4nb
 kU433WHsLh3X0wXBa9p01pHjHYZpDMocJkCxizLpVE0Sduc+GWzWGH0chtieR7/BDp0D
 cijh+MCJGYfQnXcdnARpuNT25CsPPeoklFEuhrA44f6aWpu8F5h4HZeDNymhEvYvA1dg
 Muu9xYQU3NT6ZRwXYPhgg/xRD2lfeILv6lS/N9YWuaTxTyB2wOadymrXSjFdKn7VS6SE
 17Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=DfkYWLinzITcd/FJI51hf3bH49wjjl87W/fTyl+XXYA=;
 b=mbICBpddesbgGx1binKUMsOO8H9287At0NoxrR3yVtFUTpIo0lB8HihAtW70c5vSEH
 JegIR6Aymj12eUvpMv8mP4Vq0TID+HgbSXUK5cAjG+uLSGpmvG9XZar9PEEbQeZzbQcN
 ELlBF3tnJSIi5TCtaSPNKxon00xv+bfpmcPrIQIVQ9NBqD3H9rNKm9tfDVxPGYh+j7mk
 VXIujzrnHLH+o8ByFqLXwJMvxD2M+7JgB2YW5FRR1oc4ZsmnQRnlrJUH3qccBe1fe9pN
 gjkWeGpPHOwJWwh9rSSCD1EReCGfUSXFfmLrFOS+nCS5e/n4ZafXMfr1QVjU7nzWe8rU
 YBnA==
X-Gm-Message-State: ACgBeo3soMlHZHhMiZoxaIxVZImr+bidwETNHOKGXhX9nTcZGmUCkbJo
 tN6InwjbloeH2Se3G9z6BFUePQ==
X-Google-Smtp-Source: AA6agR4juG/N3jgczX70o0Dl3DOvEQ4/ob1i7PWSjLhiBKoVD/uHlbCBcNDorCHqYK4EVygW1FnuOg==
X-Received: by 2002:a02:238b:0:b0:33f:4ccb:3139 with SMTP id
 u133-20020a02238b000000b0033f4ccb3139mr8959740jau.20.1659985596901; 
 Mon, 08 Aug 2022 12:06:36 -0700 (PDT)
Received: from kernel-dev-1 (75-168-113-69.mpls.qwest.net. [75.168.113.69])
 by smtp.gmail.com with ESMTPSA id
 c29-20020a02331d000000b003429ee6ca96sm5380638jae.1.2022.08.08.12.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 12:06:36 -0700 (PDT)
From: Coleman Dietsch <dietschc@csp.edu>
To: kvm@vger.kernel.org
Subject: [PATCH v3 1/2] KVM: x86/xen: Initialize Xen timer only once
Date: Mon,  8 Aug 2022 14:06:06 -0500
Message-Id: <20220808190607.323899-2-dietschc@csp.edu>
X-Mailer: git-send-email 2.34.1
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

Fixes: 536395260582 ("KVM: x86/xen: handle PV timers oneshot mode")
Cc: stable@vger.kernel.org
Link: https://syzkaller.appspot.com/bug?id=8234a9dfd3aafbf092cc5a7cd9842e3ebc45fc42
Reported-by: syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com
Signed-off-by: Coleman Dietsch <dietschc@csp.edu>
---
 arch/x86/kvm/xen.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index a0c05ccbf4b1..6e554041e862 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -713,7 +713,9 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
 				break;
 			}
 			vcpu->arch.xen.timer_virq = data->u.timer.port;
-			kvm_xen_init_timer(vcpu);
+
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
