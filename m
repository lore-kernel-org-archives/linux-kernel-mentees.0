Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB833E51F0
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Aug 2026 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647072; cv=none; b=fdL7Ti0MwC9HcUxVXAu73P5ft2UrOXBmYm9+VdYtbOyuL5SwmSH7TnteuKyyZswAEj3H2uXh6HAJHvy/JkhdQd4hHAJ8SEI66ZXznHhMBRlFbq/D6bal1dM9533mVtfLvTns4VCIW98hOIZbc3QQM6ex0z4KQcVKnp6nW97JORM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647072; c=relaxed/simple;
	bh=QzU+PHGXaMJ/27WJb6wJphrvbMmQUjQ1+684SPuRm40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OS0NOTr6Vql/XCE9a7HDoaxx/l40UgJ6/YRy/uqmWyTGbZ7p/pyo8CTINBru7oKLjXsMkioBl/4I/eT2lB7J/si5C2HUk3CxYmVX5A+uRyOywYHJhowTMAqMFQQ1Ws7aMkv+FUr2CtpgH1gwKPMC8mZ2hG3airPRSqoCEzkOiAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LzTicVv1; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzTicVv1"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso3293965a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Aug 2026 01:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787647070; x=1788251870; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlP9O0s11C5YW6Wj3Uolvqko6ksI3Exocfu05SFa8SI=;
        b=LzTicVv1YqB1FoPxzdeAQJ6Xu7iWHqpmBJLdM/OhtEGwqRGirDGtT8cJ8LS2qdZO/h
         TLsjQjDzeyc9FGebOlHnBrkiAQvdjhMk+qEKsEqVvxvAtcA0eGIfXHRkK4eaebCdzYvl
         LtvHh48Jas1Lu/bo0caWJGJwWMCad91AyWdpW1obgGUYGrKtM/EFKNtdU9HdHh2lUtwG
         ey6Z94nNqBuWfMc0XrtU6unkLQFHgDTjsPFGEV8cN/dWCFff9hnpq/LVXqOecConxGss
         Wkgtk3VRE3LSZjBfaBahJN4ZBmsAlUHHjwqI+0gC+grfHVLn6dD+M3NnpQMNrP3iJTS3
         6e3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647070; x=1788251870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SlP9O0s11C5YW6Wj3Uolvqko6ksI3Exocfu05SFa8SI=;
        b=hXea3iLRNF2EnWPG2K4zBdUqh1ycM3GdXaWkHFZD2vSHL+knC9Kf5GXL01pqPRBVwi
         Rh2Ii1wZx5jjDh4Cw4W1dZutHFo/QoictfdFitLacZIXoGC7eArGJKvqMleDFrU9ENLU
         5PkUfTKM8M/+7eTr3jTIhsl3VY4FcXXJ5YhXeLoXEJtKsT1Xb+Fr/xTSIJ6krDRgoAus
         HzOm9pdWJf2vRr/Q0kk/ABvUvD6J15Q2s3hNi3JxD0XWjWV836E6MeVMyaOTGhE/ZTyX
         omVMolkkNsgFnXT1U1IZgF9ZUsYTg0jB2cWS5bHZJDD+mHCZVLVfGzXz9+Yp+vPRLXVg
         XDXg==
X-Forwarded-Encrypted: i=1; AHgh+RrUJ38Aa3/xlOVsQmhtTAoSVsF999d2m8GrDzFG9eLgfln/QU+nH5/aDk88EfPG+jREYvSsxTyE3C+Sb9Imsmaj0nMyWA==@lists.linux.dev
X-Gm-Message-State: AFuF++m6JpmwJ1aCuTtfMdKoSvgE4Osjiop/PlZ5jDn0m8m36dECnba4
	J2sD/2BaZHe2RTeDPRoUZu2R9PnByM4Bnsz5WVt3jFBwLGE74+TlzicA
X-Gm-Gg: AR+sD13JmDq6Rd1kZn+xy4QX80Z0568yeEjOgu6l8RfcUChDq+iqUxAmnPoQHstStw/
	CfhWY6FsXRuEtaDXLpnYdXzTm+baQYqrhwem6NgreKuxFhniD4vHrxQWU0C8FrZJTNv4z8JE3yX
	pvEGuOxuARqIkbqVy5KYCtomBW7Jxz3/zxYy6Cxn4+aeHe0F0M/Izd2tjolEZYfYPaSDoihUiBM
	W6V5Lx2svr7VNRQA7c+tsyAPBOO0e4vzG86e4mhVo0LcMZ2JRx985Neh5dnpbOXACM+3lD1k76k
	ukQhnBmbI9NygmQqxJJ+mf0lH3cZpk3rVgYBnP4qLdcqBxBR0WOwWKIVJx3yq/T1RbpoiAk41cb
	R2NMjcUL8o1L1N2jTS4LpVBM29PrTw6XZ1rElrkc9+eRibPT/4NfKfcebOa/uP5N6aJ4EVq+Xz5
	ddxcvDppFc6WJkHr4hsaSeDNeNiru6PgGdMFfCx16jsDGjK++j4zjXufq/FGL8KJbdNic5NUcvX
	NN8ZDdFvdRc
X-Received: by 2002:a05:6300:6bc7:20b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3cd9f9933bamr400900637.0.1787647069755;
        Tue, 25 Aug 2026 01:37:49 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm1835887a12.23.2026.08.25.01.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:37:48 -0700 (PDT)
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
Subject: [PATCH v1 2/3] RISC-V: KVM: Report snapshot write failure to the guest
Date: Tue, 25 Aug 2026 17:37:18 +0900
Message-ID: <20260825083719.643970-3-suunj1331@gmail.com>
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

If kvm_vcpu_write_guest() fails while updating the PMU snapshot area
on counter stop, the guest may receive SBI_SUCCESS without the
snapshot being updated, leaving stale data in shared memory.

Return SBI_ERR_FAILURE when the snapshot write fails.

Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 56dd5b1b2846..45dd5233340d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -723,9 +723,10 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		}
 	}
 
-	if (shmem_needs_update)
-		kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
-					     sizeof(struct riscv_pmu_snapshot_data));
+	if (shmem_needs_update &&
+	    kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr, kvpmu->sdata,
+				 sizeof(struct riscv_pmu_snapshot_data)))
+		sbiret = SBI_ERR_FAILURE;
 
 out:
 	retdata->err_val = sbiret;
-- 
2.52.0

