Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8008B2905
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  6 Sep 2025 15:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757174388; cv=none; b=hh8GN92zxklcutQm3oqYlOzqZSH03IpNzdT5KQattDZW0SMqsMe3/1a4Nyh6JdsG0TLLlde4CtuFz2RpnRKV1tRfQE+7MQHf44Bbst7oi6iCS8YmciYcepjcAdRHGwLMVBxUldvD3c5ycsVQUivuLtre97uDXqF6KtUThKuBYjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757174388; c=relaxed/simple;
	bh=h4wiwBgaByzT8nTZ1ZqpoQOXMs896bVUy0Kfjd3++Q0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OHhAXn3b9pHhxqfQzqqlPqUFPA7xWLI7gxRmlFAeiIDRtuQ81a7yKQ22QXihnUUtOfAcHPTdpuUnOqYYTbwKWugg2vbMKAxzrh4l8II3AwtZo0vjEwOCeqQanv1faizqe4e39kMRM0RI11C22ceK85WqgSu491+IfN6enpTlRKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ugd95Rcg; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ugd95Rcg"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so2715879b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 06 Sep 2025 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757174387; x=1757779187; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrIFwtSt9A6lyVVU3dEeMrt9dG3SP7YLN7A/4OIq3Uc=;
        b=Ugd95RcgWkdpxLlQ1r6oaMDTy81e/kGOmfqK9qlawiKeQjEBQiCPBfpG7n//8am+AW
         /cfSFij7An+PU/Mb8/RO4MxqO6bJWyxEURzozL4D9kpxpg0ylSq9+rhcioR/+jcrqFIh
         lbx2M0O1EAApiZnaO9cKEHmU78CvgIRddO7mly2Btj0DPTMGAHmcBJML4wctYNfkxbzV
         FTh0QMHPDJX+VVaUR+cLfKY7TvZ/sZU0WrjDh1akX22hOjGhUvAbUearNMUfEM0P6Rkk
         Xf8eqpDcfZxgLeh2SDGl61W2dM3gAZcCRq+3mLbMUmDiY4+hKIqZtYbyxU/AL4oEKiz9
         yOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757174387; x=1757779187;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrIFwtSt9A6lyVVU3dEeMrt9dG3SP7YLN7A/4OIq3Uc=;
        b=TKB3bQ3QZ4P5AqDWBGYHTAqZ3UoWao64yETs8lbKH1g5ZjAwdV0M0j+9whbz/C6mej
         DsgJfY0ZYchiIdscVfGiWrzXTrXFu65O12aAeNHVcT8US8oUpbS9ZYaPqJGZoR4Yy/1M
         b7uG8Gnat2nmH4sQ4aD3ugNNVjKP6lqToafXqqr+mndVrLyCls4aHxREbBd8VQmgSlQd
         VvaGVVGYIvjHqeVaHJoeT0LlbzWDUGQhTvZMxW6h89whuciOjbDsfRnt2nJIHJ8eOrEF
         +hTRl/x1uQvmY2r+rTu/Jy46WNKhE+FBbUU8KaQ/qO5QRyVUrel5dvguh+kdSPXlrmhR
         +LZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtQIYLqFUIa5OZGVOf1hWF57Ba8fiatkjpmzcyaNTq8FwSJfSHKGy6C7iY8ou+/IR6/4r8GsAHr+jTXD38ZnqzOvnRUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+dxZwxVvjXbPk2YfGkbf11zrxkdumFUzWE8TxobwHgqDu40MI
	A/SGr2vlaWFk0TMdZwcD0ajy3VyFQbPK/XdIvADgB39VYFiP76ZdreeX
X-Gm-Gg: ASbGncvL1rZWi4brOYin1ScT/4vTFeV/SULH5ZTIntAy3w6XSyiq5m7iPzfGM7nOvrB
	AK3WVTpKGjn810GHoWwYmhtk2KJDTopzpfqa/g5R2LRwWaO7P2xLZaVlRItvyshso3VNPEJ9TAu
	jkDS1uDUvn26q65e976ZoJEGcrPvbJV/B2eDjMQx1wFJvSGvtLNDmn3H0xWphRqSDeDQRx/4PhE
	P0mvmVgYe1bx08hAKLHgn+wGgTr4aEu1allRo2rOKuxQswXuRhsiTlZcraOL24yFU3HYarWsSOE
	ExG/HrobbgIlkpkWjVjHHaz5rWXNMYlqEZoUXAdPSEco9IoJxZfWE4xxb5wzw3sLVJCCO96FcDM
	CGtvUDlGofmQTDkEAyZBlzb5MBy+Vaqo=
