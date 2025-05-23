Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A212980B0
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 18:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748025800; cv=none; b=YzUpMcA4vYZbftKoXkbcm0bCK9+Cma0czQWNsR50TPkvAZlbDZ8JRbXwqMIyrOTuCbwwk9cG++F86runfTvuJp+r1WZKUiBmrMGKIaAMlgz+RBA30BXnuEG33ci7udtB6IJQwA6mJ0jpQg4XjQRWXV/9Sr4A2dZrcEn2W5W0ijA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748025800; c=relaxed/simple;
	bh=gs5K2rq/cBIABkj5iFdt3STh54GNK4JoTpG2QNUrWDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dTeDndqsCF4JvaMShlFfYvbWFyR9BoW9X4m89lkuJIf7pxMW0WertzDUSa27nEUP3MuvnZheRNJt80IgK8blg8AXUJuMqNScLrgFQPyH1LD2uYCRQ1dIIrTyNopl05viZkqks3pno8k+fUVgzEdmL8BuDW8w8Dket4my8OkM27M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPslOSyS; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPslOSyS"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-443a787bd14so8926745e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748025796; x=1748630596; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=btTTfvQ93Rrp+cfCkaZPBbleiZuXCpTdB3DJ5XEH6Kk=;
        b=VPslOSySClzN8mgiNC3THej8tLEI2kTik1ltj3t9fsFcWTcTQMBpvJ8sRFAMFgqAsU
         tOqa8vaEe4EErEq18aFcOyJgDyKjT29s4Uyo2FPOUKb7GHz5rWt8fyIOdcb4IKt+xqoH
         Y9FLj4Qe9A/Mku5gPP5qNgpILp41YwkAryKrDJ7TPEIdYYZfukwX6U1ePE/BDFR9KGmi
         95CYjF/hJQyTMEX1RZlmoLoKNOXDBNuegdzXr2a7H2X5Bh6lQHJWSZ62rxXCvSL7+YzW
         /ylZkEvVzSutIFOx4P2+nOxHO5IdKGp0VmjzqQHNOG/1/GQcrZu+86mJg21BBcFlJL8f
         oOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025796; x=1748630596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btTTfvQ93Rrp+cfCkaZPBbleiZuXCpTdB3DJ5XEH6Kk=;
        b=XKAdRRAx5zI6NdAsRb1IFDDTELHx0c5m9CeyEpmHBbhBeEovH2qCXI5yx2QJsv7F4V
         GqN8BLZQIzNrYWDPQ9EYaXl04sxUdRzNTqg0HVnwu/SrPXKhbKElIEsteRnDE53qPyQJ
         1vkBUnAUbNtuquyih2G5gErxZ1FGR2wzFInP13/+HflgFbJCcBy7iBhpVsDurK66MMGv
         vyz6FqT2wjbMIOrG7ZT0ck3scc69Q0xZNTyFkcqju/biKlH77mmLHHGM9wtSm5UgEZqz
         sjpNng4jSpaA7stbAsa/c1p0BOv8+LN054bPfTTVmaI6I/V2cWJpQfIHRbDN1vvY5ff3
         wNcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Mvs3qORjUB/L7k7/n+OmBJPvJYN8rck3UCdw4UxpENllXC8ERCxWB8uMjHAgzmpRVXmeTzZ4FME36Od5ZTCm/c8nwA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yysr6x5+3tRlcsOFnYgT/kzoItZcRFSojIhCLLxBt+n3zGy8+RC
	sYbdA9D9kvWcNvlu4noAUNFH9KHZKzk4j+CjGYHxqVKlhNCesut7y5GT
X-Gm-Gg: ASbGncuBGUOf/HlL/PP/i4UIFBsvGXbTNxY/ip6vz7t9m40zJAyqj73Riv5MVKiM+41
	p2HOtEcLkUoxctgzcd2js4y2fujjgksj0jtFT5CBaNre8vF3vRAyKjitZqABpm2KAVrgZZZbSPI
	o8s7GK+23jDLCZgi5ec6w3/K7YfKvt3mFUimZw2ikKfYQvI+JS88G3ZE1uO6+wsCr6Q/RaI/tT7
	BK+TOz6IPkbLLh/5yeWiSynGsvoi39JBFV6EO12BCVEJJU/G7xqbKigQsnABQKNjI4rSmCJS044
	si+jDH9fEXHFtsD92Ky6zQaXY/gjrQywLUn3qLp19ohN6ZiOzAOLUf/RnbaANhD4habtxhXSB2w
	4Xo7ErR8QUc8G
