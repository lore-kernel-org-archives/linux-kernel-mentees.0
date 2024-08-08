Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1235D190461
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 15:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723132186; cv=none; b=LCfBFtcK/yNhsgpOpsbZsaGoZPaBLU5wxR6waUBFLoGZfHZFrnk69dIk8Va/Nj9hl2hnkE9XQ3WTDqE5kbn6KZDdD4wWCziw6TNANoWTDJOXYKIo1FjgjXulsgAmbEfPUfqw1ujjssP8JOl1ISwAtePESWNIg6XTIEcAGRbbV2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723132186; c=relaxed/simple;
	bh=qIbTHzKq4atn2aMUICjMeEnP8cU8VVuGGw7o6/rYwYw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qhUMmfqGrYTGh3M3VG1dkqry6sKiFldDHGl2YiJXRSvJ4Z4vrI2Z8lKurj4t7GevwVceH5I5uxAT5IWSIyvFK4lXl5xEVGPU6aTHmBolvcscflP/ETjBt1NWC9WcpI4bqIMqqBNlHBqtFVxajJXVZLy++gf/f9S5zDLsXY9j/9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6KNiynK; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6KNiynK"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D94880D8D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 15:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsOi-Xi2-5Yo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Aug 2024 15:49:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=pranavsdreams@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09FF880CE4
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09FF880CE4
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=c6KNiynK
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 09FF880CE4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 15:49:43 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-70eaf5874ddso923128b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 08 Aug 2024 08:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723132183; x=1723736983; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hHHGhWai3eNjYOFZd63abtHYuW/EnhR1HCURoXC4/qA=;
        b=c6KNiynKBgein4MsKLunEc4+4RRFwMqq27/vGwj7ehDfgBYSxSqtQNByjeusYAcj0e
         xFeGZ4eEf83kfGIOWLAi8RY0V5pdobt8ksVcqgexfNik9ttYTeim3Y4XxrKPRJ2Dx2dL
         PAqEycD4k7iSFFpruz5dtdyZ4VjRN5OzHxd0kGFVh6cmWV5uQy6ESZiKORTujyinNB3B
         1r7hfAMCpz3kcDJhVEuuPCh2F8nwFNKk3hcKy0Z+AVJuPU4C2Dc5ogF9cQ7P+fB8qhI4
         7ozg/0qEVXaiyDIKQEHmHFfcb5GUCnQNz8wSNPB7cRKBMMhPVZoix0q0QCJuyNa8dcoh
         H6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723132183; x=1723736983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHHGhWai3eNjYOFZd63abtHYuW/EnhR1HCURoXC4/qA=;
        b=pWWk1V3OuUxq+IT5Raclns5yTL7VOqa0FFX2xCmCs1dC9T2d3WWs/HuFsjFzLeIn8N
         z8+S4fiH8glpkaMWtKtgXpXIYQKL4ryIVuGJ6z6ZuFv0QvxhDdsY7VX+Uzyd4453FPJc
         ORenaBkcwQAh44LXT1gZlhrsvYM+YfkacGOww++XPh/A9h+VeRal6Rc277AXpuH2iK5U
         fLKtdIAvgw/cV177Lj4D3296GxPFZGXGPbrYhqlKFNeVe5GpnMt6Nbr154mySvXvqlGJ
         gG0hbDi9lc9IgKHCSwZZ/FdpJ6Cekk5BEl1bw8HVzAD8/69jQGp7NgRa4iVvqDiuGWx2
         /ctw==
X-Forwarded-Encrypted: i=1; AJvYcCU9mSRQGsOLmOBbEFLjb9eG33CoFHXloN+7wgzhOxmxYRoNMpau1+WF9U7rENlHNKFjcPvvrnszWush7a9bJmYfMKKhcQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxWffMi2GJjyru1YXNHfzny7BiFT51a2h60nwHtu4W1Ji4VG14V
	Dsrx+g4uLpSY+rFWgEOeq0X652l/L66Z3CnCAgSofgBISeWb2lhK
X-Google-Smtp-Source: AGHT+IE3dc1rAssBALMmQoxg8ZDIVu1ZMGgSafCdKIR1wm6DynfUCj6sggvyCKRWGwB1HQCioWhXOQ==
X-Received: by 2002:a05:6a00:4b02:b0:705:9a28:aa04 with SMTP id d2e1a72fcca58-710cae2823amr2873584b3a.23.1723132182836;
        Thu, 08 Aug 2024 08:49:42 -0700 (PDT)
Received: from ThinkPad-L14-Gen-3.. ([49.33.192.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb20a098sm1270228b3a.40.2024.08.08.08.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 08:49:42 -0700 (PDT)
From: Pranav P <pranavsdreams@gmail.com>
To: skhan@linuxfoundation.org
Cc: Pranav P <pranavsdreams@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] Added extra word to Extra Version
Date: Thu,  8 Aug 2024 21:18:24 +0530
Message-Id: <20240808154824.13390-1-pranavsdreams@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Pranav P <pranavsdreams@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8ad55d6e7b60..9a4012a08c0f 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 11
 SUBLEVEL = 0
-EXTRAVERSION = -rc1
+EXTRAVERSION = -rc1-karuvally
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.34.1

