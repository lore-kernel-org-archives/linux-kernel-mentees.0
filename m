Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1A8524F
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Feb 2025 00:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739235373; cv=none; b=IMXQRZPACGBEQRsuMrfI+1aLF5nIvzSbo+Uy7IIJ/6OibNd1rCm7sCqNhme+DgJmPtBVDwNmS1h0fklwAPoBrRLax0s11KLbaAi2CpusPpEildQqyRZauSpEQ20NcNqEQSlZHq5x00m/bFBMFkNTfTDjhwKJfzYbIjMCwytr3NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739235373; c=relaxed/simple;
	bh=e47iR8fyburMallAFhuLe1RTPvkqX9NNf1uJok+lahI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEr7UMDiwfFuLVsjYgxL/j79qzK/KzjdOzlW0+d5fSO/NLimcd2zPBFwrSyJkzl+jC/C1VPgopKcIJzjtGTIvezSgpxz8D45FVWTVSJiMoIXHWFERcDTP/1+NSR4LVfMkupkN55NZLCoNIiMoTC0naZFcPyo8Vd8M5g3IG9jjRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAK76SbH; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAK76SbH"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5de7519e5a7so2293305a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Feb 2025 16:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739235370; x=1739840170; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6UL9cMSXRLrKUmcSWZ6ehr9HZGcrPjrQbiwbSxeTuc0=;
        b=IAK76SbHh0tkcQSVGTorYu5P2c6wdz+wsAR2h3klQc5mQ35ujq5GLkZiDptZAxOwDX
         olE/CXKrfESFwF/S70NwxEO8uirmSMzVNeGqOLI5AkfhYGhpJPHqWnNb8MIPmikJa402
         osNfmKuWEVAuxVX3II15CTXaTXu5axIeVJcl+hH82LAhOMgJNBuR0On/NK1nm2hjbuwP
         myw9zW+fo182IQ1NPsmvp4LauqhiHguU6ujCIkxFrbLjOep9fT+zXeW3e2z92KIQGB5b
         r5Uka5vTMOdAw2WcMGgXEBj87UJ4vMLnf0fFM582RExwz6UPM3oPtfvYw/VwQDyLk4A9
         fLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739235370; x=1739840170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UL9cMSXRLrKUmcSWZ6ehr9HZGcrPjrQbiwbSxeTuc0=;
        b=fHMNE/ZlPZ0gg0EGh1a2MkT8pkWWBAQG1ACgAIiwWZmNKlCQ+02jDLcWgDRbr1GEA9
         ZLNzBJXuha7MANYIsvOqQm/ruYU387O4b1/asmicopnSXSDjhOSp/340K6SWrCkr/p7Q
         HsEa68Py6gvJSFZ8iTCwhxPfmQ45qLBh0tthpBFkyifbidcJtNe8TOoW9CuMUOBN58pB
         PqNqgRFDyyUvh6wFvZwrHD59EUyKqgRh+rfrDCeHyoF8eeCdK+Ys+OJyhxTJPY6vrhkU
         I88tEhZHHwjzQ8bVcrOUly86kge7h1nTaTM75HZgDNhhDfnvGHqjTqkti78q3eezLoTo
         MQ7w==
X-Forwarded-Encrypted: i=1; AJvYcCUpaUfoZXFVxhNdxT8Umrtlbw9ShnMIMtM5WvCdZjF1ZBOK1k6RNZWisSsZOcrawJ25pFowhFWu737jpExNlQx+RhPdTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoUMu2ubQJZK6xjCXgCZ9yF+40St9e4hbSf6XPB5/nB2Civgry
	AgBPuu6Xuy7bB+dz9/peopiEGu7wzM/vd4KqRBS/aNXS1fb2zy8xZRjWD0nlX15zuQ==
X-Gm-Gg: ASbGncvQTLMwpbJ7fJ4tC56gyYnccYHQ8tT6YTiZeMlm3WzOm4f5wqh413L1KIn5OeA
	HCTGS3BlnQcv9Rrc/2cHQdAnFAa07vmpRKVMT3MDj7LSZbStDQupj8BBT7ZQY8bcCmSNQ/VelkQ
	Cn07ACYtN75RSTL1VZLoWmgfqHNA8SGORpF1ddsi4ATyYW3LtetPstSUyGSpTapBZH6J6BsNFd/
	UhMMav8s4GDDnWE73cNbmOu87AMWIyaAsVXmoVvyanrcBuoEhviipmGCLPCocVZXQyLkaj4+60O
	qVGY
X-Google-Smtp-Source: AGHT+IFmOULmOXGP28PqCUALPKYMf0/xNA7A869rzJwx0VnrPUsVgBbo5gi6VDEbrDyHmyNFNjEpgQ==
X-Received: by 2002:a05:6402:4305:b0:5de:39fd:b303 with SMTP id 4fb4d7f45d1cf-5de44feab07mr15546115a12.2.1739235370140;
        Mon, 10 Feb 2025 16:56:10 -0800 (PST)
Received: from localhost ([95.85.21.13])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5de379cedc6sm8183032a12.44.2025.02.10.16.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:56:08 -0800 (PST)
Date: Tue, 11 Feb 2025 02:56:06 +0200
From: Ahmed Salem <x0rw3ll@gmail.com>
To: peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca, shuah@kernel.org, 
	skhan@linuxfoundation.org
Cc: linux-integrity@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] selftests: tpm2: test_smoke: use POSIX-conformant
 expression operator
Message-ID: <gmqimicpacyyg6mkxrk4etmi74gp6zqivlrgbu263lfgpw7qvg@wwzrscxvidvm>
References: <D7OY3ZVGJOV5.R3SL9SBFT2DF@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7OY3ZVGJOV5.R3SL9SBFT2DF@kernel.org>

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

