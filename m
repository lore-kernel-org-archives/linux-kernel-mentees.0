Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ED7433C0
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Feb 2025 03:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739242866; cv=none; b=A8+fAehj71WO+W72KFxxY1nIYohK0RAGbt4Om4Wqmxnc67ciPUUwQ6IzpSCpoAtjD5gTXxtGHJtgvyo3oTApYZbreUaWRlV6CmJWXyA7/EwS+Hpn52GupnkZbYY1wnJuHyrmOqmv+IzKT7OT2e9ljEyTJxEfU62BqSqLPp50NmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739242866; c=relaxed/simple;
	bh=cZRSGsPr5NDIpPaoHCeAoLx/Cg6l0wSrIJIyEW42Puc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CtX0arD31vPGLhnsQAei2z4nvIZ5mNR1Ii3I87OeKdDq44Eta29zQTnHjima+LTuQ+pM6oUZ0xoU5n7X+ICAlnIj3oRdEkbu2YVqoj/oO3c85C9fxgklwodeA+OfQqTcvxZ8xb/Q4mxVYgkTYn3fCuptaXCT22qNYR7uOt62UDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhZWkTKg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhZWkTKg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43937cf2131so15423485e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Feb 2025 19:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739242862; x=1739847662; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0+Ftmctz1tHLKGjM2SvsvtPNyMgN+i6G6rr2ncjwYw=;
        b=VhZWkTKgLYDv2fnPV3Nyj2/739X2XVnO84pW/f6AmLo31MhFay7WqpLl1P2uEwgoLL
         8aDLGP2JS5MuVnTmfnD5L87hXoWXQN4I9Z0i0l7PM97T8eFeEifTs5lfhBWgv6cQjDCH
         GXJ0XIDXtWLz1BQUGO0mhHg59eeQkW+102GCuXCG/fgGfo1/hv0rO/NicbPXShP7I+hB
         uk/vya4viflkkdnl79gfOylJQ0dzH7T+d7Z0JqNRK1S5BR9M+aVYwDx7+B8ppuFzFHe6
         Z6pRJ8WrmnI/jtHBIv1mMaMLAR/+HApGrSxgLffKru0Xw5tqmH0stcx2HTbQOmyps0Ti
         +fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739242862; x=1739847662;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0+Ftmctz1tHLKGjM2SvsvtPNyMgN+i6G6rr2ncjwYw=;
        b=VA/1KnupjPBq6TAXG0kwaY3+iZaTsMw8RNkk6+/dznah+q9w8fU8eM9CRPfpOD98Jl
         e/fyXkDgfylstH64R5BgKKmCURfslFLsOK5mSSjpuiY9D7KU/4Y83tZ2n7qAXu9riV8Z
         EpPiwkekq97aECm8eXDzxRDlI0nhW8IMDzWRRuMRaPCZJan5IkFbGrtWuq4l9Pms7Dzq
         mZoHS/Y9k80dB1gt8HTRbytt9KNn4Gx5usyzGOTTg59FWbJqu4ce7id9t/tYqj+2yoyt
         4LN9EJLsi//el7yqPq+hCShrUR48JjKz8SVEPBcJOzXtCyXwuPUlXI0hHaFDizNYLnMH
         3oHg==
X-Forwarded-Encrypted: i=1; AJvYcCViUcne0PQAkSSr1xMjp4TMxCK18ffD9tCc8AXc1B2qJwT4er8QH1ECvntzwRLw9P/SMfwNA/XsdayhGAcREs5FCTFHIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz3qJQHUQARHnslkvtZjCS4hdT0XcCshLklTCyAEyTLMTikK6Q
	pwVX5GpNZLihi4j7WTi65QAIiTzvJuUpdgSTbenCXy6vgIuJ7e6YgDB72p2OQyIHCLz1
X-Gm-Gg: ASbGncuVvM8tIkiZz8Qn+Z3D7liwvTYXh0gX3N7mdSyWUpANxv6cy1J02AJ94mwap9t
	grYNT/AJeEduttL4n8H6vRGX7AkciscXjNYT+47l50kuI0KnVjuEV+KPjguFr9dpLyD9+VpWSzH
	IJxq6DZN7Wlm1OVi7upDvJ5TntLr3iScAY10gEGAZ/Ec3AdU3p5utjRAKPeLMhZoqzRByIIiciF
	TRjtwL+ZX2NPAM6Gzpk9Xd81I0KseVu1LKWwziwzdBm/PlVUayGI0BBfS9Hr6hINV/ktYdErUqT
	o6TGQI92UmL7dwQhLqGcSxHS3BT3Ub7Eq9EJNMk=
X-Google-Smtp-Source: AGHT+IFQ5ct/eLOgfDv7Qw2gj1n3vazuwUHtEoARoYyP42j6t/7paFBG0Ke21LcKUs+x9M67T3tGLQ==
X-Received: by 2002:a5d:6d0b:0:b0:38d:bd41:2f8b with SMTP id ffacd0b85a97d-38de41bdfe9mr1852527f8f.44.1739242862468;
        Mon, 10 Feb 2025 19:01:02 -0800 (PST)
Received: from localhost (tor-exit-9.zbau.f3netze.de. [185.220.100.248])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dd4342502sm8153548f8f.26.2025.02.10.19.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 19:01:01 -0800 (PST)
Date: Tue, 11 Feb 2025 05:00:22 +0200
From: Ahmed Salem <x0rw3ll@gmail.com>
To: peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca, shuah@kernel.org, 
	skhan@linuxfoundation.org
Cc: linux-integrity@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3] selftests: tpm2: test_smoke: use POSIX-conformant
 expression operator
Message-ID: <nyskb7mbqk2dvlwhez4sua7ryz5gyi73yker6y3qhd4chyyeaw@x6nhqgtxcyvl>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use POSIX-conformant operator symbol '='.

Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>
---

Apologies for my previous mistakes.

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
-- 
2.47.2

