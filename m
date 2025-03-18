Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB3F38FA6
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Mar 2025 03:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742269398; cv=none; b=ko3KaEIa+toW7XC8UIYsniXCRD5ufHQKqw3+j2sgNuXOaoLDv0sV/veeKUR4TALm7sgKbe29OLQeLB5lqK53DXukmcV6AiUVh2ExuigsljqCcIt2/kpcgvo3wnAVI3n38vmeS8TGhuBhApFFEDTItOrCwAT/G/Kma5V/+OuJ9NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742269398; c=relaxed/simple;
	bh=zC4lcP2V4IiIPxr9JpgDGjzM2a58MVUtBq6gOOCS1H0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g4meJHXKCz9znmXZcIHPrKMPG28sMbch/tZL5KXPrc1z0RW14iRcYQq4FF0FkzLVzsGmJ9ZCLABIGCDUekGCSXe7ry5PD4FQv6aickUp4QVbBWe2j2dYDN8BPZH80WxiIUx3Mc5YiwnKvdOHBp0K6WpevAtp0u9TQm3tQjjZIlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1UcK1db; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1UcK1db"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-225d66a4839so62558865ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Mar 2025 20:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742269394; x=1742874194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bbe7RI1DhdJmmq13I+ma0flbSEXGJRuSSXWMj76ljDs=;
        b=U1UcK1db+klIA5/sS279ImwId9b5/VD6HudUY6CiyQtWF3M4e5kLO2P/KsF3vYK+JV
         SAO0Pzr9ueuPMcUTqDFuc3aeSgcbtBf+1+twomMst9ITiMF2Wyg+qU3GpqlIT6xjS2YM
         htDcNpL1eA+VodWGxnk7sDLkW5aNvEr3iJCMuOD/foC3/wwMvWpL/3wCHpPRpdBhPI+C
         xK165/zPNIFeQSdWF3Rj53MgWunmV0GH1LFeBhtWHSVmPOcnSk3aIighbWrRXfj4H7K/
         JMf/L7O8nQURJazxAiZJjGOHpkhvNOQ2ECl2zIQkxMuj6SnL6/uFIqGOjfY77DHjelT3
         0obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742269394; x=1742874194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbe7RI1DhdJmmq13I+ma0flbSEXGJRuSSXWMj76ljDs=;
        b=U53xjLCHSN4D3N7qtZfxVkrXiMGJ3PRicGM6/Uj54TVMiVfYukGVf/mFfEhaSg2xHb
         s9T2vA1EiJIl5Tafoz92zp3GXPfUXKEF8QoC4yqMJOE8QcbnrFIGtLAGYAzQEXp2kDee
         h9Ld1KsSBQuStLTR9l5KX6JX5iq0+gtyuHBzRpFBQK/cYzR6iLCgrtRfi4WICcq5gw3z
         NVy64+H5Rq803g8mbBUweBkWh6k2O/dzSJnYQ9NYSr8QbaCXbUYNSTKraB55879A6mFQ
         JfDKUgqYekMif6Dt5zpDl2m8KtDhvSQfV+ZyEtZECy55CjBhO+qqdI/oxXUYqCl71xK2
         SwbA==
X-Forwarded-Encrypted: i=1; AJvYcCVWD9ylj+UwdAZMZFRf5oIN8MTIbKRZgnHXFdMsAzvVnBcH1LY1QYsX/E3trshfeM7h1b/iUz3DXIjAN+r69rCGZOYSAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh2n4SNCbQ8uq5F2yeKXSwuX7cuPCViqVYpZOMScTA6uzU6IM7
	DSDJF7tRRnR1XhHtFbUqe9aV/Mi6VXwVqwAezwaX+8pYuSDaDPo2
X-Gm-Gg: ASbGncuLVoCnDUa8/BmF1TcCnUkk/SCaF6HnFWeBYW+VuBPuEx/q37iBLmZGn8kY2fy
	dVlXq8TXNHM9rcuOBHy7U/N2aNzzd3qL5TSQtT5JC6a8+54OLwY2xP/ZCvQOXcxdePIZUXQzE9H
	HddKWNM2E4yUO5dttnplhLbVA/4GaULxooNuFRDHUlNBPhtesaEIzreCtqX5nXPlxTSWHdgd4bc
	E9eeg6uY9UX6pfXYmYWPN2lsIoFRPOEzM926grsUOb5iXa/U+Jf0iPJgVACdXQy3kKP7VXFxU3Z
	dTWdgee8PREME6rCEWAjhpNlGDTgzlfX+e0EB9cOT2VUUiy9VME07HXw8Okp/37o00PgyQUu
X-Google-Smtp-Source: AGHT+IFJQn/cOgw7EyLdb6WHd/Ewe8xwoPRaksNngkE4NI4fE8kg9IuFUAmiQpsXkIZKRDFRr5FG5g==
X-Received: by 2002:a05:6a00:928c:b0:728:f21b:ce4c with SMTP id d2e1a72fcca58-73757794828mr2545778b3a.5.1742269394341;
        Mon, 17 Mar 2025 20:43:14 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:86b4:46:3f1e:43bf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737113d71fbsm8407612b3a.0.2025.03.17.20.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 20:43:13 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: hirofumi@mail.parknet.co.jp
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] fat: Refactor fat_tolower with branchless implementation
Date: Tue, 18 Mar 2025 11:43:09 +0800
Message-ID: <20250318034309.920866-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Elimate the need of if-else branch within fat_tolower, replace it with a
branchless bitwise operation. This can reduce the number of branch ~130
regarding to the test script[1].

Test size can also be reduced:
$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-68 (-68)
Function                                     old     new   delta
fat_parse_short                             1901    1833     -68
Total: Before=22471023, After=22470955, chg -0.00%

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
[1]:
static inline unsigned char old_tolower(unsigned char c)
{
    return ((c >= 'A') && (c <= 'Z')) ? c+32 : c;
}

static inline unsigned char new_tolower(unsigned char c)
{
    return c | 0x20;
}

int main(void) {
    for (unsigned char i = 0; i < 26; i++) {
        if (old_tolower('a' + i) != old_tolower('A' + i))
            return 1;
    }

    return 0;
}

Utilize perf to profile the difference when using old_tolower() and
new_tolower().

$ perf stat -e branches,branch-misses --repeat 100 ./old

 Performance counter stats for './old':

            2,6302      branches:u
              2334      branch-misses:u

       0.000754710 seconds time elapsed

       0.000000000 seconds user
       0.000804000 seconds sys

$ perf stat -e branches,branch-misses --repeat 100 ./new

 Performance counter stats for './main':

            2,6172      branches:u
              2338      branch-misses:u

       0.000782670 seconds time elapsed

       0.000853000 seconds user
       0.000000000 seconds sys

Best regards,
I Hsin Cheng
---
 fs/fat/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fat/dir.c b/fs/fat/dir.c
index acbec5bdd521..77d212b4d4db 100644
--- a/fs/fat/dir.c
+++ b/fs/fat/dir.c
@@ -35,7 +35,7 @@
 
 static inline unsigned char fat_tolower(unsigned char c)
 {
-	return ((c >= 'A') && (c <= 'Z')) ? c+32 : c;
+	return c | 0x20;
 }
 
 static inline loff_t fat_make_i_pos(struct super_block *sb,
-- 
2.43.0

