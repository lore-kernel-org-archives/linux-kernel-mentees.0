Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEFE63CF
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Oct 2025 17:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760376921; cv=none; b=YjNvBqnAdUXD2pUIF2DF1xDFV0SLkA+6EoJknV3ZzUCDi2vX79VdyN+f9ncuyfeLutq9V4RuDCZaSwYFggMpY0OK5OmvDQaEF3LdAg9NhgGweg6D+3seF9sKNK/E93tMIhRfL7JCD2eJU5117RjtaGIbp5UHR7Jj8EuHYhrNf5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760376921; c=relaxed/simple;
	bh=5u2WXKnAjwunglH4kI3kkBVZBl7dmg03x+w3dzWZQVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nO/SXiZVNOzdOyLmBfN3Wkgh9+bJYeztZavtXeUVmeNCd+tb/Zg4fevzCWLsH+HVFeSTn/s8yeDHpGyWfgk7wm5duz9KZbs4Wqh+MKFY6aXKsa1QmXmcb8FC7hMKFkclAq7cbCiRydTZ+HVYW3JBz38pdWb5j+Zsz9h7Js6ULDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Au8l70aw; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Au8l70aw"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-782bfd0a977so3814155b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Oct 2025 10:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760376919; x=1760981719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sf7lPV7/xKbHW1ixA4klO6iVP5TLl9rMqKB3b4kTyF8=;
        b=Au8l70aw7f92yKqsiqPS+JcEBhwDW0cSJvvMhC0/MMQ41zjrw5u2ijLoRhuzicsxwD
         P7v73zcLb5w2MzO+y1sYsIZw+eb9jQ3nMO0UYaZAn98mn7bvssnxXKs8pTaMsTKByui8
         0kNf2La0dS2C0AFaz2Plj/D6pJVk3D/YwFDb77ZF8eoOd6PueKyUeFEMspSbquGe8jNu
         eAY8Iko7isvqTV2wHOoN7C6kp77hqrbcTcchq4IZl0Ujqtlyh9AE1Y1n0KVhbNhjummX
         50dN1IUuAGCnIF2WPnVM+W9x5+sBzzFoUJmTvTRnHFvXpaZ0mv+fovdMDwEZh0d/bOxM
         iDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760376919; x=1760981719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sf7lPV7/xKbHW1ixA4klO6iVP5TLl9rMqKB3b4kTyF8=;
        b=YbtVf04negKcuH9MTRUMae0y2YoJammCg1hdeASGpyai0oYjOMol+sIux1iroSblrr
         RonUamkSSaYmAXZ07GVBnp/Afyrk3hT9er4RBAFNoUKJiuoZkBEZtczYHY08vNqXAKSD
         h/N2zwsjFFRuCG0cun7ol46UFC3VZXykLH7oP4kpE269u5AUtUfDqikr2fI0w+qROODZ
         WTlYYsBf5XCAMvN8Us/hqnMg7zlGS9ZphAlxN0/qXZMAypSkIhfslAyzYUj4y7eoEOEh
         Unypgs+2vMu6U0dl7WHAOn0+ePQD+2m8Yqiwyl4ZTsH5T/2/zxyAtsedHfeoa5TgpQJQ
         O5Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUyEeM+BmbmLhNjUY/t32hPrZ6W/XVnFcRMjqB8L2rbuKzqtxPps6dz5PQEGB0R0fX+39gKpOkixdhTtM6uCIFjjCXBXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWdw8KKpHn9QPC1eWCi70vKu6SIJAzg63kBKTjOIBUknZl2I1t
	fnoEYSect5+tkuD+qdmARXA2uulbqfbnDswdhhZZPEd9dBM07I0ogD7V
