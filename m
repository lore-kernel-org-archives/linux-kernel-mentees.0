Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6C91624C0
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754915948; cv=none; b=VbwfznyuBTHq0nPFrE2hWI4fJHC6vfjnSp6MgweR5QB5LaABE0ovbaRXTFFryKYNdAgAVeCQfU6KRFpZ+xyqbxMTcl66Zh8t8D9PeOY35ax5fj07N+dsLqbxEJpO3wPOKu6Ugroupk+3SQ9cCiLeQFKnelS9r64rT+y9cWI0BCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754915948; c=relaxed/simple;
	bh=JELGV9uxYb771JQzUxfbsoM1pDEUVMvV4KIKwkr0cto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0VEsFK8JTNMpL0q+aibUrtIT6gMgGbe1ebLn14zXWcHKSD6PC/IpigKwHpCyisWxbIQDz/BPdQUEVTfMoXWx1jRp3+KgnM5IJ/RB5tB64CtzQD6Dv1v8s0OH9Ha0KEK5JAC79Yye6mflQo2QohjhXsZKyjGZiW0ptSA9mRBm/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAf4ty9b; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAf4ty9b"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b3bdab4bf19so3354658a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 05:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754915946; x=1755520746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRfeZ2wULaO/ukbbSK7auYzt6Gdpx1wOukQWQfpAB+Y=;
        b=EAf4ty9b7s2QCjkfQ+svNcdmPXzYvbfSVWeRSnQ86MHLApdnwJgR1tCoGtrJ7DdknZ
         6rviVf7GOm0CYACXESV1oY7wKS2Zol2Nq8bg6DjRenKHDhJouUHNYGgmcIQ67G5iWVGr
         P1QZ0qQrxG+iDyOnp03fqG2NYz0se00U9UmZ/GkARL9vLJuQp4s5KAkDrm4JfUQhqMZS
         lV4JtsFHGmMpEKq3yEeylGEr36qrHakAeRXqQ1QH25aRIGzHwQFVm+rxUBD4ih2jZrAQ
         nZtRzJSHiZRCYmpLrWr6Igti3xb0XBWIDPXihspJQ0HwukpHEmSPsnAjshvZ3peCdh0W
         336g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754915946; x=1755520746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRfeZ2wULaO/ukbbSK7auYzt6Gdpx1wOukQWQfpAB+Y=;
        b=qx9dWVqFSp4Y/+V1+ztjYfm8rjnLhBd2MXXZnuDZPVaC0qLxbfGERe5N4b47qxdxtz
         +qrYchCD58eGfEytl8HNJYqFZZ2ByJpqvaL9TXYfNCp8kYjlcT44QhNZQWRu2vSKS5H+
         FIAw3mRTm5VlIH1ZXG2IuuVzvRRsLnVOtr3rXfTqZW27aupB8eZcyEcXZRlorMcG+f14
         uSETVeBHLLdfs6+virHelA0ukRYVM6MLypJXVRmYm7Pb9dBRXjHSCvzvHt34wyMo1bsx
         /t2iPkUz8bI+nMCAnYDsYQdpiCk5TwdXnwfeIr96mYW+5I33ci8f5jhS9u5W+JeHeI3Y
         0trg==
X-Forwarded-Encrypted: i=1; AJvYcCVtr901/cu7IgGVZCm2sBQTNmatuxUon+9y9L6H8P52Y7hzUcH1MPnsuWxKweytEPrv/bUUt9gCL/Q4Oi/nlgtDia2Xbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyN/KSUHsdETu2kEnbDlZ0Xzadutizlo2h+my3wFp4iVCugKFBT
	7iftCMA8PBj6lmrm90Z0zahevKIe75TZLIzPCQo5OzVvExCrqFFBCzQ=
X-Gm-Gg: ASbGncuFJxjPzXlQFdSQQazrONtybrQ9ni56iUlpm9D8L4yN/YMJT1ioStIwtHD9WkM
	wIlCEq8iCRzQpi0s7r95ivKzdkuNwj9DZPXBZPsPRLXUybfBrzu45oF3/tmev4joLCIpDRnZR8o
	Lkuz97VrmhyeOY47uUvStkUcgrEq1EYuRTMcVt75ry8wZEPptjmI+Hcf+1fy7jHaRg+hJCOc79O
	XAlC/iaNEg8Cm1r8va8qas3fD2dC8QG5eCUHqXH/psxzPGSLbkN2u3HuXpvplcqEZIZk4oANWhn
	VXoZGOz6+xN8fT62W1Rizjt9ZL4sSDlLpRv2IA1hw1tRTj8d2BgW9yNnkFx5pE5f2anWsYjr9oB
	zmFjo12EUYg0DT0Pe9oFw8v1DhvkW74fEgpf5bwry
X-Google-Smtp-Source: AGHT+IGr5GxVR+NNUc51sa7zH6pRSzPgZdTCS/mxkTxWL2PvWVdssdSaJyl1ykfwlZ0rhlI4ggtQaQ==
X-Received: by 2002:a17:90b:558e:b0:311:ed2:b758 with SMTP id 98e67ed59e1d1-321839d9dfbmr18229202a91.3.1754915945476;
        Mon, 11 Aug 2025 05:39:05 -0700 (PDT)
Received: from kerneldocs.. ([157.51.80.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216128ac08sm14731699a91.30.2025.08.11.05.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:39:05 -0700 (PDT)
From: Nikil Paul S <snikilpaul@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	snikilpaul@gmail.com
Subject: [PATCH 1/2] docs: timers: Update dead OLS link in timekeeping docs
Date: Mon, 11 Aug 2025 12:38:36 +0000
Message-ID: <20250811123837.4378-2-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811123837.4378-1-snikilpaul@gmail.com>
References: <20250811123837.4378-1-snikilpaul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nikil <snikilpaul@gmail.com>

Replace a dead link to the OLS 2005 Proceedings with a working
version hosted on kernel.org.

Signed-off-by: Nikil Paul S <snikilpaul@gmail.com>
---
 Documentation/timers/highres.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/timers/highres.rst b/Documentation/timers/highres.rst
index bde5eb7e5c9e..24dcc32f8dcc 100644
--- a/Documentation/timers/highres.rst
+++ b/Documentation/timers/highres.rst
@@ -58,7 +58,7 @@ merged into the 2.6.18 kernel.
 Further information about the Generic Time Of Day framework is available in the
 OLS 2005 Proceedings Volume 1:
 
-	http://www.linuxsymposium.org/2005/linuxsymposium_procv1.pdf
+	https://www.kernel.org/doc/ols/2005/ols2005v1-pages-227-240.pdf
 
 The paper "We Are Not Getting Any Younger: A New Approach to Time and
 Timers" was written by J. Stultz, D.V. Hart, & N. Aravamudan.
-- 
2.43.0

