Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E3C13048F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 23:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720826265; cv=none; b=Yo27t/XGekmzqzhagarBJdgrM5M6JtsI3+GQkZS06rc9JZsKoyRfH71qvw5T6szbBT+w09KoqI1VNHQorXPGijhkIxc3tDoy27lyH/yGbGQ7vx3SLx+NSHRD8XCCCW3EPS4kEapELpj8PoyQIGVy0PXGqnepm2AIgVvOdYriK78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720826265; c=relaxed/simple;
	bh=QYgVRyzH8PcMNACMLIrauxK296Rh5jioM9J1lSlVUyk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BvlranByWeHY07JqDSAIIpp0L90SgYF8RdxTX7LGYg6l2sXDA7EIUvCvQKbJYUmKYbyevuP0xuChko9c9UM2vOFgGZ6UwP0AN6wD2NQGxVsuvR3uuRH1ZKfymGEMlpQr0XpMa8pzYZeiE/o5m8fB6tCRGpwF8wUAWLoZntZJmbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=NR41Oikv; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="NR41Oikv"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D150A84762
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 23:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZn9xYa0D3dv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jul 2024 23:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=rbrasga@uci.edu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CEBB8475B
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=uci.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CEBB8475B
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=NR41Oikv
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0CEBB8475B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 23:17:42 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-70b0bc1ef81so1905194b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 16:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1720826262; x=1721431062; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ/x0PvWt6cH5OnfaR+19VuRmz9ObiIe9IQ/Uhq9F24=;
        b=NR41OikvI9M1sQwV+18z+cTSpztz1es6WKJUp5R/hu6bgr7WdE8DktexlnbVsvvzee
         e7wZIavLcpmZeyW3wwZGg9b+GDyRaraoCHkGZyUhcq5E5f4Ky7FdpsZ/eQ6kmW1z1arK
         kquyLBX1yVwe/jXu8a989qy2ZMm7/boPkNh0yOGKN9EocAKmT3cniY4MlYvDcUuM7XDt
         M+xCR6kFwcJXPBogZpW7HAQbeks3dt55b9g6EdICUMrMridbelcXnXwfvwsCf4oIM2Mt
         ZSD6BtyNuPnRm7sXNMO5nYEMVXEqj3A6IYcA0UUMVXamH+UxfEimzAhJ2jXE+fzmtQan
         sF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720826262; x=1721431062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZ/x0PvWt6cH5OnfaR+19VuRmz9ObiIe9IQ/Uhq9F24=;
        b=QyHPCiGJrHA2TbiFsLqKW0XHwGI21MH+8nrixhfNG9Ma/uSFQMr+3RJY+S8I9oWTpk
         BDc50QbAmA3xIsvERm+4FPUXG+TumFsrel4Q0OYqPaUD+Qbh+OqPv8ucALq77wyF6EIM
         Wt+B6NZ2kVgoGaIz3ttGEh1fXUv2HJ+QI7NmtV1XlIKPs5TUcY4rnBA5/tQQ+QKcJSLj
         M8u4MZVvo05S7128bUP9c4x6wuzVqqpsgXD3t0fgLpXog8l0pSToEjDKQq1pwDodjRgD
         2DUDZmVDwElCrC+WNjXoJRq0Ucs503YEPLe4KJsi7BSWoRlMJP9P4LFpG3s6zLjivaim
         qggw==
X-Forwarded-Encrypted: i=1; AJvYcCVWFtFq3RhZy6D9/OzCgAj4HAI40XXztT7UbLTvXe9MeGYWJEkFzfrNS5MPYjRtIdcR6+YOVRp/y4a6zXNpLpMvy54JAJBXffJ30xKpiK5ZesCdMHF5z9vvoR7H8h/l
X-Gm-Message-State: AOJu0Yz9JDNVGhZBnSNrkGu+Rq0+Ij9tpZGi8OAleNwzaxe5puuqe0Wl
	ikxX0cn8BLe5SIUW0OoF7QNR/CGvEFgA2ivZ8gxMWL4ASQM2Pi6/Fh4vkaVvdyU=
X-Google-Smtp-Source: AGHT+IHLHwjE5E7P2KMkGKIVL/NKhjh2eaHWxkdiky4ouJUHcC8YM7Sv7rhWy/oTO/b5bjM+LvWERQ==
X-Received: by 2002:a05:6a00:3d08:b0:706:5dab:83c4 with SMTP id d2e1a72fcca58-70b43576a80mr13644912b3a.14.1720826262020;
        Fri, 12 Jul 2024 16:17:42 -0700 (PDT)
Received: from alpha.mshome.net (ip68-4-168-191.oc.oc.cox.net. [68.4.168.191])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d5f0ab0d8sm6292960a12.19.2024.07.12.16.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 16:17:41 -0700 (PDT)
From: Remington Brasga <rbrasga@uci.edu>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Remington Brasga <rbrasga@uci.edu>
Subject: [PATCH] kselftest: missing arg in ptrace.c
Date: Fri, 12 Jul 2024 23:17:30 +0000
Message-Id: <20240712231730.2794-1-rbrasga@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The string passed to ksft_test_result_skip is missing the `type_name`

Signed-off-by: Remington Brasga <rbrasga@uci.edu>
---
clang-tidy reported clang-diagnostic-format-insufficient-args warning
on this line, so I am fixing it.

 tools/testing/selftests/arm64/abi/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/abi/ptrace.c b/tools/testing/selftests/arm64/abi/ptrace.c
index abe4d58d731d..6144f83f8ab4 100644
--- a/tools/testing/selftests/arm64/abi/ptrace.c
+++ b/tools/testing/selftests/arm64/abi/ptrace.c
@@ -156,7 +156,7 @@ static void test_hw_debug(pid_t child, int type, const char *type_name)
 		/* Zero is not currently architecturally valid */
 		ksft_test_result(arch, "%s_arch_set\n", type_name);
 	} else {
-		ksft_test_result_skip("%s_arch_set\n");
+		ksft_test_result_skip("%s_arch_set\n", type_name);
 	}
 }
 
-- 
2.34.1

