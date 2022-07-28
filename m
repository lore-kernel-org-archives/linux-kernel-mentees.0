Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CA7C19F2B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Jul 2022 19:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CB634154D;
	Thu, 28 Jul 2022 19:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CB634154D
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4/hLevQ+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YLv9bLlORyzV; Thu, 28 Jul 2022 19:49:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 12DD441524;
	Thu, 28 Jul 2022 19:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12DD441524
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC6B0C0033;
	Thu, 28 Jul 2022 19:49:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3D32C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 19:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97EBD813DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 19:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97EBD813DB
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com
 header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4/hLevQ+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q_6DG2NK-hm3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 19:49:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A06F813AF
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A06F813AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 19:49:35 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id l24so2156641ion.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jul 2022 12:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csp-edu.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=hNrqN7wUMWjrs6dVVTuGDTVJ+Qagz9kPXPbUwKiCccA=;
 b=4/hLevQ+OVFoShgowRXTnBTJZeVcb9IsOtoG7xEDtgjD+GemPnRjK7pGxGHonrEEDJ
 HrlumeJPKhTUfuAT5Qcc0Wd+vfRhfIB+e1LQrescrlZ/dTw+UPL+KSJjVuOmRz0/aMI+
 wwvZ6K8WUytEF7Pp3VRbGwqfEbPC5NpyGa92Rt0JNdvCgfhELtuBSH73CAXzwJ+mYr9K
 1LPOHDUHgu2Aawq2UPog7MdwmnwqZqo02CVxadVBYG0/88bK0mUto0BEmomb6QosYY97
 gdYbkp5To2brnIGN7ztWxQ8evN5ra+gRvH9+R+/3uNZF0D++B/S4RmFXngvshKHMuAdw
 lWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=hNrqN7wUMWjrs6dVVTuGDTVJ+Qagz9kPXPbUwKiCccA=;
 b=164WjYYi4SSxn3PQBC5oRPr3iy80R6KhfR9iBlmrCkpU8Uy0r8/WPVerD/tnQZBTGw
 10nBxry3NzP1Y/7wZryMMKGXPkegGGeAwn1KEb+3V0SIlMC5/Bb/DgbKxGfcsSYF9Bdl
 oLtaXsyIUu/eyyZAwUa/YClkWdqu2hkfLHV1L9RAZg16iSmAOAUhxyuUFD1n7+l0MOgl
 0zMvmzu/x0KNFoUfLetwUBMurify3qJmPN0WFBA+WBrKjD2Rk5famWInpH/oh7SoNB5k
 D1DtbLzgsQBb07ILYNp7hz+t3vNB4l+Ni/SsjtzCm6TbAr5hd8/ShWTqgJNb/Wpfyhd8
 6FCA==
X-Gm-Message-State: AJIora+VghWeMgwNsUu5ZflbxNdiPxEs+3YxDj2DL1lWuBETc5Pb54GF
 sZ5nxI3Ya+JxNHAf5/PMZByLeg==
X-Google-Smtp-Source: AGRyM1vYw2WcsBR2Cnaxt6yfwVR7SG0qg1zyCShe/bZ3GlR7JtB9v75m4gWtCzSuONqYwXq1j54WVg==
X-Received: by 2002:a05:6602:3805:b0:67b:d39a:3c8b with SMTP id
 bb5-20020a056602380500b0067bd39a3c8bmr65060iob.51.1659037775255; 
 Thu, 28 Jul 2022 12:49:35 -0700 (PDT)
Received: from kernel-dev-1 (75-168-113-69.mpls.qwest.net. [75.168.113.69])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a0566022c8100b0067b74df7960sm682102iow.32.2022.07.28.12.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 12:49:34 -0700 (PDT)
From: Coleman Dietsch <dietschc@csp.edu>
To: kvm@vger.kernel.org
Subject: [PATCH] KVM: x86/xen: Fix bug in kvm_xen_vcpu_set_attr()
Date: Thu, 28 Jul 2022 14:47:37 -0500
Message-Id: <20220728194736.383727-1-dietschc@csp.edu>
X-Mailer: git-send-email 2.34.1
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

This crash appears to be happening when vcpu->arch.xen.timer is already set and kvm_xen_init_timer(vcpu) is called.

During testing with the syzbot reproducer code it seemed apparent that the else if statement in the KVM_XEN_VCPU_ATTR_TYPE_TIMER switch case was not being reached, which is where the kvm_xen_stop_timer(vcpu) call is located.

Link: https://syzkaller.appspot.com/bug?id=8234a9dfd3aafbf092cc5a7cd9842e3ebc45fc42
Reported-and-tested-by: syzbot+e54f930ed78eb0f85281@syzkaller.appspotmail.com
Signed-off-by: Coleman Dietsch <dietschc@csp.edu>
---
 arch/x86/kvm/xen.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 610beba35907..4b4b985813c5 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -707,6 +707,12 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
 		break;
 
 	case KVM_XEN_VCPU_ATTR_TYPE_TIMER:
+		/* Stop current timer if it is enabled */
+		if (kvm_xen_timer_enabled(vcpu)) {
+			kvm_xen_stop_timer(vcpu);
+			vcpu->arch.xen.timer_virq = 0;
+		}
+
 		if (data->u.timer.port) {
 			if (data->u.timer.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL) {
 				r = -EINVAL;
@@ -720,9 +726,6 @@ int kvm_xen_vcpu_set_attr(struct kvm_vcpu *vcpu, struct kvm_xen_vcpu_attr *data)
 				kvm_xen_start_timer(vcpu, data->u.timer.expires_ns,
 						    data->u.timer.expires_ns -
 						    get_kvmclock_ns(vcpu->kvm));
-		} else if (kvm_xen_timer_enabled(vcpu)) {
-			kvm_xen_stop_timer(vcpu);
-			vcpu->arch.xen.timer_virq = 0;
 		}
 
 		r = 0;
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
