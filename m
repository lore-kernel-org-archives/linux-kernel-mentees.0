Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3370430B9C
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  1 Mar 2026 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772358729; cv=none; b=kE61xl1rE69/kmLQQnFVSDLA0pAx2B7LvdpVxiuoYm6q1zttQchPTUYzq4J+Gi9V2Seo7KEG0nvW9uCEI8d68BI5qYAQ11Lp77XXdAA8XlTTzdplEMyhp+YXyPj3svyQeeMwX4+cxFw5b0LZN1RFFTccxB/QROgNohBGPeUe6Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772358729; c=relaxed/simple;
	bh=juz67gx5zOWzw3OEZIWKIX7wkz03s82+au6h57l1e/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LU2GlL0/h0dfexFf8wMr/wzhmwI+r5RbUPF1aj8XT2Lt0qUKjEsI4yZE4f7TAfoTelZNYRbFKqfAKFNdRvSor7UeLmlVDa33tIFYsOMAAyrCeM4aWY+zq8+B671kkFtKAzMtmHADfJXey1S60bIMnTIP5CAkZK6uwIEAf5ry0EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcWsIeuH; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcWsIeuH"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c6e5998f90dso1299051a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 01 Mar 2026 01:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772358728; x=1772963528; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm5Am12037HbAYWTJo8eItPltWuuhhyfYxRI/gBF+1w=;
        b=UcWsIeuH0MSUItuzDiCZQubKlKvuaDD5lhzp9kvONvsvql9L7EBjfRF5oKdl//zuHa
         jGe+tzLeFeeCZbnEOfmS0BmMtdmKT6ycu+WHrGfwNffZUQWkkSfCVnSWtY6MZxMXYurx
         UkqluCXM46d4UGK05LB/5zvv2nK8SyYwIQ/U8wY6ArItAjmzCeuxghyfhtxDpsDEKQMj
         e01vXJp8NkwEhk+p/gfXAxqjA3SPt8LI8TE0mKMV9WVMqs08Zi0kvwXoWgHxshBai+vo
         knGvyC9ivmyhkNRLbiu5xKeztxuixQgmK3wBccrvVOH4cg1IXtAeCjtTj1cSH2xn78s1
         whVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772358728; x=1772963528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm5Am12037HbAYWTJo8eItPltWuuhhyfYxRI/gBF+1w=;
        b=ALZzUh9Ll3qvFDJo+6zHCO4hQDgsOMdF+1iVGzcWa9K3HMdgwV8CBl4BPQVTrS7fAC
         rxlPvN/79Wcc0XAXu9A00/nuEMQ/Jq9sFSL2UZ0q66pDag+7XH4z6cm9xuepkDDyMGMp
         7a9y6o7gtSOo2JH1oSl1k/ZCROI5LEEVja8qpSTLtM50yx3Nrvi0AbrZ/NG1WG8W8ksg
         UN3rz1mnl7OSs9v2S1UDD2J806sIcPdASVwmO52MbPbqMlaCKpo2LfjMB+DmsvENFa23
         4pLjVzdSMgb8WC1xHCYA5i8h3Mv64HHrMSuwn20x3Ob5Jwe8tDm0YN/BAzJzytC1xpTu
         JhxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlk8sn25C86KkKlUC2/mJTHkhml9NlN7rmpZ9Pc375RJNCo7yYEjh6CjcTxcGEXf7QKHs5MEHdNtIH/zmjs6ukjTrIfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYMiylgWu78tjLZYQEBNkfALDRE6g9WckGDchULfF8Fb1BJ8bJ
	SKJNFzYCtYX9jocoI0di5G3fr2ulnATCdq+cEegMT2PbBECUd4uTslid
X-Gm-Gg: ATEYQzz7YiOkq0ayCKE6iRZ/VIqTc4okSYfCn7xdriLsj+aAwLlot2ThC3CAxYiai+t
	pIXIiAv5ewtbsHGhDRCJee8hQfL9H07DpcNrtt3yTBWlONWHxHg9h/vkdVjhPqC5n5RvEwItYDN
	OmUjjm/SXEt1Dp8YdLUdYG/mS3aVjfnO/cut4Nw3QCLGek7Y//5HJI1+vIzZ5snRT8oM1SDjQkw
	16SmRsTXs2KLDTVqF2lFVJf6Ib6OaZ1NSqXo58c3akRLAekaQkJpmyDAd0wGbPLB2s08DfYW6fj
	qV9xb6fAz5WauVX4ug0oLjSzof60wC2C4fPMT/H+TCBwSd1PhZcCPpn4j2vxvcSwM0eSHNFxYYc
	YmZdC9DFzv9F2TNzpWkzo59iXGzcXEAHcESWpera0nKcbHQ4G8XFGMmX7QYV4JrSYYkl/CaRqWZ
	19nVQTbbKbgeF3Vw75nj0TLqaMOXYTJZXxrx/XgQIe
X-Received: by 2002:a05:6a21:6da2:b0:38b:ecae:671b with SMTP id adf61e73a8af0-395c373cacemr8691204637.0.1772358728247;
        Sun, 01 Mar 2026 01:52:08 -0800 (PST)
Received: from localhost.localdomain ([111.125.231.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa801963sm8971216a12.21.2026.03.01.01.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 01:52:07 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [PATCH] staging: greybus: standardize data type and fix alignment to parentheses
Date: Sun,  1 Mar 2026 15:21:54 +0530
Message-Id: <20260301095154.144809-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize code in the file:
drivers/staging/greybus/Documentation/firmware/authenticate.c
by making the following changes:

1. Remove redundant 'int' from 'unsigned long long int' as suggested by
   checkpatch when printing the obtained device UID:
   printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));

2. Fix alignment of multi-line printf statement to match opening
   parentheses:
   printf("Authenticated, result (%02x), sig-size (%02x)\n",
          authenticate.result_code, authenticate.signature_size);

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 3d2c6f88a138..ba4b16b04557 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -58,7 +58,7 @@ int main(int argc, char *argv[])
 		goto close_fd;
 	}
 
-	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
+	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
 
 	/* Get certificate */
 	printf("Get IMS certificate\n");
@@ -85,7 +85,7 @@ int main(int argc, char *argv[])
 	}
 
 	printf("Authenticated, result (%02x), sig-size (%02x)\n",
-		authenticate.result_code, authenticate.signature_size);
+	       authenticate.result_code, authenticate.signature_size);
 
 close_fd:
 	close(fd);

base-commit: eb71ab2bf72260054677e348498ba995a057c463
-- 
2.34.1

