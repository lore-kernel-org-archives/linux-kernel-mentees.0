Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AD92C11C5
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  3 Oct 2025 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759508839; cv=none; b=PXEEXMdJ1T79wPbfwKTfnTOSNu2GD/cKerhiQ+Zu7r1E2g3xjy6jSeJ6RMFXZcwXSsUK4sFQCyjS/YJ1bMWEHT46lgLBr1YE4yOA5/2EK8ICN2enO7eWLiHF6tQITA4PqPfhnx/38jju2aEHkHC78yfN8JVPXLd5zINQMc7xBeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759508839; c=relaxed/simple;
	bh=A0seJZUqD56+LqaPGls9QqXRtY97r8c7RYbr7Ueh1kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=che4rWkiYjI4zP6gS+AJIKMi9Ug2A35Ysf8z0bDQ8Cj+x2pkwx1LemQdP2s0HHLGM5avuua9Cm+4C01zsCXalVeUj+nF5noQd9qxBVBrhJhq8jhhTFcs3dSKsKk8e0E+8kKEbujshil5R1VsKuJhf8D0bqhhXZqxlDIq4X+F6Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJPjIaoz; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJPjIaoz"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b5d80f5a23eso2814763a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 03 Oct 2025 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759508836; x=1760113636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU1ubv9QFqhwCX/UJW2MkuGJ8oe42GWkgn/905N8tto=;
        b=OJPjIaozFcme+ic7y9CvFxORgxrwFpBMQB+ZqJ35F81JSW6+V8CDmpKq9aeix71/Ot
         +Z4zotE2ToUvB8LEQwrmAdeb8bXsugA7XxgjrFf/lNO5jQ9NETxnXHw8ClfCd4EbJNxG
         gR+RDWBHrm1OigBDyTThMuoyKFH472v8MxavHPmHFiu4LTzSpwxIaifViwh2eSyVLtSt
         BN1DNaTbDHxU4HsXZPUoQSI9YqWRFxZ0krkgCp8Mivf3XLT9FqE9uzf7unREtx4tdfom
         2+JkGsWY0rlDZ7qFQW3APD+lGJ61ASTYrm/+Z/0VJ1VDFftOADEfrbt7a2EOrjdWiJPp
         qPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759508836; x=1760113636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CU1ubv9QFqhwCX/UJW2MkuGJ8oe42GWkgn/905N8tto=;
        b=wrOsozkAzBDvJHEsyXizShdF2OBKtUpWzWUv+dzucBf30Xc8YYCqaLzuEYGbK0ZhPk
         KFdKekEiIyNNOWuR0tWgv6FivzgWxc5vYnsu3g9jZuQX7ua6uJu1DkXPmSGEorh5FBSW
         vz0331e3B46DFBoBcdGoQt7xkKjfbjN17skURa8FIcvqYlOoYHOm4wWnysEjD3crYmfv
         7N3zpYUaRNxlGGZQDzw7QUsyFGI0sk+sXI/ZBQELwa6s2cvr8mZqvC8FjJ8YOUsTKWRr
         M8VTFlc36TkVg9aSmmZX4D5rABjc3e0gf2tMrj7JBr1NqlEnbwu6vANB9+YDMDSCNS9l
         bBWg==
X-Forwarded-Encrypted: i=1; AJvYcCVkEeSCJ1E8FOykIeITL3J+IXG2in4PL23lTVLfPzJVlTucEKO9Hlh75g84Uk1MZSYimMAYX6lz7bzYVgzKSJfmbsYDKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjBE5iSFBrRxjTY3+65HGhUhtFltWLGSNiT8CMFV5XSiPgsdm5
	XaDUxxmP2Sn2y6fFxu8FwLY8Gfa2u3OtzggHuy9X38O0MT4r+xUeZUZe
X-Gm-Gg: ASbGnctJNSrMML4/tl0mDxIawvLrRDE4rz9FvNEdM1BIvSwU1Wu1XqYbeie6X4rtCjC
	3nzxCS95qadda8G4qBfn73BwahtP/79NWN6E7Zmy4rqrtqPUgauct4JeqUtXc4ZiZgce7PGVKiE
	SwbsgTC0XPoA6F7hh9dzBQbqiISMBs2zhIHVRXNhG/1dU8b1cfIICMEeEYV+wVuGWaHR/Az3Jfg
	zoDDk9jsppEGlW/y9ta77bxyLEp6XKg122vx5E9lqmt1LzVTmpXJ3pXCMewpKLZnh2kTxk4mmGr
	0mcDOHABi6Vi5TrbpMTsbDy6k+n2fhBtDCfdWU4BxU5NlAKOql9NM48bdx+0XP7R6zYIiB+Hl18
	tZuA3w5XYFiPFRsMkIBtslFcjh450hGNxKw9F9jCaQwoKf3ScJjuoWoJPofyUWqfDnn1MTfWCx+
	eyojB5KIrUzh0=
X-Google-Smtp-Source: AGHT+IE6rDopDalQuanfI6ZfiLOsAMLpprtvoctAcjUSyZ5ja4KsaqHXynMClqHNTWE1f02Amnq3hQ==
X-Received: by 2002:a17:903:1249:b0:265:e815:fcdf with SMTP id d9443c01a7336-28e8d0a1a55mr93324495ad.17.1759508836311;
        Fri, 03 Oct 2025 09:27:16 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ff0dddsm8416787a91.18.2025.10.03.09.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:27:15 -0700 (PDT)
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
Subject: [PATCH 1/2] docs/zh_CN: Fix malformed table
Date: Fri,  3 Oct 2025 21:56:10 +0530
Message-ID: <20251003162626.6737-2-krishnagopi487@gmail.com>
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

Running "make htmldocs" generates the following build error
in zh_CN/cpu-freq/cpu-drivers.rst:

Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst:109: ERROR: Malformed table.

Fix the table formatting to resolve the error.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
index 8238f4c6e4f5..2d5e84d8e58d 100644
--- a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
@@ -112,7 +112,7 @@ CPUfreq核心层注册一个cpufreq_driver结构体。
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cpuinfo.transition_latency | CPU在两个频率之间切换所需的时间，以  |
-|                                   | 纳秒为单位                    |
+|                                   | 纳秒为单位                           |
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cur                        | 该CPU当前的工作频率(如适用)          |
-- 
2.43.0

