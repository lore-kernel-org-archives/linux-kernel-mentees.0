Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0564E224230
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 01:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747359888; cv=none; b=RQx7fNF7dxdvfs+BV/Lcn70rh5lNud+dpaM6XHb0AjrxVDcYoMFlp9vgDAlZHU8btvCwc4TP9bNe29NDRkRMS7dML/HIi1O38L3Sw8sGlGyYWgguNOhvjrYrLq5Kkcr/RmmB7E3EYiE1uc3ci25d1q3Ch4cDSoAFzznO+Eh8SNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747359888; c=relaxed/simple;
	bh=OLule8vZ6pYFD7KstMmId4kflE7J1eo02CkkvhaIF0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIlSVZ55PcEcJIbERi+YQZgSTWZjHFx180P7N8hgrRsKYsTekCDePaIvCkmC9kkAkDcZ2ux0NnGMYmTYIlVDRRptZl2HGQamHKQAQgi+IoJ4cZ/M5J5MEQl97IFWbB6M5YTY21Q1afkkIP9ejGGdcA85aktyGI+NPhn6ojoNgYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+F/V5Nz; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+F/V5Nz"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70a56b846d8so17313577b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 15 May 2025 18:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747359886; x=1747964686; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jkvwIib7SJ8VISrZy+6Zl38kwYsQhTVmXH1LNDYr2gI=;
        b=A+F/V5Nz5yMJmxuTRg7Zi5cyddxcHK3FDDEBSJWaOLX/+3lusCBF7nvz9A4RNJHqrf
         JIn7Rc/zlgK90HiNhmxnaREW+RajfOMpVuUVbSMO38M3JNTxfJsTZ+jUEisQp2ZIXkMA
         ad4vnSRZzhoDedT2nhCrDTjVRBKoYRR+BibzY3u2G5aTdc9t1geuIVzvFEn/rG6ym89o
         bSi5CuO6u8zrgjWb04QgKntIjEobKC8H34XBpl3L+BzrPRFVU+7kKxd3h1Ipr89V5PR1
         D24ZM1qPV1Is3bswbOadXKEm9m9X3F69vgYYui3ZyL72BNmC5qFSQ0qkg2EGqeJwO57X
         q5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747359886; x=1747964686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkvwIib7SJ8VISrZy+6Zl38kwYsQhTVmXH1LNDYr2gI=;
        b=Lx5tXLSt8M6mAea64VhubHl04GWAn4Vp+2qZ2pTWrjA+KiKYnhTuuMSM6tPuO3BbZj
         6att7NA9rRQyEwbW5XV1SkuUbq2xKACuU+IhJacnAfWEaiFU+f1RHkPGHENJDc7IFh2h
         VLAg1n+g45ZUzytT1iHzs87/1VTe21fZ8Kq2bgeFed1v9lmd3w30R+B1drMUjMKzxE+9
         DsMxWe+RnH0E48/QTAJ32mMjgA2SLsenYBYIHhqhogoKWvB/TTHn/G+jrbUB4oWYos57
         w8RdE2/3xSs3+Yc8UIL/ECDyhwDMf1l+FhuhGZD/NvRs2HEGJ/PVoY2YPrzfvzX4d1D8
         fPxA==
X-Forwarded-Encrypted: i=1; AJvYcCUfyzD/1JuODc6wrB7V0sBulZIJq65csDBD+PZS/fOzjjRAAUTyWl+6ii0KxMFpTajQUS6WiKIfAttizTTetBYkAmM2Cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBxXVGCjtvXZxZgmbI3M16nWx7yvfVJC57hXcig2h1XzvX7LhY
	/+9JIv3O9+84plKH60Ba+CkurLdujGl8Eq/a5zFIUQxIJmSikF297gRd2AAZLAxNT1hbM6xNzmP
	RwVQeP+APz3xYgYD+tYSHfigS+jcCvCGS4A==
