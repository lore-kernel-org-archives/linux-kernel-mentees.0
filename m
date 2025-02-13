Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398E226B0B4
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Feb 2025 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739460388; cv=none; b=OLbgcweQxv8jOxwUpEhojQgDKakQZvPuKJnkyTtyY7hAIibcC8OT6CSHwAyw05HBPk4RazuXR/eprWOAyV1igOJ97SXqD2j0jjO115qGX/mI6RSxvW9fADkyMKcYUFjFB4OSNhF1oxnmFGuqdb39MnS5R+qUBIwjF6GzizLVgZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739460388; c=relaxed/simple;
	bh=KUxFX+4f0Aizw7Mg85WPdNi8c0DEahMb6LLBmtuIvak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dDI7rIcHew36TgsZ87eygyUZ2cYc4DIM8/H6yE0+LKGpaYiS+FgOb8tSZPJgKK10Z/YoDpIBHvHcjt6KQTbK9kqVdsyy6QkvZ4YBgfrMLuAYqMLEaGGQQzOdw2eIJS3SugApKU7tgOhi2Zh3IogIkroP22P15nUPymVEDR3nhRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Co7Ioolb; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Co7Ioolb"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fc0bd358ccso2151427a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Feb 2025 07:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739460386; x=1740065186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K89iMvYVIaxnJ+fqwfSq5htV0qyp5rhqJml9Bv4LRmc=;
        b=Co7IoolbxQhEZs5TchrNwk5/1FXNCiCmiHK4sW9Suw5IPZvnMjOYZMFZe/XAR6n9ZX
         3RPmSmrVmCBctsA6ZZNDx/1UoP5J1JwZhvflLlso8HVbgbesAsrDGyOkv0g8rJt7Q+h8
         oCZMa2JcEc/SVjJuSdzjtFFPHutJyUiAy+Nlvx6WkylUsR/rB5WNS/6RgeMsetE1lokK
         mW/PMxTZ+WIYYlYjFUBDBfdD/mrWCn0R84x1WzviKMb2vnWfxZH1oYxMDEz7vdPoXQF+
         2oVycvlD5gbGp7P7ZzhCRqr9QR6iBbFH9ryqhxOe8A3Owzs4PWEUny8lM1u0fygCf0gf
         jiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739460386; x=1740065186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K89iMvYVIaxnJ+fqwfSq5htV0qyp5rhqJml9Bv4LRmc=;
        b=GsWOFkGrFpzz90bVtZnqBaQVtDDh9nn3D3rJOTEDvJIVhtYi7rsRBkjvdnroXg/ygP
         Q6bQrfTKTSdLBMpXKKNWdrluZgZ9JOMRRVkU0nb7y45dYE/Vq40TyZ2rv0CbrDiItpK5
         POhKcIHLePk9xk1m71TtqTtSGYclJygxjFIYQxUle458gBK8RzGUfbF9hI+wD3QAyhF+
         2lIQlqJitK3hoeFhqqDKdbdG11Fq7e3rxpSIlJgX4HsZd2k6kh71MtSX6IryBSQWBgJq
         LHt7QOqPGbj24Ia7iW/mT2T3B99DYc2gsVITtVFJA0gNEFgyakPX9cf2oYKlEkoxCEE1
         UTuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNCVjWI0+o4uKyvzOvtYxLQkjh/tdfAnS/FpFkp7IazR9hCeLv7jek3Bwe/8XtDS+a/sacXO6UdGV3gJ1bk112eFfweQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzN0mXjqdVspgNZB7a4BQoOD/5C8O5TAc4OdjVlb390GuA15lZU
	h3dOqEsCDC5mpNOJMP+GhoTiW8+2NYFrLh2innFxbOkhtCZQkVw9
X-Gm-Gg: ASbGncskFusUFhviFUphLO+4jt3acteQ7IYnHaH5RLlLumjEubMg0/2pbomkkrnHVlB
	G+caVs8BBi54jtHncmDBKC5QmvAxOyRReKjd2bG2rneKVpHinISxG2t4rCtI8z7nQpFde+xWT+N
	j6kDDBq4GXNP9zSnJLq4mjehjq2m2EHrvfp3x4Cc3RgrXbER3eHYfjuxez2QeYbdEQTtVyfSdNA
	c1F3jrU/aTuSx1P5xUeooSXXr7HkHZBebNksee8sMmY1SlEuGqq4//jeo2E+HREc0P6Vd3zCLOE
	EIIozwlxPz+p9EUx3XJASO4cd7GXVlWrPGldJg==
X-Google-Smtp-Source: AGHT+IFipaKcWyFZaSEDZiGw02DfcykMmnnerthm7WE8jzcwMvin1u67jpRAWSD47lXTNrhIZQXsRQ==
X-Received: by 2002:a05:6a00:399c:b0:724:59e0:5d22 with SMTP id d2e1a72fcca58-7323c1f5ab4mr4699239b3a.20.1739460386123;
        Thu, 13 Feb 2025 07:26:26 -0800 (PST)
Received: from localhost.localdomain ([2405:201:5c08:585d:6eb6:f5fb:b572:c7c7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732425806f3sm1403499b3a.82.2025.02.13.07.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 07:26:25 -0800 (PST)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: netdev@vger.kernel.org
Cc: horms@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH net-next] selftests: net: fix grammar in reuseaddr_ports_exhausted.c log message
Date: Thu, 13 Feb 2025 20:56:11 +0530
Message-ID: <20250213152612.4434-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a grammatical error in a test log message in
reuseaddr_ports_exhausted.c for better clarity as a part of lfx
application tasks

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 tools/testing/selftests/net/reuseaddr_ports_exhausted.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/reuseaddr_ports_exhausted.c b/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
index 066efd30e294..7b9bf8a7bbe1 100644
--- a/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
+++ b/tools/testing/selftests/net/reuseaddr_ports_exhausted.c
@@ -112,7 +112,7 @@ TEST(reuseaddr_ports_exhausted_reusable_same_euid)
 		ASSERT_NE(-1, fd[0]) TH_LOG("failed to bind.");
 
 		if (opts->reuseport[0] && opts->reuseport[1]) {
-			EXPECT_EQ(-1, fd[1]) TH_LOG("should fail to bind because both sockets succeed to be listened.");
+			EXPECT_EQ(-1, fd[1]) TH_LOG("should fail to bind because both sockets successfully listened.");
 		} else {
 			EXPECT_NE(-1, fd[1]) TH_LOG("should succeed to bind to connect to different destinations.");
 		}
-- 
2.47.1

