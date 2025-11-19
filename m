Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A8236829C
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557762; cv=none; b=DdTjpQvTmPqfC7FD7XxlIQHlxkn/PPn88jesJhfVbtVVwnx+l+vzCV1DWe2oQfoVodBfFjAhjj54YAE5RRDLzpoX3i8XnjXbQbcj2BKUrLRL1nFjT4Hf9Tc1ptrvwIJWkt3uQ0pIe5hiZAZu8hWzXiJr1keyTjHHraZLTiKgxdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557762; c=relaxed/simple;
	bh=0Gyh0QsWpdhCfDK9gC2hRQiRG8neNDMu8HdtyKuH2yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTIjgcskfuUyLXdFMoMraQpkAfh+Pgz7gWIeYCCw4Wrnnx0eeWmJU1quNfuFIdrsMXOMYqJgQzHNWfoRww0Pb7WW1w9mW60M0iYiTY4yIIMRmNOai5kqrERbwkKmnamZxY0D1bxWoL5hWW6ftJyKSn+Tfr1xBiN36kI0v4Ndic0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntczQWit; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntczQWit"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7ba92341f83so3250747b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 05:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557760; x=1764162560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZYVsLL6wWFXxTI5h+FOLRQVY+WCanrDEO2Tz+FBfiE=;
        b=ntczQWit4kUpQxdtclIjK9qQYBOTo9k/3Ppp/1N9PjibhjaShVU5jVOZqp7Xkmrqfk
         Kcrcqizu7Qfsg4k9+qKFWCmQQB21N5wyX/r1CyivnefeVQt/lTLNRRhC2E4yGdelfLev
         8T+9Jwtu2BPjCKBEJnh+kebRnCSGyJbLdp8mmsdThvnU7DpKPBctG2Y6wD3L9JuDHgOE
         PU2y5Tqkx5aRpLOHlWnSJ4I+GYcMu9oIgazwVEY/oBJIdZ5X8ja77B+MSsOkTBbIFuVo
         MDHyMa2tLdTA4wEGGYFzcJgyHbZ7D6wrfRtEtFj+A5CmCCIJr6+F6cYOQ0OvuYktOBDm
         0aAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557760; x=1764162560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wZYVsLL6wWFXxTI5h+FOLRQVY+WCanrDEO2Tz+FBfiE=;
        b=QpXlQy+QZ3rRkEKb797NEbDqB3UV4kBf4s2HDQBSIww9E9yaumvC5+LphTclvEeRcN
         6pKeGkpu2ModRUgGLHnvkDL8IqRtxGSPQa+FEUw0d/5aqD8ty6Oa1kUWSi13UJM1OMOW
         HgmdjiOjvxmtttQ58dhQ4foj1y9G7DMKvy4nwpqyxOdw3wnkweuJf4GvF7PB8wDE2MXs
         g85eztAgbBb9B08G3fOL4hlP5TYlTmHPtOECZWRNxaCX/DkzCbmmd5H7cTojUL36+fJJ
         UAmy6DFKQq7WuOS7IYp+ax3D/pNi2/hjvA0Za7lMuRX5Le07ODxQXXQhw+DLESl1ZTyj
         MEVg==
X-Forwarded-Encrypted: i=1; AJvYcCXWvu4eRoc0qEU/fvW6HZrnVbk0Ufow3hOXj1/++axxrcxKnwmiSrZFXsO4xT53Gm1DEh+ODogcqeCPUIG2mKzg1Fr8qA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBfuSLvPMZDsk6uel+DYzWkBn8oRpVtfo54U/pq7IS/8vZHdS1
	YPEKxC0Qx4VSFmDRtviaUWK9kQufc4HDUNH5hD4HNwJyQgtSaLHUeP5M
X-Gm-Gg: ASbGncuitGDoxwQZuJwT7RtGJLGEZGD+a7M9rtU9HqTAQi/qUGc/C6Tju1HWi880Y+m
	n+EWEmfNvtS/BTRrr1Q6roRaqUx4vnM8e1/DkoThKmmak19RPHffmgHNfzNSZ/cS/UCJm8xdgxo
	7xQfyCrKTLiqOdaKwnYq4Tw+r2ZfaR80pLcD1hgFi4CG+5KHx3FX7SbZQOHLux5jJBqGsOfL7Gk
	NbDKRd7zKtcI5Q74fSRbYzS0ZNFlf7GOhiIiPCkvicj4S1SHacyoDIpuOYBDzBqSRhbaNLOhJwt
	OiriKdfZYnGMvELmqS++bN1UGQAKLhYjDBqcU6LhCphcvIpKxaxfl7pvFi4PCaNJuZkhxVPCJO2
	GK9rSB0ZTZ8gq0GOnbMgxNvCNSH8KvUN+L5Fy1c1QsmrKHlLo2ss8jKr7jvdhkHj+0saVDMk/vt
	4/nZruae4fWkB61de63uHmNeth+4g6+2Gdq+UJEvigS1DoRQ==
X-Google-Smtp-Source: AGHT+IFI5Iixx+eyHlV2iuHwmtrmKBaOi8SAI5kZLeU+B97GC1Qy/+Ng+6dg+PQgCgUtsLq42ih8SA==
X-Received: by 2002:a05:6a00:c93:b0:7ab:653a:ca0e with SMTP id d2e1a72fcca58-7ba3b7a9fb0mr19063978b3a.23.1763557759764;
        Wed, 19 Nov 2025 05:09:19 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:19 -0800 (PST)
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
Subject: [PATCH 7/8] usb: gadget: dummy_hcd: remove unnecessary 'else' after return
Date: Wed, 19 Nov 2025 18:38:39 +0530
Message-ID: <20251119130840.14309-8-clintbgeorge@gmail.com>
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

The 'else' after a return statement is redundant and unnecessary.
This patch removes the 'else' in dummy_set_halt_and_wedge(), making
the code clearer and compliant with kernel coding style:

- Return early for the -EAGAIN condition.
- Place the subsequent code at the same indentation level instead
  of inside an 'else' block.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 1840dd822..1114dfe61 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -803,10 +803,10 @@ dummy_set_halt_and_wedge(struct usb_ep *_ep, int value, int wedged)
 		return -ESHUTDOWN;
 	if (!value)
 		ep->halted = ep->wedged = 0;
-	else if (ep->desc && (ep->desc->bEndpointAddress & USB_DIR_IN) &&
-			!list_empty(&ep->queue))
-		return -EAGAIN;
 	else {
+		if (ep->desc && (ep->desc->bEndpointAddress & USB_DIR_IN) &&
+			!list_empty(&ep->queue))
+			return -EAGAIN;
 		ep->halted = 1;
 		if (wedged)
 			ep->wedged = 1;
-- 
2.43.0

