Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F71E26BD94
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Feb 2025 02:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739241206; cv=none; b=ZlCm4+PfAAci7rX2KWR43/cDqH4VZtTLK1EYPyIudvoneaLmdekWs+QiLt1K8IX9rri+sajhN/iF3KQFgqsBfMpikuEk3Q9fHfHMbULIk9sQYOeHtwqdjdGVxQr9wVbYpx8XD7gIWKsxD5EhiV9mzu4LP3IFESMsvOGLhkh1TPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739241206; c=relaxed/simple;
	bh=e47iR8fyburMallAFhuLe1RTPvkqX9NNf1uJok+lahI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJfIawbbtnVIsQIjPkpYT8Xc44GOubii3Uk4eVGnRRo5uIh83HrGx5v8tYlltxkCnB1DZHSDdBiJtthhmyP//yhsdnyiyq7HjkZRxes+csoXjFyg2v326dj7qJPSuhQBAhSmxjrqgTPd99DXIrls/GDi2ELtM/EES4c8F0pDqAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsiWYtS9; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsiWYtS9"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de5a8a96abso4680552a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Feb 2025 18:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739241203; x=1739846003; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6UL9cMSXRLrKUmcSWZ6ehr9HZGcrPjrQbiwbSxeTuc0=;
        b=lsiWYtS9Rhczz/5/kCGoOFtJKH4A6CXFM/sFvQWa8xvmrMwxoMXNRdeFS+Y/AEx2b+
         tM4fyNBa+qEBSccUMBcMwddhK8/SpDu+Fhswd2iAtzmW/PNpuXjRvKIIs2rBIpSeujpc
         xQZKJjr1wkKMKAlVDYoFP7iSbrgji+x2sjrmCXtwuukdIBUZ9SAhGO5r2l8aMDO6zPiq
         dLXd1GyPTMpaalzeHO5hhwHTFseA013bVovHUlzBEfymqYK6aeLm65K3r8pulOeRHDlv
         0/hZaUuHkguLwimTpD95vIzK6GDR5Wz1paz+Cc+IUvOA2ScDMCZX50KU1WZ8fHA1RjGv
         czsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739241203; x=1739846003;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UL9cMSXRLrKUmcSWZ6ehr9HZGcrPjrQbiwbSxeTuc0=;
        b=C62myE4431Nge3GO5YxTgG47vcHotHm6Wi/aFNH5htFikdy02TjhbmzZCpNGhcD4Xf
         WeAed+KSWV6+reDS7h2FDqxUtMqJ2tXcnBncrRTeLTppD9gGYQ7FBpUHG8UvqP9c59pn
         CZHqIyp/hHsh+Z9hhsM6cGdLroeNyOW+cooXYpwQW5HS8trzGnDs065aLKI0kjdjM8YX
         6Zs2JKRNmFPTTLbLRxRiJLnDQgBTJCCxnHUyNT3ETFVijVR6gZFiqu+UF521S0rcqSJ2
         KsCFWY4ihFqBJ8P9A9ulWOBkj7m6KX2vPk84DX4PDiBhbZj9DhQQe2zpkkSe7O+naEel
         siKg==
X-Forwarded-Encrypted: i=1; AJvYcCWXQQb9X7qdxj/mNEJQMmptxmg4iRD1ceppBRR2PvEfh3f37clrkuNXPS4QqordgGTu1SAm6NsRJdLFCJoO52pnQEOoHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHlw7TZml7h5gwxRcarbln0Z+3rCPYXIObfzKHTAFAWPWmpWnC
	ACguReroDnfGaFn3lPzSO7L0t0rAmLbQTC3pTR03if4zh3vmqWK9
X-Gm-Gg: ASbGnctR6Hx0Y6pFnVdvNI83L8voRVnKCUVpCJQWlnetF+3jUN1CNYC4dWSGUbJ62NF
	MtpfIl92R3sDk5r/9JtRzY4ffZDrPSrxLaT66uHb+Igzg2GfmMkACWDR32qtfg69Jef9gbd1aVI
	vl87vI79hLencvFeoiYXig4DZ2FIIqQZ6RVIKzccY6KxHYSJaPdMVCD+DDlp1uBrM8lXALhuja+
	WjodQ46mrmqoN+jnNjPXrV2HetT5LbSNq9EzWAI3RvwC8TS/pF6odyuvb/nKnBa92q0CWRQbB2w
	3lI77pG6
X-Google-Smtp-Source: AGHT+IEbtRQwXdRYjzvNt6JtIsUfluvawcKWNETu3bpc+hBbK+x35bbkv3TuH0v8kzBmn1BIPqCpWQ==
X-Received: by 2002:a05:6402:5290:b0:5dc:ea7e:8c56 with SMTP id 4fb4d7f45d1cf-5de45070792mr39401428a12.22.1739241202764;
        Mon, 10 Feb 2025 18:33:22 -0800 (PST)
Received: from localhost ([45.141.215.21])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7b9bfd2c4sm381243166b.43.2025.02.10.18.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 18:33:21 -0800 (PST)
Date: Tue, 11 Feb 2025 04:33:13 +0200
From: Ahmed Salem <x0rw3ll@gmail.com>
To: peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca, shuah@kernel.org, 
	skhan@linuxfoundation.org
Cc: linux-integrity@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2 RESEND] selftests: tpm2: test_smoke: use POSIX-conformant
 expression operator
Message-ID: <ucnzy5kvkseivbofbushyeukzslvberjb7osjlqttzs7pycnsx@evww4qqqgiuh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use POSIX-conformant operator symbol '=='.

Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>
---

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
-- 
2.47.2

