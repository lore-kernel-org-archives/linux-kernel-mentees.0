Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D82A24A06A
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 13 Jun 2025 03:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749785700; cv=none; b=BOfgd+H6sb3NGNA5OmSwhdJ4jLnmPfRCadosIr8fkNf6K4l8tbcBkRmMVx+tW0qIAyUxbbTh1qS0OPHvTrtwxPE+OgIXfa5AzUENxgHzt+fKZvF7Y+PG9KDi/gDF9l1M+bhUoEVcX867+M3VCMnbj8puiRn3wzj9tY5YzyrMDm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749785700; c=relaxed/simple;
	bh=SkozSVOnUsEzXPxitjFHJu8bXkL2jLMEy6Odc4iIxM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzmAlriPk4fjR6kszexWd9lacq+YjqA75qX3WVF8eHVjC30bc39ZbqanccIC7H3DNA5qg8onC+VrwURGpU4MupUzJ0Ct+bvsUixqwHmpW6EzXkB6MS2xiECCjfrSMtI3gT0vti66hiYc1oCvcMZr9EsvNhnWaZidU07HPmQ0PE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jP1nBDjN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jP1nBDjN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-236377f00easo23197365ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 20:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749785698; x=1750390498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNxJUfWKAJFM1mLIFS2utgiqmJqo3aSwrfykHEFk6Lc=;
        b=jP1nBDjNKNhB/2dZK5QWTC6W024+Y7lPd4bjRljAEwOn3Hj1YB583vP76/JNapywCA
         OrOURYgw7HeeiKUOou+wvyzVdGmXMqw8B/labJkG7QINijMmcMq/ELxwJkAxW2R8pAPc
         UedCKB5kUwGouYtzY5dKVkUn3o65jJ7GWsb4SS6amaxtuDETC3iT2l+3z5ilJia0O0IW
         55G1uORpM3MbBgaHy1z9fD6QdpXa4lsVWog5un9/1vhXkbK7vnAV6lnRs8ayrXIIhfTH
         TfmwddMxqxJWOuRsbaz6CefuBqUbLq3maA1uaQcgxftOpbz9Kn/kpYzICo3Rzii8/IBC
         SUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749785698; x=1750390498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNxJUfWKAJFM1mLIFS2utgiqmJqo3aSwrfykHEFk6Lc=;
        b=oJRVFNYoRRSyj93QOyZt40jz4OW61vwSFr0nmypnLvv2bPR4dZ2yAtER5HD0EtEqgM
         KvoMOMKK7VXYq4HjbKjCdAB0ZLN2tFWytXj9B0LYJxh2CbAYJG2Ts9QeXRROT/BKXwwZ
         8TCFQxAuaq1t/T0xjnRmDIenWZCFM/8UfnFO5UlK44Lw53626C64cfBMdwCOXh9eang9
         q5BRY0tLKz3/tbJQDV1aVFwr1taRvClkf979jF+JcL9Ou4IljKuipxJIHNxGbAl1SBxL
         2OSFdT/GdBrpesFnaNYAvs+H9qwYVdsYmSOhpQszzrpkWrP031F557UDhKA6nxlkMCxH
         uluw==
X-Forwarded-Encrypted: i=1; AJvYcCUHIqEXbtTpttT+JPvozJUMWmiMk1NMX8jUY5a0l0SjXgaWdcmOOPkmbOQNtQEVhYj3RJeYjGJi31zldTaiqdn65JXCJA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWA/1ExfOgIEAgrngM/SYFsA2ryY5pauetIQoMhWnx4LvJbshp
	WnJJa5LKZXyDgvFi8fbdZ24Sic0o61zUAmwhFrrfoB4qXhWkcVrcy4jH
X-Gm-Gg: ASbGncuSbcSfnj/5CiwDvQEhjzKVifsDc/eB28xia6frMRshz+TDXXWWmLTydTmtuRb
	15eutRNa1X/UeinIhSwCdvgVsQxCh1mF5vIYBKb28nJ7RYnXjKZTAnuWHfbr2LSWJ+0sUVXyYmK
	BNDmP0pPVz8Vz3lvzBwYkodaeTlWu3pmNVh5GbUHswTJZuzMkJg9rCceN4oKfvLa6t6w0b0KEDv
	evE7oCt1adEcGMjG4PC/h0oTBl8LtOoHa8qXZmjP4RrMd/ZCLvN85v813rDaNeZ2Lj848SerqzJ
	wel26el0lXyzFCgnsbpWaZ/vrn8cHM2qM22GrQf32/Z7RYmFGIpl6IXa6i7Z88TFLsRIBQ0j4fW
	qyVlngKMHx670/aQ=
X-Google-Smtp-Source: AGHT+IESF+M6oqXA5f8Vw2SniR839ETtLyIUTc+3tpCna/59lCR//WHjBrVJ6TJCecTnlxNf2+Mn0w==
X-Received: by 2002:a17:903:32ca:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-2365d889afamr17940315ad.8.1749785698398;
        Thu, 12 Jun 2025 20:34:58 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:873:d810:9d97:1c69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19d1122sm2339081a91.13.2025.06.12.20.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:34:57 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: yury.norov@gmail.com
Cc: linux@rasmusvillemoes.dk,
	jstultz@google.com,
	tglx@linutronix.de,
	sboyd@kernel.org,
	linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com,
	visitorckw@gmail.com,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH 1/2] cpumask: Introduce cpumask_first_but()
