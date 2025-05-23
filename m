Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B46B1FF1CF
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 04:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747972801; cv=none; b=VN1kJPaVX9ib1mrOAR3rKZvu/Itb3BO3MB01zS2N9oLARHYgmWxwW6Tu1iUr+pOwZIAcul+r4HdLanIP7swKryWGkH/AfMYq1cwqrT25MESLytJUcjWdaFYMb/zYKIstxouJFtqYtX5Vyra7HZHtmw9TQvldQhY6qkZHaR0UlvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747972801; c=relaxed/simple;
	bh=Sj7m6EM7kndCHsPvRtfATw9pHhcHJtt1zDi6ri9XT5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bqoRpgmMJSN6di+c6tUH9h3QhqxQjEkVD1VzbyXQISHaclOCxdn3B7Cuiocc6F0qYxAB7Zuo/kJYaCNgIdrJPwZkSsJpf7AIQwdQ7BW8Xc3UEhHZcRHlzRAkq+T5fhfACAFeZHECupwm8QtIivBd7mwGiHNdC5GiVYh3IY7hvl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJR5D+W8; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJR5D+W8"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30e9e81d517so5217898a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 21:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972799; x=1748577599; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DoUaDf9sklz66/nXsi99JBqWi7v39+C/PJqdOEBvY4c=;
        b=eJR5D+W8RxPUIYXIDwgTMdwmpXzIiKd3DrgB4bGqKPuPnHNDVFpNX/7gAc44KL7ns1
         8SU+slpK5EXPAgDd8mRMMUOiTsIRh7bqtRFR0uy1vxqB58fK+6MwaqGlTkda1KqGL5BA
         dkY1KnNCUQXmuDa4h/HaN233kiew2AYqVXeMBm6w5TlMr7AbyIE369OvH5uAqOCDAsme
         C9yRIgvC+ioWno3F+DcWDDW4ijGAmyk6pO6ITvO+dMgveeTIC6sclZJsrb7FcwLuA+ND
         b512iKuqqDUWqGqK0UKc6dZrPekxrx8oFpVFZHVWrc+SLXO+2x9BhxFc+dKoEnEOO8wd
         SKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972799; x=1748577599;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DoUaDf9sklz66/nXsi99JBqWi7v39+C/PJqdOEBvY4c=;
        b=H5hNZ7VnqIjXMYC3Rzgt9dkcYzbMUyuZ3y4RAA45H2LgVno7Fu5NvMUoZoJfFWVjGj
         0vVWfbFuR2pTIE+rBwwWJa8btzMQko88+0lJJ7fX9RKwQErzA25qsGmhEkC4+MmESpDG
         +9zLFNyO9qsDbV5NEn07LwztMKGF+cW1GqvPairWBW0Ey9tSvtTB+E6R3FgVIuccgjX9
         rYhLotw+csu/fdPwpb5PEbKdLzLMvj8oRzaHeisSFAynpWgE4cVzI+bDRolD9gKVIMOn
         /beS6b/1529TRE9Gz6m9lkam7/gFq+18MhaMy2Nozfuv21lCuKm0J8eBc6jxCU+wxuw0
         uDYA==
X-Forwarded-Encrypted: i=1; AJvYcCUbUl0enBz5J7iMEWflaD0pUQ2ybsvmkRO8WezPBEzRzbsJrD2L1lgtPuVfDiqAqHqstuqqgQWRNnerE1f4ugsAH4OH0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyVBzvhe2LamXifEb7nWBz3KfYT8BI6Kcno0HrgmE5ZVNnrbxT
	iUScKfpvzBy+OHph94Enz5iGX9T4RHz3Qc9uGoG4QRhGsWEUj6jlXRELhdV6Vg==
X-Gm-Gg: ASbGncsD80PHxFZUrNTlbsiWdA9jH6nvfc3vLzZgjNo/WALAYdqCPwfc3nOikgwjNxc
	kgM98shiqspB6HZe0ugk1bxXldqwsEGgktxb2KbSK1GFDKF1gBqVRU2vknnydveqgoUtCdA5L2Q
	31a5oq7tDDhh284P31DrOVQl0Vea9Lh9fYv4dUkmtLJnyxT9AtdUOT7sgMcGsgLMBcK0np2lfum
	et0CbxHY5EHrcv5eudb0xSetaRt8YUqLpLzWD4tzLcljJEicHqbAbz3Vos+e+4zgroPwLpmC/iF
	ZjTSRqIgLsnhOEqWQ/FFcSPXNgYnp4PhfCv7777mLaqamuFvEt2C368hrCTf2/IpdBg3
X-Google-Smtp-Source: AGHT+IEIiA+D0qQyxvTOmBXHIAVCDDhXMSPK+IhMRA0cF96xdqi3Y/mxBxAyjZlzOIhAF3ZkrM3lqg==
X-Received: by 2002:a17:90b:1ccc:b0:30e:823f:ef3a with SMTP id 98e67ed59e1d1-30e823ff012mr41569578a91.30.1747972799271;
        Thu, 22 May 2025 20:59:59 -0700 (PDT)
Received: from brak3r-Ubuntu ([2401:4900:4e66:e488:f144:96a:edee:4588])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b158fsm6328162a91.8.2025.05.22.20.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:59:58 -0700 (PDT)
Date: Fri, 23 May 2025 09:29:55 +0530
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
To: shuah@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] selftests: timers: valid-adjtimex: fix coding style issues
Message-ID: <aC_yu6Ll2E-3qRHj@brak3r-Ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


This patch corrects minor coding style issues to comply with the Linux kernel coding style:

- Align closing parentheses to match opening ones in printf statements.
- Break long lines to keep them within the 100-column limit.

These changes address warnings reported by checkpatch.pl and do not
affect functionality.

changes in v2 : 
- Resubmitted the patch with a properly formatted commit message,
following patch submission guidelines, as suggested by Shuah Khan.

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

