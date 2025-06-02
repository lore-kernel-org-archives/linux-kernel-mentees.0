Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D53189F20
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  2 Jun 2025 23:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748906581; cv=none; b=nE2o715hluaj9oBI76uc9seLCXi8mxt2XlpH7dkfj7HionSGxwBMFIZ1Y04Nf7axbbJATm47Hr2nOGekpLIqBbhKZ4K8l+SPFazAp1ZLfk6ebzIO8MmgAIH89yNvDNQCKHbi60gFwUDRQB2lTrA9mSTTkDLhrADcp7w4QGoYSLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748906581; c=relaxed/simple;
	bh=l4lNPNZ3NUcwOxlD8zL9Fz88dSmoXnMGOr5KnMPj9Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1jY8bpCyfZs+FMiyxMIHb1meI1K5ScgsLSbGt8laJ1rqXvbZKXOdZVjVNZE/4WAJQ7MbKFpED2ToUFlVyi0cJRVujI1pa0Qc+Fy/SdtZ/rVJ0E4sIV/IQtn0oYbf2HlIuK8NCGK87YErAi96ZypkmuaW/XV9RoGvOAhInfXF/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbVBKKcK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbVBKKcK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso33458975e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 02 Jun 2025 16:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748906578; x=1749511378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4lNPNZ3NUcwOxlD8zL9Fz88dSmoXnMGOr5KnMPj9Zs=;
        b=kbVBKKcK088XmmEr/9J3FK5J/UGl4RV44Z3k8z3Bk9zHD+BYVPl04bURvmDmuljGF1
         zDVpBm+KXPSH64qDVpblxnANF7syqCEKHoOO23YcZL21g1zyyCYB+1SB4lTunncvkwDg
         CTBfuNsM8Xe1v9xdwlb8ySNCjuSLHirga7IHch6/B0FciampmT+wCc3kl8iJE31gJ6jk
         wG1ew/iNV4qILm8xpDsnPkbrN2xRjKMxYHf4VCztrNL4G/pWyiDWd+yMVg20dYAWPJiY
         wxfWp0e/ccFNevjIAxYxnzmYgDGBd6N+BCt4v1LdaGKqWkT/8R5aXK6MKb+hut/kK2qi
         bckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748906578; x=1749511378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4lNPNZ3NUcwOxlD8zL9Fz88dSmoXnMGOr5KnMPj9Zs=;
        b=EbPQiyT8wWAmm87bWf4x/3kkeMWnRxcfoV3rD8Bj3vz+HOY5j50Hd5EgBCydIgIflR
         fYGxzl6BkxIH/5a6xxDAUU8jwxk9AJL6TspJvz3uCc292icguB6wa9v/co+0I4/yMRg2
         KD3I67KUSd/ujfvPM55pv1B7MYJ3CT7NM1IyudRlPxjt9BlxOgYrINW1RLSQwueS8itl
         y3yxws1y4IOw+V268o84X80d3kj1SLJBhEUzWeVmx8NjXxwmcPEGh4LkcN8hhTPqE4Vr
         zwhJjAXwu33FHWSEeqzPZZiemZXxsuWOJlp5DlWZ4JCwDlMR7Jk6AheXlpuTxQHRjHVO
         Ps5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2kA+3Iigbz8z6Yn5L5TAw+TkxnhTMFLdvhjdHHx1SUDJ+5/5JQA3V4TTyFWwg0q7WNWFgQuuDFHhD6PwlmYxC7Dd4yQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywggoa2eXqztkfZ4VRCJAjtJsz0X+EyhdPraGw0Fmn0WYD8mrxj
	9SkpyvnSs93nB2rRXsuHQ2Z9QhINtK56KvySR5fRkkDcUKzR9+kqJR/6
X-Gm-Gg: ASbGncu51Vkiz3Rbtx3PKpHwAieOIlq7NXl4UEplSFulkz0W4TUh3pShuhislD2e5Ux
	I7O/qliGXcF0SMunGvqUxVrsPxr6j5myEHVjsnF1B0JhjaRDinRt9yj6Oay9yp/T++idkylkPg1
	X03z98OQzQ8v0RD2V+mxvHTFr/rZFvX5emmht16De+ZA89brqhDiHUJ2UayMFZ1vkMLsJz1R83W
	R7xyqcBgp50nGVqfJiOA4A69UGDXadA94AQ1J5VPfcWvvZj7sFuyAwGfrkmCzj1ahCsFKhwdrvm
	YJuwDi8qtEJTKsVuxw/hzYjgZkh9lMNwjyL5hTlBE7L7qPxkCInaXAT1EjPgEu+bCZsUKMt94Tu
	vXw==
X-Google-Smtp-Source: AGHT+IH6DsnJBoiQsAc3Tp9KiqWWBaTYvk3z0aYMLUKq3Rr7QP0jqJR9LBj8Sq5TS5iI/BGiHrY1Wg==
X-Received: by 2002:a05:600c:5294:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-450d883b9admr124035505e9.13.1748906578187;
        Mon, 02 Jun 2025 16:22:58 -0700 (PDT)
Received: from localhost.localdomain ([197.63.228.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb80f6sm137954765e9.28.2025.06.02.16.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 16:22:57 -0700 (PDT)
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
To: linux-mm@kvack.org
Cc: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] selftests/mm/run_vmtests.sh: skip hugevm tests if write_to_hugetlbfs is missing
Date: Tue,  3 Jun 2025 02:22:32 +0300
Message-ID: <20250602232233.224099-1-khaledelnaggarlinux@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523184312.2647781-1-khaledelnaggarlinux@gmail.com>
References: <20250523184312.2647781-1-khaledelnaggarlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hugevm tests 'charge_reserved_hugetlb.sh' and 'hugetlb_reparenting_test.sh'
depend on the 'write_to_hugetlbfs' binary to simulate writes to hugetlbfs
while checking reservations asynchronously in the background.

When this binary is missing (e.g., excluded from the build), these tests hang
for up to 180 seconds. During this time, run_vmtests.sh is eventually killed
due to timeout, aborting all subsequent tests.

This patch skips these tests if the binary is not found, preventing delays
and ensuring that the test suite runs to completion.

Signed-off-by: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index dddd1dd8af14..0b55395ee2cb 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -375,8 +375,13 @@ CATEGORY="process_mrelease" run_test ./mrelease_test
 CATEGORY="mremap" run_test ./mremap_test

 CATEGORY="hugetlb" run_test ./thuge-gen
+
+# the following tests depend on write_to_hugetlbfs binary
+if [ -x ./write_to_hugetlbfs ]; then
 CATEGORY="hugetlb" run_test ./charge_reserved_hugetlb.sh -cgroup-v2
 CATEGORY="hugetlb" run_test ./hugetlb_reparenting_test.sh -cgroup-v2
+fi
+
 if $RUN_DESTRUCTIVE; then
 nr_hugepages_tmp=$(cat /proc/sys/vm/nr_hugepages)
 enable_soft_offline=$(cat /proc/sys/vm/enable_soft_offline)
--
2.47.2