X-Google-Smtp-Source: AGHT+IHJkBfbaRZTfiawC3YBCWrAP6hCVu4FwytpXR+uUzJyLvZ6bKq0SL4BUl4mZxqTv0swGQezkw==
X-Received: by 2002:a05:6a00:9162:b0:76e:7ab9:a238 with SMTP id d2e1a72fcca58-7741bf66911mr8160961b3a.15.1757174386587;
        Sat, 06 Sep 2025 08:59:46 -0700 (PDT)
Received: from localhost ([159.117.70.219])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7722a26abdesm24451555b3a.1.2025.09.06.08.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 08:59:46 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
Date: Sat, 06 Sep 2025 23:59:28 +0800
Subject: [PATCH] selftests/net: fix unused return value warnings in ksft.h
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-selftests-net-ksft-v1-1-f1577cea3f68@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF9avGgC/x3MSwqAMAwA0atI1gZqqxW9irjwk2pQqjRFBPHuF
 pdvMfOAUGASaLMHAl0sfPiEIs9gWge/EPKcDFrpSjXKotDuIkkU9BRxExfR1NraxtTjVM6QwjO
 Q4/ufdv37fk3QvfpkAAAA
X-Change-ID: 20250906-selftests-net-ksft-37266937bc4d
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
 Nai-Chen Cheng <bleach1827@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757174379; l=1664;
 i=bleach1827@gmail.com; s=20250730; h=from:subject:message-id;
 bh=h4wiwBgaByzT8nTZ1ZqpoQOXMs896bVUy0Kfjd3++Q0=;
 b=doHOCBxnaG5mpY+1/18TuD7d+TAkG2uLQIUjLXuWgnXjJqEMnp8qGuPA1VO2R5Gi3UhOoJ2Gb
 LZoWaVMySTBBc8DNJv13kgiS7zFebHmdowBV1UgYRBbP4MjMtupYCNE
X-Developer-Key: i=bleach1827@gmail.com; a=ed25519;
 pk=jahFPRplw20Aaim8fIt8SxlFMqkHbJ+s8zYBGbtHH5g=

The write() and read() system calls in ksft_ready() and ksft_wait()
functions return values that were not being checked, causing complier
warnings with GCC.

Fix the warnings by casting the return values to void to indicate that
ignoring them is intentional.

Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>
---
 tools/testing/selftests/net/lib/ksft.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/lib/ksft.h b/tools/testing/selftests/net/lib/ksft.h
index 17dc34a612c64e549f634e82a23f317b2ff6a282..0ca2cb408c643bc76c0aaea684f0e7e28e6b05a6 100644
--- a/tools/testing/selftests/net/lib/ksft.h
+++ b/tools/testing/selftests/net/lib/ksft.h
@@ -10,6 +10,7 @@ static inline void ksft_ready(void)
 {
 	const char msg[7] = "ready\n";
 	char *env_str;
+	ssize_t ret;
 	int fd;
 
 	env_str = getenv("KSFT_READY_FD");
@@ -24,7 +25,8 @@ static inline void ksft_ready(void)
 		fd = STDOUT_FILENO;
 	}
 
-	write(fd, msg, sizeof(msg));
+	ret = write(fd, msg, sizeof(msg));
+	(void)ret;
 	if (fd != STDOUT_FILENO)
 		close(fd);
 }
@@ -33,6 +35,7 @@ static inline void ksft_wait(void)
 {
 	char *env_str;
 	char byte;
+	ssize_t ret;
 	int fd;
 
 	env_str = getenv("KSFT_WAIT_FD");
@@ -48,7 +51,8 @@ static inline void ksft_wait(void)
 		fd = STDIN_FILENO;
 	}
 
-	read(fd, &byte, sizeof(byte));
+	ret = read(fd, &byte, sizeof(byte));
+	(void)ret;
 	if (fd != STDIN_FILENO)
 		close(fd);
 }

---
base-commit: d1d10cea0895264cc3769e4d9719baa94f4b250b
change-id: 20250906-selftests-net-ksft-37266937bc4d

Best regards,
-- 
Nai-Chen Cheng <bleach1827@gmail.com>

