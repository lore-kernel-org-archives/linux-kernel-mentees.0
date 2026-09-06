Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8FC3B27DC
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  6 Sep 2026 03:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666122; cv=none; b=AFwcmNSrDYBLPxcRrk57KC4I5nXsTMtRI+cj0n5UYIaznyTrYWobp555ou+YGtdnEJygYU24ROBSXtqmSjXPE2TsGlSKbNyi643ssA4W7HME0qkoZHBrSLmPo53mp0+PlbrUZOd2xMUR7WE8xMaS+eNeIzJePvWiHRn1/H+1zvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666122; c=relaxed/simple;
	bh=1eg7xfXvqB+X7Z1e0Md87PErbs70YQUknxBBKub28qs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGXbO2qamPu3ctOzXlxqwIVmLs6wsJIgFTmi/Un1kSRDpX2G2Fh/hBL5BMda5ELkX9d0ZPJIa3svwUjh2iYK/EwjRPAHpFYX65YP+fLn299/a1RzU9m75fY9w4RB7AAlOC9Excw5c0m6cGw7eVv7SwTQqZccm+wbg4n3VJLfnek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBZpRBYb; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBZpRBYb"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso2837550a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 05 Sep 2026 20:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788666120; x=1789270920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=48OUlgZ8oJkokpD3G8IEqvdlANt4AE/H+y5S+7nUN5c=;
        b=UBZpRBYbG4+TLmwKO7CkzG5Sqkx56YLT9BLpFfU0YhnQWDCgGqjHFmuzllgOY+3B1y
         FZEbddteZR/NXsWAPiuhZNU3mO/M0JSPL2JCn0drkFOK+s/ANTQoYjml/Q0XaWVRJig9
         lmyvh10tPW4N8/Fgc69eRaPWd26iYxiJBfM2/l1MX/wgBs6d/yaBW2KiW3W6u+Hl4ylW
         Y8PSPaGSmWn2tcw1w35hqlLG4qDfi/tNgzl4yKblcmHp6CVSEXPfJPThlI6wAoLALGio
         ROOSYM9OhPKrHlyDF1AFfPS8Lee7iv7LDdOELJtMgZNXvbU6KC0012IC5aYwrYB+M6uB
         iTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788666120; x=1789270920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48OUlgZ8oJkokpD3G8IEqvdlANt4AE/H+y5S+7nUN5c=;
        b=IymvuNYQHr3fJe/TmAbOUukWfhRH/khWo85U5nQY+PzZsqGpAaEsPgiI/XpXcTQH5d
         HqrVctaYE4a7lhilAjnnzBwp2nGxNVYJ8pMBk+aQMbm7cpnop0M6jngqT26rrvtBHAaM
         JrUjep54MTgVUexA+st8afEQgD+gb1xS4HETLWCDnXcMW9JkUR+hGRlpZFkjVLy+gfvU
         yJLcY8X409cn1ydl2nuBUxlgJUZHKuRkD2ZawZCf/DFiBvY4Klcds2X46aIi9ZB3UH4C
         BCBJHXpNDpuPhFHqSjjEuDXS8rekR7wlfbNwwq0FmcqKXRGnxaSpezaKX/WdzHeNnG0q
         ipEg==
X-Forwarded-Encrypted: i=1; AKwUvBzyIalrD9383ualBYv+qkSG6ci5Khx5M15/kgyrrO4J3ihWItxwDN+KMREXEoFsgfKUsetav8YIohedx+qNnINr2cuqGA==@lists.linux.dev
X-Gm-Message-State: AFuF++n2BUCusBzsdqaINS48sW4T6FSTZARbK68TraZ9gbNF1JKAvvMd
	KOulveMlp5lJNTyEr1LprNT4pxClQyhOBghYM5Hh4BhdVx2I3wE87evI
X-Gm-Gg: AYBFou0eCq/jTBRrlY3O+pBWBvy0gs7bNZeBPQeq5Bkl/x9JYeFLit7G6dQXdHVEe17
	wY0l6grW2rXUDxFgmolX8wkrzORZ+yNLgyvLlI6IlLdYxB++pFpn66qOzDu6ClF3U0xt5MUJZqR
	dLY4odvzI1f1rzNEVMzonD5BTmcbZnhwe5qxOay/qmiG8fJTyuQZdU7bSXdLWyhRR5S8NexsOrc
	/3AJ5Y1fGz2Q9i7Cv+1gK30dGdST/lUhZDxIYdz9rROU9Rxhf24CuY5c5eOXFBdX/iH2cLUTi80
	r39L3GjqYHiCv4sjHMcHz2BRlWboA8/SGnj5VodL9CikVlu9EHxB8OEBoytryYI1fO0FRyMue+6
	LBLM8xeHvqD7HVIapnP9HIF+beiPZgGA1IzfZOcP7jq7ydASZF2M/T6/eWi+1zHE/XypEFTz/FS
	vCBxtTq14T0fuTOM21IgpR8jIGk1VcSJz+/M2879utM4ptb6KwafCkvqbaE7FeKRGaU452p8/jW
	jSRDWWFDSJ+p9lcMJxzaM2ugW88l/i7K0f6baYUYaYO
X-Received: by 2002:a17:90a:da8f:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39b26208e7amr22343140a91.12.1788666118495;
        Sat, 05 Sep 2026 20:41:58 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([27.130.10.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm22761765a91.14.2026.09.05.20.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 20:41:58 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sean Christopherson <seanjc@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>,
	Gokul K <gokul02k@gmail.com>
Subject: [PATCH] KVM: selftests: Fix VM leak in early return
Date: Sun,  6 Sep 2026 03:41:43 +0000
Message-ID: <20260906034144.14059-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_mmio_ease() returns early and skips the call to kvm_vm_free() when
ID_AA64PFR1_EL1 is not available.

Use a goto so that the early return joins the common exit path.

Reported-by: Gokul K <gokul02k@gmail.com>
Link: https://lore.kernel.org/all/20260808081050.408657-1-gokul02k@gmail.com/
Fixes: a90aac553249 ("KVM: arm64: selftests: Test SEAs are taken to SError vector when EASE=1")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Tested on a Rock 5B (RK3588). ID_AA64PFR1_EL1.DF2 is not implemented,
so test_mmio_ease() takes the skip path exercised by this fix.
---
 tools/testing/selftests/kvm/arm64/external_aborts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
index d8fe17a6cc59..7836756a38a6 100644
--- a/tools/testing/selftests/kvm/arm64/external_aborts.c
+++ b/tools/testing/selftests/kvm/arm64/external_aborts.c
@@ -339,7 +339,7 @@ static void test_mmio_ease(void)
 	pfr1 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_ID_AA64PFR1_EL1));
 	if (!SYS_FIELD_GET(ID_AA64PFR1_EL1, DF2, pfr1)) {
 		pr_debug("Skipping %s\n", __func__);
-		return;
+		goto done;
 	}
 
 	/*
@@ -356,6 +356,7 @@ static void test_mmio_ease(void)
 
 	vcpu_inject_sea(vcpu);
 	vcpu_run_expect_done(vcpu);
+done:
 	kvm_vm_free(vm);
 }
 
-- 
2.47.3

