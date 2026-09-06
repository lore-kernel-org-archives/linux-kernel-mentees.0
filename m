Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6843CAE75
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  6 Sep 2026 04:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788668515; cv=none; b=gEf3UNKIbgM8RcRJRtMQsJhUDlgay6ccktNKRhN0DupZJ39GmmQvwp83fXnQ0h507t5pvBbdELccvaXBcfWdhWVJdD5BgGh9gT+uuvZccPcai8J4uf9cKb0J6+JTt4mq8htAlVBuQ/T1aCSv7aH9DWbbQ1qgxwoplkoZGdt0Z2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788668515; c=relaxed/simple;
	bh=vdK3wtpjZYQNeaslASnAOYg/PCjcSi/RbT91Z1Uest0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UN1bBHBXvFpoblNlNMdkg3darqLufgoW3K4MECZmRJwCQbRzM8l8rEgWypfxLkNp8HwO37NMG2XNc/SzXuZdIIficMnRFB21YH7sEO7AdfqYpD/Hxv6P5cspeuCIkb0s57Wg7aM2IRbXP48pYID1eL0emexN1CJ2z3PVXSnBXho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbEbl293; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbEbl293"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381b831d535so3948496a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 05 Sep 2026 21:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788668513; x=1789273313; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVHZoxQnI4RGBc2Se+Rzzto/jsA46jGgtEifAbeG3A8=;
        b=QbEbl293X05y1nrssdv/bshizonhdSp3FYrV0awgPBCX468BVmsv2py8FmIS/PhygA
         0gUQY3AlDlvad7i0pYPZMrsvxRQL8xoGAVSuDoTh8KxHgqprGrTUb8piobY67YMTylfS
         /Qs7f+CLb3idvvdY0cZvptzk4F0g+OWdG09gAmLZh8o4NUo+Bc9LGE1kzXyvDY+WBven
         gSTAZ3PltgtHY7aROkVECwXnbcOMZJroL/KWIfRJ5TNYaqvPi+UPIjocxbCuujVhuqhT
         1JpNBulVrA4fGv7m0xzBdLBPbUSQlqLz1pOaM+070mhffbVglMhQ81Rj3lGIxlFl8xC/
         ADGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788668513; x=1789273313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVHZoxQnI4RGBc2Se+Rzzto/jsA46jGgtEifAbeG3A8=;
        b=iEHSBFRqKGxcIt8h8uAStU5hfTldxkAAgeHxpzaK+MZHbi4ZWxHalE9zhNotaShQNN
         UlzWd6R+rpJMXnKjW23MG+Wm1rrumcy/SSzNW6fsJvgt8TCS6xFe7uClVTx07My43qcq
         fFJoVezXWFe5/hLLTVq2FA0PVEtU2qLUGkCv30/HyeV4GT1+XdRTv0X2OlcayUVuAVsi
         5EA1ULSksB0GgjqIRa5yWB1IEQW+3Dz0n/Fu2sPqCw+o7ebHtnNfERyS6NYURh+yGyHX
         Ew8gHuNZ6SCgONIdJc7Mbr98PJ50nlNutTgQWVF7749BoMuWIlugURrhRiWieIT9Mycq
         FPmA==
X-Forwarded-Encrypted: i=1; AKwUvByOkDdHW2ZbaIMjX6VFSbYcezsgNo8eCaCXlD/MPeFbNuHZQ/IjAnuL5K1nVmUr8WzERLaZI1ujvht4wM+0buMwePhOXA==@lists.linux.dev
X-Gm-Message-State: AFuF++melH3mFwINIzmCc3y3WCVQlE3fn1aRxPjlc4n1bVVZ8wk7At7V
	1bX90sJbBrOQGJi5vepwWey0ZW7m7z5FsH6L6czUr1OZyh9JI8zwB1YF
X-Gm-Gg: AYBFou3TPDEfEKVyVvB+Mw7QoGh4J2I94DwVGYRpY1JL6G93KmCA/XijqwLFFjVlBf8
	pN8k24Os2Yrlea9PXRtpWBh385ypo/jtNpxr2735RV8WsBjara8IjyuYcwAnA7eMe78Jo+DxG3p
	QWDtn+7dT4p/C0kiUn10skKasqcZQQD2AK0MX/IM0GD8ggfp+y+RctVRaMnssvPrmXXv8x0Ojoi
	vkLCBXv8puTDndnQW/wiTO10cY50/Jy4IIeMkOnntZBHoq8dhTEcZpUJrLQzHRqiN6WYxYT5O5k
	gKqqLwuXCESpJ48TcudBv7GWlVgFjkZPiH0B6RhqvRznL/Bk5ey5EkeNui62NSTEN15Z+R/pTE4
	e8Qbd34kAIibugQ6ZgcUufgG5tMPTIml9R4aRPUGrXuVr+MGymre5iVrkRxPUdeLNtNCzb6J6gb
	5BzjaPEIh7DQMK6ea0g2i1Giy1u93uiUb2zBcPuTtoPnYYTZTAUU4lSiO3TNfznepivhpm9PM0W
	DJZQdE99Ii+n0f4XpB1yEHDtDttgn7japyF0VaQUy5GXZKGxhwL1V8=
X-Received: by 2002:a17:90b:1e51:b0:399:ecd:d68d with SMTP id 98e67ed59e1d1-39b26260f7dmr22268351a91.22.1788668513437;
        Sat, 05 Sep 2026 21:21:53 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([27.130.10.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm9412489c88.8.2026.09.05.21.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 21:21:53 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>,
	Gokul K <gokul02k@gmail.com>
Subject: [PATCH] KVM: selftests: Fix reg_list and VM leak in get_reg_list test
Date: Sun,  6 Sep 2026 04:21:31 +0000
Message-ID: <20260906042131.630-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling the test with --list or --list-filtered causes an early return
in run_test() which skips freeing the reg_list and vm.

Use a goto so that the early return joins the common exit path.

Reported-by: Gokul K <gokul02k@gmail.com>
Link: https://lore.kernel.org/all/20260808081050.408657-1-gokul02k@gmail.com/
Fixes: 17da79e009c3 ("KVM: arm64: selftests: Split get-reg-list test code")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Tested on a Rock 5B (RK3588). Running the test with --list and
--list-filtered now exercises the goto path added by this fix and exits
cleanly.
---
 tools/testing/selftests/kvm/get-reg-list.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index 216f10644c1a..6eb91d5c739e 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -189,7 +189,7 @@ static void run_test(struct vcpu_reg_list *c)
 				print_reg(config_name(c), id);
 		}
 		putchar('\n');
-		return;
+		goto free_reg_list;
 	}
 
 	for_each_sublist(c, s)
@@ -306,6 +306,8 @@ static void run_test(struct vcpu_reg_list *c)
 	pr_info("%s: PASS\n", config_name(c));
 	blessed_n = 0;
 	free(blessed_reg);
+
+free_reg_list:
 	free(reg_list);
 	kvm_vm_free(vm);
 }
-- 
2.47.3

