Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645A528466C
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  1 Dec 2025 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621455; cv=none; b=srwhnw+ZjhhO8MUEY/GklgE9EGXy0dfYR580v+JxDeBFOlKjMUdcHtYKOJ14cKAUhSKyZ+Ki/UwHWddWYjQKxpDeQeRMcYod5JEuKXSH0qjKRsbubO+eqAw6CLrpx21naWe75h639wA7Heb3hScD1H7z2fzQcD06LQ7gu8AalEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621455; c=relaxed/simple;
	bh=ulUB8KEvP4vIj0I99RHhhlg9mGtE59OTbz9tn/axA1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3Em7EGJm/hlZYJKbAXfqDmWsHGO4FkE6HcHhVtshIt40bXcpMwgWd0hv7l6k1Wq9AKw+7TfVd2Dbgz0OxnaJztkTDePItsWallPi7lme9PRLu1fafqO6uTvnOECoUtfd2bhSB0uiv1k2QfthXCnP4GJhLRe1aSI48MHuqtuWW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBvAPHvj; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBvAPHvj"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aad4823079so4085854b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 01 Dec 2025 12:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621454; x=1765226254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rddN2NbLsRsXaz5nK+hoW97gJimLd5zvIjhD50OcbhQ=;
        b=WBvAPHvjhycQuZ8luG9QeWmgZIeDLk0j8Dr6Ll1EeKFWRyi4KwVz3sY12+LUrUO19M
         Qus30VK0LNMIX4hcxHQuUyEGFccuov16LtOeUCJAZiE94MzhPBmOY8UIEAOWaWqcERny
         0649Gu9zEVP3LlY1kxdt3bVU8r2943FwGvmj2VwSwXI0DDyNtWDR2vSBJI4RN+5Mp2gZ
         O/121qqpW1IDyz2xZpXMSInowO7gV5o/XvQFERMmSegJoFSZnINYXpEe8KWQuVitYxNV
         EvpqrTmqHWXcaVTZX+95TziB0fGCsrNH/Om81ZaY9qqMiFM2JepCH9wICOdjkGoRfLRI
         ygDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621454; x=1765226254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rddN2NbLsRsXaz5nK+hoW97gJimLd5zvIjhD50OcbhQ=;
        b=O1cuT7IvqEX9WMONv1qDVvHdhUO9rtZnbSpPT9IB40oVgaP5EUAiIRgisKJf9LGFbq
         AkrPkBVGXS+pzUYt4yHqgavYmDLTvzUhJmIABJUMpzOmtPH+qRc4KWmAX6QWfm7AusGz
         FrSSGwbFUDWnxjzmZ3As4xkQ24UivpN+O4GSTchJq2a6SfGVq4TC1rGCgVvs3DUbuLaY
         c8fNH+tmU6P+SHWHN0n4+2t3RQFO7wbNBgpGds9S9jSevdW2MR74RQ035O22CvfR11Np
         JbGm7gOSJfktuBphZC2FJkG5T7/wWurJq8KluTVxVF4sU/CQUzamn3c3DHIhU1fO4A6v
         fVzA==
X-Forwarded-Encrypted: i=1; AJvYcCWrpyiS6KOyU6ZOncrRT9dV3u8GJSVgGeTYQdwipOKXP7oSdB/K0FBCV66siNIMe9r54+uTjNksy2vXynK15Swhba+D8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpDrpFFx/941uJTekoiTTcMUO7SZwHkCAt7V/YCTPXYkJDgb7s
	R+QMM/e72bSZRjHc9q4seRMY3e6beg9Ps6tiSALeccQyjM+3dHxhnGt4
X-Gm-Gg: ASbGnct51C4Ba+hMqn0WlzNivPNEOGyR1thPzKwZZohB4YtmwOkzVVFFl+UGyOyCpA5
	9sciJFBWEAOAiTfgN4O9NzCFNkQO5mSXUyXxd2o/uBD8GU0Y+8wqp8F6h7b9KBXXXNKczMBs1cr
	MdGckF/+8iCDXHFCnhSh6HF9zPOUXMalo269cVj51xDJBmA3yP8IUdI8TSbaXLRMaXgXaAS5vNF
	efdzgTJDRcrPxAIXryA1AjP+segOkhlxs1IjWFiTXk0J+oTnrGtLpC3gd4qywtMzjPzFUhw6So1
	NgNEe3JyODmiwu5BS5b7hBjyZ1XtUCxPmpSGTbHP5KV8UGnECgfL2XW1b5sMY7SFA1d4LVbU3SU
	e3QeUyfdRnHlvPfxdjkqwBTcFzddwjeN3hbVrzLHITooZMQ9w6OAScxafsLawlXCMgJ5eLG9t2Z
	f1vI+pvtA8g8mFojJt48mWa0GU7RVzHWuj5Ac=
X-Google-Smtp-Source: AGHT+IEEPQo7d9t7c6AjYuQvOyFFo9Jc2FlavWwe6HnggCJaRUGvoTe6BFxCVSmi4BX9k/Ck4u7Kkw==
X-Received: by 2002:a05:6a20:1591:b0:35d:492e:2ed0 with SMTP id adf61e73a8af0-36150f34605mr45146172637.52.1764621453514;
        Mon, 01 Dec 2025 12:37:33 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:33 -0800 (PST)
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
Subject: [PATCH v2 2/6] usb: gadget: dummy_hcd: use 'unsigned int' instead of bare 'unsigned'
Date: Tue,  2 Dec 2025 02:07:11 +0530
Message-ID: <20251201203715.17768-3-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201203715.17768-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'unsigned int' instead of 'unsigned' wherever possible to maintain
consistency with the kernel coding style.
---
 drivers/usb/gadget/udc/dummy_hcd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index fadd3d0c6..39b571899 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -506,7 +506,7 @@ static int dummy_enable(struct usb_ep *_ep,
 	struct dummy		*dum;
 	struct dummy_hcd	*dum_hcd;
 	struct dummy_ep		*ep;
-	unsigned		max;
+	unsigned int		max;
 	int			retval;
 
 	ep = usb_ep_to_dummy_ep(_ep);
@@ -1414,7 +1414,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 top:
 	/* if there's no request queued, the device is NAKing; return */
 	list_for_each_entry(req, &ep->queue, queue) {
-		unsigned	host_len, dev_len, len;
+		unsigned int	host_len, dev_len, len;
 		int		is_short, to_host;
 		int		rescan = 0;
 
@@ -1443,7 +1443,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 			/* not enough bandwidth left? */
 			if (limit < ep->ep.maxpacket && limit < len)
 				break;
-			len = min_t(unsigned, len, limit);
+			len = min_t(unsigned int, len, limit);
 			if (len == 0)
 				break;
 
@@ -1624,8 +1624,8 @@ static int handle_control_request(struct dummy_hcd *dum_hcd, struct urb *urb,
 	struct dummy_ep		*ep2;
 	struct dummy		*dum = dum_hcd->dum;
 	int			ret_val = 1;
-	unsigned	w_index;
-	unsigned	w_value;
+	unsigned int	w_index;
+	unsigned int	w_value;
 
 	w_index = le16_to_cpu(setup->wIndex);
 	w_value = le16_to_cpu(setup->wValue);
-- 
2.43.0

