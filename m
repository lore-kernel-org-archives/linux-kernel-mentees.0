Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D9623956E
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 10 Aug 2025 11:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754824390; cv=none; b=YedOM6/QPpYVWsESdRDrlI0TAdkIDf72Uu+I1WPwj188pCXk32IlI2XKf2KsraeZawc24QtqAjSr+EVGk6hX0KNfnBjaaA9mX1cwPwXhcm64iQJ0k/bnCfhB1qIy5ewHOP+n5O2smsIUVT73GovHH0DmjvB+Y4Tg66nwwNvi6mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754824390; c=relaxed/simple;
	bh=QhLjmOIS92P7ea/XzuNovZfDinZN9nt/o+nPMeNZ4zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mP+n4u6Uf0DyoXy5EpRaMGY10Sj2oj2GXjmvupwViNODS9qh9N+vDtoPiOsgSlDpHCDEJnYNZ1XEDaEkQYSL7ZnandGyaUumLWrxLUK1Mh+wKX3D9YePkaBg6BCDhvANs+mzkEAXrmBdiGT3Q5sg+Tnh/4oTwqk2VUh00/2+kTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdKXn6RG; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdKXn6RG"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2953659b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 10 Aug 2025 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754824389; x=1755429189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rb/Swu0G08J4y82/6Cs36yghjUYUfH8TllUehxDTCYg=;
        b=fdKXn6RGTb8wCrYUvIUGO9ryEUV0zoQD2hL3YTMkj9gnS3igE7MiyCyCHFxyoYRRCi
         J/jgIh6pQey2n0WU24+kdkfnuJWDyCfGu2OwSGXcfqRUEioBTMz6hIaToGjBcnejldHr
         ZBlphTRCmNnfatQa5QxH3p4GLhz0gLKzrpXPfeggaQtHXR0Q6p8YJ4LJqtwW+mQw067z
         uXNs43IBIrHmZIFbzktEoK/TuYsUE1bOewhH3W1oKZLNUzwD0CfrYTbq8B7ByDdQEsHn
         oifWISUjI4c/ent69O9L9UvvUtLlnETFUGpYsN8q1iN9QYxRj8c+RBoY623HbKMTGoXC
         482Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754824389; x=1755429189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rb/Swu0G08J4y82/6Cs36yghjUYUfH8TllUehxDTCYg=;
        b=fCtOqAl7ZdQJir+z0jG0M7WUQFT2vnzI7akmguDoGYUk3VMjxBNeGVeze/MIP38GuR
         UiCLIzwN6ThpwC1vg3ArElOYgoyFWTFoCuovbtfZ/UQhKA3dRQ8LNpE4MQDol5OURjTW
         9uIvyzNd4evYkSX122Hu7xHyp8WHJvnaf9jjui+t3CTP9J41hSSMAgGCn2J8dMYx7Imo
         ihOCrHJFWABJ1dhKeS1wSR5pZaLMPygMPVMuGjo42OezkNxKQ8AorHerD1GPjDyXNm83
         qJE7U2cQKx1iGvUKuC3y/LglejS++PSTkGd/G71wcD3u+XVKJYbLS9DefiVuykWkml5u
         +yWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWL02jo+psBM2c54eARNtV9z/Wmb1kcz/9c2CEry6qxrMb2IiErtheuasB27HVBXZa234SwLkj4CBdzipqJeZ2o+w6Ng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/HPn4JxeX4WQ19R7grbVox05++B6BViShcF2gas2Q4N6ap45u
	l/37MLYwo6QG0c4HDKI4Pr0dycmm/VBc0Y37JJvxC4ErxyojTiz/VB41
X-Gm-Gg: ASbGncv15pr84QuQ/JxLEn+3QkLuCIq1a+cLmy3c/VGLOjIY//2RxkUs3nMqU71K/VP
	JE7+DpyVJcuqTLtLBXUc1n8OrOrcMMTXmSs1dn7Ci0KSOwNn/380XOhwxxvOR8KtcQwuZnhY1cs
	75VCdQ59Ni3T1EWFEA4NMQwydNSRTMlJ9VSoJq3SmDbNZ4nqsLoIvUCElSNBuzjkIE4nN3q1cHE
	iJrYATjiSrn5b2GgTQ+kisQLvpefsbnLFUD43Nu4C8CTVOErQ56MaNOHrz6AnpnE7JBBnh463sn
	CgI0m8sG2g9N14Yo8/YYl6heVpde7KKfxF7QBZQaRfGaQbuiJ14we5GWWql3+I/n2aBGvtrk0Bu
	xVxMbB8q37k15eZhy84oZNv/YghvgTUbLP2x/yVQO3Qw=
X-Google-Smtp-Source: AGHT+IFYbOlLruk89Zs56x9IK75Dy2SXGTNWfKStneEVZOxxj2/Sw109N76g6LUWLW1IDYmJc4i51w==
X-Received: by 2002:a05:6a00:139e:b0:748:9d26:bb0a with SMTP id d2e1a72fcca58-76c461b2aa8mr13327685b3a.18.1754824388851;
        Sun, 10 Aug 2025 04:13:08 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c0a952525sm15705030b3a.79.2025.08.10.04.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 04:13:08 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rostedt@goodmis.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] Documentation/rv: Fix minor typo in monitor_synthesis page
Date: Sun, 10 Aug 2025 16:42:48 +0530
Message-ID: <20250810111249.93181-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specifically, fix spelling of "practice"

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 Documentation/trace/rv/monitor_synthesis.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/rv/monitor_synthesis.rst b/Documentation/trace/rv/monitor_synthesis.rst
index ac808a7554f5..3a7d7b2f6cb6 100644
--- a/Documentation/trace/rv/monitor_synthesis.rst
+++ b/Documentation/trace/rv/monitor_synthesis.rst
@@ -181,7 +181,7 @@ which is the list of atomic propositions present in the LTL specification
 functions interacting with the Buchi automaton.
 
 While generating code, `rvgen` cannot understand the meaning of the atomic
-propositions. Thus, that task is left for manual work. The recommended pratice
+propositions. Thus, that task is left for manual work. The recommended practice
 is adding tracepoints to places where the atomic propositions change; and in the
 tracepoints' handlers: the Buchi automaton is executed using::
 
-- 
2.43.0