Date: Fri, 13 Jun 2025 11:34:46 +0800
Message-ID: <20250613033447.3531709-2-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613033447.3531709-1-richard120310@gmail.com>
References: <20250613033447.3531709-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the implementation of cpumask_any_but() to cpumask_first_but().
Elimate the need to looping and make cpumask_any_but() a macro to wrap
around cpumask_first_but(), just like cpumask_any() does, to make it
more consistence.

The change brings some benefit in terms of code size shrinking of
vmlinux, for NR_CPUS=64, it reduce 78 bytes in total, for
NR_CPUS=4096, it reduce 2 bytes in total. The details are shown in the
table [1].

Performance test is done using the test script [2]. Running the test for
10000 times, the origin implementation of cpumask_any_but() use 19665287
nanoseconds in total, the new version of it, which is a wrapper around
cpumask_first_but(), uses 19545574 nanoseconds. The difference is 119713
nanoseconds.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
[1]:

For NR_CPUS=64:
$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
add/remove: 0/0 grow/shrink: 3/7 up/down: 46/-124 (-78)
Function                                     old     new   delta
irq_migrate_all_off_this_cpu                 716     745     +29
try_to_unmap_one                            3380    3391     +11
try_to_migrate_one                          2451    2457      +6
uncore_event_cpu_offline                     343     342      -1
calibrate_delay_is_known                     236     235      -1
tsc_store_and_check_tsc_adjust               506     495     -11
arch_tlbbatch_flush                          302     288     -14
tmigr_cpu_offline                            406     382     -24
perf_event_exit_cpu_context                  592     565     -27
flush_tlb_mm_range                          1561    1515     -46
Total: Before=23390770, After=23390692, chg -0.00%

For NR_CPUS=4096:
$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
add/remove: 0/0 grow/shrink: 7/3 up/down: 136/-138 (-2)
Function                                     old     new   delta
uncore_event_cpu_offline                     291     333     +42
try_to_migrate_one                          2378    2413     +35
flush_tlb_mm_range                          1476    1503     +27
irq_migrate_all_off_this_cpu                 741     754     +13
tmigr_cpu_offline                            353     362      +9
calibrate_delay_is_known                     183     192      +9
arch_tlbbatch_flush                          296     297      +1
tsc_store_and_check_tsc_adjust               484     482      -2
perf_event_exit_cpu_context                  546     528     -18
try_to_unmap_one                            3560    3442    -118
Total: Before=23448698, After=23448696, chg -0.00%

[2]:
static int __init test_init(void)
{
    struct cpumask test_mask;
    ktime_t start_time, end_time;
    s64 elapsed_ns;
    unsigned int result;
    unsigned int random_cpu;
    int i;

    cpumask_copy(&test_mask, cpu_online_mask);

    start_time = ktime_get();

    for (i = 0; i < 100000; i++) {
        get_random_bytes(&random_cpu, sizeof(random_cpu));
        random_cpu = random_cpu % nr_cpu_ids;
        result = cpumask_any_but(&test_mask, random_cpu);
    }

    end_time = ktime_get();

    elapsed_ns = ktime_to_ns(ktime_sub(end_time, start_time));

	pr_info("Total time: %lld ns\n", elapsed_ns);

    return 0;
}

The test is running in the form of kernel module.
The test machine is running ubuntu 24.04 on x86_64 machine with kernel
version of v6.14.0, CPU type is AMD Ryzen 7 5700X3D 8-Core Processor.

Best regards,
I Hsin Cheng
---
 include/linux/cpumask.h | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index f9a868384083..d91630a97d76 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -408,22 +408,22 @@ unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
 	for_each_set_bit_from(cpu, cpumask_bits(mask), small_cpumask_bits)
 
 /**
- * cpumask_any_but - return an arbitrary cpu in a cpumask, but not this one.
+ * cpumask_first_but - return the first cpu in a cpumask, but not this one.
  * @mask: the cpumask to search
  * @cpu: the cpu to ignore.
  *
- * Often used to find any cpu but smp_processor_id() in a mask.
+ * Often used to find the first cpu but smp_processor_id() in a mask.
  * Return: >= nr_cpu_ids if no cpus set.
  */
 static __always_inline
-unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
+unsigned int cpumask_first_but(const struct cpumask *mask, unsigned int cpu)
 {
 	unsigned int i;
 
 	cpumask_check(cpu);
-	for_each_cpu(i, mask)
-		if (i != cpu)
-			break;
+	i = cpumask_first(mask);
+	if (i == cpu)
+		i = cpumask_next(i, mask);
 	return i;
 }
 
@@ -864,6 +864,16 @@ void cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
  */
 #define cpumask_any(srcp) cpumask_first(srcp)
 
+/**
+ * cpumask_any_but - pick an arbitrary cpu from *srcp but not the given cpu
+ * @srcp: the input cpumask
+ * @cpu: the cpu to ignore
+ *
+ * Often used to find any cpu but smp_processor_id() in a mask.
+ * Return: >= nr_cpu_ids if no cpus set.
+ */
+#define cpumask_any_but(srcp, cpu) cpumask_first_but(srcp, cpu)
+
 /**
  * cpumask_any_and - pick an arbitrary cpu from *mask1 & *mask2
  * @mask1: the first input cpumask
-- 
2.43.0