X-Gm-Gg: ASbGncuDnchtjMn8ayIlKaKJkqluu7eRrUT1tuIuZAEfT+V2NBi/aXp0RKWUCH6tXcr
	gmIrRQ+73jvxkplqvryh/WAx6rHDsBQoLRrqgc7kVrQEiclYeCB8xjaXEf3lymOFJ4WLdceS+U9
	OyjN+HocrcLThKjcdQogL6GtgcgefelCGCmbqyECH0Y7iiKriwSB7r65iZeJCs/j2vVp8=
X-Google-Smtp-Source: AGHT+IHaUQqw1N80C0OWhVA4FjqviBDRh58TKU0yyt8RSMOTTxsx9frZtSeZj+VRFZjfpaa3ZkwPB+opUbCwU3YjrLA=
X-Received: by 2002:a05:690c:6089:b0:709:1d50:897 with SMTP id
 00721157ae682-70cab0dcf41mr12450787b3.33.1747359885769; Thu, 15 May 2025
 18:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG+54DbGpNn-Ps=djpsUy+K-6V+eoNcMbTcJoW8W5upz2OKn+g@mail.gmail.com>
In-Reply-To: <CAG+54DbGpNn-Ps=djpsUy+K-6V+eoNcMbTcJoW8W5upz2OKn+g@mail.gmail.com>
From: rujra <braker.noob.kernel@gmail.com>
Date: Fri, 16 May 2025 07:14:34 +0530
X-Gm-Features: AX0GCFvnDgljjtOzQ3Gs4asEx8d--Lh61FJjSx4zgR_CjQEsgnkL4Zx2u8VeV98
Message-ID: <CAG+54DZ1wDTdWPQSw01G4YgTdihezQ966LGa6ttmBgT2D2gTyg@mail.gmail.com>
Subject: Fwd: [PATCH] selftests : timers : valid-adjtimex.c : Fixed style checks
To: skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

fixed style checks according to Linux Kernel Coding Style standards.


1 : fixed alignment of parenthesis.
LOG : CHECK: Alignment should match open parenthesis
+                       printf("ERROR: out of range value %ld actually set!\n",
+                                       tx.freq);

2 : fixed alignment of parenthesis.
LOG : CHECK: Alignment should match open parenthesis
+                               printf("Error: No failure on invalid
ADJ_FREQUENCY %ld\n",
+                                       invalid_freq[i]);

3 : fixed line length of 106 to 100 and less.
LOG :  CHECK: line length of 106 exceeds 100 columns
+               printf("Invalid (sec: %ld  usec: %ld) did not fail! ",
tmx.time.tv_sec, tmx.time.tv_usec);

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 tools/testing/selftests/timers/valid-adjtimex.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/timers/valid-adjtimex.c
b/tools/testing/selftests/timers/valid-adjtimex.c
index 6b7801055ad1..5110f9ee285c 100644
--- a/tools/testing/selftests/timers/valid-adjtimex.c
+++ b/tools/testing/selftests/timers/valid-adjtimex.c
@@ -157,7 +157,7 @@ int validate_freq(void)
                if (tx.freq == outofrange_freq[i]) {
                        printf("[FAIL]\n");
                        printf("ERROR: out of range value %ld actually set!\n",
-                                       tx.freq);
+                              tx.freq);
                        pass = -1;
                        goto out;
                }
@@ -172,7 +172,7 @@ int validate_freq(void)
                        if (ret >= 0) {
                                printf("[FAIL]\n");
                                printf("Error: No failure on invalid
ADJ_FREQUENCY %ld\n",
-                                       invalid_freq[i]);
+                                      invalid_freq[i]);
                                pass = -1;
                                goto out;
                        }
@@ -238,7 +238,8 @@ int set_bad_offset(long sec, long usec, int use_nano)
        tmx.time.tv_usec = usec;
        ret = clock_adjtime(CLOCK_REALTIME, &tmx);
        if (ret >= 0) {
-               printf("Invalid (sec: %ld  usec: %ld) did not fail! ",
tmx.time.tv_sec, tmx.time.tv_usec);
+               printf("Invalid (sec: %ld  usec: %ld) did not fail! ",
+                      tmx.time.tv_sec, tmx.time.tv_usec);
                printf("[FAIL]\n");
                return -1;
        }
--
2.43.0
