Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847E43624D5
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557737; cv=none; b=pNMQV3vTlxD+NM7DbL/9x/LCghHON1kzEi/rQsQnyvCpU8J4Hoy5tR62dfMrkHC/SEotbdg7uCn4O86sE+QQ3sigFYbvsf9oADC2OwBfMKA2XP78iuLKAqOPTlJ7TPQ6rJatiNlIfGwtlWvaYUum4tFLEdQXgzr2CP+x6kXViPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557737; c=relaxed/simple;
	bh=XTwiB6LhyFx+sieSzalDt/J192URsyR2fEdTJu9dGks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2f4FERMJhq+TwRQx/ZkGn5to4j2BXVG9FgZuL1nQh3W5XXvOIbSotjTzyJk0DVNq1VNiagLLlsliHLUsHqxnUpKXdv/cKDTZBkHzvFgAnUHbqiG1DlZYpGYFjfjRi4IqYa8SbNUHSXTf2iZGGuOkehc7vwhz6zRDAuPSOQYf9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iy1QjeOC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iy1QjeOC"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aace33b75bso6120104b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 05:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557735; x=1764162535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Di0vNTQpYDEXqMaIfB6/Wre2BioWn4TojpcyJB9CfyE=;
        b=Iy1QjeOCfn2k4X0wXAVze07ku5fBnOxfQnXOkCGn8v/V1H0ZteH7lQELf1ip0wUO6x
         nL+m7BAcUbdjY/eg8g4JZLdcG+tk41GHiO8W6nTN4Ed1tqGm8qMtq5t+s6XksFDIWf0L
         iGLN/Zu77e3OblWmo6cHxG9G/vk1W+IU1n/LPm3On9luvp9Uy9r6pX9Pv3FvxHCL+wlb
         tEaVJNQm6DEB2/o+YkJe8nCjuEfvHrj5F/vP259cZKJTUjqbpzHyw9MLdJqMpSxVhrkJ
         +LdYnLN+pXgftOBlSAJ9KaOX986D6uWkHGy7cNF1sRkurqDezrCX6XTF+MHzces6bKbv
         CQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557735; x=1764162535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Di0vNTQpYDEXqMaIfB6/Wre2BioWn4TojpcyJB9CfyE=;
        b=g8HWignGT/ShThdqwY0zEQI7PaMFLDmi1UvK0ItrS1tj0cZnmpaOtLXI5L1TG+jtIR
         8v3z3/pU3M4muCETGYOsCEaZ8yI38/vyxxzMh5BbGNCLG/YdsLaC8egmK3GjVHc7lOU9
         T+xmvNDNKfaK/PThGHoda0Q8tQueb4K/Z9zcvZTtYPgSsnpoxIEGXLvuRBDESzucI/9q
         abFYCxGLmZXN/QX8+vJTAaVMHwXkLBAovde89tea2c+gMRgeVxZ86+RtJR1yWUAxXtO2
         fGx4AjmtJwqVsa4SHeswF2yOAdt+pcgqXieBIbSqkPL0YOo2JxxIob8aHyd/woAr613b
         Mnxg==
X-Forwarded-Encrypted: i=1; AJvYcCVxED0avmY8IKwlCe2w3J0K16oUo+JAyv46OrGJqgcuziYVdkpwlT+YrifH6dJ1nWmxSMy9QMyLiAz32h07gFdPkTQupg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuJUpHQgCi6VwX2puC4ilzpqKxs0GoW9AVbSkS2mn6d9VyKgQg
	AkTZbHfiwOHrhwzVTsW4/MTA1ltzTYOyaPcZr8KSHO0LOhlAR4RNGUut
X-Gm-Gg: ASbGncsIwmm2mcvoIjUBa80tFnELA2kjFvLPMUl1CVppqnCpKzFgk+AGiMk02y6EMbG
	boMnKnD1kyrPq2AobtbVtIL+K6Kq5DQDNz7jsSQdvmGm2S26orS0JIKz3/zVRb95cjgv1nmRwtW
	6kHmEY2DkcB7ClKqn3TA7Vly7B2mxx7VIaSBZdDcHRSz9q1FRkl8ABRJPpYVraHXNx6Y6RmEols
	vAsMgyZEeT+YVC6AE3vXWTF2nA+fRot3+irGR7+IBoWuu55qXgJg91uLrKd3FaOX574zh9xUp0k
	/TblS84y5VPgmjP520tJYg6E+yAPdKrNZ1fMHlz07nzEnOhjtcRl8my4iu7hoVqIK56OpfmhHR2
	ml8RR5GuwsTDncKTUuFxDd0LmnBRX/j2n/OaHsqdTUKOkqVxgsbAcYoeIcGbZd7rO7eHit56UEu
	i7sFRIPqT92UqmSb9pjnYCGP/JvojJvX8hWN0=
X-Google-Smtp-Source: AGHT+IEcr17WE3EmqFRtCvdpvfPm3mz73HGDRmblKdp91/ZM37RE+aj+Beu6lNdIpLSl6HfUMZVBuQ==
X-Received: by 2002:a05:6a00:22c5:b0:781:d98e:ebda with SMTP id d2e1a72fcca58-7ba3c086817mr23166067b3a.30.1763557734608;
        Wed, 19 Nov 2025 05:08:54 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:08:54 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH 1/8] usb: gadget: dummy_hcd: replace BUG() with WARN_ON_ONCE()
Date: Wed, 19 Nov 2025 18:38:33 +0530
Message-ID: <20251119130840.14309-2-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace BUG() with WARN_ON_ONCE() in dummy_validate_stream()
when stream_id exceeds max_streams. This allows the kernel to
continue running with a warning instead of crashing.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---

Testing:
- The function dummy_validate_stream() was tested using a test module
  that i created where i sent value of urb->stream_id greater than
  max_streams. When using BUG(), the kernel-space used to crash but
  after using WARN_ON_ONCE() the kernel-space does not crash and the
  module terminates gracefully
- Ensured that the module builds properly

 drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 1cefca660..41b7b6907 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1254,7 +1254,7 @@ static int dummy_validate_stream(struct dummy_hcd *dum_hcd, struct urb *urb)
 	if (urb->stream_id > max_streams) {
 		dev_err(dummy_dev(dum_hcd), "Stream id %d is out of range.\n",
 				urb->stream_id);
-		BUG();
+		WARN_ON_ONCE(1);
 		return -EINVAL;
 	}
 	return 0;
-- 
2.43.0

