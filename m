Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5648A1FDA92
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 16:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755190463; cv=none; b=aWxIO4Rylw70o4hykVhUmJZMBPXuB1mjyYXhuNmQakGA/yW20ojaEmUVgZk+fk42Dh9WsIkaNhwiwBrdB85UrfnIlJ4siOjeqGX+jXqLTl43oEc3ymrTBreIBIsBrRh0a7Pcwj4o7qGE9dmwCl/3RbGuSqmUKCb7tHnTaesqzlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755190463; c=relaxed/simple;
	bh=YfHkh+eSRqs9I6udgnVleOU/rOxXdnn1bs0TZZvIbmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRwTnKYz0Z+YadCARFIBC86fihacooaMUCxfLQ4xyqy0jkCS1ytHLXAnrv1YaMh6q6QG7Kw7iG9N7f89PIGxYmQIQ+uVdJzGd5OqXELjzGKrK6UDheAsu6IfLDVbTFAA/v0EpgKqUkMhiOuWllVs2qQswIelTAwriaGXeDAncuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUgzjSe4; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUgzjSe4"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b471756592cso727076a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 09:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755190461; x=1755795261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bzAUOwpAWoQpgwAW5jB4MGjXOdEDxLQtc2FXn4/gdjw=;
        b=AUgzjSe4bYDiJlZ8bcUeSzUausDGuqWlOAEtyndaOrInhPhdKJKj6EG38jnLknzZOP
         kv6+TUBm0z2zA14ITc7v4md0DgcmUL2mENpkLRr1J3W2uXK3ZBUuGa9CaqXreYhI03XF
         JQHcKGmgrQb9pT/LMtLxThrQ0cSyYc+ZwyTKcyCsWiSeppzOe80JvR4Qd5JLKKVvbxEC
         Mvw5REfmcAidTNl0aOmo6l+2ehnLp6IZmwdy8GAXx14YMPNmLm7gyOaPZTGi4uKE1jLd
         8PNuoIMCVENs/SdaKcMqxsjwvjX78NeHhG+X7ZBverlwAI4hgePMk2CHG0mhsWTzPNqJ
         S0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755190461; x=1755795261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzAUOwpAWoQpgwAW5jB4MGjXOdEDxLQtc2FXn4/gdjw=;
        b=sw1F8UEA3ebLt0cvtccTNw8yaxEV/bNksXoTwUvoLru93HOSnACdscSFvITQwZzu21
         X9AC7aCJB0GjMsytoK8CRINN7urEtZl/k6/BcLcoSgkcWDzpeeutDrnCbI7xz6p07k5v
         wcIQ+a7F0qBfPc7pKCCi3ON2zxE5X8T90qQlHhYaFDF2eN/e/FUGQl/JjuzTFZLsESBr
         /hLOnmtgKa6rC64YLJJ8HptNujRlAOnRYIPXFYfeUHjafIA7peW4ze+0+2LlKzrqDSxH
         TMlbKK5MCLWigphSdW5wVFcOP9VTqeHiUL98ZmNY1zDJV8YSPVgY4kkN40zXzhVvRY4E
         EN9w==
X-Forwarded-Encrypted: i=1; AJvYcCU1T+8AmML4uTErLujMYJLcw/yHjcr/u66ESSEej/9Srh+D19Y2lxDaHW2ziZb2S2dNeJfUpqPwBQO7mNqkrx0tE8P3Pg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfdVh4TLnvxn09XwmiNM+stxLX1AfMCwElkLAQ+poCdxWrB7Dn
	E1Gg4pDLlSVF3mz833br3SgJtjGXy4D8dBWtcWAvtFvXlBq9kw9+nG/C
X-Gm-Gg: ASbGncvxO8A4gtTJ58g8nXMzHCLh/eFrrNTjcPHlD5D151PLYzmpDuwYQwXruLLqP5n
	cx6UCstM4097HASEMMcAJWnSS/P9wa9U8kAj3c6hZVJZnAl2TC0zjDXHIru2w7JT9hRVVWnV0Gv
	IKoD4CMAyDGdpnSOI9wTTMH8MHodJVafY5QGm3XplbLl1mtozogyV8wiALY+fK0qU+0fqON24sC
	LmwEQrjwPrR6le8luwrKqVJbRfvzXFl5CZT/Zi4Y0DuFcYWt5pz57ECYxdTMdLgcpbsw7DJiGG8
	CQmHZqWtY5ND89mDRupev94VtqTg0xIKjQr00WzfRwaliT0Cs67rwHlHG/oGz22rtxAaWd2cBtC
	Y2jJZktSlhsDyk+GmVNg9Y0UFQ9kEGcmv/azeMnMkZld56U4lQr9CaNmv4VpiBAaN/nBM7e4ZuY
	I=
X-Google-Smtp-Source: AGHT+IEqMpZO5u/tm/cwn+0YsGs4tZglauzhONrWB/FV5p8lGP3iOxI6+izHLFRBqWNEDG3eBmVaBw==
X-Received: by 2002:a17:902:c952:b0:234:ba37:879e with SMTP id d9443c01a7336-244586bf29amr53951435ad.38.1755190461424;
        Thu, 14 Aug 2025 09:54:21 -0700 (PDT)
Received: from chandra-mohan-sundar.aristanetworks.com ([2401:4900:1cb8:7b85:37eb:c20:7321:181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24244f5c1c0sm310205985ad.45.2025.08.14.09.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:54:21 -0700 (PDT)
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
Subject: [PATCH v2] apparmor: Remove unused value
Date: Thu, 14 Aug 2025 22:24:01 +0530
Message-ID: <20250814165403.616195-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The value "new" is being assigned to NULL but that statement does not
have effect since "new" is being overwritten in the subsequent
fallback case.

Remove the unused value. This issue was reported by coverity static
analyzer.

Fixes: a9eb185be84e9 ("apparmor: fix x_table_lookup when stacking is not the first entry")
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
Changes since v1:
    Fixed the commit message and Fixes tag message formatting.

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

