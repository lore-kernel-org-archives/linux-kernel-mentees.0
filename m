Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8721022D7AF
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  8 Apr 2025 18:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744138699; cv=none; b=mU332lmr/afVYUvIvV8/Rclar+wyeiogSfXqP8ythkL8fDw4KfRoNTEbEskEpooF1SgGGSesKn3khjClnLZKqWix4eMUo2h7nByrUKXWWD8N9EUHNc1IbslBpif01KwRcmW4kYi5aG7WJrIfeyrIZ4TnFDsUW0bTc4uXM6mcvbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744138699; c=relaxed/simple;
	bh=qi68FPqjWeIImJbScaOCfWAjXU8ANBLoLMNxd/yYrOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f7KBOoLLiZ7uVcmeKyIQ5oTBE/HXs5u6VpGXZmmT7HEE4y2AmNb3ZKPZdsUuVj7u/PoQSvM56o0qix1IRj7NWc4fI/x5yfKlbcn+8m83F7mAd9sCyw68p4ZVQ1LufUrq04Rlrlm8svsXRzvOPXG+EnxLZCvBFELagEUn4vWxXQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdC3tHiO; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdC3tHiO"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7369ce5d323so4775153b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 08 Apr 2025 11:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744138698; x=1744743498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wzHI83MKSiqIfFaxsOKY1zS5wH4MOVgY9NicZrnKBJw=;
        b=gdC3tHiOEZOFufCgi0WEtTbPcUkKX5J5rPTxAoB+jPSK73dRqT14XGOwPDmDzZes6m
         eqDWV0Cqra/Lvvx/CoUwcTjpsotTKpQZb2usq4a302YrvYbG4Vw6+q2dvR4hhsw0+LXY
         bi1sxhGEsglmNFmjy4RycxfQaDcGxcgFrNzT8B6MRBICeMehj3ewY3sZbabOUNg4RAnc
         sISZ26cSpNiaogwmhyaNL9cewkKw9jgA+mrpKnOnxbewo8PXpz8JixkTO4usXQakGyTR
         xltpH/xDzyHARUvClbnmKn9SSzTq86H84nY4ofS7xpdFWe+hXn0P7C36zUGRSuLxb89k
         qrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744138698; x=1744743498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzHI83MKSiqIfFaxsOKY1zS5wH4MOVgY9NicZrnKBJw=;
        b=AZEjKTj6I0zNbDpy3+Nw/LCzSja3WxWbhnUMsKNIoAc9w9bBUSM5asVjBBa0LiyeI9
         E/d0SYS8jBGXoAFkVOUevsMgUFybhnd0UR895IbuxtBGtu/2SnhEYWl63a0Dfmx59TWZ
         EXDvK+VxhBiAwo9Dam0DNBBQrzlQji/s/6hi5YjNgSxADTn0ijQSB7Xw+oBqsaJckVSC
         408hL/744hT+OmYjiXfRkG88hLgmieSeg7VklGayB7PrK044aipIHiqsAsiwgRFMRvTJ
         ssfeWYSmECFExeZv13B+vny64RBXCBjXhMvUjsGTZEUoJKY32fNB4ag6nOJXvSeyqwfZ
         mepg==
X-Forwarded-Encrypted: i=1; AJvYcCV8lnKB+vKgNlUlaWbSQC7UTQOUKnT7O/c1CAd7MmYzriWkbw+UrU5uQpj9xulAFCVjNcnJkPJ6Q8FQWTqyKJDFgYC/VA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOcXLggOiBLontGuy+o1EKJR73yyUKenQGgJWTF8F8i+m5mDNa
	b53h2WHnkhIiJK9hzKlTIC5zH4rH8EPeMsOscIYV7afhbhLsBTbN1dtcz2KV
X-Gm-Gg: ASbGncuyFOlvyP1uQ/ijWBZy9fMn26P8NPqmp3tf39c+p75zdd/AlFO9a5tkIAFnalf
	YAj/lsouftE5Z31fSL4LQqahIJAiYre6L7WYkgHDgWjN/j6GNaOqGEB30oN+VF+WucDMNrUJw1F
	30vvi0yI2VRZ+W9yc/J9Ey3Qh1sE49/U++C0Etl5kDUlib54US0H/hxWn6GF3YE3VRwXCmxNxLl
	DRJQWLhVdy0wGxsNel5rnp0DG24wt2nswdYB0Rblxl/aC91VVU2WW5uBQ266o9Xcsdj0gjGxmsw
	32j+RU7dneBamxqr+mHHJVQLsnv4xw4ya1Zdx95d100wh8br+0gLANTcalGaRUGRBH9kJNbDNrj
	KfA==
X-Google-Smtp-Source: AGHT+IEyktfEPtKDikhNj7ckXZr1w1jnHWGuCEGLWVYLsgrcs35m+q+VlCXtvBz1nUhwKzx3fbO2zA==
X-Received: by 2002:a05:6a00:3d13:b0:736:4e0a:7e82 with SMTP id d2e1a72fcca58-73bae4b9085mr216548b3a.10.1744138697594;
        Tue, 08 Apr 2025 11:58:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0dedd4sm10900752b3a.166.2025.04.08.11.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 11:58:17 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: davem@davemloft.net,
	dsahern@kernel.org,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	skhan@linuxfoundation.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Cc: Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] net: ipconfig: replace strncpy with strscpy_pad
Date: Wed,  9 Apr 2025 00:27:59 +0530
Message-ID: <20250408185759.5088-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated strncpy() function with strscpy_pad() as the
destination buffer is NUL-terminated and requires
trailing NUL-padding

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 net/ipv4/ipconfig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/ipconfig.c b/net/ipv4/ipconfig.c
index c56b6fe6f0d7..7c238d19328f 100644
--- a/net/ipv4/ipconfig.c
+++ b/net/ipv4/ipconfig.c
@@ -1690,7 +1690,7 @@ static int __init ic_proto_name(char *name)
 			*v = 0;
 			if (kstrtou8(client_id, 0, dhcp_client_identifier))
 				pr_debug("DHCP: Invalid client identifier type\n");
-			strncpy(dhcp_client_identifier + 1, v + 1, 251);
+			strscpy_pad(dhcp_client_identifier + 1, v + 1, 251);
 			*v = ',';
 		}
 		return 1;
-- 
2.49.0

