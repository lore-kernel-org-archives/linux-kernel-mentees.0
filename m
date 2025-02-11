Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFAC267AFC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 23:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739315791; cv=none; b=pMtEng4BDyJ/XT4BQ/aOJGhHc/Vx58uskW/jInSzAzO4xlERHmI5fhY2QqFj5Lhjy1hGgbr0J6SLlOH64bT6sa91gdiSFj7Q1GQW63V0F5MEGQ3akBhXWHaQB71pOxEjH7JwKvTSfv+LjxHmTonQnVL8dpfHjgnjjRUGLzdT0b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739315791; c=relaxed/simple;
	bh=Ys1rhJgXEnjNdv2VFm8kkhafAaLZPOuF2zw82IRSTpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AhUA6DTk29qtoH143yLC+iU1/8wsbD7EofISq2b7MVt0R1sIbga+12V885uKUh20oRNUmjQQjfNefG4UjxNHzdWnnNN/wT4evLqwWY9+fLNQbzJHj02J4O6BfoohbYBgCMpkOo17ERoMEdm65gWBfwDoMrkyk+MnQ50pU/ZBLaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejcDo6pV; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejcDo6pV"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B93E2404AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 23:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 2.583
X-Spam-Level: **
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkFUMkmL06is for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2025 23:16:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=x0rw3ll@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80680403A4
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80680403A4
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ejcDo6pV
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 80680403A4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 23:16:28 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5de5bf41652so6399215a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 15:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739315786; x=1739920586; darn=lists.linuxfoundation.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aO6abGurUc0b4USPskQVxLQPxPraxFKYOUzF3VnWLZI=;
        b=ejcDo6pVu9xiZgRsXHWXomffUatfvihhLXVLlxABaojynhG++LbF/JUNIiPRYS+Rgg
         o9IQxIO5WsF8aVhp3GW/NSRUfMvkJ2A+i88/X7ksrk+ubQXS4q2MgtsXPz5sCyurnGgo
         oJ4AGepaNcIKyi+5TThSAfb72xGn2XvcHQWSfwT7TNwvxUA+l3Wn5vnYh5F7TAROSnyG
         r3HWy5rImoeyzUfABL+c1iDTrNz2go0JRadGwv5Gl91jlf01RiW2uH8c19N7KDkOjeb8
         RiKX9ctAeQI4vyoNmTBk5iFvX+f/8T+yUHRzQkMqyNOb4Brqlwm2KQbhWma5A932IZ/W
         sZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739315786; x=1739920586;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aO6abGurUc0b4USPskQVxLQPxPraxFKYOUzF3VnWLZI=;
        b=ETpPp4szVHblDsWBJ5ABoXbY1t9Ka5UBt3mi4qwSgeLU9FvNtfoy4WzR/wNfVvucfV
         TUb/bTLDKhdMaTjrKgo5eD2FcuOv4DMhYl0TqGHrMi5akmLrd3K00PzuQGzIvRzzFiIE
         Rc4XYOl9nJwaBhQ90fRxCk2vHPvwr4o1XSrdP9y9f1836W1ILNYUpmrzlNuwlykP0X2N
         ldIEEMtfZPsLry4mRVwpMQwF3NMJoSZ7rg4W74Ya+eQfyCv9rCm4xnqpw122AJRC2c4Y
         IY/O9yd25BTJr2Ms5GjgO5nvlBeINfFm0ycB2BpUfmKSSK9a++WpRZuQTbe6g3brs/Tu
         4L7g==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2f9DA30qWNaGs+ir0AMVsrfUh9XCmMFnvAotFAAEVgy6UbO+fvNjdgM3z1D01rE2f7t120OHZbTazAHcyz96qmSqtQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw4WnN7G+qP2WaWClkNvvTusV8K40LlL9/V/sfWXj7Z93hFco2k
	gGhS+JzjNZfRJhjCy2BgfpWxilPMvqbcL2MHv39zpkOYWwTz46No
