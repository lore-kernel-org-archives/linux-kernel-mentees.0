Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8FC2C21E2
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  3 Oct 2025 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759508844; cv=none; b=gdUQ+Piw4/uiNKvkM/fJujOd7G/lREntvLeyLQCqcZ9wUjLucSGYmSeWHuSi0ooXTyO7S4DR/PUPfvX9M3Hj7LLBZUhRBdnibSVs4PPLq1vJgnTcZxwbGIjH+nu/zeEhcModZczMnbl8DETwU1FaptZTZTWAXH/0OhS+K1o643c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759508844; c=relaxed/simple;
	bh=jdDLR5zSZaMeP6Z0Smw6SGxBy/T6QQ6s+tHgLG/YIuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rmvp8uli7PkK/Be4VIdreApqwDOcphvNRP7kXdtOaoBmlBJP+ioOSOglY5WrWJZITco5Foe9uATqo8wnDg5Prke0ckeG6tAneiCRG4K6UPdzzlE6svDc5MA2N5q3RDw57g0Mo3yoea14TJi38xSqg8JSA2YH2kmdvIyqznAQ2+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNpfjqHu; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNpfjqHu"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77f343231fcso1582702b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 03 Oct 2025 09:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759508842; x=1760113642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EqyC5t2SrD/bODU9RpzzMMs5DHytzZzsB47Ks78jSw=;
        b=LNpfjqHuj+stgQ2Lt72fGdiEZcMyDFfW41wKlfBlfiitaldIiSBVdtccttBy8AHZA8
         Yuj1I2G18BktljQmT0KmdMa7yw1bOYEqQ0OoMHxeHZgUm5RY0mAhZpA91c5QxBiORcu1
         QY5ubUtv9Zp4xHKJZfDxv27+PvRwJt6Ma65h5Sdecif5do8n1e4LVOdGMuPG3NOM45fp
         iJPWLHXRuHRUvypJ7v5MwxvO9D8fQNRy4Br8+vLZyfNyF6AWKpWnX3IQa3mXVBxnygq4
         Nqvgp8+cnUjAe9vclSwJpDachZB+c8s/2KCff1UwTdLkhUsa559oIBOUKffhN0fI4UUD
         cFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759508842; x=1760113642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EqyC5t2SrD/bODU9RpzzMMs5DHytzZzsB47Ks78jSw=;
        b=BxenkGmdcGrm+bw1iulMWVmPgwI9BlUu7xmLLqCSp/iH0J5RUzHq/KANs7ruPCAw+Q
         fWHkSJSLc1fHOY69P9myoiQrPOoeXUQIobxi8reB3AyA6WOBwzSbIwwMDRe3Qt+4TKhA
         RYEvhge76p0DeHpFBKVmKXLnnujCuUUe0xFFFBOpEz5wQWEECbbMrRKf2D8g+2gu4wjm
         281Gcg/CSc1Pk7Y9AYxgm0a3kUuky6m4xBRej5mnz2Fc5/1Mn9q1TSvLwQNEyN3yqwyj
         +DME/a9Renl7HSsWGRdH2/QrBkJwCuqadyaBCHaBiTG13aIZ0EQcIfr+DRI9P3hpM+Zk
         4aNw==
X-Forwarded-Encrypted: i=1; AJvYcCXVA8F7ZNBL0atOP2yiJGqeBonJIygwgVxn2M+TQ9qo34iXs9eCmkagMq8W3MxOXWc+1Ez7k4eJXhjds58Y0M3Vg+wzGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxE4OJ1JQgGVcsbuSlpPfHykZlQeuCgBeVOWBJAj+CmOTyY2YiF
	L2XrcVrcLC+WBilJV6TXQoaOXoa+k5hFPzoz86GIN6rgdao9ARms2XT1
X-Gm-Gg: ASbGncs7x9FZVcTiPWp2wzqnQiOh2C09zroFyjMvHMRxZ0f34NRDJC4XvA5NFySjD+m
	J0y5UbT9k5SaPzbElStK1ibJw8xb4o1/22hyKlstbjO+0pR+2jVffjrwa7/cUY0w0T0vzYgApKp
	Zl4ZU3/839PXu17dsrOXdcTKhdmlMAPsYkieEdZTDpbP6M5liU78HV0yBtwJP0aYv/joBA/XdaR
	2Dr4upYZVwll93GgK0cvDjYEwOmpYM02cE9Gllt64N7usZcrjthyv1y0bR/NNW8dctSgOtcQPiE
	3lNKj1c2qV0jBnDGbAD7EwQ5T8IKCFjnbd8w0HvKcH1/Ytm8bdULs5WFffiy6ga1ZTiiB2yXzhg
	i0bU78EsjiCpAYisSUeyk8chryB8ncj50vC0rCXrO7ahJrR7S0Zt7pptcRXm2/6iWDQ==
X-Google-Smtp-Source: AGHT+IG2rNSUruY8DM1klEXzzCzW/OV+wycqjmFkUs0EoVxuzcjtow/eEbQKdm/Kq0yZONOSJQEGTQ==
X-Received: by 2002:a17:90b:1802:b0:32e:7270:94a4 with SMTP id 98e67ed59e1d1-339c271ebd5mr4418563a91.14.1759508842185;
        Fri, 03 Oct 2025 09:27:22 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ff0dddsm8416787a91.18.2025.10.03.09.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:27:21 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: 2023002089@link.tyut.edu.cn,
	corbet@lwn.net,
	rafael.j.wysocki@intel.com,
	superm1@kernel.org,
	viresh.kumar@linaro.org,
	qyousef@layalina.io,
	zhanjie9@hisilicon.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH 2/2] docs/zh_TW: Fix malformed table
Date: Fri,  3 Oct 2025 21:56:11 +0530
Message-ID: <20251003162626.6737-3-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003162626.6737-1-krishnagopi487@gmail.com>
References: <20251003162626.6737-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Running "make htmldocs" generate the following build error
in zh_TW/cpu-freq/cpu-drivers.rst:

Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst:109: ERROR: Malformed table.

Fix the table formatting to resolve the error.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
index 5435c3928d4b..7f751a7add56 100644
--- a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
@@ -112,7 +112,7 @@ CPUfreq核心層註冊一個cpufreq_driver結構體。
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cpuinfo.transition_latency | CPU在兩個頻率之間切換所需的時間，以  |
-|                                   | 納秒爲單位                    |
+|                                   | 納秒爲單位                           |
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cur                        | 該CPU當前的工作頻率(如適用)          |
-- 
2.43.0

