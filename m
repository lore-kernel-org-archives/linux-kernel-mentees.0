Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC8D2661B1
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Feb 2025 21:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739482145; cv=none; b=WGcYcrB9UFsKXNjpKA5ucB9wiXu6rlmiY4ip0GaaZVEOBTTwOUnav7ha7EjKQ6/4Fp3gM3vCvdQQTBripL3VOPNUdoL9ZXPteqzN7X3eqzpN2EIbaIrH2O6bVcKLCkY4/FnFAV//z6evtpKC1JhVd9unSlSK3R33CLqQnjfEl0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739482145; c=relaxed/simple;
	bh=7mAvqdA3BitZDxxMOm9fCP2kqIhpALIVRe54ECHYnqw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=S8uyFCIrTZM5ZqI646FTTMAhPNynHu7lb/OM0z5u0T1SUw7huqjTJ390TtkRxdpfCZ9Pzx7WuPgcxfqM6YBIDNbiBlOP9TpmBGJSuceP2P5HkK9/BfOFU2EKlVEmm4bHPZ/W//tkVr2VWJkmZl4ZdslDjLLkFovwaN5Wg9Vhct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFbES7cB; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFbES7cB"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-726e9659704so393535a34.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Feb 2025 13:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739482143; x=1740086943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1FBXAb5srspDKrWilGOZGvuqz4tU4bdToVFq+ezNEY=;
        b=aFbES7cBDQqLz8SX9seHZTzL1H2dWPAq/yYvtQYj4NLG225zGvkGhIog3HN1d4w5Dm
         lHzAZdtuRJbrOJxIGp/DYp1h76fet6uaDy9DJnHGbHp78oZE81++GkTLbe+Y5GCnTFtB
         FOkgXNUuw84HT99O4JPHKCAjy7XTy4gusWFP2g1iQOnO22EkZKyfJ1D0F++PhCNOw+EG
         VysSVOHqR65wgh7sZDUQk2hi7ubH/xDErhTs0UVW29XzeDrw3xb5azfsha1za8ZG0Bpq
         gLcotqnm+CYjOnoK2e0HObw8Sj2ZQIn+gy111bWpy24nPyfiNEcHIALdbPziPO3Ki9zQ
         ra3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739482143; x=1740086943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1FBXAb5srspDKrWilGOZGvuqz4tU4bdToVFq+ezNEY=;
        b=Ufxi+6IAxiBkcy12G/C1YJvdk7bhkW3LVziyaZeCFE5ykBaurcm7mlkJ+1qS9ldftG
         bRYERWxdXrMGT+9befB3541+g9s99OyNGAPCw1ewpzNMsLiLpwLI3cpKP0eBH/BLOGMz
         SfFPjrkzR2272OXKXtRn7NZYfgjG7mC5EpHzX8xfPyLDMINAdEyq3bE7WLQ5HSGgr8RH
         uaXafcZBoE0XWh0wAxFcUl36HotyYmMPoDgatXErkYEWq+IY+P3X20/PLiv4+5KA8zg1
         t8ozQAtnFNjHN11iZ107YcuX7HEZpepEZEJkSXPSHWAwzgMoscCLo/I2YyJLiLgbD1Z/
         Ae3A==
X-Forwarded-Encrypted: i=1; AJvYcCUfhOysc3h6V+PPv8qixyeahfxnsd8vuQw38LZA+EvaxCXZ05ipttGLGEF9cfjkT/e/Wae5R4jQ73WIZICvadWrTjXX1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrOh44SNtHBLAUz7MEpX00FA9eszSLm2s7Pvmv9EuIAqEJzbmQ
	dWvCf71xxax3tK3iqQoFcy6g4wtaII7EVq7gmYKm392TMimiUJVD
X-Gm-Gg: ASbGncsF5Bb3AjFE7RWgQzxKL7EX5u5xi09u/RAOWLPSLsSiJwC/70eSukwNOH0gR27
	F0pgN3/eyybHIhTfdswYlu/yFp8oS9MTx0FJ91mm/YFiLid612le6SocqlJW/efeor5LFeunG6f
	BcULjvFxraqfJP2+U3tx5/1Azg3qzXrBuEk8ZPNFvSq3khYw/mQw+L4qGYU3fpYiOijWB9HMsLy
	DO5PXwM8VGMcUsnLrMkYXv5jN67UMAePEGNZqOrNK1LT3a2fbPZdQwbKHOUN47EkHopNeVFcM2p
	zk2n
X-Google-Smtp-Source: AGHT+IGrE8kcnVtua7JCnT4TiZTDmJ+xb2mlVQaaqH8If8+LmJMG/pKRwOoEGLtU3JTxX2itlp4fKA==
X-Received: by 2002:a05:6830:6003:b0:71f:c1df:187e with SMTP id 46e09a7af769-726fe80fc89mr3012041a34.27.1739482142993;
        Thu, 13 Feb 2025 13:29:02 -0800 (PST)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-727001dc738sm950718a34.15.2025.02.13.13.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:29:02 -0800 (PST)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	martineau@kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] Adds colors to kselftest output
Date: Thu, 13 Feb 2025 18:28:16 -0300
Message-ID: <20250213212858.710884-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit improves the readability of kselftest results by adding
ANSI color codes to the [ OK ] and FAIL messages.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 tools/testing/selftests/net/mptcp/mptcp_lib.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/mptcp/mptcp_lib.sh b/tools/testing/selftests/net/mptcp/mptcp_lib.sh
index 051e289d7967..7b55855ff788 100644
--- a/tools/testing/selftests/net/mptcp/mptcp_lib.sh
+++ b/tools/testing/selftests/net/mptcp/mptcp_lib.sh
@@ -83,7 +83,7 @@ mptcp_lib_print_err() {
 
 # shellcheck disable=SC2120 # parameters are optional
 mptcp_lib_pr_ok() {
-	mptcp_lib_print_ok "[ OK ]${1:+ ${*}}"
+	mptcp_lib_print_ok "\033[32m[ OK ]\033[0m${1:+ ${*}}"
 }
 
 mptcp_lib_pr_skip() {
@@ -97,7 +97,7 @@ mptcp_lib_pr_fail() {
 		title="IGNO"
 		cmt=" (flaky)"
 	else
-		title="FAIL"
+		title="\033[31mFAIL\033[0m"
 	fi
 
 	mptcp_lib_print_err "[${title}]${cmt}${1:+ ${*}}"
-- 
2.48.1

