Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C21F2BDC2C
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 29 Sep 2025 16:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759163511; cv=none; b=ELRPdU3Q95VnTlLwOqL2+T4rDpxWH0nIf4xUlDFLJMhaJxNzOUfgCq01fZfedKUpB/wGN2BI6ULxgl+NfJj0duNuN2t1N+TuIewJ/ShM1DaL7rcr8dWRePSupZ1MgZTlDo5uU8gqU/LmT7BGua5S+x7LkCPRCkyqhwRk+eibWc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759163511; c=relaxed/simple;
	bh=nTErp6MjM2H9FJt5b0VdfDXyFtxk1zguj9gOTg/Op1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vj78WFPqW3BL8cTCYBFykucp5fClvMi0KbIaASpDTFJVqHn2g96yBCEX4gscBq4RWOJidQPdnWGAkyh3an74ILw7AoS83+M1TpUSQ4ipofLd5jgNwCVspJOUmZ4NGzDdJxdnPTjDayPoBLzqDeY9zOHxcjPQG4qE86xs7pOG+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3hDzIWx; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3hDzIWx"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3322e6360bbso4738003a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 29 Sep 2025 09:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759163509; x=1759768309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lka4+ZyxLfYllS696TYLXMts9dTS83swxEi3cmvk4F4=;
        b=Z3hDzIWx8G0y5WGWcsoEca4Ws6tcOAgXLsE18Q5IhnPD3XMeK/61UqgOTrVzZm36g9
         v63qigSxg0xboYvEf32McHKPNTYu2g1t5vw+jXPJDVMBGPme2b34y8o1kj/gbJvtp3Rj
         m5GwpD27mYTrwLwia+wkW8SeFIsR79/XLyLl9KnYzbiP9s16syxN2FP1ZoY/SMe/VIQ1
         K68V6e6reH/rq/CEoTSWWeg85vuGRjzZIzxGaKn+w7CMRAGonH8JC8DUqFDl1IoelLAQ
         Qm8JGGR1aIgZXRsEHZ6t2hMtMXzuFBqHAqdyJbGYEMqntiweyBvNP8tSfBzqdl5rkZva
         cRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759163509; x=1759768309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lka4+ZyxLfYllS696TYLXMts9dTS83swxEi3cmvk4F4=;
        b=jQn1L8rosTa1JRRlr3dXEVJRSF9zcOy8I0fgdpDUqg2VGDAVa/x69pSqPJQVPHdFiu
         4viFkX2qvjsISTTqHPnx8OsP9cOHvLNF/WZOOL86Benlxffr14lKuK6lZlQjtFTkEjya
         DUkuwhv47+BVmXWPoypLH9xIh72HLsx+4XFnRBaY4vrwkD1aLtCj863Hnuo+WUrCO9XH
         R5nSAJ5v2jB9Jz2MmEHtYWVnfCWyhCcAvum13RUkZXdg1PVZTlPduLH12YUqQzo9Wj0j
         80GnxfpEKnWk8IkTzr2+Y0V2VEArPrlYL/M5VLQM7f8lUtlfGk9DiR9a0xReJh/n4Nzp
         vXVg==
X-Forwarded-Encrypted: i=1; AJvYcCVnurtB5ADEosC+8kvFf8DFMcB2KzbH/sGZfLEzqIh1Ig3rtLf5ntk9+miba943CiTZzA/HVnzUMzPCC4jI1AbqlPOWbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy41AgHMLzaM8BKMeNpNFYkhbi/gLIHiPKj7PVZPt4/DCRBEfE4
	Aky1zCj1OgKLTd8LZ4IQRt5G8z4MJHER6EEzruvEyuWLgrwzZ6NKj/tv
X-Gm-Gg: ASbGnctTOaU3jL5HxdffHowrpyyGLpYVUAzY6nB4Ef03nVhHHVKVD6MwXqT9aJL//3g
	l6TebIUB66jqrb/2S9mpoiGoHHrHe5Iehzn/ou8mr7T58CLICRWu8ZgLtJt9c+qMjYjIi13Krhs
	Z6oWQI4S1eAKWACxuiHhkVNRiLVpY4uydFR2LKZ77mujyWh02M0DcqtLYBFKvMHN+uGpHswJf4h
	9n1LSjCnLODru220DotG0qBdxEAYz6U84DNAcChm1GLvdVRb4DWAvYpSdlWWj+aIbN/0jweZPiR
	aXld7U1hCZmoe2Jojq+ICzOn4v+2KWG+nT4edpz0W1i9TPWAHXJWbFplY6530jV/AqAyElk4Vjy
	nn3lrfeK2Crtmm6N2xDxlgwHy5cWPzho1YVTIXFQZWZnkO8GIO6lo
X-Google-Smtp-Source: AGHT+IEZeT16n1Qx68AceriYoS2m5DQH3UD7/ggp2pq32iz566aW/AJGDTJkg6J0/p2eGeMqMpos2Q==
X-Received: by 2002:a17:90b:350c:b0:330:6c04:a72b with SMTP id 98e67ed59e1d1-3342a2498f2mr18362711a91.3.1759163508737;
        Mon, 29 Sep 2025 09:31:48 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bd90327sm17674419a91.3.2025.09.29.09.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 09:31:48 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH net-next] selftests/net: add tcp_port_share to .gitignore
Date: Mon, 29 Sep 2025 22:01:38 +0530
Message-ID: <20250929163140.122383-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the tcp_port_share test binary to .gitignore to avoid
accidentally staging the build artifact.

Fixes: 8a8241cdaa34 ("selftests/net: Test tcp port reuse after unbinding
a socket")
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 tools/testing/selftests/net/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index 3d4b4a53dfda..439101b518ee 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -52,6 +52,7 @@ tap
 tcp_fastopen_backup_key
 tcp_inq
 tcp_mmap
+tcp_port_share
 tfo
 timestamping
 tls
-- 
2.43.0

