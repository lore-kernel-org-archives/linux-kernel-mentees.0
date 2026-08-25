Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B133E49DB
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Aug 2026 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647066; cv=none; b=rjXAriTRRVzSRzf1+8+7CKqCQ5FuNoitVr1ALCrWWgKUxwwA6NjvMpEc4ajYSCKLyF8i/uQhPaRIkdaGAovsFbIp4HiQbIyX6WtYwi4f+sJlp2VJ/nii2kTcn9cFUs4msVF1CC1LKZIaztdxBKzACjyv5/+nNMfA/C8TgTE3Fkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647066; c=relaxed/simple;
	bh=0iAVbxJH3sBm1IgSAaYTJfu2cuy78yxvo5wsLfXwV28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OG3mRFzu0D1m586gEt15P+MO5E8m2lGiiimvH1Y3xvp0ibTsL9gJudmX3cz12+W/W1CKrKW/35oEC1XCWILbiEvWZTJIIPM3YtWqBUssJ56CuQeeI2eUjILkFhr5aVvS5TlmGATMzSwkgmlVTpZtWYFAJORjsaX46tNkUbXrlJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ck3jUKF6; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ck3jUKF6"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so4355171a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Aug 2026 01:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787647065; x=1788251865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKUnc+hCH/m96lQyJ3IHIfrh5f9TDgQ6D60NAJmR+nI=;
        b=Ck3jUKF6NgzGLfwzUrlmQTwC6paENIHAO4vh0DB3S1Iy6Is1Lq7/ubnu/OGgpM4Z3j
         TrXik/tAFTAQZH/10KidCLQz7S9VVjYDAOyinJpRSb8Nj/M+o9L0A0MhXqhAS7MyHq7Z
         K+FCIbssIG0err4ioGpfTkG7vrGU+pek6AAZqYKjaVS/4pMRDRpkXj0+sHa8qA5bj0l6
         gPyPpa50ND2k6Yef3MnM7IpKOUU05vfeZq0jVytal7DtJnQl8bdL87j8sHN33VKn70XE
         b67ATRJurCidGUkd0q8wihRMpCYuPMI+YZsWTe58M5LVLn+ZMUUHW9oQYUkr4DQTx0e+
         V2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647065; x=1788251865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EKUnc+hCH/m96lQyJ3IHIfrh5f9TDgQ6D60NAJmR+nI=;
        b=I7n0xWmxdO3La133d7lLiTRGw47Itsq2NC1qh/KEIIJDNlDcSifowm72O3xfW38ApW
         AHuazrTaNBs7QLhCDZhlqsuXCYICnKeMoazkK2SCnmixeWFLqmOMNiozmsW4aQivBNfB
         WQWfUOedfYpdsonAifeOw13Ew2QQnNA2omvwWEPgeEe82I3vY/rySaQ9LuJqZJS/yp+Y
         GmZtseXy/VktroHqCIBt0Ux5+pwa/pAjgZCY8kB3bzxCo975FwCw1ZHeX3g0HpUCgVQk
         sIa+TkgsE58Or03hkcNi4AYBElX2uigNvh5DEH/fy1r3skLGuQu/2csQ1fjaflUkqWwa
         LHTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5efpFDV6R6cw7wE3ul2Jk+i3CmaumfpS59dGTDgHmOeKjqx19lh7wt5GdlAHCokzX1yUwZrwwfzh/fB4N/WvY+DBIEQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nNqVcu7XORL0JkqiZyej/MnuFK5AAKchtvzbxVn5QxOWWhD2El
	QBGutWXt6gqgR1z24zdFBYh1A9tmh6Xfkt1X0neLlCfItXuMvu0yx+BS
X-Gm-Gg: AR+sD13zJLx9pMSE3jCf866ciGgtOU/qdHP63aTTxmPTgRCWSs2jcxobP9c36RZY8XW
	1j9v6C4d+yJYM9wgQ4Q7n00EIBZvhfndcnRZ1CKJc8psMtNEUJkCtCyVqffeGnHm/q6t+71bEmv
	vHlJUm2pyk8FTq98eR3cnMsBmTZNoeg/M2fUUSfQSIcvzy7XAyab09nfbL0POyBnwsW5EZeP+iC
	N7CW3WC4LU0cS+qVxvMi4GKVaQ6/1pKDPyoQLgL5OaxYUzFrQinpNVoy+89HK3dcb66iI4yGled
	Ly9J0oE1zCJIZ4WvBy5PwkF9zX1O1o3oyyVmNZP5y4ksNV7MDuInkAJ+nTuPc1Q0fasFYsNDnp4
	0ZiJhuQeI2qD50f1Gavmykv8jzqY656fdoai9drtIqsSjQ+mAB4rDhete6zo3GGj1WOGzDLy+yc
	UbOiB3qOb3W8/7POlZKoRiFHdDhmEAuXLD231KBUGQxA2Z43c1h91zYVoxoPDYzS7JJAZvzcXTu
	uhAhmNBcjyr
X-Received: by 2002:a05:6a20:6f04:b0:3c4:1916:9d3c with SMTP id adf61e73a8af0-3cd301428ecmr16874917637.15.1787647064570;
        Tue, 25 Aug 2026 01:37:44 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm1835887a12.23.2026.08.25.01.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:37:44 -0700 (PDT)
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
Subject: [PATCH v1 1/3] RISC-V: KVM: Preserve firmware counter value across stop/start
Date: Tue, 25 Aug 2026 17:37:17 +0900
Message-ID: <20260825083719.643970-2-suunj1331@gmail.com>
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

Firmware events accumulate in kvpmu->fw_event[].value while running,
but counter stop only clears fw_event[].started without saving the
value back to pmc->counter_val. A subsequent counter start without
SBI_PMU_START_FLAG_SET_INIT_VALUE reloads the stale counter_val into
fw_event[].value, losing all events counted so far.

Save fw_event[].value into counter_val when actually stopping a
running counter, and remove the now redundant synchronization from
the snapshot path.

Fixes: badc386869e2c ("RISC-V: KVM: Support firmware events")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2025b664961c..56dd5b1b2846 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -671,10 +671,12 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				goto out;
 			}
 
-			if (!kvpmu->fw_event[fevent_code].started)
+			if (!kvpmu->fw_event[fevent_code].started) {
 				sbiret = SBI_ERR_ALREADY_STOPPED;
-
-			kvpmu->fw_event[fevent_code].started = false;
+			} else {
+				kvpmu->fw_event[fevent_code].started = false;
+				pmc->counter_val = kvpmu->fw_event[fevent_code].value;
+			}
 		} else if (pmc->perf_event) {
 			if (pmc->started) {
 				/* Stop counting the counter */
@@ -692,9 +694,7 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		}
 
 		if (snap_flag_set && !sbiret) {
-			if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW)
-				pmc->counter_val = kvpmu->fw_event[fevent_code].value;
-			else if (pmc->perf_event)
+			if (pmc->perf_event)
 				pmc->counter_val += perf_event_read_value(pmc->perf_event,
 									  &enabled, &running);
 			/*
-- 
2.52.0