X-Google-Smtp-Source: AGHT+IGbySv0kJkzhoWrw/RDGSmd5NY01lUNmRSyAzY3QDkI4nh5xMLz5f+ebRm9TH2KKXtfV5Tq6A==
X-Received: by 2002:a05:600c:524c:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-44b51f4c57bmr45533255e9.7.1748025796031;
        Fri, 23 May 2025 11:43:16 -0700 (PDT)
Received: from localhost.localdomain ([154.183.50.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f74cce5bsm145897875e9.24.2025.05.23.11.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:43:15 -0700 (PDT)
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
To: linux-mm@kvack.org
Cc: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	akpm@linux-foundation.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] selftests/mm: Skip tests dependent on a binary not built
Date: Fri, 23 May 2025 21:43:12 +0300
Message-ID: <20250523184312.2647781-1-khaledelnaggarlinux@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello.

Running the mm selftests from the kernel's root directory
on an x86_64 debian machine using:

  make defconfig
  sudo make kselftest TARGETS=mm

the tests run normally till we reach one which stalls
for 180 seconds and times out according to the following logs:

```
 -----------------------------------------------
 running ./charge_reserved_hugetlb.sh -cgroup-v2
 -----------------------------------------------
 CLEANUP DONE
 CLEANUP DONE
  
 Test normal case.
 private=, populate=, method=0, reserve=
 nr hugepages = 10
 writing cgroup limit: 20971520
 writing reseravation limit: 20971520

 Starting:
 hugetlb_usage=0
 reserved_usage=0
 expect_failure is 0
 Putting task in cgroup 'hugetlb_cgroup_test'
 Method is 0
 >>> write_hugetlb_memory.sh: line 22: ./write_to_hugetlbfs: No such file or directory <<<
 Waiting for hugetlb memory reservation to reach size 10485760.
 0
 Waiting for hugetlb memory reservation to reach size 10485760.
 0
 ...
 Waiting for hugetlb memory reservation to reach size 10485760.
 0
 Waiting for hugetlb memory reservation to reach size 10485760.
 0

 not ok 1 selftests: mm: run_vmtests.sh # TIMEOUT 180 seconds
 make[3]: Leaving directory '/linux/tools/testing/selftests/mm'
```

Logs show that the executable "write_to_hugetlbfs" is missing, causing
the test to hang waiting for hugepage reservations.

The executable not found means it was not built by the Make system.
It is mentioned in Makefile:136-142, and only built if ARCH is 64-bit

```
   ifneq (,$(filter $(ARCH),arm64 mips64 parisc64 powerpc riscv64 s390x sparc64 x86_64 s390))
   TEST_GEN_FILES += va_high_addr_switch
   ifneq ($(ARCH),riscv64)
   TEST_GEN_FILES += virtual_address_range
   endif
   TEST_GEN_FILES += write_to_hugetlbfs
   endif
```

So, for some reason, the top-level Makefile provides ARCH as x86.

My proposed solution is similar to existing virtual_address_range check
that is to check for the binary, and if it is not found, skip these 2
test cases: charge_reserved_hugetlb.sh and hugetlb_reparenting_test.sh
since they directly and indirectly depend on write_to_hugetlbfs binary.

This is just a workaround, the root issue of different ARCH detection
when running tests from the kernel root directory should still be
addressed. I am not sure how to approach it and open for your suggestions.

Note that this issue does not happen when ran from selftests/mm using
something like

  sudo make -C tools/testing/selftests/mm

because then mm/Makefile's ARCH detection runs correctly (x86_64)

Kindly review and share your thoughts.

Signed-off-by: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
---
 tools/testing/selftests/mm/run_vmtests.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index dddd1dd8af14..cdbcfdb62f8a 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -375,8 +375,13 @@ CATEGORY="process_mrelease" run_test ./mrelease_test
 CATEGORY="mremap" run_test ./mremap_test

 CATEGORY="hugetlb" run_test ./thuge-gen
+
+# the following depend on write_to_hugetlbfs binary
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

