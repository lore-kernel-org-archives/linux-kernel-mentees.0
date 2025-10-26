Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2C325A2DD
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Oct 2025 19:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761508739; cv=none; b=g0USxdT+DLiMoBkdqPOvvZDnS6RP4zabWOc0dqVJznNfKKrxt4cWERU32a3EieH881SH0ThMSabg+bvgzniQZ2CQM8Z0w2k+9V5JpC1n48efe+1VCCr/LhIfwz5aQlaORkS6P63MAsP/uMy0XpDvpE6lIoRDd1v10vSEswwEnlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761508739; c=relaxed/simple;
	bh=QBZOFso+rikTeqOfG5xslpmr/o1dWQgIjC9jRe5aqxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ml6cPK2gKLwQxXn4dd+l9Q71lMhLmFTn8J8jtsZwwsR0WKJBDNpsN2tPXlX+ag8fCHl4Z8zHFxgDfAkbzkWud/Xg/8K42r3ac1MTXkV7InEa0A3Uk8OyM06poSNghDtOPLQbDFf5pDL2y1ZjMQQ4jziLVrIu6lM/cGmLN4iViVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Md8GYt8C; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Md8GYt8C"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-592f9400b04so3357501e87.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Oct 2025 12:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761508736; x=1762113536; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9BW4FFJcxwWu2CsyinUCr/KixoJIv7Wl/ptnFvZ10Zo=;
        b=Md8GYt8C6J5sIi20DqyN1ALtmXJIsds0XYgmW+Fq4/DMCvIu2gop/jXmZEq/r0MBkB
         JJ2RQ4RC2wjJjNHp0TCDUHlcMn3B1P3fbUhM/D8ShnwupWD6cllMkIYDVUF1uQlNbtq3
         UFpolCpZHEJIOyJ5yChT3CvIZuhfqnC/c5xrRR0mrpcFuZ0G6qtv/ogOUPC2nS/Qloro
         PvlaXbgEP+JVY2loiNR7ads1SbrLjsgFBaow/IxXO9ypX0+N/D/BbF+0FWpHArwuHUQq
         sJohKiyfdMKD1P2Lb/2tD3aNPQqWMVE6tfhX2KmxtlSmXMqBl3jnMdf7X6e/G6TdS6BI
         pWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761508736; x=1762113536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BW4FFJcxwWu2CsyinUCr/KixoJIv7Wl/ptnFvZ10Zo=;
        b=Lm5z9wn9ebHvdCg+8MCtViHUxM1DfN++achZ1lA7MWxltPUoY75P3ooxH+ibzD4l6E
         lEW0UeIwNjGe0Fz1O6LIVtp+ZnU00Ka3npVEW+GSQPq+DqKHVeSW0u5S05+hUYOy1g8l
         t3A7MT+oI/jW0rNXiYTx6sCJ14FZ8AajrHZcwTDB/5sZE1M43wIMf6/ojgi8A6L9KPQA
         WmkhU7ke09iADZugmuO6hfl3cJLhcjkwVOVIkCEamWimMXEy5Aqm09RKtHXj6bxxBDIl
         KpKzdkBkpBNS8owH6dX/x4eSaebOLj3SAEVzuy2lRw9/S6UGlVkD0O4qbX9jiC8lmjDi
         CYhw==
X-Forwarded-Encrypted: i=1; AJvYcCUu1MWjY5TnYqbh7gzqrlMje+85xeoXtDrxEv1E0W/SEnXOg6ahwrHLOjwwdTXd6wcv0CFVsU8HQDFBOqDZoHl3y+Qe2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdiYJXUfbHzMjP0ipg75gaPGs2lLPyxiOjRXayrtniUB+e/tXe
	l319O/KNRMHoUZbnEh5LYTLeATFVlFwt3DtbS0i6gop8yeQ2t/SWufGe
