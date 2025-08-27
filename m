Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E5E304BDF
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 27 Aug 2025 03:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756264417; cv=none; b=NzB+RZT3zX8EmXxlFGReA4m2QWlk7+T3nzsh/1vISEZEroCkCM/DxMWMmccqUkSxCYwBfVVOqb14UhWlJzwLmYLl2GMGQ9KH/izD8JyVcggcFmOaZMimdcUT35JdlUksz+OnLCBAKZQJXNaCl9SuMMbI37hHMyH+dw28X3bQ+xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756264417; c=relaxed/simple;
	bh=yX/qwjcskcMcSyJexqyC0NTHw40p2wM6719vDgdsxWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWPnZrfoiCW70uL1QcBSSdR/ROMiHzZ4dgJ5XMKtep0ikVTgLMXZbm82tacoADxvcE9W5PeAhbG2szUB1++lZgaVTb/CshMNPvaur/0M7jkhvbPtMmkRbYzD71vPvhy9H6xu6mQ3tn8Tk4L2Ql9GETx1ygY0SZbo+pMK+PWou0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXHXRSVj; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXHXRSVj"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b471737b347so4094238a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 20:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756264415; x=1756869215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/McTYQdEpEwGe2x8bB8le16r9isb4SHvShhNxkUsgc=;
        b=jXHXRSVjigCJqWqCDQi3p8sWf/YQAtFnWxYH0UNF8PcBhsWNhsxAgIYgMl2nHtfdVe
         kfAc/5NL6rOvAneadz5Pr0DofHsrDNJ3Mox+VqaZHbBRaYyhhxSPClY9SkHcjKe89KlN
         3Yf7XzIXMOQRAi19UTx/NIt4L2Q6kZ2rG6wKXhkEJWEyoEiH58ulAucFA5ZizIcreg+L
         sWGGHOTCrI6LE4yQRER/RJcROd3nlTTtD+RgrFgGQoCaB/uE6VA9Gen2m2VFtO9mS3GY
         CkBmU1B5vTLla+saGJo6IPWYDE+3nvGwrgrloykKGnvA0vbaFVb7JTKctffdE/tbzr5i
         Levw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756264415; x=1756869215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/McTYQdEpEwGe2x8bB8le16r9isb4SHvShhNxkUsgc=;
        b=QlfDwYrZeNbNLmZ99YiQjuFAO05xv11V4zfg6R9RC03AZG8bIeTq8X4dhV2obEaqCL
         8C56W4I4XG04+8h4bY9vwp6ENXRcPIqo/uuw2LE3lnL4u6kHj2IVLa9W6pqDkwwu17YT
         238ScV3y+bqIABRXp+xc96PsQI6Lbh7XGwuf6ISMPBaOgVBitPe7TkYLD6f07NQQUCzz
         avQhEHaSJU2gQJfaujhCPfefXu0sE7ydEkfa7mvT1/b5evYUc/FR3V71a8ararGCWAFR
         BvYw1SEVFyo1QD4aBqnZj48C8HDYAfYnYEDpkgXB86XoI7h5kTxCqLav5c5+Xt3J7FgI
         Gc1A==
X-Forwarded-Encrypted: i=1; AJvYcCWSRGJkPsvBl+Gj8d2aK5S66W5XYcHgxdK5OdAEidni1LBPzbV13Hs2Sx6oNPlZCHHq2+zHcPapyf5/oH0sjCqf9JmvLw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2J429AxlgoS5n1NJL5+moI6JXiu5OZ39qafzdc3x07xWjgmc9
	2nq8Wbd89P6OxAM8pN9xSAsMbeDJosWhPTEL2pYP9OOL4xuaQf/iV9sZ
X-Gm-Gg: ASbGncsEqQM7Hlf7Oi7/QoEucGEn7OqfCf87ApwOrCoHVFqBt6bD0HPDArzSM6yzhgG
	n5oUgsiM2vddVItqA8K/7s5CqWDbUX1/z8d5s0JnfxkGigbHJs4XJkw8m6zt2AE9lmqNl97pz+a
	ieq9LcMNCTaYCBcshUmcmLP70dSTUPEmHAFoLW90oqtpd5Rzp+Bndk27DIBi2V62dxRvRzcwgwH
	PzaGDt9d8aDz7GnMKpJe51xrRn6MdxOJ4uZq+7bBbN1uEFQv8sGbvKus0QFE3gUd0fD+551IJxF
	Es/MjbSqYHhA87Uflhkys8FXCzRGvr2mLAamFD35Cdnk52V+ORN/IEl+mERVKgvHpmVNXlEkBIN
	IWairxxTG0+1Jw2OUUrXwOy0MIhTy3T+SPwbtlT3EIaD+NrjRZ3UBWl4i8W5NXG6GzdTxgRFLc9
	0cUKkiLg==
X-Google-Smtp-Source: AGHT+IG2H8wGjRa60KI6T0koRJsOFwn2LT50b5OO468YqNT5u67p9oELQGYQjhYbmh2R95CEmTqTsw==
X-Received: by 2002:a17:902:db0c:b0:240:10dc:b7c9 with SMTP id d9443c01a7336-2462ee2ba4dmr165619485ad.9.1756264414733;
        Tue, 26 Aug 2025 20:13:34 -0700 (PDT)
Received: from linux ([223.181.113.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-248681adacdsm30226275ad.10.2025.08.26.20.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 20:13:33 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: dot@dotat.at
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] scripts: Add missing break statement in the switch in unifdef.c
Date: Wed, 27 Aug 2025 08:43:16 +0530
Message-ID: <20250827031316.11293-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statement in the case 'V' of the switch in
unifdef.c

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
The current code works only because version() calls exit(0) once
it finishes printing

 scripts/unifdef.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/unifdef.c b/scripts/unifdef.c
index ff15efd6e7d7..465246fa7fd5 100644
--- a/scripts/unifdef.c
+++ b/scripts/unifdef.c
@@ -305,6 +305,7 @@ main(int argc, char *argv[])
 			break;
 		case 'V': /* print version */
 			version();
+			break;
 		default:
 			usage();
 		}
-- 
2.50.1

