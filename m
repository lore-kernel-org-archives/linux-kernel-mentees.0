Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958AC1CB31D
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747479421; cv=none; b=adwoCK65reYyXR6p9kup6kohbis71Ym4X4hosAYcOTGQ9696bBb6T/KUTAyZVWgyvgrlrAQpbFlfqM2s4ip99S266KC160pQKAit/M6OuToUMxlenyZYuwYS5apBj7L6/l/rx7eYEPBiu06S67lytXcIPZJETQt7M5wmo0UTsMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747479421; c=relaxed/simple;
	bh=TaOUUvJfOBQRRvg+2oaX4mZwU1C72eN4A3s8vUyQwqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nu/SprX6/fdGWexVoj6IT5dGfth2gbiijxyLEET4YPW3kRJWV54AV4Utx4S7zNcjBikr9T6f6cF4hSlHw/3Rng2vSiZdlm3wftvFONG55WRb49KDO7/xsO9h1rmiz+Qq8g+nHxl2jIFFSqaH/IwTQm12tgbPxydZZ5IZsFHC1Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jH1IqbPE; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jH1IqbPE"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7423fb98c5aso2807302b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747479419; x=1748084219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qxhz2TL1+lksmnlQygP7TKzX54zvkcpHG0iUspN9avE=;
        b=jH1IqbPEVQdnhm5fdR2RjwKVCoTlA7u4KWhs2K0H+ypjebgieV7/oq1eO5qhuwhjg0
         u+MBF6GRA86aK+xhjCsOfmD2O56KwJUOYcLlKAc9qquaqAXqDh4Y5Vqjoz1Nndf8ecC2
         8Xq8KXvPv9gMcvvUSIUq6snMjMK6QM94+lop7j3j24KUzMbr9g5GK4AU7yzVzQaejmDf
         CE7PncT3BT91IbXVmuMdX3HNX/bzdTODvrjlSdZQGgbA/tEMCNs+8bdbI1fTcPyVzSLn
         uhjfDm2ZEISR/x4Bk2dc+NHK+jKP/acHcFkOnSCOzqNXvI0EC8+3S/0UhBLZNu36bOYE
         nl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747479419; x=1748084219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qxhz2TL1+lksmnlQygP7TKzX54zvkcpHG0iUspN9avE=;
        b=EMfxm0m0NKLdJ5VOA5RDQX4p9uw6zRo9G/Slyyul+a9cFMI3LDEGBN/8aEOpz24n9K
         ipkeUrF8df3GAVzS2TOX/uvb7LymNaBVPCKMEMKdEDO59UE6CQNeEc+2OckZfwOEVhiQ
         FHDx+7N90Zza6kJBHBdkrDB/bGNwEv9f+aiK3a3VjztQ5MGo/Kw+mlGFJPxGp7KWr210
         zxq/oF8CqSywBvea54METrTnMDR9kxODE/3fd1K/qmA5Lry5Bfu1f3g21oWkIPR+eiuU
         8OM1TAFvxdi4/Fmta+IB1C4+4+yK86sj0psdBWf9geJeAcoYatPOyiGQ+s4x5rt49JiR
         mIgA==
X-Forwarded-Encrypted: i=1; AJvYcCXEJ9ld107+uLd1GYWcn/4MoDFgDUvbC6K5mfitpFb2N0pYBcnUQZCQxEIngw/874RsbEdOr1EGrQ+X0hVmwTMVHdXvnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPCKLal6b8OqkNtwxLZEQFOsBIyzFw2dh8bPY4ONXEn/qmB81n
	e5fJlcngCALiiR0xSM4Cmy/I5+PDw2/LKrUclPZrO38SNX2WOAFc+vj/
X-Gm-Gg: ASbGncsYxfqhYaWQf/32J8JrS1pnNBIXRfAsWI1XBRTfg5Et5x/GQpNB2Ff18rwxjp1
	x9LRhccMwX/rT76PqtAWiljLGeZqoN+8WxA2EdOReEVphu4nCYRh0VNlPX3P5bLYVDgZVPgU5Ty
	LST2FUJQCtZ3Rvtr+MseVbWJrvkKZ/5pqwxRl9SMAG0JyoUrP7lW+LxMk3Frl+Mb08K5LkKuUot
	1qqxynjzy9WisGcA5gG4xvzg9xc3DrDn6EWmlF9iWGqXHq/vRuncDsmAQULd7Ng6hPZd+dzIicA
	JRFvBZUeeb9zh6u2ZJeu2ZLBg84+m2x/dCSNfOyG3sponYkeW8yRlmidvFd5SuA=
X-Google-Smtp-Source: AGHT+IEyohYK5wDYwRvsjeOzzJ3z49rlbGmQNUgPMxSJe2CH1kN97HeVrQHblZ2cwgCHYKWzwlPM3Q==
X-Received: by 2002:a05:6a21:7e86:b0:218:bbb:c13d with SMTP id adf61e73a8af0-2180bbbc1b0mr6619521637.13.1747479418722;
        Sat, 17 May 2025 03:56:58 -0700 (PDT)
