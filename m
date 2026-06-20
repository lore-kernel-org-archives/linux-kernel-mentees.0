Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F579340411
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Jun 2026 08:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781943547; cv=none; b=W9/BavwpThRFU6u9of5Zn+TnmaDc3n4fSLVlgR/UedBOQsB7RzWCuMsOKTcSQxOXGAeAVOpvCxSbTNWdtNe1xky1LGRZ023Wwh47Q4Qauhx1nM044+IBjiZhw7rObEF1vBmzZ5klTCjpYzepDt+6TRIq2hTnHErMiq09uUlbsZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781943547; c=relaxed/simple;
	bh=ebjICIaKnIiWqN5sCqRzBeqtjhGLBHhcjtqnFhx4W3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nsdO9LreFzXmLWkgNvuSV9AiVNrrMVh3ou89hl5ESg4ONC/qdqt3vwmMkcnkgFcoPgt+bSQC3qSPw/bF0ZFxA1u7hJleti9ETs0JrwNQZRbMCXvbI6Jp8rh+LISkAS4v4+ZXw2e4NtNYWJHkValECY0Mez1TeYx9CGy4/H4SVcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxbZn6R1; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxbZn6R1"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36dac5d5d05so1177268a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 20 Jun 2026 01:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781943546; x=1782548346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYONhAjYo50YxLgZHUBiBRUd34pR6NaLMu1zrzWmCZk=;
        b=LxbZn6R1b/G4MjT1K+H3k521qGcKUcme5hMFsQ+I3FVfyT/lvTMZDhs5fRUcpAldSL
         S2mDYu4hHCifo6Fwi2RBnszoxUuKEL5hrVCR9M6wGC1P7SRpBjFZthlznjESo39RCBJH
         6a4RN0bu6DVX1voPCTJ2m69/PGYgWd2rvK9SuVO6WN9qpgS5uGQ/If27IhF2+0iPPe5u
         V9moXncDwJRUeaVO4roqCPrLWSZIp+wABiaWL0obPiIVgQSQgeudJwk7jiwwekL6K6iu
         Jo95wSqWkiKvzbMcBjASzZ+G0JOk4a1jBS0N/P8LVw1d9b/ewJMgnhbqaAGD4rhGqoIX
         CUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781943546; x=1782548346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYONhAjYo50YxLgZHUBiBRUd34pR6NaLMu1zrzWmCZk=;
        b=jVtWQy9gL+cIQo7jjjKfNHkq8ARPdZCLiuZSWtGjD1YhGQa59pwuZSxIBR4hnE1TQS
         pq6hFN18jtw7rQnRqgLdC09ui9vYmN6N2ksCDxSBmUtfHrv/VZ5Uwu0dssKCDTcmvwh7
         fBy4VwmGEhOOr2PpWnki7e9kjAdq31Zl9GEM4Zrve0RPpU2qNWncE2leuB4hXkCBv6vO
         o5zjEvlI96OqpZ4zry7qb3PEKHRF1g/0/DPLQMPyLwTRCdGCuuW9tyyQgUAIvpjqFJSI
         tYoPRjgfP9k9Rruuf+UTNnSPJKDeYGhdZivjmd2628H8dwj3LJ2rM/yguVkPfS9DWgeM
         FGZA==
X-Forwarded-Encrypted: i=1; AFNElJ+EspXuwGObGAZ9ecLD1YanILWMusaJ0nyl1VwCichArg6xQnhV5SQeAUtoevIAgUE97zI6WmJWF4V8LQlxC2W6wqt/Sg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQhbz/Ln42criBWkux5SU0rQCIAxmLO1DnRjlvgjrxGfP2Uk1U
	zyoH11FSM1Do/BHPY9Tc4qhXClRA3OWKCosdqLUcA+4UrD7F+IrV2ZiA
