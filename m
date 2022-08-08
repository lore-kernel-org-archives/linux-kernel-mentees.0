Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BD6C25B0C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Aug 2022 19:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33E184013F;
	Mon,  8 Aug 2022 19:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33E184013F
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=PinGFxYR
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9AmIM9LVJ__z; Mon,  8 Aug 2022 19:03:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2E22E400FE;
	Mon,  8 Aug 2022 19:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E22E400FE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7BB9C0033;
	Mon,  8 Aug 2022 19:03:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 350D8C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 19:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 177AD4013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 19:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 177AD4013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqDq0V4Q64oE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 19:03:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40E66400FE
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40E66400FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Aug 2022 19:03:49 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id g14so5348646ile.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Aug 2022 12:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csp-edu.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=syAtPX/fEfY/Znj5vIFhc6XP8gBHOtdfC9U66uE+0pg=;
 b=PinGFxYR+g6qD+2+1uClXpDIeha9HqBTjdj78StBVEeLhFTubqtiFpLXdAfzJQsnIB
 N/MrX8QQinIl1NXg0uIFgSy+pzaDOur/RGU9txFVKv8TIuFtAszffnMyt1h/mMeSu9bv
 c10YPiJpVMd3y0+ns4MfWt0kkhWpeO6n6iwpXg3eFUwTmn7FkDdRCD2kidAjQuigBNhX
 Ixx13wqu5MyktG3tnvQ/5y1P+7rO5xKE2WPPawWBOYLq+iUSh7Q9HsDP4bRBKdNrPB8O
 7M403iCvz/LeaZfwjpV/6dTg2e5ImH4hWYiWkvz7LgJ3S+sQ0HEWNB1dCk5p8Gslf/SG
 jSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=syAtPX/fEfY/Znj5vIFhc6XP8gBHOtdfC9U66uE+0pg=;
 b=OTENRYZRvVeL1X15UsG6u41jVEinXfOdELUfuIL41x4Q6pHXkuoyn2q6TwoxpueYs9
 C/dOLohW7PhKUkWwDOb3QXMxoyi3FfU3E95ZWcWjk0Xs3/MynqHenviCZ0YG3t8O1LNG
 fFc5YggSZCTAAkwkHz8x8HJt6X8NXoVmk8kjP/ekqQZjT9Lbif9wydjy1eJ5SvRfkNzU
 7w8q1MvQVBp2n1sCS5ZHeED92muYQky/VBGO2d8nkm+0iqn99yr0WQl2YqgtzKdylIek
 9f1OaQCKg9qRpRemdJPlF7fhopkCfwDqSFl8a1nkepVpdOg9Y49gMHntt5IIXbj+Gwhs
 dhFw==
X-Gm-Message-State: ACgBeo1mSfH6N6xzIMevN35RtxX3Y+wCcv5ajWzFBRrrldA/t0aU9cNh
 lfiFeIciJ9NCcUL55/zVANx627aajUw5ato3yxWiMxdqlGGN12Z3jpIp2BUbRFqgblYNB2Iht+W
 pg/r8AHzFzSeurfLW0+rXJiY+lw+z26tgv7lVE67ZaOBmGwMMdNDLJxqHpWjv00Lzq6K5Wk6m50
 OH72y2W9BFSihAKS7Z0qeyTw==
X-Google-Smtp-Source: AA6agR7c1UwS8w8jUikUvEkKhIpyqDOzMB9e62cctTro+gFeq58kURPib4bcwlSqgRjrBUEKVsO6fw==
X-Received: by 2002:a05:6e02:1ca5:b0:2df:3283:b4a8 with SMTP id
 x5-20020a056e021ca500b002df3283b4a8mr9468668ill.131.1659985428040; 
 Mon, 08 Aug 2022 12:03:48 -0700 (PDT)
Received: from kernel-dev-1 (75-168-113-69.mpls.qwest.net. [75.168.113.69])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a02a60b000000b0032b3a781754sm5541725jam.24.2022.08.08.12.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 12:03:47 -0700 (PDT)
From: Coleman Dietsch <dietschc@csp.edu>
To: dietschc@csp.edu,
	kvm@vger.kernel.org
Subject: [PATCH v3 0/2] KVM: x86/xen: Prevent Xen timer init when running
Date: Mon,  8 Aug 2022 14:02:10 -0500
Message-Id: <20220808190211.323827-1-dietschc@csp.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: x86@kernel.org, Sean Christopherson <seanjc@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
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

The following issue was discovered by syzbot:
WARNING: ODEBUG bug in kvm_xen_vcpu_set_attr.

When running the syzbot reproducer code, the following crash dump occurs:

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

The ODEBUG bug crash appears to be happening when vcpu->arch.xen.timer is
already set and kvm_xen_init_timer() is called, which appears to be the
result of two separate issues.

The first issue is that kvm_xen_init_timer() is run "every"
KVM_XEN_VCPU_ATTR_TYPE_TIMER. This is addressed in patch 1.

The second issue is that the stop xen timer code should be run before
changing the IRQ vector. This is addressed in patch 2 with some cleanup.

version 3 changes
-removed ambiguous comment
-updated another comment to be more descriptive
-continue cleaning up changelogs

version 2 changes (mostly feedback from Sean Christopherson)
-split patch into 2 patches
-fix changelogs to be more descriptive
-fix formatting issues
-add check for existing xen timer before trying to initialize another one
-removed conditional for kvm_xen_stop_timer() so that it always runs
-ensure that xen timer is stopped before changing IRQ vector
-streamlined switch case KVM_XEN_VCPU_ATTR_TYPE_TIMER a bit

Coleman Dietsch (2):
  KVM: x86/xen: Initialize Xen timer only once
  KVM: x86/xen: Stop Xen timer before changing IRQ

 arch/x86/kvm/xen.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
