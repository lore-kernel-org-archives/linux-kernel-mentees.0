Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6619CC3C
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 14:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147716; cv=none; b=EhITleu2QDfeKjY3LNyoFgzoc9LXbxLFCwBk+bdIjXnAzdchWgMRu46iTwiHBpw0cTOdm+zLhGaQPTTse7NjSBxPrv0/3i1tCzQXscorA0jxIHsDynSQIW3AikZQi5Jy711IRaA5tQ+D38eWEmvn5kdAhIRwxVqDQVLuhXohbg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147716; c=relaxed/simple;
	bh=YT5xNS4r8xP8EivUfdR7P7lQuV3FIsANyZZmY8R7e5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qm171Gen4ClbSt66r+D6HVF7B5aX3qP8fqb2rKna/yLyR3ODhrWdL+xM4S5g+cSw1iLxZOKBxnoeiwJ2Pz5lDP/6Zs3Op4j807S3w39V7wFoQPBknd1W/Y8r89sEYw/wydccAzoX9Nb3yyjPS4PlmQ4VSP/tWpFThRzIjljYvQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=CpOGLdq2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="CpOGLdq2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441ab63a415so59344395e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 07:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1747147711; x=1747752511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NbBexokf21nG+m5XXQimUxHbfdz/gKFEIaDFzU/LUE8=;
        b=CpOGLdq24CgvKqbHo2faIKf1evi2u2cjuIpgDOoUIuqYGXkjni4ZfxvPnCK7a5Fpbi
         aAuEo7mnr6E6+Qj002o2CVJ5UUImXrxjxK2AuxygdQghgw5LanI93XAwFp+5w7erycEd
         7lQxxbiS16RMN4QyWG3pctjgqzO4XHc2wmHdHvpn1qOb88nqSIKSRFizWAhEqIATkvFZ
         poQhTvKfRCCc5yE5yLTpfDTZBQ8bmB9WBE6vZ1qLgSY34FZ4H5awVEV8OAf+RAMU7DFE
         0Mrug7mqbv+D51I4JtLEmULE9WXo7WYbnUJdIliqG5B/ocbCMyHBtUxp7LXdTsuZHHmF
         dhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747147711; x=1747752511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbBexokf21nG+m5XXQimUxHbfdz/gKFEIaDFzU/LUE8=;
        b=crs71cVw4R2VXa8FJqeIAckze3qQKGdW44x8pepOiuMr+nbv7N/KzHPEI8dijr8rgB
         dD3Y/A/7M/OdLlPEEGieqqgtf6HBzE669EpHbhHHiPJlVBhLfRTKWrY08mwLU7ewlOLB
         JjULSEiCPAzXtgJbmSo4US5PKZwvwEcys0Cwz2p+XiBDaevQQtBaVZvx8HamWymQGh26
         sRNoQ5sXHHr/rExEH0RJ+OF8wjIWy5Uct9Vv8QSG3j+QZYzCQd86wQ948sRrx1tJMrZa
         aeruRiYb5TNz8iwzMs26h5nIEILvQulu2kRIZhFcf6zhROBb8ZPdaePDcdGnZrE5fGDs
         nYVQ==
X-Gm-Message-State: AOJu0Yw4jEVb7Zc524uLIFuw3Ilv9Fgb/yJGxWidOWalKej5quYsfSJQ
	uETCXVcgtCD/1tyPkI8R3gw6ByDyXzuRoqSxTJJTIu6up5PlPgY3o6sseDwYSmd8+q0pitQ2kiU
	o5NA=
X-Gm-Gg: ASbGncuaYAGYC/g7fnAOObtL+oC4gfWNuNGYW/PG9zWp3CA6H8VNBHSCG2X12kFxnSy
	M/mqQQY+cWFG/rga7Bch2ozvKpeHoTunYDorPECYyKgICq+Pdf8lyg+Ac2GnzeTd+j69WWfCe7Z
	fklGb/tpEK5Z/LLLPK+Z26mJbkSRffxTl2efPJ96onjPGrO4Xm60GauEo4GeFqD9HKiJGR9mng1
	3ZETB/A+Za5+T9O78J45S+vfjybPIpMKEFpJJNVYUXZND02f/9MFh2ebNMb2cdbxQDTxuVR0Nam
	j8/nhlws1IZEhPTTtJh6xuFjq2/E0mH+qbD5iCNSaBYznJz0ewQt39VVIzq9JfFp0/yWjr0IqX4
	+ix/f2TbggWkIe532dt2BUV/JUBGvBA==
X-Google-Smtp-Source: AGHT+IFB3vwfvifBjKb4BRvj9BZyF3VmALZPU5U77ivyr56FeegCa9igR2q57C2VuHPX0hdhYeEJpg==
X-Received: by 2002:a05:600c:6612:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-442e17571f9mr97496445e9.11.1747147710206;
        Tue, 13 May 2025 07:48:30 -0700 (PDT)
Received: from pop-os.. (178-116-3-140.access.telenet.be. [178.116.3.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm172837185e9.4.2025.05.13.07.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:48:29 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] selftests: fix "memebers" typo in filesystems/mount-notify
Date: Tue, 13 May 2025 16:48:16 +0200
Message-ID: <20250513144816.72566-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrects a spelling mistake "memebers" instead of "members" in 
tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c 

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 .../selftests/filesystems/mount-notify/mount-notify_test.c      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
index 59a71f22fb11..af2b61224a61 100644
--- a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
+++ b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
@@ -230,7 +230,7 @@ static void verify_mount_ids(struct __test_metadata *const _metadata,
 			}
 		}
 	}
-	// Check that all list1 memebers can be found in list2. Together with
+	// Check that all list1 members can be found in list2. Together with
 	// the above it means that the list1 and list2 represent the same sets.
 	for (i = 0; i < num; i++) {
 		for (j = 0; j < num; j++) {
-- 
2.43.0

