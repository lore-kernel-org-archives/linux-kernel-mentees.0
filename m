Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB8C7E1
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 07:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739863065; cv=none; b=gVtf5Vt33I2wJIHUHkjCGAOYSVa09SMfPF57tol+bwYzys1I4Fvgxq++v/LMK/TSru07pbb0iVJG98GRYG/usV9NwtRjgDOYDXJnBASNkBHGXNXRMTI8owACIlccEXq3oA4EMZKMGEpgC2YtPxEWveEpPWhRx1GQaCnud3/8TDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739863065; c=relaxed/simple;
	bh=iM3wSpTuk7D4wA9BzcsUxMDSa487yfLxYkQTEbvIgYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kytOAA5LM8pfDvmFR3ZtqVqZp1+qco/S86R7bZ0gqf3HQ1SoU7THKiNkjgPJH4TVj9CGoxen7h1dxLQ/NzyaqgTScFxeNj8hlAUZg3rZHod7nWUOV4BsD4plcs3h0xSmeBg7IOrE2fzAvsLV7qU+4It+lY51JzyY8o961PkUaPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQJf+JRe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQJf+JRe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2162b5d2e1fso12599915ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 23:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739863063; x=1740467863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=22EMLLT5l22q52svNiixz8e4S0xGsv9ACkjJiv/5Te8=;
        b=SQJf+JReJQyP6HvPE1KeysaXbhnWfnf2ePidhoehy+bTGWHT7M1ZY/iZXO6b4wSV+2
         VPxKe8mSfy4hW7c2brMn6h6fmhKcKsu9L6FLMU6PqyXMIfHrMi284tNAspzYuSB3dzeu
         qMtb8wMEBXYP2mkW4FU9+JiNEo/NhQALNsmR5mu/Cqu1R5imixtyz2RHZZJxz01XbfiS
         Un0xPDUuqSq2DGeci1TaRFrm4wyLrWPGRDwWt9CzvcUzoubHcL6p/3xiz+lmGB3NWGFv
         ARImQ1PuffL5+ZTvqZIgbF6tyjv1fpg5rBwqmWPCN+gHep00jp0TI3eNjLyKl6ZLghH8
         b1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739863063; x=1740467863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22EMLLT5l22q52svNiixz8e4S0xGsv9ACkjJiv/5Te8=;
        b=olgXgXsHL0XKYS4c7L9l7uzv9QjaCdup+H/Po60hqO0enyPDH8ySn8wcwMSaFkgNGz
         LxRvyoEu+3KOrF+5b4huuM2LyaqMZjlDHhVs9L7zHMRjLud95GPkMyE48zI8zjRy3Xiu
         RYtRLrw7EM225p8T1bNxWF05CNHO26KAh8TUfqO63rCoikY+WRhuZ0NKUPudRIN9xKEb
         jIE7Rvpq1JW8fk8w9j55i9whEZDv9UD8spWusumq9HKTsY17uTAVlwWPLBrNwUyRLf/7
         1VO2GdX+iDXXMhN/q9vgp4ZgUJPC0XBjxNo9V0uWjtyInCBVCVZWolCrCNHZvX4FVVdD
         QyiA==
X-Gm-Message-State: AOJu0Yzy6Z/smkaMd8Ea0gVRpIF4wyeRM0JQFwXZRUhPdu4v2sXAAKYp
	im7UsPtoirnlHvHGDFclW16loghBWs7vwnlai/VMMWCwWyipimhv
X-Gm-Gg: ASbGncuiZSRxT6dz7sHYgKCd8+cxjDjSKwB7b7sXOUKiwRDQiAflrL2aSymUAqCRWj/
	aPrRiuPDQD2utLGRmRehXPwwu40SbA8QZXoXKUSBu/Xilt+fzqDWglS/a2mIdaab/oX1r4ySgap
	Df72gNPmpCLeLAdUA4RgfSAupDu2fag5r481QvnM/mlzr4O9ybk4j098FleZi5onanCHzRJiCwj
	RMP9Nry2Zr+jqVzKmwQW7G3a/9uh9/ftl/GgXiRaSTVIhQG84fMIAHCg/DpWGxFL+4sce0GOG9q
	QHygWbsoZHw1037blLqYzWUk0fCrQ7J0OpaS0Okg3bNO3g0RPvLm6CjRsxrqafL16fU9TFaxN+D
	T2cJ2ctClAQkdDzx6GS3MuEBhfkj0UfmoUJ2qzUXkLvHx
X-Google-Smtp-Source: AGHT+IE8rxhKneBAPoqjhnO7bib+LS4UhcC9CWJOfQ7L8CvDU9iOjzzaRYBmwQ/uHQIcFp3ANAOhkw==
X-Received: by 2002:a17:902:d4cc:b0:216:1d5a:f348 with SMTP id d9443c01a7336-2211c553096mr55903165ad.11.1739863063059;
        Mon, 17 Feb 2025 23:17:43 -0800 (PST)
Received: from codespaces-977d69.2t4prynt4dlezbzls5ze3dxsqg.rx.internal.cloudapp.net ([13.71.3.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d558fe2fsm82272315ad.238.2025.02.17.23.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 23:17:42 -0800 (PST)
From: Marvin Murithi <murithimarvin09@gmail.com>
X-Google-Original-From: Marvin Murithi <50557936+rimubytes@users.noreply.github.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Marvin Murithi <50557936+rimubytes@users.noreply.github.com>
Subject: [PATCH] selftests: Fix spelling mistake in documentation
Date: Tue, 18 Feb 2025 07:17:36 +0000
Message-ID: <20250218071736.17767-1-50557936+rimubytes@users.noreply.github.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh b/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
index c63d840ead61..f63b7f12b36a 100755
--- a/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
+++ b/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
@@ -171,7 +171,7 @@ table inet filter {
 }
 EOF
 
-# make sure NAT core rewrites adress of icmp error if nat is used according to
+# make sure NAT core rewrites address of icmp error if nat is used according to
 # conntrack nat information (icmp error will be directed at nsrouter1 address,
 # but it needs to be routed to nsclient1 address).
 ip netns exec "$nsrouter1" nft -f - <<EOF
-- 
2.47.1

