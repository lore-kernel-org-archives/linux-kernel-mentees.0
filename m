Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BBDC19F2A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 Jul 2022 18:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0090B8463F;
	Fri, 29 Jul 2022 18:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0090B8463F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=gxVP8cku
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ydcYk_RWfqgs; Fri, 29 Jul 2022 18:46:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DB5CD8469C;
	Fri, 29 Jul 2022 18:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB5CD8469C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADB42C0033;
	Fri, 29 Jul 2022 18:46:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 907C6C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 18:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71DBA421E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 18:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71DBA421E6
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=csp-edu.20210112.gappssmtp.com
 header.i=@csp-edu.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=gxVP8cku
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gMRiPxD0r6Ma
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 18:46:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AD4F41BD5
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AD4F41BD5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 18:46:47 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id n138so4276909iod.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Jul 2022 11:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=csp-edu.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Fnhyk5gLFQEwsJhfQYKuwr0cjl/8dz+duvFdwzZkUrE=;
 b=gxVP8cku9Bw1/VU8BYM/gHmgG3lEBkfgDP93zh0zKLMTbWMqzPrYCfj+fNQsA5orbo
 O2/mTPnA3HyB8P5tlxTZAnt+jt3HodpVnblz7ElhSNACk7FqH/YZd1EsrH3qSPpipY/m
 XNKkiTjdBGN2L0VknqC/N0B1jprRg3Rjbrl1OCvfByDP+tLcCaCPiFG0sWD2XUpgwDM3
 mZvKoHnCLrB0BEKJdopm6NMyAv4e0qdpnpCvTT3cuyjEhfwk19BKPRoGUcw+v+NM50nJ
 MENh/WxL/H66rJytORM1E01INuM8BxTIL64LLhbNlI0kLL1bejixa1ypi/u9iXsCjPKl
 Y/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Fnhyk5gLFQEwsJhfQYKuwr0cjl/8dz+duvFdwzZkUrE=;
 b=009lnR40rlWOzJxI5EToKW5x0saUpeLICvV7zclGp8eB8ZIKIiUoMLN5ucrbUdFAFH
 j9FaJLhmyu71H+l8l1yyDZtJ3J0SkJORkqdNLcz29m26pzm4wXlkDtUQ5Um3xco5MLXp
 Nhue9Gj65BVKwiUNX/yo+OrQbli5KiiJu6vhatAbzZYq96UstI2+bB8Wh24X56x0fnYn
 /opyze2/kklRbzbtO3/ZprCP5FRy1GZ+nieNu/xZHdy5lnv3s7iB7g8/xhvYKGqZvQ5Q
 BKjOFIGtNJViH+e3RV+PHBr6y0BXfwwythWevpsKwfaMnIguoWOD/AjuHPIV+h1CPOXO
 WItw==
X-Gm-Message-State: AJIora8xTqVO61FgHhdQuCCM2jpIFCmSNVtBV40UGM5b/xvkF0/B3P+J
 Yl0jeNivS9pW4CW5ksipWPvmPlVFW5DwN6JF87CQt+F2V663f/ywRXzB8Z7mQFKsLAXOmuu5iFq
 7tRzA9XzFmWEKNMbnXl2j0knafJk0XJLnw/GAFUiCB5hIadWts5buovSxaZhzz94BYWI0/JKg9k
 wjDn5WlBS4wT4tdadHwVOOhQ==
X-Google-Smtp-Source: AGRyM1s9okV2pRWA3Fcsyvo+i/vocs80/XI5TSLntOxAZW8EwS7EcF/KQ5/7BOYxMZYbswazU+GPcg==
X-Received: by 2002:a6b:c505:0:b0:67c:dcd:a5b2 with SMTP id
 v5-20020a6bc505000000b0067c0dcda5b2mr1607779iof.37.1659120406280; 
 Fri, 29 Jul 2022 11:46:46 -0700 (PDT)
Received: from kernel-dev-1 (75-168-113-69.mpls.qwest.net. [75.168.113.69])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05663810ee00b003423f7b779csm1206576jae.41.2022.07.29.11.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 11:46:46 -0700 (PDT)
From: Coleman Dietsch <dietschc@csp.edu>
To: kvm@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: x86/xen: Prevent xen timer init when running
Date: Fri, 29 Jul 2022 13:46:38 -0500
Message-Id: <20220729184640.244969-1-dietschc@csp.edu>
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

This patch series was created to address the following bug found by syzbot
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
  KVM: x86/xen: Stop Xen timer before changing the IRQ vector

 arch/x86/kvm/xen.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
