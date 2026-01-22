Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B0F363C65
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 Jan 2026 19:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769109565; cv=none; b=TF/bW27DsWk4rzmwV4JCoDH9CTYywUWHcWHYW7zHM1+0EUPGY8TAMcNQQqvTF0GsCkjK1AzAn2F9VTIWEVD5hTw+r4EBCSpwDXHZBuzWwrUXPIpB4yXA0Gc5wEElUr1J9C9I0OtcsdAfy59IAsrZuA2UlqLwdQ57UccOybqP0Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769109565; c=relaxed/simple;
	bh=OLmrGLEMdPscyNLLY5sLSNNGFiyXy6hLcRAiQEugsHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jLanrtAE3bCZAMOPnCfGcMo1WVVJfhkwvCgHYo1x6D5yz3hWr8LBKwF0NUI/LzwHV+0nblg3ewFsQZW4D7YjP/DywhIbTYJ9Xw9NF1r7/61ihl/xHzyBXBq5J3/lKaJKaz/gFNFCG5ls5I57gOzXECTughQoM7J875SjyuKOMDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J//bAJ2v; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J//bAJ2v"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801d98cf39so10633785e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 Jan 2026 11:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769109556; x=1769714356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6xRyfD8XK0jyWejnFq3OadXZ9LbtEamFWXL6+yDnsPA=;
        b=J//bAJ2v9KJpMoI/UDgJw07r1lYlVnGA+o1pwjKjsIo/nzW8C7ZxJKj+fcyqmoeOva
         fLhx2W+L3HQNxoIRRnKN0rIwBmyHARJBSjUtsc7iCPbhaAHViVfdYa00Vq9VMHFCOGgU
         Emh4/32qY9CDTIDdfesGfsIo/bEBqkWbXCTz/5bgTaUDwicWizTs5nr8df5D2RgUBuTz
         Meq3UknrqWkoElzVOvmkagPse0fBZoYV+GKssMbWWmDs0M9FqLYUNyQKwHWPnDTK4hzy
         +xHf0ixB2k1RHWm0+GcuZevNPA/MJAmMe7pIwGudH+o8mWgmZiFnw/yMpboEM6zwjbDr
         2S7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769109556; x=1769714356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xRyfD8XK0jyWejnFq3OadXZ9LbtEamFWXL6+yDnsPA=;
        b=kHeqYykUIWy2sq+EGEfUWBSe1GeB0iLMMnveMJ2TPO8M6WbrTy/MFitZ7uWeMur5+4
         9gyMaqIU1DR0lx+PMs7Oidiv86k5iFUhO6EYZt/Oht6yAmv57Wx/70xvQ8nUpWEBgaqU
         eVWR4yUeY+GbU3c4wTaPpvEW0H8EwNeISpRS9YITkUuP+hw0zHOKW2UfCT7g+43KtyM9
         b8X4GB6HiP8fSNBgbCW0g29jzx9viBFyMIRV0oVHDVGW4/O//CgcC31qt40BFC2dIjGA
         3nOYRfHOiCvZvAIIIHBy1JIzBjpzdACGDeg5k9SUyKNfY5vu2RtOaKkH8YC5ylemNhkS
         faJw==
X-Gm-Message-State: AOJu0Yw299u34uwy0Ei9vEB2tX/AkN4bDBUM2BlEtQxOZgNXTM8CIfIw
	y+/p96yTfoKr+GDeE7VbAFkUC189y8xiHGu+yFo66+KuNL6PyWH8/4W2
X-Gm-Gg: AZuq6aJ4qhoZ8WV5TryMUhUzyWscsiFiqznhC29OnLUg7BXqb08GPnXu+NDlvXAqxrT
	bnNLZqG6p9l04fhGMR0W8NknIw0uyMvCqhC3MGYtoBvPKIEypOOFtPO5hg6ym1l//gZTtyH9Qzh
	FRKOsQRSspbk2xphZgcp1lstTVUJ3J0G3WE6Ye3OrRyO7tEL0cH38SQXB6hjqZmmqFFJSShjTpl
	/Xt48N3odPO7TvV2yRpe5yHeaiwgeZM5rMXrehDflcqlfN0yFB5NOIAyAK4Q2vY/7IwUlxKhbEF
	/YhYaTBYUgEU+no89FNWDVqqPhY399qtMYnP6zBc0mloXqJ2V6lYiCkmC3Jx4OL/hU07mJimfjf
	jBWXcaOeRwssg4kcaZuSLLw54+2PBBTNl8PJn16PznPJPxY/nSgtirI/Q97ym0tZUtvYaZFD/gK
	JLIr4+vAQ2Tv9izcnA8R31sRAAnqv0VHiPbovUJVMgUkrIeq5cDg==
X-Received: by 2002:a05:600c:1c07:b0:47a:94fc:d057 with SMTP id 5b1f17b1804b1-4804c941792mr10728435e9.2.1769109556171;
        Thu, 22 Jan 2026 11:19:16 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470474cbsm86097235e9.8.2026.01.22.11.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 11:19:15 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH] Makefile: Add EXTRAVERSION field
Date: Thu, 22 Jan 2026 14:18:58 -0500
Message-ID: <20260122191858.18003-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add unique EXTRAVERSION to the Makefile to serve as a unique
identifier for the mentorship application task.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
Proof of boot: https://imgur.com/a/YdSYhGW

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1465f715786d..157279eaca27 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 19
 SUBLEVEL = 0
-EXTRAVERSION = -rc6
+EXTRAVERSION = -rc6-0rayn-lfx
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.47.3

