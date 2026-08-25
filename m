Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951273E5588
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Aug 2026 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647081; cv=none; b=Upu3KUZima2+P/WbTpzqnE7EUn7r3+gGwyGwliDhBkSbjCiz+tVyo6oQVCGMGtyHVfpHXbam5bGjFEgIERdH3AvWfu+LObDvOSdDZc1euZt9oar9UpYwYuPR+U6RAE4ODFUWDI1fL5cIChWxQ1MiLovng1bw/QSs78SetQfzT5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647081; c=relaxed/simple;
	bh=GC6ctnqH49PdSJv4HAShbCKDfdndlZxHBrXCNy37gbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VkUt5h8QgTXiRGTIX64hWf6O4zNbi5guPuheZkWy2gRFR15PoOOcFpwiITXzl+kRbiWOAwHW/lNz9ziiWsZJ4B1UWJsVaVCJYT7ti3luTxQimeQp3UPjcj/O33ynnILvn6qzGKs9ytQN8w8YNIWiyxDhN9o3cQNGZmVDghMAH+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7FIPTt+; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7FIPTt+"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso3925631a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Aug 2026 01:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787647075; x=1788251875; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hN2Jmy0Yce+ny/9mzHdZVPdF+NxcdzE2Ab9UDeAEcWs=;
        b=I7FIPTt+dMRSVpVhTF26xJ0Er/sfUC45E3DKk0MyCzbNQmm2Z1xUjEo9GCTL8TEZly
         ggqSoyKmc87kbCAZsYKO8G7ZN075lxFjCitcVpRae+gURhQqfR8MwkdmxUzJPsuHV2zh
         4XpIiqGikaf2dBUSSbfBTulHjTZKZ7WVi72IZ6Y+ZfDYuHbBt6Ov6w8lmW6UmpZnmqfU
         cJ9hOPT/iTHFfbmBz91Qsw35jXtQCoHXunzbYjCVfqVyE/b5QH2RYldOME8Ghl5iH5vS
         tgzR2soelh6Yyo2pjwFStSLavZIIV0xlEavJJtUyCffJHwz5NZgX4XbDg0TkS/0jZ4mw
         n3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647075; x=1788251875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hN2Jmy0Yce+ny/9mzHdZVPdF+NxcdzE2Ab9UDeAEcWs=;
        b=B99wekuu2kusr+5vUmHrB/6J3v+e59SBe+dgsSJXP7lWA3v6DPJLRNiC1ZsZ5rxAcA
         wPlALhEyBIr2jA90d2qxVc94RhnoKLy3tM04et26sjqT3wMW4pjoQ1gflJUY0D95gWWR
         YHnpv1yVSqfbO+Tfn1VDbjDCdHRuJ8RRZYTcQ6jZmjPFB0iXcHHfeB+k6M1tDr3K32KU
         KTwaiUNIRLs4Y91SP8mV+GXp2depC+rbVVOEvN/IfMnGPnwP4PTpfWai1plML+2XRmho
         JTYVA0KJ7BH9qGBLfnLnV4AEntQP5dn1GNMqwshbyF978DS6uCpgdYPG7HrtsWz1ECV3
         v4HQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5dlMS8+YvVGzraR79LpMCj8/nsC7CQYTT1uoO0RZa2QIlaCXwK/0H6WmYmuMR+6pJm9urgTIfomdFCQZCMGcPnKrw1Q==@lists.linux.dev
X-Gm-Message-State: AFuF++kdT/QExu915Qaj4aIp6xYpHxUzKWvEUawDrNAdZ2cKaFn/1+A3
	75UKhYw/aWkew8u+E/Cjf/PTB1s9XvITULwpvyCi0UWRGgYFRdvsfSGG
