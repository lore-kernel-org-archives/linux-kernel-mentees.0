Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0431720B22
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 18 May 2025 14:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747576974; cv=none; b=LIoC/MfZMJIbjtR9OHb28BtzCpOZ/FcPdYKYfn+vDuuNt2yAaVGOtSEH+nLe7sTZ354SrFH43d8L/0dGlh1t6urIpmOucFji5wUOUfbSkNuAvQT9YDaBgwZJrj9Nkvm0jOOQQUPpAW4dwR6OFZUDwOxFdc8k9nA3XAEZVsVtTSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747576974; c=relaxed/simple;
	bh=d1HvxwGZsiv8u1F0MMX7hbxvK/sQWlak+mL76ubJS+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SDdfNdWxCNQxBvmH/XL+2Mdzws+XR3UhJ2MfekC5A+CWIgb2TWSVh5oMyRIVQgd5qRP/DYeJ4+xqdJZ/hnPzZU7ggOAyLrB1mgGHN1fsFC62A5gnoy44JXdA0uuXy79JcnjNf6xbDVGlj+9ZC+d0Pyw91DMJo9E9gDm6MX/TbgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3QCsbwF; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3QCsbwF"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7370a2d1981so2843720b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 18 May 2025 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747576972; x=1748181772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fsy/1/2jfhTrQ8yFSRwPaazrBwxXz9myqjSPmcjdTek=;
        b=J3QCsbwFJOiFRKp2fShTXzlqk4nfBRgdAAlX8v5eRzrTeR9czyWasd7LqYYnCG0Iia
         FBmdgk/9NvxbTexCZS634COafam9zszG3aaKU6hx9PXzfhCKSsSfDmxTcO57FP6jILAK
         jGonOHrBtHLL40sshXuFQGtakqr5h7guhB/PBTSdawtyFMu7rw67NmqufVdLDNhw2Axc
         WM40un9admPlcBDtQso2jaLcSCkLStRz4wGlJLbAqX1ZyhTF4H7v4fvXcUrNpGKAXUCh
         rdKO5Ps6aETlZDsfaIu12SGhaR0XmkPcUbyZuzK023nPFGVrKZ9e97kB3R4qeWDDNVO4
         36/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747576972; x=1748181772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fsy/1/2jfhTrQ8yFSRwPaazrBwxXz9myqjSPmcjdTek=;
        b=qyxMeesrEJBfZgraxptIWpUVrQ5B/lcMPK/aAUxspXtoHGLd8a7aV31RUJgAjLA1ck
         Fy0duY0RFKN7VGn5A26fubiZ0yxc/urOxfeRnOwxxr32S2pag7se9AIHqvmBx98SLquS
         B19fDz9bdz+uFRdtLDG7SQ1LF27IiPxHKe+fB/Rx/sq1ZdYqyfnALt1w8XC5e47iocmp
         Asg4lr6DG+7caRvOGuXtwaiZuZ8itjw7Y7FOm0ym8KlncyBkPwaVFlJDHmvIRoLQAExI
         L8x6Gibqfk8J9DSog3htPrPgrds0xswjCkWs8za9IecaBdunBSnrleabkeldfDYmdIYy
         JQ5g==
X-Forwarded-Encrypted: i=1; AJvYcCUGrgqmCPYfUIo+/fLvJ2c5sOdkZHX8OgV8HelgdvpvfVYHe0gLrixVuLEz7yZ9Y/pcVnJSlebjy0WLR0NySui/8zLVzg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhMDlI75Sf+MdvGXdgWxSgrO2+i3OtBPiP2DddDo+sPzZGQ8wy
	tI7xgZqF534flNp2HmBXJiWEuZkL0tABUnZRmJ9bY18S6tiCfgox2Abx
X-Gm-Gg: ASbGncsh0+m0Ea63wP23ubQIaJ9apwoolv/W94R2sqMybofMuOmnLBZLeuzb3TjmrCN
	tybN4npA4jULMWE01yQ1ViSZG/0nlluYW5e7grRf/3e0QzU85MeTgQHUrpPWWo2hg5MPPu9jnpx
	btS/4KRGB2HnFdFxVO68Brk5l5jQHaguErV/4+HUdoE+QoKvCe1KqfSq9H8MjR1I4S3XDU3kbWx
	vebQJr39oFblDYkVsNPbNg4m/Q87d41qUKhluwVoiqFcwkOn11ZBhK9Py7wnIkz9N/wfLgYEPl1
	0qNzmlu9DcWBbYm1wJATOhJBCzKi+avc26BWXPUe22kw8QUXudO9Q6DeYMfe5KvnWDoZ6w==
X-Google-Smtp-Source: AGHT+IFWVlgoy86Ca//+WDZja6kxlAwBtvJ14qE1042DmKmudax7KJPnkF29yOYElYTXfa2jhTC0vw==
X-Received: by 2002:a05:6a00:9094:b0:736:57cb:f2b6 with SMTP id d2e1a72fcca58-742acce138dmr12728298b3a.12.1747576970595;
        Sun, 18 May 2025 07:02:50 -0700 (PDT)
Received: from localhost.localdomain ([45.252.73.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a4755sm4685230b3a.179.2025.05.18.07.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 07:02:50 -0700 (PDT)
From: Anish Dabhane <anishdabhane71@gmail.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Cc: Anish Dabhane <anishdabhane71@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH] Fix spelling error for 'parallel'
Date: Sun, 18 May 2025 19:31:03 +0530
Message-ID: <20250518140107.21310-1-anishdabhane71@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anish Dabhane <anishdabhane71@gmail.com>
---
 Documentation/gpu/rfc/i915_scheduler.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
index c237ebc024cd..2974525f0ac5 100644
--- a/Documentation/gpu/rfc/i915_scheduler.rst
+++ b/Documentation/gpu/rfc/i915_scheduler.rst
@@ -26,7 +26,7 @@ i915 with the DRM scheduler is:
 	  which configures a slot with N contexts
 	* After I915_CONTEXT_ENGINES_EXT_PARALLEL a user can submit N batches to
 	  a slot in a single execbuf IOCTL and the batches run on the GPU in
-	  paralllel
+	  parallel
 	* Initially only for GuC submission but execlists can be supported if
 	  needed
 * Convert the i915 to use the DRM scheduler
-- 
2.49.0