X-Gm-Gg: ASbGncu0tSV0BFZSjHX3OgKnKgGGzIN0qjE+qxvzjdZLEGTZQ9jmYwQeRalW4HUUc1e
	9IB479THaFsE9ns4HHYgwVWpXXyPn/boYsG57XTyhFS88DB6Qbbn9Jwp3428WsA4ZstrTw8+X2U
	2s5eIFUwJQ+4twyYVeofECZGmFv2C6q0dn0VMCN8tOJgix4AgxcxIq3TqfJ3dfs44YfQNHAiv+O
	g/8Ed/rQsQf4hAwNto8Bvvmv0/xatrq5jTdJjAPwutzNIsNGPGnam7xDRFglpvzkqjhaMBNXIkz
	nt1qRRU6EYE/bg0upSSaTaVLY9rlV352PguFY8mWIOtZcX3Wj9gdAJ5XqsaLj5+FBE0=
X-Google-Smtp-Source: AGHT+IFRMxaQWc4CweYkS5E/aJgKc3I6MfhoY2jkKP65WChnoZkLoI9IzknT+GJzEi9P0e+GxdYDMw==
X-Received: by 2002:a17:907:97cd:b0:ab7:b0e4:aa93 with SMTP id a640c23a62f3a-ab7f33bec22mr52917966b.13.1739315785997;
        Tue, 11 Feb 2025 15:16:25 -0800 (PST)
Received: from localhost (tor-exit-44.for-privacy.net. [185.220.101.44])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7b35b0d2csm620651166b.122.2025.02.11.15.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:16:25 -0800 (PST)
Date: Wed, 12 Feb 2025 01:16:17 +0200
From: Ahmed Salem <x0rw3ll@gmail.com>
To: peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca, shuah@kernel.org, 
	skhan@linuxfoundation.org
Cc: linux-integrity@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v4] selftests: tpm2: test_smoke: use POSIX-conformant
 expression operator
Message-ID: <37ztyakgrrtgvec344mg7mspchwjpxxtsprtjidso3pwkmm4f4@awsa5mzgqmtb>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use POSIX-conformant expression operator symbol '='.

The use of the non POSIX-conformant symbol '==' would work 
in bash, but not in sh where the unexpected operator error 
would result in test_smoke.sh being skipped.

Instead of changing the shebang to use bash, which may not be 
available on all systems, use the POSIX-conformant expression 
symbol '=' to test for equality.

Without this patch:
===================
 # make -j8 TARGETS=tpm2 kselftest
 # selftests: tpm2: test_smoke.sh
 # ./test_smoke.sh: 9: [: 2: unexpected operator
 ok 1 selftests: tpm2: test_smoke.sh # SKIP

With this patch:
================
 # make -j8 TARGETS=tpm2 kselftest
 # selftests: tpm2: test_smoke.sh
 # Ran 9 tests in 9.236s
 ok 1 selftests: tpm2: test_smoke.sh

Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>
---

Changes in v4:
 - Include relevant parts of the script showing 
   the issue before and after the patch

Changes in v3:
 - Reword mistaken commit message

Changes in v2:
 - Remove snippets pinpointing the issue
   from commit message

 tools/testing/selftests/tpm2/test_smoke.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/tpm2/test_smoke.sh b/tools/testing/selftests/tpm2/test_smoke.sh
index 168f4b166234..3a60e6c6f5c9 100755
--- a/tools/testing/selftests/tpm2/test_smoke.sh
+++ b/tools/testing/selftests/tpm2/test_smoke.sh
@@ -6,6 +6,6 @@ ksft_skip=4
 
 [ -e /dev/tpm0 ] || exit $ksft_skip
 read tpm_version < /sys/class/tpm/tpm0/tpm_version_major
-[ "$tpm_version" == 2 ] || exit $ksft_skip
+[ "$tpm_version" = 2 ] || exit $ksft_skip
 
 python3 -m unittest -v tpm2_tests.SmokeTest 2>&1

base-commit: 34c26c5e1cb0cc7f54c1b89c6e9168cad8ffb580
-- 
2.47.2