Received: from fedora.. ([103.102.144.175])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8ead7sm2961955a12.46.2025.05.17.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 03:56:58 -0700 (PDT)
From: Nidhish Chauhan <solemnsquire@gmail.com>
To: shuah@kernel.org,
	skhan@linuxfoundation.org,
	alexandre.belloni@bootlin.com
Cc: Nidhish Chauhan <solemnsquire@gmail.com>,
	nux-rtc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] selftests: rtc: fix grammar for more clarity
Date: Sat, 17 May 2025 16:26:48 +0530
Message-ID: <20250517105649.18163-1-solemnsquire@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix some grammar mistake and improve clarity of output messages
and comments in rtctest.c. Fix format of message in accordance to
other output messages in rtctest.c.

Signed-off-by: Nidhish Chauhan <solemnsquire@gmail.com>
---
 tools/testing/selftests/rtc/rtctest.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
index be175c0e6ae3..42456dd90095 100644
--- a/tools/testing/selftests/rtc/rtctest.c
+++ b/tools/testing/selftests/rtc/rtctest.c
@@ -138,10 +138,10 @@ TEST_F_TIMEOUT(rtc, date_read_loop, READ_LOOP_DURATION_SEC + 2) {
 		rtc_read = rtc_time_to_timestamp(&rtc_tm);
 		/* Time should not go backwards */
 		ASSERT_LE(prev_rtc_read, rtc_read);
-		/* Time should not increase more then 1s at a time */
+		/* Time should not increase by more than 1s at a time */
 		ASSERT_GE(prev_rtc_read + 1, rtc_read);
 
-		/* Sleep 11ms to avoid killing / overheating the RTC */
+		/* Sleep for 11ms to avoid overloading or overheating the RTC */
 		nanosleep_with_retries(READ_LOOP_SLEEP_MS * 1000000);
 
 		prev_rtc_read = rtc_read;
@@ -163,7 +163,7 @@ TEST_F_TIMEOUT(rtc, uie_read, NUM_UIE + 2) {
 	rc = ioctl(self->fd, RTC_UIE_ON, 0);
 	if (rc == -1) {
 		ASSERT_EQ(EINVAL, errno);
-		TH_LOG("skip update IRQs not supported.");
+		TH_LOG("Skipping test since update IRQs are not supported.");
 		return;
 	}
 
@@ -192,7 +192,7 @@ TEST_F(rtc, uie_select) {
 	rc = ioctl(self->fd, RTC_UIE_ON, 0);
 	if (rc == -1) {
 		ASSERT_EQ(EINVAL, errno);
-		TH_LOG("skip update IRQs not supported.");
+		TH_LOG("Skipping test since update IRQs are not supported.");
 		return;
 	}
 
@@ -252,7 +252,7 @@ TEST_F(rtc, alarm_alm_set) {
 		 */
 		ASSERT_EQ(RTC_ALARM_UNKNOWN, alarm_state);
 		ASSERT_EQ(EINVAL, errno);
-		TH_LOG("skip alarms are not supported.");
+		TH_LOG("Skipping test since alarms are not supported.");
 		return;
 	}
 
@@ -324,7 +324,7 @@ TEST_F(rtc, alarm_wkalm_set) {
 		 */
 		ASSERT_EQ(RTC_ALARM_UNKNOWN, alarm_state);
 		ASSERT_EQ(EINVAL, errno);
-		TH_LOG("skip alarms are not supported.");
+		TH_LOG("Skipping test since alarms are not supported.");
 		return;
 	}
 
@@ -384,7 +384,7 @@ TEST_F_TIMEOUT(rtc, alarm_alm_set_minute, 65) {
 		 */
 		ASSERT_EQ(RTC_ALARM_UNKNOWN, alarm_state);
 		ASSERT_EQ(EINVAL, errno);
-		TH_LOG("skip alarms are not supported.");
+		TH_LOG("Skipping test since alarms are not supported.");
 		return;
 	}
 
@@ -454,7 +454,7 @@ TEST_F_TIMEOUT(rtc, alarm_wkalm_set_minute, 65) {
 		 */
 		ASSERT_EQ(RTC_ALARM_UNKNOWN, alarm_state);
 		ASSERT_EQ(EINVAL, errno);
-		TH_LOG("skip alarms are not supported.");
+		TH_LOG("Skipping test since alarms are not supported.");
 		return;
 	}
 
@@ -494,7 +494,7 @@ int main(int argc, char **argv)
 	case 1:
 		break;
 	default:
-		fprintf(stderr, "usage: %s [rtcdev]\n", argv[0]);
+		fprintf(stderr, "Usage: %s [rtcdev]\n", argv[0]);
 		return 1;
 	}
 
-- 
2.49.0