X-Gm-Gg: ASbGncsmXkUQkfTzaElvy/by3OQpDtYGPnkUA0Y2kMPnEYrsqnsbYLyfkAPUsPWDyLB
	4chxaemQCDAL40oXtA4KJqKEaeavq86N6ztm+LVec8RNcGUtoBsZIN9CudSJLFvBUJYUkPGumc0
	wrN3dU19Mx/poMZe3xbs22qJpol5K2c/aTIb7wWKZVJtg65TARC4wuEJDDPk4Pgi1pRtRYHRqIL
	CrEAKvTfVWUxI998lw1NKCF+PaQczbmYYRGSGvdWHzvic7jRdFQmNdui48U65xGUxZpR0TFtxd0
	vyB7Ohjetz9krYRUHA3iA03p2CSnrtDg2pTVZwD3nNbudkoo1fOw+ZilkRQ6tp8rdG2JHP+wJnH
	zbmxcnTkJdSzixAZtTgigdMug6S2UBbbSvp0/jsjIkJ4/e88=
X-Google-Smtp-Source: AGHT+IHJ9JF04NEk0RDWo/M+FonZg1W+ZUki100QfI9FsimhO0rPRbX+SiqlvkhlTM0409gSBAc5Yg==
X-Received: by 2002:a05:6a20:1585:b0:2f2:add:331a with SMTP id adf61e73a8af0-32da81303c6mr30024622637.19.1760376918796;
        Mon, 13 Oct 2025 10:35:18 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bc13543sm12208080b3a.35.2025.10.13.10.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 10:35:18 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: lasse.collin@tukaani.org
Cc: skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ankan Biswas <spyjetfayed@gmail.com>
Subject: [PATCH v2] lib/xz: remove dead IA-64 (Itanium) support code
Date: Mon, 13 Oct 2025 23:01:58 +0530
Message-ID: <20251013173446.8692-1-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for the IA-64 (Itanium) architecture was removed in
commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture").

This patch drops the IA-64 specific decompression code from
lib/xz, which was conditionally compiled with the now-obsolete
CONFIG_XZ_DEC_IA64 option.

Note that the upstream version of xz_dec_bcj.c still retains support
for the IA-64 BCJ filter.

Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
Acked-by: Lasse Collin <lasse.collin@tukaani.org>
---
 lib/xz/xz_dec_bcj.c | 95 ---------------------------------------------
 lib/xz/xz_private.h |  4 --
 2 files changed, 99 deletions(-)

