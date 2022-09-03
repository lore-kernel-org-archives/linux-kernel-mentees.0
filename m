Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86750C6FA86
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Sep 2022 07:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F08D941634;
	Sat,  3 Sep 2022 07:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F08D941634
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aDZMg+5G
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iu22j3n-7r42; Sat,  3 Sep 2022 07:39:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A42B6415F4;
	Sat,  3 Sep 2022 07:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A42B6415F4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64A3CC0033;
	Sat,  3 Sep 2022 07:39:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9B23C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 07:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A429E8188B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 07:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A429E8188B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aDZMg+5G
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMpGVJGepYhK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 07:39:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C186D81886
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C186D81886
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Sep 2022 07:39:09 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id x19so4007918pfr.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Sep 2022 00:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ROgdEwGTwKSezP6yTg8Bn5b9HWITXNuPp4Q731RWP+M=;
 b=aDZMg+5Gm5Z4KOXdcDeuVimJyU0uVQjdAQwcQwrupA3dK9GcXnOTJ1Go03nMO5UyIi
 FeAOY3WR4t3d4kBYiXdbh/karp3nWeMzIKPNe1GjSRWstX3jcBW+G6NKSbCfW5u/Tvg+
 5kRi8bZBQvV92jv9FWMu5Yq7yXg9X4fnz00+Ywyb6vEMoDYl10D7q2ZMToCtXPL1C0xe
 i4S4ZxWiI/RjCU6JKkX3JksmRs7gdmwWGLazYwyeHMTJ+bEBxJ/2TGUQ54iwSfdrxgCu
 kBsyEt+iDL7CP3ZUpk+gRIWGP1ZYIPLIuV5DjlxubDNmsPUdBKT/6Sl9T0UFhfL9BGe0
 FuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ROgdEwGTwKSezP6yTg8Bn5b9HWITXNuPp4Q731RWP+M=;
 b=BGH+Qi6ejihpOZ3elYOL2SofLRs1jqWrprTGISBcFcyhLySufa+UmZio1AxkShCQXz
 tzxfUCb8CLEwoI95zdYJZjmqlZ5Me75LpP0d4SP2mVqGIrShP1vEcubp5kv8vPpkJlHz
 tkEuUFw61jKkbT5byOjDA8g/WDiGk21OFTuPMY3jkvow5HIczV/FiR9f9NhD69xG/8bB
 9leFK83LMP51b45xMI6LkveW4mBjKdJeMyOye/0BNiWy7HpQQrMnuL5RW8+ln2ZZYjZ6
 z2e1TwCigP7otPqy471qUqgROrNlPTqRuQTgH7OYnvyzJ4/QY5jYJaAWGr6udu2d9G12
 2VHA==
X-Gm-Message-State: ACgBeo25H/6i9OKGKx8jleCF5ATEckhUQ7Fr2u9aTqVXKwCiYdsSA5uG
 vYn942pJ/HzPVIKXZhgcO6o=
X-Google-Smtp-Source: AA6agR57jxS7L9aa+NHczXrLUs5tGLCFmC508F1B/uwdaU5GBjHzXDuYk1MADtsscXoIC3Xfvhxabw==
X-Received: by 2002:a05:6a02:104:b0:430:93ec:776f with SMTP id
 bg4-20020a056a02010400b0043093ec776fmr8025194pgb.544.1662190749090; 
 Sat, 03 Sep 2022 00:39:09 -0700 (PDT)
Received: from biggie.. ([103.230.148.184]) by smtp.gmail.com with ESMTPSA id
 h14-20020a17090adb8e00b001fd6066284dsm2738133pjv.6.2022.09.03.00.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 00:39:08 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: pbonzini@redhat.com,
	shuah@kernel.org
Subject: [PATCH] selftests/kvm: Use num_vcpus when testing ICR in the
 xapic_state_test
Date: Sat,  3 Sep 2022 13:09:01 +0530
Message-Id: <20220903073901.73862-1-gautammenghani201@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, seanjc@google.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Gautam Menghani <gautammenghani201@gmail.com>,
 guang.zeng@intel.com, linux-kernel-mentees@lists.linuxfoundation.org
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

A TODO in xapic_state_test asks to use number of vCPUs instead of
vcpu.id + 1 in test_icr(). This patch adds support to get the number 
of vCPUs from the VM created and use it.

Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
---
 .../selftests/kvm/x86_64/xapic_state_test.c     | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/xapic_state_test.c b/tools/testing/selftests/kvm/x86_64/xapic_state_test.c
index 6f7a5ef66718..de934e8e5e41 100644
--- a/tools/testing/selftests/kvm/x86_64/xapic_state_test.c
+++ b/tools/testing/selftests/kvm/x86_64/xapic_state_test.c
@@ -96,9 +96,8 @@ static void __test_icr(struct xapic_vcpu *x, uint64_t val)
 	____test_icr(x, val & ~(u64)APIC_ICR_BUSY);
 }
 
-static void test_icr(struct xapic_vcpu *x)
+static void test_icr(struct xapic_vcpu *x, int num_vcpus)
 {
-	struct kvm_vcpu *vcpu = x->vcpu;
 	uint64_t icr, i, j;
 
 	icr = APIC_DEST_SELF | APIC_INT_ASSERT | APIC_DM_FIXED;
@@ -110,11 +109,11 @@ static void test_icr(struct xapic_vcpu *x)
 		__test_icr(x, icr | i);
 
 	/*
-	 * Send all flavors of IPIs to non-existent vCPUs.  TODO: use number of
-	 * vCPUs, not vcpu.id + 1.  Arbitrarily use vector 0xff.
+	 * Send all flavors of IPIs to non-existent vCPUs. Arbitrarily use vector 0xff.
 	 */
+
 	icr = APIC_INT_ASSERT | 0xff;
-	for (i = vcpu->id + 1; i < 0xff; i++) {
+	for (i = num_vcpus; i < 0xff; i++) {
 		for (j = 0; j < 8; j++)
 			__test_icr(x, i << (32 + 24) | icr | (j << 8));
 	}
@@ -137,9 +136,13 @@ int main(int argc, char *argv[])
 		.is_x2apic = true,
 	};
 	struct kvm_vm *vm;
+	struct list_head *iter;
+	int nr_vcpus_created = 0;
 
 	vm = vm_create_with_one_vcpu(&x.vcpu, x2apic_guest_code);
-	test_icr(&x);
+	list_for_each(iter, &vm->vcpus)
+		nr_vcpus_created++;
+	test_icr(&x, nr_vcpus_created);
 	kvm_vm_free(vm);
 
 	/*
@@ -153,6 +156,6 @@ int main(int argc, char *argv[])
 	vcpu_clear_cpuid_feature(x.vcpu, X86_FEATURE_X2APIC);
 
 	virt_pg_map(vm, APIC_DEFAULT_GPA, APIC_DEFAULT_GPA);
-	test_icr(&x);
+	test_icr(&x, nr_vcpus_created);
 	kvm_vm_free(vm);
 }
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