X-Gm-Gg: AR+sD12Ajil+T625ADw8CKWRaXTmDxhUN4iy+yna5mYWjQ3Sbj/JGAYJxZGJIoIJXp2
	kOFrmkBGOVLjDdxj7j79yNcD1OXLlcliWxlt7NabR0zy0OoaruuakV5j8ly36cHrzlNd0+U328c
	C4+2GLxLXzzctqVXY7wHP64YSZcrnGl467pzzFwgHzZQ533XL+azSiq5gc1zE0Gv1ns67vqF+u1
	fb0M1evnC+YL+keNWGtOvvtlNE95vUri1q3Ku38ln+P0eEZxOy5Ws0+axqLlz7fEyEi5mMOJJLE
	410/tMeoodC30PIxAiDWXI8m4iZn1L4l/4SVfg224Y9/1/oHEXiVPJLB5GHp3JDjZ9b2ewAdTPj
	6H0iRMmF08Fmo7NGsGVdOCaUxCXU1nE6u3/4sZlwbklbm2nSHChn8+vE2Y4jhbz4d5AWqO2CMKh
	M/MoSu7jnjUtFDM+puRNErw7F99Zpi8vnD6k8eQz9BPT7yBntx13uLo/fkPgam/njuSKCOFFSvM
	2nU4F8f08uf
X-Received: by 2002:a05:6a20:c90c:b0:3cc:22bb:8911 with SMTP id adf61e73a8af0-3cd2fe7a2cdmr66070868637.6.1787647074852;
        Tue, 25 Aug 2026 01:37:54 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm1835887a12.23.2026.08.25.01.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:37:54 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev,
	me@brighamcampbell.com,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 3/3] RISC-V: KVM: Fix perf-backed counter accounting across stop and read
Date: Tue, 25 Aug 2026 17:37:19 +0900
Message-ID: <20260825083719.643970-4-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260825083719.643970-1-suunj1331@gmail.com>
References: <20260825083719.643970-1-suunj1331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmu_ctr_read() adds the event count returned by perf_event_read_value()
to counter_val, which can accumulate the same count repeatedly across
reads. kvm_riscv_vcpu_pmu_ctr_stop() also leaves counter_val stale by
not folding the current event count into it.

Make reads of perf-backed counters side-effect free, and use
perf_event_pause() when stopping a counter to fold the current event
count into counter_val while resetting it. This preserves the counter
value across stop/start and lets the snapshot path use counter_val
directly.

Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 45dd5233340d..7d50490cc622 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -268,12 +268,13 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 			return -EINVAL;
 
 		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
+		*out_val = pmc->counter_val;
 	} else if (pmc->perf_event) {
-		pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
+		*out_val = pmc->counter_val +
+			   perf_event_read_value(pmc->perf_event, &enabled, &running);
 	} else {
 		return -EINVAL;
 	}
-	*out_val = pmc->counter_val;
 
 	return 0;
 }
@@ -641,7 +642,6 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 	int i, pmc_index, sbiret = 0;
-	u64 enabled, running;
 	struct kvm_pmc *pmc;
 	int fevent_code;
 	bool snap_flag_set = flags & SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT;
@@ -679,8 +679,11 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 			}
 		} else if (pmc->perf_event) {
 			if (pmc->started) {
-				/* Stop counting the counter */
-				perf_event_disable(pmc->perf_event);
+				/*
+				 * Stop the counter and fold the live count into counter_val.
+				 * Reset the event value to avoid redundant accumulation.
+				 */
+				pmc->counter_val += perf_event_pause(pmc->perf_event, true);
 				pmc->started = false;
 			} else {
 				sbiret = SBI_ERR_ALREADY_STOPPED;
@@ -694,9 +697,6 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		}
 
 		if (snap_flag_set && !sbiret) {
-			if (pmc->perf_event)
-				pmc->counter_val += perf_event_read_value(pmc->perf_event,
-									  &enabled, &running);
 			/*
 			 * The counter and overflow indices in the snapshot region are w.r.to
 			 * cbase. Modify the set bit in the counter mask instead of the pmc_index
-- 
2.52.0

