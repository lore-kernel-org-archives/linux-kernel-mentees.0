Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B14580398
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  8 Sep 2026 16:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883509; cv=none; b=PHe2oFbeZYHujBIAvibsIbvS6w0F1V4ql0519Pw3ugUbS9p1QXyWgPDGg5zbOfynRLGiiuwPJuJ1Fczu7gEkhRvgZR5/JSGzZJpwNo4gID/6EwyEKJpoU0Ymx6tQq+vZf5C2t9vQhFDT0vnFt7zPwOSgujzWnuoW8rP3FoHcTtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883509; c=relaxed/simple;
	bh=sK1b5nDQtrjVKFr+o/6GwxhEgYwKp92RT5diVPkBA+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FTo5Eo5Z/HiC3XTKgNTE1uPvREpEsSYgKqCOcuDP4BNdD2mZqrNL0oPJZrW8ykZNny5LH1z/mUP5R5uJf3inTVKCeJW6k9fPzY3q/BOSNH30dCNRjphIrB0l4nbAS55tWuNI7miCdVWKeyEuHFZMSUewxPNjLbKvzKNvQU90ivk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjHHBzq/; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjHHBzq/"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso87046a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 08 Sep 2026 09:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883507; x=1789488307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSdpcNES+qMXGVTc/+WrAnmCz5JB/CaNe97EdcfztrE=;
        b=GjHHBzq/Dk3vTE2/30klRbe9qeBqj3BRMhqhBt6ler5vc+wOo8YfRoOU6tCDh3BfCH
         tiOw6Fp3WmKx1W0MlDUwCdf8YGgmhuxXZJ6ribGTe8wwPWJCMITtGfDqHzLJgZ7AjJhl
         fGQsvif0NmQeIqtw2gpqYe93UC3+NHM4p2lv60cmJlCurX+C4K9q24P9xjGg8sR1BCmv
         FgCmwRQg3jWcbQjFpcL99KU6YDct2txfW55xwm/cJkBo38khg683YEBeClQgn/Z9bZ9l
         lvd+yp60hnIYMPQJqQjySDnXOQIZgwOeUfdVydDe3oFlLRFoW5H1KX0jdVpOBfeBPFmo
         72Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883507; x=1789488307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SSdpcNES+qMXGVTc/+WrAnmCz5JB/CaNe97EdcfztrE=;
        b=aajIOGjYWF+xr3ye5XRS6ZaX/4zcjhO3pWZaLUmtKVBrHQwJiO31GPKSfCrJsOoMJj
         FKxntBKSh2Jt1ABpRJCgkvkk2kqmCNfuH9vLUUhZ1YG/oYCNtUPQ1/qyMCPctiYYk6kb
         RSIV+3VFWuivch66/FArj42dcCBHIsGFCyeYfQIZbdz+mN0mW7txp3Q6ivuiahZ00OCj
         djbfxvvsEvfC9OY23ZrFWKDjgKWkA31RhimZh/rH74SFMfgVpdi9x84fXGn6CZndunNd
         xWoigf8Oj9/zlvfGDq/ycii7cTnRFajvYZQZEY+N239K4IJqo/gdxX1Ih791nwyWSJFq
         3tyg==
X-Forwarded-Encrypted: i=1; AKwUvBz2yNmYUCT2/sn4rp4zily+uft0BXPukKBkfpA8HmAiUFoeisSu9vUeWx2wP8SA4btuIGE/Aean3bSRN2kaWYLReb7NGg==@lists.linux.dev
X-Gm-Message-State: AFuF++kJ8ec+RJTY/n1roHjhr2HKOWDCBqD3F6QhsQt7e/39iW9//QP9
	wv+RkQTgf8057FeUy1U3MT9abRPZQcFxGu3cvWv9V7a6Uzxek/dnR9OL
