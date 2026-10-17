Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B324D40F732
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Oct 2026 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792234989; cv=none; b=VpuxQe/pFcwpFJyY8XUgz24ekqQZ6lsVP8pdoush0khmgCOECUTSSzVBGXSz3RO4MWs4H2jVIPnzCNGAmbY1joGV65zcN7AuTwxa/NICmtvuXLniVDyHCGSPvqCirg3Gm4/PDUlunPNn6rmaZQzWY6sbQcNuNTNpr7rTeCppZjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792234989; c=relaxed/simple;
	bh=TLOEjtKkkyoqOjy0bb8E298VSARXyB4QATRkuXYijPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6VwlbgiKJzTvu96EJwGatk04i/fUhdkp1+BrFnfGztHRHxX9MwwKM5d43e5F7b36XAqkZIalG54EvQWRzG3I+30RS/tvDIGmmgvOyOguJC4RevBCYJzD0uegmLqLTaxp8YZlaXBDlNU75XHZUktDH8UbZn2V3MuASb6Mmqrtuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YV6yMWd9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YV6yMWd9"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e915887d9dso3096545ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Oct 2026 04:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234988; x=1792839788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2VJKUNI2Amz8x09Pyp10zZpRdq+9eAmweb0GWmitbzg=;
        b=YV6yMWd9gBblAQ7HDJQGQUV9cnAYGUzLXHrZU9kCO6dZPmnxhqYxbECH5dCt+J0HHZ
         QDTG7OkE0EDUWeHVQ2FVLPfoMTCrdiMNA1bRs+QSv+THsGfxoBHwHEKX1gAKVmq1d8xc
         reYqzy4tbrGqyVYu5GTr+jwxzDfHX8SQtSi7p3YmwXJk6TN+QftXalxbYODEk8XmSlU7
         GFKUKX0KxbWMW8ds7NZ5FFJ7uszA+GKD6RnsiviWqP5mX95AMmbOuj276Tf5ewI7nsuQ
         GSClnyuMOA63gp3059/UX7J1gSr3xt4uA07ejplZyrQTWac4FdaS/3NPI+LzXdiRu+Nm
         RW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234988; x=1792839788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2VJKUNI2Amz8x09Pyp10zZpRdq+9eAmweb0GWmitbzg=;
        b=VQW0Iq+NPVatbNch6/Z9QpL2hs4NdhJ68ffCtZfLuAvZDv7d8QUleznMZ60Xt05LF2
         ajQxQjjdJ0w/qe0kqfX1P+JcTBJIPfct7Gc48gGLC/qg6c3nJ/cq7Jfxmjpo/JyHwHR7
         523KNc9NnXvjIKi5GnnkiZ8dymIc4Ipvjde19KnbeHbFgHVPfVGaBSKdvVQjCDzKdvtX
         ZYHpOS3AlO26v0jGo4KelO9nqoc3x5ZQb5LqqsO9hye3rbqbTPTfd7nxIpZ8IV5Hu0GK
         2LGpPRQ2YlqtdMOhVJF45egAL7+iMxZYCxS97hVJx+FgGBllBx1sdeeg2+BPRrZs7a9J
         d0yQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2cQfisTlhdoo7gPt9gwwHH4vEeE0SCCrWOt5oOfDqjS33fH/WmmcjtVcbYpxFa8sz9IbnRBDfwqu1PworJxq0uRGDuw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKmz0lbpYU8U12H6Dq07lOw2L8W7bY4y3UIGXJchxXDDv6M2xup
	Pv0lJxM6WyM7y3R2+zjFYehc3HyFeLAggY7WIo+vODYpleF3MVjK7Ap/
X-Gm-Gg: AYBFou0fKf6G2ziP1VDlz9ccZyauq/5GlluGnTkx0wOYBAE9Dz0FUfF4BPvmaF5jMtd
	ceUaaKy/gSlwcgcJ4ASeQ6ek9gQ2wk/SJPWp3cUF6LQB6w1ySIUAxUUgG76YLSvKhoyLeI/vwgv
	TRaHHgyO0wTOGdYXWSB0lZ2ttVu+Z9ttV96HeaPZiIYO9NSWRtDf+dmz4f/GI0u4D+5bobVhVDj
	R55gK6nAU2cUvhdi8foaLjjR27juz/RK08aY3n6qnzCuOW6+jn/NOoiJTq/cxSODcY1p4qUwx7E
	pDyT4WHbWmxrm1hrG5HXqzYvDST85uczzX2kxdDPjafVW8q7guOd+V8S2dL3ucAh6G1s+W6V/5b
	HnHCNtFN/zr9TbfTC554xYkLt0L2WjuPDRWtuYH6GMQT/pI+TVTf/GkvbSleM0awcM531Xipe7L
	etv1+RLbj8vXlij7K5MypyRy0dFVhivApJEiheU4q/3jyLD35lFl7yqqoYSUM37dn8g3OfI/ZQ7
	p1iqKjTquRmSjL7MU2RKA==
X-Received: by 2002:a17:902:e949:b0:2e9:7dda:bfce with SMTP id d9443c01a7336-2e9a6d3c1admr19606475ad.74.1792234988014;
        Sat, 17 Oct 2026 04:03:08 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:07 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 3/5] KVM: selftests: Use the shared memslot base in memstress
Date: Sat, 17 Oct 2026 18:02:11 +0700
Message-ID: <20261017110213.46199-4-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define MEMSTRESS_MEM_SLOT_INDEX using TEST_MEM_SLOT_BASE so
memstress and its users follow the library's reserved-slot
convention.

The tests affected but require no change are:
	dirty_log_perf_test.c
	demand_paging_test.c
	access_tracking_perf_test.c
	memslot_modification_stress_test.c
	x86/dirty_log_page_splitting_test.c

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 tools/testing/selftests/kvm/include/memstress.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/memstress.h b/tools/testing/selftests/kvm/include/memstress.h
index 0d1d6230cc05..4da03541e805 100644
--- a/tools/testing/selftests/kvm/include/memstress.h
+++ b/tools/testing/selftests/kvm/include/memstress.h
@@ -17,7 +17,7 @@
 
 #define DEFAULT_PER_VCPU_MEM_SIZE	(1 << 30) /* 1G */
 
-#define MEMSTRESS_MEM_SLOT_INDEX	1
+#define MEMSTRESS_MEM_SLOT_INDEX	TEST_MEM_SLOT_BASE
 
 struct memstress_vcpu_args {
 	gpa_t gpa;
-- 
2.53.0

