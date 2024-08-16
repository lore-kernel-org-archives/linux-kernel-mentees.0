Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270071C689F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Aug 2024 17:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723828370; cv=none; b=LVDwFWQ7SGjqZ8Wn9nX+gdpbcJ6Jjcdu+xOMlEKvIUluBMaDbJ4ZKN5EWY+N14/in0LTXbyS32RjBrbp6GpL7LaK9TUsAn2sGRyEUUZxdl9sEHBDD+kqOrVqpv54YqGjyaB9/7wADZGBai7ZzZwVGQNix5pcQZU8zMoNkkYtzRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723828370; c=relaxed/simple;
	bh=BJbAOhfmR88tLFChbQZVoqdcx/W/pQUrC9UyjkKSkb4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mE/OSAdk1T65vfp9AHeTix3tyG6BFWLskX9rrytk1VKbEDbBTwnxUxqYfEALN0SIijhxjJ6LcmreYmpRT2A67lO55BTmZLiIAJ7W6VJR3cagaE0Qe8TaXWljl+hd470MupjoV2H/juoBy1HL7NCubdBVdT/Ba4uI45hvQm5Oqbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxkA623j; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxkA623j"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C468B6074A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Aug 2024 17:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dz09PFBQ3Jd6 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Aug 2024 17:12:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C72E16068A
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C72E16068A
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UxkA623j
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C72E16068A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Aug 2024 17:12:47 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-70d28023accso1802589b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 16 Aug 2024 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723828367; x=1724433167; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gdy9zSqWjuC2tMQ6qbmA2POy13/um9sPqP+u934ObRk=;
        b=UxkA623joD51dRQt0SnbJMXCRFMRtlAfHR+NcJhe8HCHaQyG7QHRWsAp/6IeZtIjzT
         03G58wKrFxcLiFmMwhT9qFHg9/MT53GhFh9JOhCyX7t9NSfrywYUfboMJMqyEe31STeo
         bKdA2j0vQaVkSMt04kwDbgoP0FwkWHuSyD1ruxh9nZoLqouT4NPwAUqLWoPRiPXFc0Zv
         H9e+IOx+Ly7ASo1jCEyUR8Q9YSAc1BVR1X134lULyMD+6IQbtdLwc3Xj6hGv91T0r7t0
         wr2vNIilVX5jCK7yOYtvDYfclP7wO+12b7eVQq9rExSnpv37OFVoVgtYxICktjJPNLxz
         pTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723828367; x=1724433167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdy9zSqWjuC2tMQ6qbmA2POy13/um9sPqP+u934ObRk=;
        b=Bxj9NX+9wftD21h+MzwMi7cDUboHsBBAAowTbaTWqfLfr+JuuY6Pz+55YCPtHa7aUC
         4pdvI9nRu8saDWuxf4BGh8tnYmaqNBjL8WENWvn/QXF3A+iCYGZ/t2R0gEd+oNot0qNF
         HschC72jIJHiywAFtyD8XzO5eLUZp3ZzmrOFdDHzYJOUBA8RTsDxZjKBz97JenyKAY/d
         U5QOaiK9BnxAjKlIzVPzSTEQQ7MzQNk7+mY2YVmZZHANNWit2kJ4Q6vY7TJYxABc/Icw
         lu8gdpwTaKX8n9vYWmM2EYohvcg4840ncBQYH8dgyptKHlIRTF4Oh/2FqhOqYk7ZhZEJ
         6x0A==
X-Forwarded-Encrypted: i=1; AJvYcCXoTGqMC6LiICEB2qu/z36UhIwy5uMdrEHTx2ThmNo2vHvmloEZEkXzBGbkhQirBUH06Nd2chLJwWEeZxrCuckW7Tj1hHtV4ZhtA7HJkHNqBb+TdNbGuo0diTDxIwvN
X-Gm-Message-State: AOJu0Yxs+sjUq4pwP9DHxy4OiXUbIvI6C+Tdi7cgT5RC6wlcxkKPA15+
	Vhxlsw5JYu6oiII+2hbsWWi6K7RZYoTcFPxdhqCQv8Y1Bk1rqn7C
X-Google-Smtp-Source: AGHT+IGksQuXa1bgiFvGegX5wQp8wdValbEh0BdyCcOBVJ1wMLE2USqtsc8QY2Gh0jFU6u6YMS+NPw==
X-Received: by 2002:a05:6a20:6f8a:b0:1c6:a83c:d5db with SMTP id adf61e73a8af0-1c904fb49b2mr4408239637.31.1723828366480;
        Fri, 16 Aug 2024 10:12:46 -0700 (PDT)
Received: from embed-PC.. ([106.222.235.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add3ea3sm2955952b3a.16.2024.08.16.10.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 10:12:45 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: sun50i-a100: Replace msleep() with usleep_range()
Date: Fri, 16 Aug 2024 22:41:29 +0530
Message-Id: <20240816171129.6411-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep() with usleep_range() in sun50i_a100_ledc_suspend()
to address the checkpatch.pl warning. msleep() for such short delay
can lead to inaccurate sleep times. Switch to usleep_range()
provide more precise delay.

Fix the following warning from checkpatch.pl:

WARNING: msleep < 20ms can sleep for up to 20ms;
see Documentation/timers/timers-howto.rst
+		msleep(1);

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/leds/leds-sun50i-a100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-sun50i-a100.c b/drivers/leds/leds-sun50i-a100.c
index 119eff9471f0..4c468d487486 100644
--- a/drivers/leds/leds-sun50i-a100.c
+++ b/drivers/leds/leds-sun50i-a100.c
@@ -368,7 +368,7 @@ static int sun50i_a100_ledc_suspend(struct device *dev)
 		if (!xfer_active)
 			break;

-		msleep(1);
+		usleep_range(1000, 1100);
 	}

 	clk_disable_unprepare(priv->mod_clk);
--
2.34.1