X-Gm-Gg: AYBFou2dcp68Gi0+PF4qw9uXIjYaxm+m37QJ42xZHY4OKXuoVyBgWUBfWUmarN3mUjE
	G/eMR95ARqnAB447DVl89cF4TRcnfAEereb9jvg0HKRFi850phJuPLH/QnyjtJI2snHR70BzPkb
	UfyWYDR0G/j+VHBGuCTyGG8MPJvWALjyVniCmITRtmJlM2DnCLJTFMy/6OVRfSfj5sUqpOC07u4
	QdR9CPvP7m2HoKZtlx21DaGyM3g8OiyKK8fQVnz6CiRUj/6cwfTXyNYs79ZL/Xt64961w7bC3UO
	Fa1Z7+0lASekL38GwKo1HqLV2ChcvHapDh7ZfbJQKoZCC9DCgBvZ6bAVhm410o+bHN+9Vxmgt3c
	zfWA436vDWCl1fW/3uN/GzY4CxtccDUbHuOiQKO6nuRCyJAOTjfRFPPO0fhp7L7hSuJiw0XuocG
	NPGVv3J6M47PGX0UimCUnBh8FO0Xj4W76ilJyADbVPDAqfc68f7Ryk00hjngHGNcTgFZono/w3x
	4+R66f8za17
X-Received: by 2002:a05:6a20:2d22:b0:3d0:f57d:c87a with SMTP id adf61e73a8af0-3dabab860f3mr994786637.0.1788883506463;
        Tue, 08 Sep 2026 09:05:06 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:3ef4:ec38:7826:6c9b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm14204525eec.3.2026.09.08.09.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:05:06 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	shuah@kernel.org
Cc: hpa@zytor.com,
	binbin.wu@linux.intel.com,
	kai.huang@intel.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v1 2/2] KVM: selftests: Add CR8 reserved-bit checks to set_sregs_test
Date: Tue,  8 Sep 2026 23:04:26 +0700
Message-ID: <20260908160426.6547-3-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908160426.6547-1-tharitt97@gmail.com>
References: <20260908160426.6547-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend set_sregs_test to cover CR8. Verify that the architecturally
allowed bits [3:0] can be set and read back, that every reserved bit
[63:4] is rejected by KVM_SET_SREGS, and that a successful set is
observable via KVM_GET_SREGS.

Without the accompanying fix to kvm_is_valid_sregs(), setting a reserved
CR8 bit is silently accepted and the read-back value diverges from the
value written, so this test fails on an unpatched kernel and passes once
the fix is applied.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 tools/testing/selftests/kvm/x86/set_sregs_test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86/set_sregs_test.c b/tools/testing/selftests/kvm/x86/set_sregs_test.c
index 603226ffe437..4e7c35179438 100644
--- a/tools/testing/selftests/kvm/x86/set_sregs_test.c
+++ b/tools/testing/selftests/kvm/x86/set_sregs_test.c
@@ -135,6 +135,18 @@ static void test_cr_bits(struct kvm_vcpu *vcpu, u64 cr4)
 	/* NW without CD is illegal, as is PG without PE. */
 	TEST_INVALID_SREG_BIT(vcpu, cr0, sregs, X86_CR0_NW);
 	TEST_INVALID_SREG_BIT(vcpu, cr0, sregs, X86_CR0_PG);
+
+	/* CR8 bits 3:0 are writable; bits 63:4 are reserved. */
+	vcpu_sregs_get(vcpu, &sregs);
+	sregs.cr8 = 0xf;
+	rc = _vcpu_sregs_set(vcpu, &sregs);
+	TEST_ASSERT(!rc, "Failed to set valid CR8 value 0xf");
+
+	vcpu_sregs_get(vcpu, &sregs);
+	TEST_ASSERT_EQ(sregs.cr8, 0xf);
+
+	for (i = 4; i < 64; i++)
+		TEST_INVALID_SREG_BIT(vcpu, cr8, sregs, BIT_ULL(i));
 }
 
 static void test_efer_bits(struct kvm_vcpu *vcpu, u64 efer)
-- 
2.53.0

