Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E489628504B
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100927; cv=none; b=cJ4hfTP1n7M0BteLmfD1jc9OiA8Ufljqiil4Xf3ogQfSI2vlrO2AhnZPaelzvmknai1/ch0LojzWInrHRkuhSXkiamV9KiAMXBaXP/1TopUM7PjmnbgT0bvgh2z/CMU+/NBtSES5y6XPOiARqm1DYxnZStn6o0MxsjyXJJiod8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100927; c=relaxed/simple;
	bh=UDmbkCATMj3zYzhEYu3RaoajQKcynIBgbBYwP3uZH3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fZIhD4LYOK/sMywd0lazsz/Y/Lpi5oEKWpAsNZx87IvuHQKfZ0+1G+niNfVkTIY9QahyvSlBh1WfDzKIklX9CjeXSEFFd2eC4oNB+2GolA9G+ixj+b42Z/D+z9wyaGdYkodRA25nYA5YdlMDiVq4NT92u7pzmKXXIoFm3teQ+ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDovaCiv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDovaCiv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2403df11a2aso46281695ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 09:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755100925; x=1755705725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=15PDS4kBFxnfhGyuPIxLhWrdICQOQTl1rvLJxElN8H8=;
        b=FDovaCivQ40K1ec8CJxmJaSChMs2c1ex81/1XSvvCAmbFZYcbuobcIOR/UIlQJJZn0
         FUmfGvgByJHmceConIUC5GCjIHearHZygRet1DLM7uObuS0xJlkVpFp/lxShN6V3FHxu
         5Q0ap/hfEAAVqTZoRZ3FYsQx1J47nZpXhhKOC+R9IJQvBR63hyIflMoNkdfH2zSNhU/s
         MrDVF4jJKbVS8w/HOmPxX3HHy6E0MrZNp8NWXLPUdkQq4aw/Qbc+0BIk0z2oYvzA4job
         PvVJMiEu1aMqW0c9cNqOz/PdAn0b+JIey0wWqqKXZs6q/ctAcddHCy2po5Wdo/k1DMrP
         JUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755100925; x=1755705725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15PDS4kBFxnfhGyuPIxLhWrdICQOQTl1rvLJxElN8H8=;
        b=jAiXcKvwu9mEwpNKI8OXr7aPfGo8ZMg+gs4YbQ5Tq+WtfhiOKodLz+Sm6Tm6pjqGp/
         WhZm+LPhQiV/Tjvxehx88LLuOr9udWAVU/gz6V8DGpht1wU2nneAixN+Ttjw7Ji8geXT
         6WgqeF20SEqjlgcP1baFkMpYEzTerJ/uOvNev3WVLKkDxGz+wj8yQWFX9iEfhSoTxHYh
         1QBPXKW7HoeWEGv5mTluH8nVi+GSkWHG5YWT6QUHHnxsjG/tXb3b4AY0x7+MQc+8Gd7/
         tXkGQCzaq0thAXO5mkeorfDYs7IJg+zim9VqinJ7ADQwtANGa/9tiVgvGHKBcJK6CddB
         A2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUr3uXkHljx97n9h3+aJpFxKy+o2QxrKBYsmkSlQPOQ2+jhVCMVO1mRsqY0tCpmCOi2JQPVLFQzETmmooYofSN0uaCDbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCRuWkd1d/+aSo1Ls6LGfeZADumbxxbFpdZaks51nFlPGJx2mT
	VNupgxJbheFu52HMbA31zExafm9N4kaRrG701Nk4YmsTi/bckV27JfNr
X-Gm-Gg: ASbGncsXPY32wIi4FFGttVSGsJIcX8FHqmsSxcCLuo/GNO5WPyEhwS6pNiriBqRLwao
	+Y/3jVmRmU4wOQY8lfeiMemDft9kXtIQ/mfhNpHoNKfzDkW8DdcEfK68IEYxzz2PHbsrZ9poVSP
	utbIwKLLCdtjcKefuKUj0L+fN58jAOMEfEGhUJS/QxT4C0R+xTKKfCIpY1NmZvKCozZVYQIVikR
	bIUt98alw3daHoIuxoA7oSo/dgDFiqkWnGRgVPSB6+Y0JRPaZCqkz0vt9VJ/1rn0yIyvo7YPAfW
	N5ZmaKu9RS/xrsLxpB5SCVOo1Ou/hF69ODjgaHjdTRUT3ODaTr3BNTxQ0A9MbF/pvccTGebadLw
	I1lhZaIaLgBMALHgs5Pn/Chcmljf1cobNT/EvRKkNt8GbOD+M2UYatGtcGAxgRCwQLtbsZMAIuh
	nYtA==
X-Google-Smtp-Source: AGHT+IFneh6DcSCXvD6FkQgAozlcfSCn7Et/p7McK6cLRii7ICb97K3VSPkcw+k/fd98jJHchkAFog==
X-Received: by 2002:a17:903:1aec:b0:240:2e93:8a9a with SMTP id d9443c01a7336-2430d1e570amr56436565ad.42.1755100924906;
        Wed, 13 Aug 2025 09:02:04 -0700 (PDT)
Received: from chandra-mohan-sundar.aristanetworks.com ([2401:4900:1cb8:7b85:9b4a:84f0:66de:85c7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2429b4ca995sm197380615ad.177.2025.08.13.09.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 09:02:04 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: john.johansen@canonical.com,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] apparmor: Remove unused value
Date: Wed, 13 Aug 2025 21:31:43 +0530
Message-ID: <20250813160148.132192-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The value "new" is being assigned to NULL but that statement does not
 have effect since "new" is being overwritten in the subsequent fallback case.

Remove the unused value. This issue was reported by coverity static
analyzer.

Fixes: a9eb185be84e9 (apparmor: fix x_table_lookup)
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
 security/apparmor/domain.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 267da82afb14..9c0c7fa8de46 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -592,7 +592,6 @@ static struct aa_label *x_to_label(struct aa_profile *profile,
 		if (!new || **lookupname != '&')
 			break;
 		stack = new;
-		new = NULL;
 		fallthrough;	/* to X_NAME */
 	case AA_X_NAME:
 		if (xindex & AA_X_CHILD)
-- 
2.43.0

