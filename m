Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FA1514F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755217199; cv=none; b=GIM6f92og/lRSY+KAMIZ5pkac6fO1RGX8uAzndUO2+ZrWzgkCJm7OlSsM+0H7juh+QbXdOJL9P6ZveC0Q+lNk7S1x3MNAbi/sRwULkEkD8+zsuxKtx5Avb7TrjG1uox4+w0NhoGPkjBbc8sFI5Qu9eUbPKYw7BNZoPyqftk2bEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755217199; c=relaxed/simple;
	bh=4WxO5njFK0+OR3toSx5o2S0JgQhNFZQCIDBPKDxbstg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bc+xL67QahGpmrzBm1Ux86bYWUEio8a6HpMnF4kjCz8tPIuhu7KhYVAopBEVEHEPNuTSgS4Pqk5za3Bb+63jllkoiqUUtca7dvU+FzenxetWpci+cBHv10SAtOM5wLSbrhPdlSAlKUh4cEiD8AvxHOX9TxpJlhtXuvbOVsP5Bdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H40HzCgj; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H40HzCgj"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F756608AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8ORtvtPInaQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Aug 2025 00:19:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A55E0608AE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A55E0608AE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H40HzCgj
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A55E0608AE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 00:19:57 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2445827be70so16040055ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 Aug 2025 17:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755217197; x=1755821997; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9fv3c2HbHHCXhaOug3C2M7cVcHLqE7dP/SrHl96zCY=;
        b=H40HzCgj6ECZk0J7MSPutDFCO6lsLICuk+2W77cKE88ByzbsYa47fA3YAMljuwXCO0
         CyfWh0OuK6mOnI2igJqIYo9CX3tIv7tAsuNRjj8rMgZn2FjNGvJVE8bdFihaiEsEO7xM
         0ikEANIjt/8Xw1gBk7rMhjPunt/vqR6N6sh/bNajKKVaOfBY7LT9HSYiBtotBYroSdrg
         xqgKFXR8MAy+kLeXmGMRhQ+1ameqDyHai2Hcvhu8RIxcx3fV/40LfCoOdcEjhLDF3DTD
         EZTiQjZoRwDjHkle/kcDCgumIVSkoZkZZK0jzcReyrBL8h50JqskXSWlhdQdGjLu3RPT
         Qfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217197; x=1755821997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9fv3c2HbHHCXhaOug3C2M7cVcHLqE7dP/SrHl96zCY=;
        b=emQz0iOiSkUo+SY85QesISKsq30iLm27KC6ATb0EqRkgeKwPYk6hboEsX6Cz7K2fly
         bIyio1n5FLobRZmw22LStNblSsi//bGLB4JwReAR4wcjqHyz0N9unWyxCnicQuA+vn+w
         WolF56Y6AQaXOiu2DPNJWUvJqUQPac0dHCDMnyUJe0FiG1boXuql88+eNOG/z1ZKruB5
         DtOfT85D2wbGErGKjazgZHHyPAPZR9+yn6gHOCdLRpn8zZ4alregfCXtJd5CNZqQhXHW
         bOAp9Ix2xDDEWEa9Nvf6t/XFwA13ZPRU8lJr5peiMJqqFp/hvpfdJMqP9hMSHz9VTMSP
         4OvA==
X-Forwarded-Encrypted: i=1; AJvYcCUpFUVmBYLMjXVPGW/KEiToLXBuNN6uvO1zebBkex4oQw4lCPqjzzJPpokSgtQnTwNOC1rxR+5LNcgo7lu2D0HVZCa+Yw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzd10QFwxGMv0aLyZglSlY+5m42BBRH0icOdhZWIid3cmQ91Cl+
	ygf1m3okGeMhVWACsJEtLinJyx9r5ArYhmjKJYDjEvSCf1/KyScWnI1ULrT1LVUf9BU=
X-Gm-Gg: ASbGncv6aRsZJpAZA8NnPfEEoBFv2eaYwg/khid50+tzXeb1PuP3mR4VcICprh72/zu
	zsFsudIntEIB2ZtJOqiJYvEhQvewgjkHvhqRVOpoBIjF/Mb4rg3LkkA2kEtkPQb02PXtITrur+2
	33RoYCmdHi4zjEm2aBQveGiEEJcwD3hRGImDxLI3uqM9F+QB03gI9SrmHGHnVgKfkc2PPzXBwtH
	p4qOc4J7LEF9y4Ta+kFFXCqD3vEHbYroqmVUH/LxiOH3vFsmGBcusXaO50qD4sJMhI3zzKK0nX1
	PqCpI7kOeVkmAZkYYwq2Yz49tsbREcpbx3RjHlNJLSFrfhIYvMLK/ZsxjGzrFpVWc86X3Gjbi35
	8Olbp6KUFa3TZ0QJiqzZDWPIKbqbQZY8FK83BddAzig==
X-Google-Smtp-Source: AGHT+IE2r0AUduQsrykmHmpUS6XlGtUQsJE/qubvEKPOvnN+jaFYs459i+wdq1r02Cqq4OkDozuRtg==
X-Received: by 2002:a17:903:1b65:b0:242:9bca:863c with SMTP id d9443c01a7336-2446d95508dmr1526625ad.54.1755217196891;
        Thu, 14 Aug 2025 17:19:56 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5a451esm700745ad.165.2025.08.14.17.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 17:19:56 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org
Subject: [PATCH 3/6] selftests: ublk: fixed spelling mistake in output
Date: Fri, 15 Aug 2025 05:48:00 +0530
Message-Id: <20250815001803.112924-2-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815001803.112924-1-sohammetha01@gmail.com>
References: <20250815000859.112169-1-sohammetha01@gmail.com>
 <20250815001803.112924-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed following typos

- faile -> failed

in `tools/testing/selftests/ublk/test_common.sh`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 tools/testing/selftests/ublk/test_common.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ublk/test_common.sh b/tools/testing/selftests/ublk/test_common.sh
index 8a4dbd09feb0..e21476ff1f06 100755
--- a/tools/testing/selftests/ublk/test_common.sh
+++ b/tools/testing/selftests/ublk/test_common.sh
@@ -358,7 +358,7 @@ run_io_and_recover()
 
 	state=$(_recover_ublk_dev -n "$dev_id" "$@")
 	if [ "$state" != "LIVE" ]; then
-		echo "faile to recover to LIVE($state)"
+		echo "failed to recover to LIVE($state)"
 		return 255
 	fi
 
-- 
2.34.1