X-Gm-Gg: ASbGnctNStpoA3uvo728b1DUy7yvpD9sn7MCcWrR9Du9HkvkZNja+bejGbP+EXWmWZV
	TvXGHRiQZ/ezrIlL/DfhiNwxZAdZEtRbLLKY35vM/h60TdR4wQd/GftFpQHbr7fJTfMKgHGn1KB
	Rq23+B8MsWt/KBsxp/OahGkk7psnYTg0mzrKhhpqT18fna9kYxQgk37VgaIbri57etKSdyAwYOu
	JpesWzbyaVSmO1Kb1G3fTHP0uNM+Chsh3HGoAxSeBciN1G+28q90y+HUVBqikiAd5ILzCG4/nYC
	4RzAORokS9heNlfpdHnns+ePjZljiGNxtcWLvi10k7NWZePUEDD1ma8ZcAz0VSsPNNBDBdBRWGp
	lXzCelC6RBjA3uxHFjIaNbi3rbKNnEeXMt/IMuzb8Jfrgpk0kcSYpE0wopzc7jv0/fuUGcL8nOm
	qmK80HJu2bmJLoC3wIvsr6g3VMRlORjWrNYkOAcMUbxkDmdweIHAsdRp6ebY/XQUg2eQlOSxtz/
	y8Qf5FfY3lTSFOdpGitwoQ=
X-Google-Smtp-Source: AGHT+IE9Z30YetmF5ZoMGNO3uDtCKPnBzSiGPDkXuike/MPa9JFCNcZ7+akwrlNqk9Sg7uQ2GYVu/w==
X-Received: by 2002:a05:6512:1106:b0:58b:114:b7e2 with SMTP id 2adb3069b0e04-591d8546250mr12024526e87.32.1761508735657;
        Sun, 26 Oct 2025 12:58:55 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-6e-3100-e3bd-e249-333e-6a5a.rev.dnainternet.fi. [2001:14ba:6e:3100:e3bd:e249:333e:6a5a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f83c96sm1773523e87.101.2025.10.26.12.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 12:58:54 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: akpm@linux-foundation.org
Cc: kees@kernel.org,
	gustavoars@kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH] headers: Add check for C standard version
Date: Sun, 26 Oct 2025 21:58:46 +0200
Message-ID: <20251026195846.69740-1-hannelotta@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compiling the kernel with GCC 15 results in errors, as with GCC 15
the default language version for C compilation has been changed from
-std=gnu17 to -std=gnu23 - unless the language version has been
changed using

    KBUILD_CFLAGS += -std=gnu17

or earlier.

C23 includes new keywords 'bool', 'true' and 'false', which cause
compilation errors in Linux headers:

    ./include/linux/types.h:30:33: error: ‘bool’ cannot be defined
        via ‘typedef’

    ./include/linux/stddef.h:11:9: error: cannot use keyword ‘false’
        as enumeration constant

Add check for C Standard's version in the header files to be able
to compile the kernel with C23.

Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---
 include/linux/stddef.h | 2 ++
 include/linux/types.h  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/stddef.h b/include/linux/stddef.h
index 80b6bfb944f0..aa2cb3db3c06 100644
--- a/include/linux/stddef.h
+++ b/include/linux/stddef.h
@@ -7,10 +7,12 @@
 #undef NULL
 #define NULL ((void *)0)
 
+#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
 enum {
 	false	= 0,
 	true	= 1
 };
+#endif
 
 #undef offsetof
 #define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
diff --git a/include/linux/types.h b/include/linux/types.h
index 6dfdb8e8e4c3..931db48a7a09 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -32,7 +32,9 @@ typedef __kernel_timer_t	timer_t;
 typedef __kernel_clockid_t	clockid_t;
 typedef __kernel_mqd_t		mqd_t;
 
+#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
 typedef _Bool			bool;
+#endif
 
 typedef __kernel_uid32_t	uid_t;
 typedef __kernel_gid32_t	gid_t;
-- 
2.51.0

