Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06802213E66
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 19:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965391; cv=none; b=QYKg8HldwjPS1WDNSr8QZIv9gyHHhYJlXXtXpxSlgOZ91piti65ExfI0kfYVsLbRs+sWm8kv7kPSbzzj4yyi9Bs8fDV+txjAxtosMdbgCgbuNyuwFZXh0Q1iOd/0K1lZDuc9A2ZaVJN11YUpl+xuuCbMDCdnCavIJhuZK4+m8to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965391; c=relaxed/simple;
	bh=h3+wCYKb+e64nlS7ZiGvNL4qU/lPfezz6///qDSCFIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+tWyZEIybMYtjz+QRaBXI3AeOkhhCpNKYeM9Y//Vhnfbui255jxZcPcWa2w4aISmtKDxfpmIJuCnDparbEcrwcIj8A/JO78t2dbt0pcwgH344YqVZFw/aCFR9ZodsMIoAyfP7e6JO7UG71s6HVFGJMBpCNp7oDmByiCilEwiIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l11m7DKB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l11m7DKB"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23694cec0feso15900825ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Jun 2025 12:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750965389; x=1751570189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kEGLkVDliz6D9cLYESQeH89M3mbRzJDwNUogp0ZBAxw=;
        b=l11m7DKBBW73Xag3DS28cVjbMdQT9oZP2qhoCbpBWdMdyKfJGACbcmgYx6JMbAMIFg
         gvx62mMxCAnfSNc1wdRZGuTrP0HPCwSbEBt8MdXzmiR8ADzprgGo4lqX3I/kwnFs7u/1
         ybGDwBqD5QvSdpbZzDRtSbgg6NM7YXNPwqIUAW9jBJlY7LbeVyWewurfqFCqxGEIFXVt
         ABk7d4r4rPZYmlSlRU9FhIaXYjW82HJM6cEvvxPzlc1qvGfW+NOWAOjV2BugFXs8mo9V
         4VhjQN4p8pvK+q0wCaf54GuzlZyL3tcVDymGa6zGz85dabfzv8HgAOb24gaG5fe3EPAe
         Mn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750965389; x=1751570189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEGLkVDliz6D9cLYESQeH89M3mbRzJDwNUogp0ZBAxw=;
        b=JDaq39G2Wy+VYQNBFQ/k6/fWKQSt6a7SFuBHLudRXEpXVWouhACdnGErXh8+KYdxLj
         lu5d1Py+OiUX+7qghqFW+yf3sGVX7dRYpDq2oAzK+PqVh6QVyqpoLHTJDTjZ6PI5x317
         dTZdci2HsiNxqT/3ialakweNvcfFLst5dfXajl8rRMRDAbGYBGysjvhKi7yNAuZ6dBri
         43l0PooG+WXIosPMbkIudpPpp6S/+ELyydWj5VjhFh9nBv6ZVutAJ8cQsNiZQJ3W8PNi
         qih6mHVHzslyikHuvsIhfkHa+W/A0pTwMCE/Bu/2gDC5OW801zve1wS4OWR+sB45rCoW
         LE9g==
X-Forwarded-Encrypted: i=1; AJvYcCVIAFvBYZ3n/VfIgQTFYhv+RYtWfKDrIW4b3/69Swa07HPBwGqIxyTdabYkR52ElRM2Gh8TsB6KRDaHLizVHVS/uFFi0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwNIigaxoKaEHIxFa6rNNGyI35yQFYMOC0V2yc7m3bWmvqlRqi
	SnA2P2s+KUYSJUIYNc7WpaV17tleSr9YQ1vNZQda58dx1hmbARsPzErJ
X-Gm-Gg: ASbGnctvNt8aCGkXhAuvdWtcu4pqzh2ayPwJS/hDClYemzz+fKESA6x3y3DGd3yToFx
	GmE86Ve4QrsH9ytSiss3rBZp9h+c0ukxrTHDlbt9bqusQVMhVkBKP72G8Le4U5LgR2Nw9zHMPvc
	3D2QrnMU/MvnPAQhbqnLYbEA48gPsPNAjcwadUI4PfUaw5JFgGk8R7cKATvMtvYMckO6dD4qIEG
	oW7vxf+xzkFrCDs1j/xj1KDTUnSkxErZolaRzoORkytENu9DdbcjExiYeJQzAoyTVx8DvJC6TUv
	8z24Bufp3D8MN3DY39pUvDotN7ut/6YY3MaP65L//6aLG6d9cvoBZV6F2NOSYAH6
