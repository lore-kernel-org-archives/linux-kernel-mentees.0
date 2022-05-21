Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7422CC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 May 2022 06:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4892426BC;
	Sat, 21 May 2022 06:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1iRv0mzw-I6; Sat, 21 May 2022 06:36:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B0A914262C;
	Sat, 21 May 2022 06:36:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D80EBC0039;
	Sat, 21 May 2022 06:36:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5FD55C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 06:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A95F4262C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 06:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhAqwFVJNhuy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 06:36:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E1F642605
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 May 2022 06:36:43 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id c22so9449103pgu.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 May 2022 23:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=LI4LxelWEjEaX1Q8c74mSsIuglj1BIMj7hPy6RZdBWU=;
 b=krDiS0tWzf4yZqe9YLwZohr5GraL2gzIFd9ot/Kj0fRMoOtw4+cET5/WyGnPwPHIyw
 dckRcE/nyT+u8ePN8HZxY85dxQYBJfVDY89t61rOHerC9SIN/2SbOjgZNG3QQQuv+0Qr
 cl4Wx3mhK0wz3gvKpssMoO4H3eVFoyUaIhqdr4kGYyN8WcjKRWqHBztrmM+GGlUueuH2
 8AMjuRBj+X/QTfzvNJqIe+/HydLmpzzogZgcZzbw6c7ky8pN8M5dPaUwI0gEaKTt4k9s
 eQsq9Hvv449COPCNLiz5gPMq3uXJW0G+i2Oh/4+INPoQ4VkdCaCM965ild5pQpnNen0i
 kofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LI4LxelWEjEaX1Q8c74mSsIuglj1BIMj7hPy6RZdBWU=;
 b=6wb20C1hJy+8koQo6q5GzHVfA4glD7SFU3SbVYtHmoa0xpOXn/2sLryZnyy+lrkDqw
 swj3DuXQbRUhYZ6+ezYPMJkv9cEDzqJ3WzcZV63SZnqeEqOwxD4fCOVjuuXYLr2nlcLl
 BQml8dfIwNyXgBI42xOJj6kwLqoUoTFSSNRbkiYRFD5KScdgRiputmT9mKmtxgwXqJPH
 aqO7Nokzwa3PSJZ1vI07xcb5rFs/9p9POXdbxrSL8pmas+Am7iydP8mf6QlPmvObWgPq
 CKrIAafVfDbHlSAzMIqiVtKCxkRdApczAWLVlE1Qzno8eSsf9+31kyRMrmovTGZzrx33
 xKdA==
X-Gm-Message-State: AOAM533PJoeZ/GHdtYFWodY8j8NbHareYwgimJyUWTlBP6yHyISMs1bp
 hSLfka8NFQffCCV2bkqOo9c=
X-Google-Smtp-Source: ABdhPJzDUUyxPh+4E2F/F1Ikqk8CKNA1QtsqzcgZ7yuZwLkqqeloj+WzWL3eWZPGPvlRSOK6iO6mIA==
X-Received: by 2002:a63:f355:0:b0:3f6:41f4:b551 with SMTP id
 t21-20020a63f355000000b003f641f4b551mr9790328pgj.383.1653115002830; 
 Fri, 20 May 2022 23:36:42 -0700 (PDT)
Received: from Negi ([207.151.52.3]) by smtp.gmail.com with ESMTPSA id
 h5-20020a62de05000000b0051831863f10sm2848702pfg.109.2022.05.20.23.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 23:36:42 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] selftests: drivers/dma-buf: Improve message in selftest
 summary
Date: Fri, 20 May 2022 23:36:10 -0700
Message-Id: <20220521063610.4924-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Selftest udmabuf for the dma-buf driver is skipped when the device file
(e.g. /dev/udmabuf) for the DMA buffer cannot be opened i.e. no DMA buffer
has been allocated.

This patch adds clarity to the SKIP message.

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 tools/testing/selftests/drivers/dma-buf/udmabuf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
index de1c4e6de0b2..c812080e304e 100644
--- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
+++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
@@ -32,7 +32,8 @@ int main(int argc, char *argv[])
 
 	devfd = open("/dev/udmabuf", O_RDWR);
 	if (devfd < 0) {
-		printf("%s: [skip,no-udmabuf]\n", TEST_PREFIX);
+		printf("%s: [skip,no-udmabuf: Unable to access DMA buffer device file]\n",
+		       TEST_PREFIX);
 		exit(77);
 	}
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