diff --git a/lib/xz/xz_dec_bcj.c b/lib/xz/xz_dec_bcj.c
index 8237db17eee3..610d58d947ab 100644
--- a/lib/xz/xz_dec_bcj.c
+++ b/lib/xz/xz_dec_bcj.c
@@ -20,7 +20,6 @@ struct xz_dec_bcj {
 	enum {
 		BCJ_X86 = 4,        /* x86 or x86-64 */
 		BCJ_POWERPC = 5,    /* Big endian only */
-		BCJ_IA64 = 6,       /* Big or little endian */
 		BCJ_ARM = 7,        /* Little endian only */
 		BCJ_ARMTHUMB = 8,   /* Little endian only */
 		BCJ_SPARC = 9,      /* Big or little endian */
@@ -180,92 +179,6 @@ static size_t bcj_powerpc(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
 }
 #endif
 
-#ifdef XZ_DEC_IA64
-static size_t bcj_ia64(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
-{
-	static const uint8_t branch_table[32] = {
-		0, 0, 0, 0, 0, 0, 0, 0,
-		0, 0, 0, 0, 0, 0, 0, 0,
-		4, 4, 6, 6, 0, 0, 7, 7,
-		4, 4, 0, 0, 4, 4, 0, 0
-	};
-
-	/*
-	 * The local variables take a little bit stack space, but it's less
-	 * than what LZMA2 decoder takes, so it doesn't make sense to reduce
-	 * stack usage here without doing that for the LZMA2 decoder too.
-	 */
-
-	/* Loop counters */
-	size_t i;
-	size_t j;
-
-	/* Instruction slot (0, 1, or 2) in the 128-bit instruction word */
-	uint32_t slot;
-
-	/* Bitwise offset of the instruction indicated by slot */
-	uint32_t bit_pos;
-
-	/* bit_pos split into byte and bit parts */
-	uint32_t byte_pos;
-	uint32_t bit_res;
-
-	/* Address part of an instruction */
-	uint32_t addr;
-
-	/* Mask used to detect which instructions to convert */
-	uint32_t mask;
-
-	/* 41-bit instruction stored somewhere in the lowest 48 bits */
-	uint64_t instr;
-
-	/* Instruction normalized with bit_res for easier manipulation */
-	uint64_t norm;
-
-	size &= ~(size_t)15;
-
-	for (i = 0; i < size; i += 16) {
-		mask = branch_table[buf[i] & 0x1F];
-		for (slot = 0, bit_pos = 5; slot < 3; ++slot, bit_pos += 41) {
-			if (((mask >> slot) & 1) == 0)
-				continue;
-
-			byte_pos = bit_pos >> 3;
-			bit_res = bit_pos & 7;
-			instr = 0;
-			for (j = 0; j < 6; ++j)
-				instr |= (uint64_t)(buf[i + j + byte_pos])
-						<< (8 * j);
-
-			norm = instr >> bit_res;
-
-			if (((norm >> 37) & 0x0F) == 0x05
-					&& ((norm >> 9) & 0x07) == 0) {
-				addr = (norm >> 13) & 0x0FFFFF;
-				addr |= ((uint32_t)(norm >> 36) & 1) << 20;
-				addr <<= 4;
-				addr -= s->pos + (uint32_t)i;
-				addr >>= 4;
-
-				norm &= ~((uint64_t)0x8FFFFF << 13);
-				norm |= (uint64_t)(addr & 0x0FFFFF) << 13;
-				norm |= (uint64_t)(addr & 0x100000)
-						<< (36 - 20);
-
-				instr &= (1 << bit_res) - 1;
-				instr |= norm << bit_res;
-
-				for (j = 0; j < 6; j++)
-					buf[i + j + byte_pos]
-						= (uint8_t)(instr >> (8 * j));
-			}
-		}
-	}
-
-	return i;
-}
-#endif
-
 #ifdef XZ_DEC_ARM
 static size_t bcj_arm(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
 {
@@ -509,11 +422,6 @@ static void bcj_apply(struct xz_dec_bcj *s,
 		filtered = bcj_powerpc(s, buf, size);
 		break;
 #endif
-#ifdef XZ_DEC_IA64
-	case BCJ_IA64:
-		filtered = bcj_ia64(s, buf, size);
-		break;
-#endif
 #ifdef XZ_DEC_ARM
 	case BCJ_ARM:
 		filtered = bcj_arm(s, buf, size);
@@ -699,9 +607,6 @@ enum xz_ret xz_dec_bcj_reset(struct xz_dec_bcj *s, uint8_t id)
 #ifdef XZ_DEC_POWERPC
 	case BCJ_POWERPC:
 #endif
-#ifdef XZ_DEC_IA64
-	case BCJ_IA64:
-#endif
 #ifdef XZ_DEC_ARM
 	case BCJ_ARM:
 #endif
diff --git a/lib/xz/xz_private.h b/lib/xz/xz_private.h
index 8409784b1639..6775078f3cce 100644
--- a/lib/xz/xz_private.h
+++ b/lib/xz/xz_private.h
@@ -24,9 +24,6 @@
 #		ifdef CONFIG_XZ_DEC_POWERPC
 #			define XZ_DEC_POWERPC
 #		endif
-#		ifdef CONFIG_XZ_DEC_IA64
-#			define XZ_DEC_IA64
-#		endif
 #		ifdef CONFIG_XZ_DEC_ARM
 #			define XZ_DEC_ARM
 #		endif
@@ -103,7 +100,6 @@
  */
 #ifndef XZ_DEC_BCJ
 #	if defined(XZ_DEC_X86) || defined(XZ_DEC_POWERPC) \
-			|| defined(XZ_DEC_IA64) \
 			|| defined(XZ_DEC_ARM) || defined(XZ_DEC_ARMTHUMB) \
 			|| defined(XZ_DEC_SPARC) || defined(XZ_DEC_ARM64) \
 			|| defined(XZ_DEC_RISCV)
-- 
2.51.0