X-Google-Smtp-Source: AGHT+IGZJiK7V87UN2yeGD2QBj1W9kV1b1WZgMlsenEy/ueEwohDtG/9+5bGugIvGv5i43iGmzj+jA==
X-Received: by 2002:a17:902:ce8e:b0:223:4d7e:e52c with SMTP id d9443c01a7336-23ac3cf546dmr7602755ad.5.1750965389212;
        Thu, 26 Jun 2025 12:16:29 -0700 (PDT)
Received: from p920.. ([2001:569:799a:1600:203c:1dca:e60c:1243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe4245d2sm4038765ad.199.2025.06.26.12.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 12:16:28 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: shuah@kernel.org
Cc: yifei.l.liu@oracle.com,
	zhujun2@cmss.chinamobile.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>
Subject: [PATCH] selftests: breakpoints: use suspend_stats to reliably check suspend success
Date: Thu, 26 Jun 2025 12:16:26 -0700
Message-ID: <20250626191626.36794-1-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The step_after_suspend_test verifies that the system successfully
suspended and resumed by setting a timerfd and checking whether the
timer fully expired. However, this method is unreliable due to timing
races.

In practice, the system may take time to enter suspend, during which the
timer may expire just before or during the transition. As a result,
the remaining time after resume may show non-zero nanoseconds, even if
suspend/resume completed successfully. This leads to false test failures.

Replace the timer-based check with a read from
/sys/power/suspend_stats/success. This counter is incremented only
after a full suspend/resume cycle, providing a reliable and race-free
indicator.

Also remove the unused file descriptor for /sys/power/state, which
remained after switching to a system() call to trigger suspend [1].

[1] https://lore.kernel.org/all/20240930224025.2858767-1-yifei.l.liu@oracle.com/

Fixes: c66be905cda2 ("selftests: breakpoints: use remaining time to check if suspend succeed")
Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
 .../breakpoints/step_after_suspend_test.c     | 41 ++++++++++++++-----
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/breakpoints/step_after_suspend_test.c b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
index 8d275f03e977..8d233ac95696 100644
--- a/tools/testing/selftests/breakpoints/step_after_suspend_test.c
+++ b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
@@ -127,22 +127,42 @@ int run_test(int cpu)
 	return KSFT_PASS;
 }
 
+/*
+ * Reads the suspend success count from sysfs.
+ * Returns the count on success or exits on failure.
+ */
+static int get_suspend_success_count_or_fail(void)
+{
+	FILE *fp;
+	int val;
+
+	fp = fopen("/sys/power/suspend_stats/success", "r");
+	if (!fp)
+		ksft_exit_fail_msg(
+			"Failed to open suspend_stats/success: %s\n",
+			strerror(errno));
+
+	if (fscanf(fp, "%d", &val) != 1) {
+		fclose(fp);
+		ksft_exit_fail_msg(
+			"Failed to read suspend success count\n");
+	}
+
+	fclose(fp);
+	return val;
+}
+
 void suspend(void)
 {
-	int power_state_fd;
 	int timerfd;
 	int err;
+	int count_before;
+	int count_after;
 	struct itimerspec spec = {};
 
 	if (getuid() != 0)
 		ksft_exit_skip("Please run the test as root - Exiting.\n");
 
-	power_state_fd = open("/sys/power/state", O_RDWR);
-	if (power_state_fd < 0)
-		ksft_exit_fail_msg(
-			"open(\"/sys/power/state\") failed %s)\n",
-			strerror(errno));
-
 	timerfd = timerfd_create(CLOCK_BOOTTIME_ALARM, 0);
 	if (timerfd < 0)
 		ksft_exit_fail_msg("timerfd_create() failed\n");
@@ -152,14 +172,15 @@ void suspend(void)
 	if (err < 0)
 		ksft_exit_fail_msg("timerfd_settime() failed\n");
 
+	count_before = get_suspend_success_count_or_fail();
+
 	system("(echo mem > /sys/power/state) 2> /dev/null");
 
-	timerfd_gettime(timerfd, &spec);
-	if (spec.it_value.tv_sec != 0 || spec.it_value.tv_nsec != 0)
+	count_after = get_suspend_success_count_or_fail();
+	if (count_after <= count_before)
 		ksft_exit_fail_msg("Failed to enter Suspend state\n");
 
 	close(timerfd);
-	close(power_state_fd);
 }
 
 int main(int argc, char **argv)
-- 
2.43.0