X-Gm-Gg: AfdE7cmIs2pfAVg3AORyWgJOduzF4VriY0/eZCbqB5/NDmzPZ8WXXBE9dWRFqoslP5r
	An3XbsWFYhNV6S3C2lZ5i52qe5s+hlHT/LIvgZgpFP8vbNFPH3FW6cdriF/gFWqPgVZ9axUeKxS
	JTcJxOQyNL1VlGTP6P92B3Gnk5TVT5u9Dsym9Z1jMtGcXQJqlugUj20nvzwce1w3k19D3/ROlU7
	VlohjlEEpaMCZR8ytSfo21ZL7Zv7LBfgML8jaxgPlcKCeOVVH5D3tUsFOmA8Vtuh254BDpzvQyv
	QGgzasG47UqKuWmQikszoLh+YPxMJ/0QPNfAOJI0SMkmGVSWSAEqMHSoZGf2+YcGjVEeLFK9rfs
	vzcUnUVQUyHS00toDqxkqgJkp2lPsM9sNSggXwMYnvTyhIIf7cRLakSmu/0rFEKMNf7FLO3+e90
	HOY3CnqQdaErDC4PmJna7WH0DYIPoJv8yHYmXE
X-Received: by 2002:a17:90b:4d11:b0:37c:6973:5a65 with SMTP id 98e67ed59e1d1-37d15e89d6cmr7349122a91.17.1781943545714;
        Sat, 20 Jun 2026 01:19:05 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:5c2d:70e2:75f2:925])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4eede23esm1601366a91.2.2026.06.20.01.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 01:19:05 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: linux-media@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: Documentation: fix v4l2-subdev incorrect ops field and category references
Date: Sat, 20 Jun 2026 15:18:42 +0700
Message-ID: <20260620081843.7641-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2-subdev documentation incorrectly refers to the "core" ops
while it should have been the "video" ops where the actual
operation (g_std) belongs to. The docs also declares a duplicate
"video" struct member instead of "pad" in the subdev ops struct example.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 Documentation/driver-api/media/v4l2-subdev.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 13aec460e..d30bb656b 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -77,7 +77,7 @@ It looks like this:
 		const struct v4l2_subdev_tuner_ops *tuner;
 		const struct v4l2_subdev_audio_ops *audio;
 		const struct v4l2_subdev_video_ops *video;
-		const struct v4l2_subdev_pad_ops *video;
+		const struct v4l2_subdev_pad_ops *pad;
 	};
 
 The core ops are common to all subdevs, the other categories are implemented
@@ -300,31 +300,31 @@ directly:
 
 .. code-block:: c
 
-	err = sd->ops->core->g_std(sd, &norm);
+	err = sd->ops->video->g_std(sd, &norm);
 
 but it is better and easier to use this macro:
 
 .. code-block:: c
 
-	err = v4l2_subdev_call(sd, core, g_std, &norm);
+	err = v4l2_subdev_call(sd, video, g_std, &norm);
 
 The macro will do the right ``NULL`` pointer checks and returns ``-ENODEV``
 if :c:type:`sd <v4l2_subdev>` is ``NULL``, ``-ENOIOCTLCMD`` if either
-:c:type:`sd <v4l2_subdev>`->core or :c:type:`sd <v4l2_subdev>`->core->g_std is ``NULL``, or the actual result of the
-:c:type:`sd <v4l2_subdev>`->ops->core->g_std ops.
+:c:type:`sd <v4l2_subdev>`->video or :c:type:`sd <v4l2_subdev>`->video->g_std is ``NULL``, or the actual result of the
+:c:type:`sd <v4l2_subdev>`->ops->video->g_std ops.
 
 It is also possible to call all or a subset of the sub-devices:
 
 .. code-block:: c
 
-	v4l2_device_call_all(v4l2_dev, 0, core, g_std, &norm);
+	v4l2_device_call_all(v4l2_dev, 0, video, g_std, &norm);
 
 Any subdev that does not support this ops is skipped and error results are
 ignored. If you want to check for errors use this:
 
 .. code-block:: c
 
-	err = v4l2_device_call_until_err(v4l2_dev, 0, core, g_std, &norm);
+	err = v4l2_device_call_until_err(v4l2_dev, 0, video, g_std, &norm);
 
 Any error except ``-ENOIOCTLCMD`` will exit the loop with that error. If no
 errors (except ``-ENOIOCTLCMD``) occurred, then 0 is returned.
-- 
2.53.0

